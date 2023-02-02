import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'custom_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  FocusNode myFocusNode = FocusNode();
  AnimationController? animationController;
  String textError = '';
  String email = '';
  String password = '';
  double xOffset = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 50), vsync: this);
    // controller = TextEditingController();
  }

  void checkValidation() {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      textError = 'Enter yoru all information';
    }
    if (textError != '' || email.trim().isEmpty || password.trim().isEmpty) {
      animationController!.reset();
      setState(() {
        if (xOffset == 0) {
          xOffset = 100;
        } else if (xOffset == 100) {
          xOffset = -100;
        } else if (xOffset == -100) {
          xOffset = 100;
        }
      });
      animationController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: height * 0.025,
            ),
            if (textError != '')
              Text(
                textError,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            SizedBox(
              height: height * 0.025,
            ),
            SizedBox(
              width: width <= 500 ? width * 0.5 : 300,
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          email = value.trim();
                          if (email.isEmpty) {
                            textError = '';
                          } else if (!isEmail(email)) {
                            textError = 'Enter valid Email';
                          } else {
                            textError = '';
                          }
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          errorBorder: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      child: TextFormField(
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          password = value.trim();
                          if (password.isEmpty) {
                            textError = '';
                          } else if (password.length < 8) {
                            textError =
                                'Password must be at least 8 characters';
                          } else {
                            textError = '';
                          }
                          setState(() {});
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          errorBorder: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AnimatedBuilder(
                      animation: animationController!,
                      builder: (context, child) => Transform.translate(
                        offset: Offset(animationController!.value * xOffset, 0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.basic,
                          onHover: (event) => checkValidation(),
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => const CustomDialog(),
                            ),
                            child: const Text(
                              'Click',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
