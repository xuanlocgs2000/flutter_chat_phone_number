import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class VerifyPhoneNumberUseCase {
  final UserRespository respository;

  VerifyPhoneNumberUseCase({required this.respository});

  Future<void> call(String phoneNumber) async {
    return respository.verifyPhoneNumber(phoneNumber);
  }
}
