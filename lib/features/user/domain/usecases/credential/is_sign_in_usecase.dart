import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class IsSignInUseCase {
  final UserRespository respository;

  IsSignInUseCase({required this.respository});

  Future<bool> call() async {
    return respository.isSignIn();
  }
}
