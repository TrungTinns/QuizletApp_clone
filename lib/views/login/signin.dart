// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:quizlet/services/auth.services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/services/auth_service.dart';
import 'package:quizlet_flashcard/views/forget_password.dart';
import 'package:quizlet_flashcard/views/home/home.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/qtext.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';
import 'package:quizlet_flashcard/views/register/signup.dart';

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
      appBar: AppBar(
        title: customAppBar(context),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
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
                        
                        // onPressed:(){
                        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        // },
                        onPressed: () async {
                          if (emailTextController.text != '' &&
                              passwordTextController.text != '') {
                            final emailResult = await AuthService().emailSignin(
                              emailTextController.text,
                              passwordTextController.text,
                            );
                            if (emailResult == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: QText(
                                    text: "User with that email doesn't exist.",
                                    color: Colors.white,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: snackBarColor,
                                ),
                              );
                            }
                            if (emailResult == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: QText(
                                    text: 'The password is invalid.',
                                    color: Colors.white,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: snackBarColor,
                                ),
                              );
                            }
                            if (FirebaseAuth.instance.currentUser != null &&
                                mounted) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/main',
                                (Route<dynamic> route) => false,
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: QText(
                                  text: 'Please fill in all fields',
                                  color: Colors.white,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: snackBarColor,
                              ),
                            );
                          }
                        },
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
                      child: Text("Sign up", style: TextStyle(color: textColor, fontSize: 16, decoration: TextDecoration.underline)))
                  ],
                ),
                SizedBox(height: 18),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    color: textColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  Container(
                    color: authThemeColor,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(color: textColor.withOpacity(0.5), fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      try {
                        // Thực hiện đăng nhập bằng Google qua Firebase Authentication
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(
                          GoogleAuthProvider()
                        );
                        
                        // Lấy thông tin về người dùng đăng nhập
                        User? user = userCredential.user;

                        // Xử lý sau khi đăng nhập thành công, ví dụ: chuyển hướng sang màn hình chính
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } catch (e) {
                        print('Đã xảy ra lỗi khi đăng nhập bằng Google: $e');
                      }
                    },

                    child: Container(
                      width: 300,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'assets/images/google_icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text('Sign-in with Google')
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
          )
        )
      )
    );
  }
}
