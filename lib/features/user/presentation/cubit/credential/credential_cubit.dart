// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';

import 'package:flutter_chat_phone_number/features/user/domain/usecases/credential/sign_in_with_phone_number_usecase.dart';
import 'package:flutter_chat_phone_number/features/user/domain/usecases/credential/verify_phone_number_usecase.dart';
import 'package:flutter_chat_phone_number/features/user/domain/usecases/user/create_user_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInwithPhoneNumberUseCase signInwithPhoneNumberUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final CreateUserUseCase createUserUseCase;

  CredentialCubit(
    this.signInwithPhoneNumberUseCase,
    this.verifyPhoneNumberUseCase,
    this.createUserUseCase,
  ) : super(CredentialInitial());
  Future<void> submitVerifyPhoneNumber({required String phoneNumber}) async {
    // try{}catch(_){}
    try {
      await verifyPhoneNumberUseCase.call(phoneNumber);
      emit(CredentialPhoneAuthSmsCodeReceived());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitSmsCode({required String smsCode}) async {
    try {
      await signInwithPhoneNumberUseCase.call(smsCode);
      emit(CredentialPhoneAuthProfileInfo());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitProfileInfo({required UserEntity user}) async {
    try {
      await createUserUseCase.call(user);
      emit(CredentialPhoneAuthProfileInfo());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
