import 'package:flutter/material.dart';
import 'package:whatsapp/pages/home/home.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
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
                  label: Text("OTP"), 
                  hintText: "Saisir le otp",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  //OK
                },
              ),

              ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFF128C7E))),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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