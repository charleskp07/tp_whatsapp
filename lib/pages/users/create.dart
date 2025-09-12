import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/providers/user.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Créer un contact")),
      body: Column(
        children: [
          Text("Creation de contact"),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              label: Text("Name"),
              hintText: "Saisir le name ici",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              //OK
            },
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              label: Text("E-mail"),
              hintText: "Saisir votre adresse email",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              //OK
            },
          ),
          TextField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              label: Text("Phone number"),
              hintText: "Saisir le phone number ici",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              //OK
            },
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              label: Text("Password"),
              hintText: "Saisir le mot de passe",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              //OK
            },
          ),

          ElevatedButton(
            onPressed: () async {
              try {
                if (!_isLoading &&
                    nameController.text != "" &&
                    emailController.text != "" &&
                    phoneNumberController.text != "" &&
                    passwordController.text != "") {
                  setState(() {
                    _isLoading = true;
                  });
                  UserModel user = UserModel(
                    name: nameController.text,
                    email: emailController.text,
                    phone_number: phoneNumberController.text,
                    password: passwordController.text,
                  );

                  await userProvider.addUser(user);

                  setState(() {
                    _isLoading = false;
                  });
                }
              } catch (e) {
                setState(() {
                  _isLoading = false;
                });
              }
            },

            child: _isLoading
                ? SizedBox(
                    width: 15,
                    height: 15,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Enregistrer',
                    style: TextStyle(color: Colors.green),
                  ),
          ),
        ],
      ),
    );
  }
}
