import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class SignOutUseCase {
  final UserRespository respository;

  SignOutUseCase({required this.respository});

  Future<void> call() async {
    return respository.signOut();
  }
}
