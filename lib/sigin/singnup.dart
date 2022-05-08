import 'package:flutter/material.dart';
import 'package:login/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/home/home_screen.dart';
import 'package:login/firebase/firebase_ui_button.dart';
import './social_icon.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignupPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        //brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Username"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obscureText: true),
                  //inputFile(label: "Confirm Password ", obscureText: true),
                ],
              ),
              firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: inputFile(label: "Email").toString(),
                          password: inputFile(label: "Password").toString())
                      .then((value) {
                    //print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }).onError((error, stackTrace) {
                    //print("Error ${error.toString()}"+"Eroare");
                  });
                }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                loginPage(context),
                ],
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                  //key: ,
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                  //key: ,
                ),
              ]
              ),
              Container(
                  padding: const EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/sigup2.png"),
                      fit: BoxFit.fitHeight
                    ),

                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}



// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(152, 152, 152, 2)
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      const SizedBox(height: 10,)
    ],
  );
}

Widget loginPage(BuildContext context) {
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: 20,
      //width: 600,
      //alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Already have an account? Login",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage())),
      ),
    );
}
