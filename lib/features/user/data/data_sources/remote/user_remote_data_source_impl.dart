import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_chat_phone_number/features/app/const/app_const.dart';
import 'package:flutter_chat_phone_number/features/app/const/firebases_colection_const.dart';
import 'package:flutter_chat_phone_number/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_chat_phone_number/features/user/data/models/user_model.dart';
import 'package:flutter_chat_phone_number/features/user/domain/entities/contact_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRemoteDataSourceImpl implements UserRemoteDtaSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  String _verificationId = "";

  UserRemoteDataSourceImpl({required this.firestore, required this.auth});

  @override
  Future<void> createUser(UserEntity user) async {
    final uid = await getCurrentUID();
    final newUser = UserModel(
            email: user.email,
            uid: user.uid,
            isOnline: user.isOnline,
            phoneNumber: user.phoneNumber,
            username: user.phoneNumber,
            profileUrl: user.profileUrl,
            status: user.status)
        .toDocument();

    final userColection = firestore.collection(FirebaseColectionConst.users);
    try {
      userColection.doc(uid).get().then((userDoc) {
        if (!userDoc.exists) {
          userColection.doc(uid).set(newUser);
        } else {
          userColection.doc(uid).update(newUser);
        }
      });
    } catch (e) {
      throw Exception("Error create user");
    }
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userColection = firestore.collection(FirebaseColectionConst.users);
    return userColection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<String> getCurrentUID() async => auth.currentUser!.uid;

  @override
  Future<List<ContactEntity>> getDeviceNumber() async {
    List<ContactEntity> contacts = [];
    final getContactsData = await ContactsService.getContacts();
    getContactsData.forEach((myContact) {
      myContact.phones!.forEach((phoneData) {
        contacts.add(ContactEntity(
            phoneNumber: phoneData.value,
            label: myContact.displayName,
            userProfile: myContact.avatar));
      });
    });
    return contacts;
  }

  @override
  Stream<List<UserEntity>> getSingeUsers(String uid) {
    final userColection = firestore
        .collection(FirebaseColectionConst.users)
        .where("uid", isEqualTo: uid);
    return userColection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: smsPinCode);
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-id') {
        toast("INhập sai mã ");
      } else if (e.code == 'quota_exceeded') {
        toast('SMS quá số lần');
      }
    } catch (e) {
      toast('Thử lại');
    }
  }

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<void> updateUser(UserEntity user) async {
    final userColection = firestore.collection(FirebaseColectionConst.users);
    Map<String, dynamic> userInfo = {};
    if (user.username != "" && user.username != null) {
      userInfo['username'] = user.username;
    }
    ;
    if (user.profileUrl != "" && user.profileUrl != null) {
      userInfo['profileUrl'] = user.profileUrl;
    }
    ;
    if (user.isOnline != null) {
      userInfo['isOnline'] = user.isOnline;
    }
    ;
    userColection.doc(user.uid).update(userInfo);
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    phoneVerificationCompleted(AuthCredential authCredential) {
      print(
          'Phone verification completed: Token ${authCredential.token} ${authCredential.signInMethod}');
    }

    phoneVerificationFailed(FirebaseAuthException firebaseAuthException) {
      print(
          'Phone FAILED: ${firebaseAuthException.message},${firebaseAuthException.code}');
    }

    phoneCodeSent(String verificationId, int? forceResendingToken) {
      _verificationId = verificationId;
    }

    phoneCodeAutoRetrievalTimeout(String verificationId) {
      _verificationId = verificationId;
      print("time out:$verificationId");
    }

    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }
}
