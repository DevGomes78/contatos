import 'package:flutter/material.dart';

import '../components/button_widget.dart';
import '../components/container_widget.dart';
import '../components/text_form_widget.dart';
import '../constants/string_constants.dart';
import '../controller/validate_fields.dart';
import '../model/client_model.dart';
import '../service/save_user.dart';
import 'clientes.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool saved = false;

  Future<bool?> showConfirmationDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(StringConstants.desejaSair),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(StringConstants.cancelar),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(StringConstants.sair),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 80),
              _nameField(),
              const SizedBox(height: 10),
              _phoneField(),
              const SizedBox(height: 10),
              _emailField(),
              const SizedBox(height: 20),
              _btnRegisterLogin()
            ],
          ),
        ),
      ),
    );
  }

  _nameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[500],
        ),
        child: TextFormWidget(
          StringConstants.nome,
          StringConstants.digiteNome,
          const Icon(
            Icons.person_add,
            color: Colors.deepPurple,
          ),
          controller: _nameController,
          obscureText: false,
          validator: Validate().validateName,
        ),
      ),
    );
  }

  _phoneField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[500],
        ),
        child: TextFormWidget(
          StringConstants.sobreNome,
          StringConstants.digiteSobreNome,
          const Icon(
            Icons.phone,
            color: Colors.deepPurple,
          ),
          controller: _phoneController,
          obscureText: false,
          validator: Validate().validateLastName,
        ),
      ),
    );
  }

  _emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[500],
        ),
        child: TextFormWidget(
          StringConstants.email,
          StringConstants.digiteEmail,
          const Icon(
            Icons.email,
            color: Colors.deepPurple,
          ),
          controller: _emailController,
          obscureText: false,
          validator: Validate().validateEmail,
        ),
      ),
    );
  }

  _btnRegisterLogin() {
    return InkWell(
      onTap: () {
        _register();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ClientPage()));
      },
      child: ButtonWidget(
        text: StringConstants.cadastrar,
      ),
    );
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      UserModel newUser = UserModel(
        name: _nameController.text,
        phone: _phoneController.text,
        mail: _emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(StringConstants.clienteRegistrado),
        ),
      );
      SaveUser().saveUser(newUser, context);
      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();
    }
  }
}
