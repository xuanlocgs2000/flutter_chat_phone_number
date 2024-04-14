import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class UpdateUserUseCase {
  final UserRespository respository;

  UpdateUserUseCase({required this.respository});

  Future<void> call(UserEntity user) async {
    return respository.updateUser(user);
  }
}
