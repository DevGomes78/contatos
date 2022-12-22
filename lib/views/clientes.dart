import 'package:flutter/material.dart';

import '../model/client_model.dart';
import '../service/get_user.dart';
import 'cad_cli.dart';

class ClientPage extends StatelessWidget {

UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha tela'),
      ),
      body: FutureBuilder(
        future: LoginUser().getsavedUser(context),
        builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.hasData) {
            UserModel? user = snapshot.data;
            return ListView(
              children: [
                Text(user!.name.toString()),
                Text(user.mail.toString()),
                Text(user.phone.toString()),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        },
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () =>Navigator.push(
            context, MaterialPageRoute(builder: (context)=>RegisterPage())),
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
