import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/Services/model/my_data_model.dart';
import 'package:task8/Services/model/person_model.dart';
import 'package:task8/data/bloc/network_manager/injection.dart';
import 'package:task8/data/bloc/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = UserBloc();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rest Api'),
      ),
      body:
      BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, state) {
          if (state is UserInitial) {
            return CircularProgressIndicator();
          }
          if (state is UsersLoaded) {
            return ListView.builder(
                itemCount: state.users.data.length,
                itemBuilder: (context, index) {
                  // fetchList();
                  print('object');
                  print(state.users.data[index].avatar);
                  print(state.users.data[index].avatar.toString());
                  return ListTile(
                    // leading: Image.network(state.users.data[index].avatar ?? ''),
                    title: Text(state.users.data[index].id.toString()),
                    subtitle: Text(
                        state.users.data[index].first_name.toString() +
                            state.users.data[index].last_name.toString()),
                    trailing: Text(state.users.data[index].email.toString()),
                  );
                });
          }
          return Text('data');
        },
      ),
    );
  }

//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   // PersonModel personList = PersonModel();
//   // MyPage usersList = MyPage();
//   bool isLoading = true;
//   /*
//   fetchPerson() {
//     restClient.getUsers().then((value) {
//       setState(() {
//         isLoading = false;
//         usersList = value;
//       });
//     }).onError((error, stackTrace) {
//       print("Error$error");
//     });
//   }
// */
//   fetchList() {
//     restClient.getPosts().then((value) {
//       print('FetchList');
//       print(value.toString());
//     });
//   }
//
//   @override
//   void initState() {
//     // fetchPerson();
//     fetchList();
//     // TODO: implement initState
//     super.initState();
//   }

}
