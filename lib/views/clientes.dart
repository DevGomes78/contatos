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
        itemCount: 10, // number of items in the list
        itemBuilder: (context, index) {
          // retrieve user model for the current item
          UserModel user =  LoginUser().getsavedUser(context) as UserModel;

          // build the widget for the current item
          return ListTile(
            title: Text(user.name.toString()),
            subtitle: Text(user.mail.toString()),
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
