import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class GetSingleUserUseCase {
  final UserRespository respository;

  GetSingleUserUseCase({required this.respository});

  Stream<List<UserEntity>> call(String uid) {
    return respository.getSingeUsers(uid);
  }
}
