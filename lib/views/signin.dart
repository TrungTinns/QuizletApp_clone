// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:quizlet/services/auth.services.dart';
import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/forget_password.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/qtext.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';
import 'package:quizlet_flashcard/views/home.dart';
import 'package:quizlet_flashcard/views/signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
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
              // const Text(
              //   'QUICKLY LOGIN WITH',
              //   style: TextStyle(
              //     color: textColor,
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 10),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: ElevatedButton(
              //           style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.white),
              //             shape:
              //                 MaterialStateProperty.all<RoundedRectangleBorder>(
              //               RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10.0),
              //               ),
              //             ),
              //           ),
              //           onPressed:(){},
              //           onPressed: () async {
              //             await AuthService().googleLogin();
              //             if (FirebaseAuth.instance.currentUser != null) {
              //               Navigator.of(context).pushNamedAndRemoveUntil(
              //                 '/main',
              //                 (Route<dynamic> route) => false,
              //               );
              //             }
              //           },
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.only(right: 8.0),
              //                 child: Image.asset(
              //                   'assets/google.png',
              //                   width: 25,
              //                   height: 25,
              //                 ),
              //               ),
              //               const Text(
              //                 'LOGIN WITH GOOGLE',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 14,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              
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
                  hintText: "Enter password",
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
                        
                        onPressed:(){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        // onPressed: () async {
                        //   if (emailTextController.text != '' &&
                        //       passwordTextController.text != '') {
                        //     final emailResult = await AuthService().emailSignin(
                        //       emailTextController.text,
                        //       passwordTextController.text,
                        //     );
                        //     if (emailResult == 'user-not-found') {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: QText(
                        //             text: "User with that email doesn't exist.",
                        //             color: Colors.white,
                        //           ),
                        //           behavior: SnackBarBehavior.floating,
                        //           backgroundColor: snackBarColor,
                        //         ),
                        //       );
                        //     }
                        //     if (emailResult == 'wrong-password') {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: QText(
                        //             text: 'The password is invalid.',
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
                          'SIGN IN',
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                  },
                  child: Center(
                    child: QText(
                      color: textColor.withOpacity(0.5),
                      text: "Forget Password",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(color: Color.fromARGB(164, 255, 255, 255), fontSize: 16),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()
                        ));
                      },
                      child: Text("Sign up", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16, decoration: TextDecoration.underline)))
                  ],
                ),
                SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}
