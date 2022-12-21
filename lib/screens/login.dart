import 'package:app_2/screens/home.dart';
import 'package:app_2/services/firebase_services.dart';
import 'package:app_2/utulity/colors_util.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
        hexStringToColor("37692d"),
        hexStringToColor("8a4232"),
        hexStringToColor("807340")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
            onPressed: () async {
              await FirebaseServices().signInWithGoogle();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states)
              {
                if(states.contains(MaterialState.pressed)) {
                  return Colors.black26;
                }
                return Colors.white;
              }
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(8.5),
              child: Padding(
                padding: EdgeInsets.all(8.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Login with Google",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      ),
    );
  }
}
