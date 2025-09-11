import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/providers/auth.dart';
// import 'package:whatsapp/providers/contact.dart';
// import 'package:whatsapp/providers/discussion.dart';
// import 'package:whatsapp/pages/home/home.dart';
import 'package:whatsapp/providers/user.dart';
import 'pages/auth/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        // ChangeNotifierProvider(
        //   create: (_) => ContactProvider()
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => DiscussionProvider()

        // ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF128C7E)),
      ),
      home: const MyHomePage(title: 'Whatsapp'),
      // home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.only(right: 20, left: 20),

          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: 100),
                child: Image.asset('assets/images/WHAT.png', width: 300),
              ),

              Text(
                'Bienvenu sur whatsapp',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                'Veuillez lire notre politique de confidentialité. Appuyez sur "Accepter et Continuer" pour accepter les conditions d\'utilisation',
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFF128C7E)),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Accepter et Continuer',
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
