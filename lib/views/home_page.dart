import 'package:contatos/components/container_widget.dart';
import 'package:contatos/views/clientes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estetica Gomes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 50),
           Row(
             children: [
               InkWell(
                 onTap: (){Navigator.push(
                     context, MaterialPageRoute(builder: (context)=>ClientPage()));},
                   child: ContainerWidget(text: 'Clientes')),
               const SizedBox(width: 10),
               ContainerWidget(text: 'Agendas'),
             ],
           ),
            const SizedBox(height: 10),
            Row(
              children: [
                ContainerWidget(text: 'Fornecedores'),
                const SizedBox(width: 10),
                ContainerWidget(text: 'relatorios'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
