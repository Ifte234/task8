part of 'user_bloc.dart';

sealed class UserState {}

class UserInitial extends UserState {}

class UsersLoaded extends UserState {
  MyPage users;
  UsersLoaded({required this.users});
}

class UserError extends UserState {
  String error;
  UserError(this.error);
}
