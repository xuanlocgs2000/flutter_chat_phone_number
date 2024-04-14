import 'package:flutter_chat_phone_number/features/user/domain/entities/contact_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class GetDeviceNumberUseCase {
  final UserRespository respository;

  GetDeviceNumberUseCase({required this.respository});

  Future<List<ContactEntity>> call() {
    return respository.getDeviceNumber();
  }
}
