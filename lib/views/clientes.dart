import 'package:flutter/material.dart';

import '../model/client_model.dart';
import '../service/get_user.dart';
import 'cad_cli.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha tela'),
      ),
      body: ListView.builder(
        itemCount: 1, // Set this to the number of items you want to display in the listview
        itemBuilder: (context, index) {
          // Get the saved user information
          UserModel? userModel = LoginUser().getsavedUser(context) as UserModel?;

          // Return a list tile with the user information
          return ListTile(
            title: Text(userModel!.name.toString()),
            subtitle: Text(userModel.mail.toString()),
          );
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
