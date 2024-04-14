// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_chat_phone_number/features/user/domain/entities/user_entity.dart';
import 'package:flutter_chat_phone_number/features/user/domain/usecases/user/get_all_users_usecase.dart';
import 'package:flutter_chat_phone_number/features/user/domain/usecases/user/update_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetAllUsersUseCase getAllUsersUseCase;

  UserCubit(
    this.updateUserUseCase,
    this.getAllUsersUseCase,
  ) : super(UserInitial());
  Future<void> updateUser(UserEntity user) async {
    try {
      await updateUserUseCase(user);
      // emit(UserU(user));
    } catch (e) {
      emit(UserFailure());
    }
  }

  Future<void> getAllUsers() async {
    emit(UserLoading());
    final streamResponse = getAllUsersUseCase.call();
    streamResponse.listen((users) {
      emit(UserLoaded(users: users));
    });
  }
}
