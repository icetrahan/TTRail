import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/reusable_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameFirstTextController = TextEditingController();
  TextEditingController _nameLastTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool existingUser = false;
  bool errorExisting = false;
  var auth = FirebaseAuth.instance;

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('Users').snapshots();

  Future<Null> handleSignUp() async {
    this.setState(() {
      globals.loading = true;
    });

    bool notAllFieldsCompleted = false;
    bool passwordIssue = false;

    if (_nameFirstTextController.text == "" || _nameFirstTextController == " ")
      notAllFieldsCompleted = true;
    if (_nameLastTextController.text == "" || _nameLastTextController == " ")
      notAllFieldsCompleted = true;
    if (_passwordTextController == "" || _passwordTextController == " ")
      notAllFieldsCompleted = true;
    if (_emailTextController == "" || _emailTextController == " ")
      notAllFieldsCompleted = true;
    if (_passwordTextController.text.length < 6) passwordIssue = true;

    if (notAllFieldsCompleted || passwordIssue) {
      if (notAllFieldsCompleted)
        Fluttertoast.showToast(
          msg: "Please completed all fields",
          gravity: ToastGravity.CENTER,
          fontSize: 20,
        );
      else
        Fluttertoast.showToast(
          msg: "Passwords need atleast 6 characters",
          gravity: ToastGravity.CENTER,
          fontSize: 20,
        );

      this.setState(() {
        globals.loading = false;
      });
    } else {
      User? firebaseUser;
      try {
        var result = await auth.createUserWithEmailAndPassword(
            email: _emailTextController.text.trim(),
            password: _passwordTextController.text.trim());
        firebaseUser = result.user;
      } catch (e) {
        print("e.toString():" + e.toString());
        if (e.toString().contains('email-already-in-use')) {
          try {
            var result = await auth.signInWithEmailAndPassword(
                email: _emailTextController.text.trim(),
                password: _passwordTextController.text.trim());
            firebaseUser = result.user;
            print("result.user:" + result.user.toString());
          } catch (e) {
            print("e.toString()2::::" + e.toString());
          }
        }
        if (e.toString().contains('weak-password'))
          Fluttertoast.showToast(
            msg: "Password is too weak",
            gravity: ToastGravity.CENTER,
            fontSize: 20,
          );

        print(e.toString());

        this.setState(() {
          globals.loading = false;
        });
      }
      if (firebaseUser != null) {
        globals.UserDatabaseManager().createUserData(
            _emailTextController.text,
            _nameFirstTextController.text + " " + _nameLastTextController.text,
            firebaseUser.uid);

        globals.userId = firebaseUser.uid;
        globals.userFullName =
            _nameFirstTextController.text + " " + _nameLastTextController.text;
        globals.userEmail = _emailTextController.text;
        globals.userRole = 'user';
      }
      auth
          .signInWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text)
          .then((value) {
        Navigator.pushNamed(context, '/home');
      });
      this.setState(() {
        globals.loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: globals.logoOrange,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: globals.buttonHeight * 1.5),
              SizedBox(
                width: globals.buttonWidth * 7,
                child: signupTextField("Enter First Name", Icons.person_outline,
                    false, _nameFirstTextController),
              ),
              SizedBox(height: globals.buttonHeight * 0.2),
              SizedBox(
                width: globals.buttonWidth * 7,
                child: signupTextField("Enter Last Name", Icons.person_outline,
                    false, _nameLastTextController),
              ),
              SizedBox(height: globals.buttonHeight * 0.2),
              SizedBox(
                width: globals.buttonWidth * 7,
                child: signupTextField("Enter Email", Icons.email_outlined,
                    false, _emailTextController),
              ),
              SizedBox(height: globals.buttonHeight * 0.2),
              SizedBox(
                width: globals.buttonWidth * 7,
                child: signupTextField("Enter Password", Icons.lock_outline,
                    false, _passwordTextController),
              ),
              SizedBox(height: globals.buttonHeight * 0.2),
              signInUpButton(context, false, () {
                for (var id in globals.idList) {
                  globals.usersList.forEach((map) {
                    if (map[id]['email'] == _emailTextController.text) {
                      existingUser = true;
                    }
                  });
                }
                ;

                !existingUser ? handleSignUp() : errorExisting = true;

                setState(() {});
              }),
              errorExisting
                  ? const Text(
                      "There is already a user account with this email",
                      style: TextStyle(color: Colors.red))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
