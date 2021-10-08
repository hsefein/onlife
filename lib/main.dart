import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'CategoryListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x000000ff),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Connect - Sign In'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  void _incrementCounter() {
    setState(() {
   
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
   return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black
              ),
              onPressed: signIn, 
                            icon: FaIcon(FontAwesomeIcons.google, color: Colors.red), 
                            label: Text('Sign In with Google')),
                        ],
                      ),
                    ),
                  );
  }


  Future signIn() async {
                  final user = await GoogleSignInApi.login();

                  if (user == null) {
                    ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Sign in Failed')));
                  } else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CategoryListPage(user: user),
                  ));
                  }
                    }
                  }

                 class GoogleSignInApi {
                    static final _googleSignIn = GoogleSignIn();
                    static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

                    static Future logout() => _googleSignIn.disconnect(); 
}
