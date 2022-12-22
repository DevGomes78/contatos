import 'package:flutter/material.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha tela'),
      ),
      body: const Center(
        child: Text('Conteúdo da tela'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          // Adicione aqui a ação do botão
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
