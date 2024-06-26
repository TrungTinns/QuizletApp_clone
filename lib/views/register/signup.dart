// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:quizlet/services/auth.services.dart';
import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/qtext.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';
import 'package:quizlet_flashcard/views/home/home.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final nameTextController = TextEditingController();
    final emailTextController = TextEditingController();
    final passwordTextController = TextEditingController();

    return Scaffold(
      appBar: customAppBar(context),
      resizeToAvoidBottomInset: false,
      backgroundColor: authThemeColor,
      body: Container(
        margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: const Text(
                  'OR CREATE AN ACCOUNT',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                controller: nameTextController,
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                maxLength: 50,
                decoration: const InputDecoration(
                  helperText: 'Name',
                  hintStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  hintText: "Enter name",
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                ),
              ),
              TextFormField(
                controller: emailTextController,
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                maxLength: 50,
                decoration: const InputDecoration(
                  helperText: 'Email',
                  hintStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  hintText: "example@email.com",
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                ),
              ),
              TextFormField(
                controller: passwordTextController,
                cursorColor: textColor,
                maxLength: 20,
                obscureText: true,
                style: const TextStyle(color: textColor),
                decoration: const InputDecoration(
                  helperText: 'Password',
                  hintText: "Create password",
                  hintStyle:
                      TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 35, 171, 255)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        // onPressed: () async {
                        //   if (emailTextController.text != '' &&
                        //       passwordTextController.text != '' &&
                        //       nameTextController.text != '') {
                        //     final emailResult = await AuthService().emailSignup(
                        //       nameTextController.text,
                        //       emailTextController.text,
                        //       passwordTextController.text,
                        //     );
                        //     if (emailResult == 'weak-password') {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: QText(
                        //             text: 'The password provided is too weak',
                        //             color: Colors.white,
                        //           ),
                        //           behavior: SnackBarBehavior.floating,
                        //           backgroundColor: snackBarColor,
                        //         ),
                        //       );
                        //     }
                        //     if (emailResult == 'email-already-in-use') {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: QText(
                        //             text:
                        //                 'The account already exists for that email',
                        //             color: Colors.white,
                        //           ),
                        //           behavior: SnackBarBehavior.floating,
                        //           backgroundColor: snackBarColor,
                        //         ),
                        //       );
                        //     }
                        //     if (FirebaseAuth.instance.currentUser != null &&
                        //         mounted) {
                        //       Navigator.of(context).pushNamedAndRemoveUntil(
                        //         '/main',
                        //         (Route<dynamic> route) => false,
                        //       );
                        //     }
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //         content: QText(
                        //           text: 'Please fill in all fields',
                        //           color: Colors.white,
                        //         ),
                        //         behavior: SnackBarBehavior.floating,
                        //         backgroundColor: snackBarColor,
                        //       ),
                        //     );
                        //   }
                        // },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

