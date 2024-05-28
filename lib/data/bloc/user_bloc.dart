import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:task8/Services/model/my_data_model.dart';
import 'package:task8/data/bloc/network_manager/injection.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUserEvent>(_onLoadUserEvent);
  }

  Future<void> _onLoadUserEvent(
      LoadUserEvent event,
      Emitter<UserState> emit
      ) async {
    try {
      var box = await Hive.openBox<MyPage>('user');
      final users = box.get('myPageData');

      if (users != null) {
        emit(UsersLoaded(users: users)); // Emit the state with loaded users from Hive
      } else {
        final user1 = await restClient.getUsers();
        await box.put('myPageData', user1);
        emit(UsersLoaded(users: user1)); // Emit the state with loaded users from the internet
      }
    } catch (error) {
      print("Error: $error");
      emit(UserError("Failed to load users")); // Emit an error state
    } finally {
      await Hive.close();
    }
  }
}
