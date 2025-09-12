import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/pages/home/home.dart';
import 'package:whatsapp/providers/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  int loginState = 0;



  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(!_isLoading && loginState == -1 ? "Info invalide" : ""),
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

              // TextField(
              //   controller: passwordController,
              //   decoration: InputDecoration(
              //     label: Text("Mot de passe"),
              //     hintText: "Saisir votre mot de passe ",
              //     border: OutlineInputBorder(),
              //   ),
              //   keyboardType: TextInputType.datetime,
              //   onChanged: (value) {
              //     //OK
              //   },
              // ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFF128C7E)),
                ),

                onPressed: () async {
                  try {
                    if (!_isLoading && emailController.text != "") {
                      setState(() {
                        _isLoading = true;
                      });
                      UserModel user = UserModel(
                        name: "ckp",
                        email: emailController.text,
                        phone_number: "+228XXXXXXX",
                        password: "password",
                      );

                      int mState = await authProvider.login(user);

                      print(await authProvider.login(user));

                      setState(()  {
                        loginState = mState;
                        _isLoading = false;
                      });
                    }
                  } catch (e) {
                    setState(() {
                      loginState = -1;
                    });
                    print(e);
                    setState(() {
                      _isLoading = false;
                    });
                  }
                  if (loginState == 1) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                child: _isLoading
                    ? SizedBox(
                        width: 15,
                        height: 15,
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Envoyer',
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
