import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task8/Services/model/my_data_model.dart';
import 'package:task8/data/bloc/network_manager/injection.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUserEvent>(_onLoadUserEvent); // Change this to the specific event handler
  }

  Future<void> _onLoadUserEvent(
    LoadUserEvent event, // Specify the correct event type
    Emitter<UserState> emit // Change LoadUser to UserState
  ) async {
    try {
      final users = await restClient.getUsers();
      emit(UsersLoaded(users:users)); // Emit the appropriate state with loaded users
    } catch (error) {
      print("Error: $error");
      emit(UserError("Failed to load users")); // Emit an error state
    }
  }
}
