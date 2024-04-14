import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class GetAllUsersUseCase {
  final UserRespository respository;

  GetAllUsersUseCase({required this.respository});

  Stream<List<UserEntity>> call() {
    return respository.getAllUsers();
  }
}
