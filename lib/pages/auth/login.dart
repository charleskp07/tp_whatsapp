import 'package:flutter/material.dart';
import 'package:whatsapp/pages/auth/otpcode.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
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

              ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFF128C7E))),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpCodeScreen()),
                  );
                } ,
                child: 
                Text( 
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