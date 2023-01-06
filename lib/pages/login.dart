import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/secure_storage.dart' as SS;
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/reusable_widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

bool passwordCorrect = true;
bool passwordReset = false;
bool failedPassReset = false;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool error = false;
  bool showPass = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    globals.UserDatabaseManager().getUsersList();
    getLogin();
    setState(() {});
  }

  getLogin() async {
    await SS.UserSecureStorage()
        .getLogin(emailTextController, passwordTextController);
    setState(() {});
  }

  @override
  Future<Null> handleLogin() async {
    setState(() {
      globals.loading = true;
    });

    User? firebaseUser;

    await auth
        .signInWithEmailAndPassword(
            email: emailTextController.text,
            password: passwordTextController.text)
        .then((value) {
      passwordCorrect = true;
    }).onError((error, stackTrace) {
      passwordCorrect = false;
    });

    firebaseUser = auth.currentUser;

    if (passwordCorrect) {
      globals.usersList.forEach((map) {
        if (map['id'] == firebaseUser?.uid) {
          globals.userId = map['id'];
          globals.userFullName = map['name'];
          globals.userEmail = map['email'];
          globals.userRole = map['role'];
        }
      });
    }

    if (globals.userRole == '') {
      globals.userHasRole = false;
      globals.userHasRoleUser = false;
    } else {
      if (globals.userRole == 'user') {
        globals.userHasRole = true;
        globals.userHasRoleUser = true;
      }
    }

    print(globals.userRole);

    setState(() {
      globals.loading = false;
    });

    passwordCorrect ? Navigator.pushNamed(context, '/home') : setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    globals.SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: globals.appDarkGrey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: globals.buttonHeight * 1.5),
              Image.asset(
                'assets/ttLogo3.png',
                fit: BoxFit.fitWidth,
                width: globals.buttonWidth * 7.5,
              ),
              SizedBox(height: globals.buttonHeight * 0.5),
              SizedBox(
                width: globals.buttonWidth * 7,
                height: globals.buttonHeight * 0.7,
                child: loginTextField(
                    "Email", Icons.person_outline, false, emailTextController),
              ),
              SizedBox(height: globals.buttonHeight * 0.3),
              //Password
              SizedBox(
                width: globals.buttonWidth * 7,
                height: globals.buttonHeight * 0.7,
                child: TextField(
                    controller: passwordTextController,
                    obscureText: !showPass,
                    enableSuggestions: false,
                    autocorrect: false,
                    cursorColor: globals.appWhite,
                    style: TextStyle(
                      color: globals.appWhite,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: globals.appWhite,
                      ),
                      suffixIcon: IconButton(
                        icon: showPass
                            ? Icon(Icons.remove_red_eye_outlined,
                                color: globals.appWhite)
                            : Icon(Icons.remove_red_eye,
                                color: globals.appWhite),
                        onPressed: () async {
                          showPass = !showPass;
                          setState(() {});
                        },
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: globals.appWhite,
                      ),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: globals.appWhite.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword),
              ),
              signInUpButton(context, true, () async {
                SS.UserSecureStorage().saveLogin(globals.savePass,
                    emailTextController, passwordTextController);
                await handleLogin();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: Checkbox(
                      value: globals.savePass,
                      checkColor: Colors.white,
                      activeColor: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: globals.appWhite)),
                      onChanged: (bool? value) {
                        setState(() {
                          globals.savePass = value!;
                        });
                        setState(() {});
                      },
                    ),
                  ),
                  Text(
                    'Save Password',
                    style: TextStyle(
                      color: globals.appWhite,
                    ),
                  ),
                ],
              ),
              passwordCorrect
                  ? const Text("")
                  : const Text(
                      "Your password or email was not entered correctly.\n",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an accout?  ",
                    style: TextStyle(
                      color: globals.appWhite,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: globals.appWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: globals.buttonHeight * 1.5),
              passwordReset
                  ? Text(
                      "Your password reset link has been sent to: " +
                          emailTextController.text,
                      style: TextStyle(color: globals.appWhite),
                    )
                  : failedPassReset
                      ? Text(
                          "Please make sure you entered your email correctly.",
                          style: TextStyle(color: globals.appWhite),
                        )
                      : SizedBox(height: globals.buttonHeight * 0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot your password?  ",
                    style: TextStyle(
                      color: globals.appWhite,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: emailTextController.text)
                          .then((value) {
                        passwordReset = true;
                        failedPassReset = false;
                        Navigator.pushNamed(context, '/home');
                      }).onError((error, stackTrace) {
                        passwordReset = false;
                        failedPassReset = true;
                      });
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        color: globals.appWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
