import 'package:co_ordinators/componenets/Text_fields.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Center(
                child: Image.asset(
              'assets/images/signin.png',
              scale: 1.8,
            )),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome to Can-cer vive!",
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            MyTextFields(
              controller: emailController,
              hintText: "Email Id",
              obscureText: false,
              onChanged: (val) {},
            ),
            SizedBox(
              height: 30,
            ),
            MyTextFields(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
              onChanged: (val) {},
            ),
            SizedBox(
              height: 30,
            ),
            MyTextFields(
              controller: passwordController,
              hintText: "Re-Password",
              obscureText: true,
              onChanged: (val) {},
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      'Already Signed up?',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
