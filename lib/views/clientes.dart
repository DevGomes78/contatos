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
      body: Center(
        child: FutureBuilder<List?>(
          future: LoginUser().getsavedUser(context),
          builder: (BuildContext context, AsyncSnapshot<List?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(snapshot.data![index].toString()),
                  );
                }

              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
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
