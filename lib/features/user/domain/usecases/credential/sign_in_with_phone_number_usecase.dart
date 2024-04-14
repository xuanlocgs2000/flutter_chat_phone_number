import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class SignInwithPhoneNumberUseCase {
  final UserRespository respository;

  SignInwithPhoneNumberUseCase({required this.respository});

  Future<void> call(String smsPinCode) async {
    return respository.signInWithPhoneNumber(smsPinCode);
  }
}
