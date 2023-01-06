import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;

TextField loginTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  bool revealPass = false;
  isPasswordType ? revealPass = true : revealPass = false;
  return TextField(
    controller: controller,
    obscureText: revealPass,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: globals.appWhite,
    style: TextStyle(
      color: globals.appWhite,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: globals.appWhite,
      ),
      suffix: isPasswordType
          ? IconButton(
              icon: revealPass
                  ? Icon(Icons.remove_red_eye_outlined, color: globals.appWhite)
                  : Icon(Icons.remove_red_eye, color: globals.appWhite),
              onPressed: () async {
                revealPass = !revealPass;
              },
            )
          : SizedBox(),
      labelText: text,
      labelStyle: TextStyle(
        color: globals.appWhite,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: globals.appWhite.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextField signupTextField(String text, IconData icon, bool isPhone,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    enableSuggestions: true,
    autocorrect: true,
    cursorColor: globals.appWhite,
    style: TextStyle(
      color: globals.appWhite,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: globals.appWhite,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: globals.appWhite,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: globals.appWhite.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPhone ? TextInputType.phone : TextInputType.emailAddress,
  );
}

Container signInUpButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: globals.buttonWidth * 7,
    height: globals.buttonHeight * 0.6,
    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return globals.appGrey;
            }
            return globals.appWhite;
          })),
      child: Text(
        isLogin ? "LOG IN" : "Sign Up",
        style: TextStyle(
            color: globals.appBlack, fontWeight: FontWeight.w700, fontSize: 16),
      ),
    ),
  );
}
