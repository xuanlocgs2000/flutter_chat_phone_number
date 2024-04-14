import 'package:flutter_chat_phone_number/features/user/domain/repository/user_repository.dart';

class GetCuttentUidUseCase {
  final UserRespository respository;
  GetCuttentUidUseCase(this.respository);

  Future<String> call() async {
    return respository.getCurrentUID();
  }
}
