import 'package:flutter_chat_phone_number/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:flutter_chat_phone_number/features/user/domain/entities/contact_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRespository {
  final UserRemoteDtaSource remoteDataSource;
  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createUser(UserEntity user) async =>
      remoteDataSource.createUser(user);

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();

  @override
  Future<String> getCurrentUID() async => remoteDataSource.getCurrentUID();

  @override
  Future<List<ContactEntity>> getDeviceNumber() async =>
      remoteDataSource.getDeviceNumber();
  @override
  Stream<List<UserEntity>> getSingeUsers(String uid) =>
      remoteDataSource.getSingeUsers(uid);
  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async =>
      remoteDataSource.signInWithPhoneNumber(smsPinCode);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();
  @override
  Future<void> updateUser(UserEntity user) async =>
      remoteDataSource.updateUser(user);

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async=> remoteDataSource.verifyPhoneNumber(phoneNumber);
}
