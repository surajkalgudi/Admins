import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:co_ordinators/componenets/Text_fields.dart';
import 'package:co_ordinators/screens/SignIn/bloc/SignIn_bloc.dart';
import 'package:co_ordinators/screens/SignIn/bloc/SignIn_event.dart';
import 'package:co_ordinators/screens/SignIn/bloc/SignIn_state.dart';
import 'package:co_ordinators/screens/SignUp/SignUp.dart';
import 'package:co_ordinators/screens/homePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSignedIn = true;
  bool signedIn=false;
  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      setState(() {
        signedIn=true;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Sign in Successfull")),backgroundColor: Colors.green,));
        isSignedIn = result.isSignedIn;
      });

    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Invalid Email/Password")),backgroundColor: Colors.red,));
      setState(() {
        BlocProvider.of<SignInBloc>(context).add(
            SignInTextFieldChangedEvent(
                emailController.text, passwordController.text));
      });

      safePrint(e.message);
    }
  }


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
              scale: 1.5,
            )),

            const SizedBox(
              height: 30,
            ),

            const Text(
              "Welcome back you've been missed!",
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 40,
            ),

            // SnackBar(
            //   backgroundColor: Colors.red,
            //     content:
            BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
              if (state is SignInErrorState) {
                return Text(state.errorMessage);
              } else {
                return Container();
              }
            }),

            MyTextFields(
                controller: emailController,
                hintText: "Email-Id",
                obscureText: false,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextFieldChangedEvent(
                          emailController.text, passwordController.text));
                }),

            const SizedBox(
              height: 30,
            ),

            MyTextFields(
                controller: passwordController,
                hintText: "Password",
                obscureText: false,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextFieldChangedEvent(
                          emailController.text, passwordController.text));
                }),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // GestureDetector(
            //   onTap: () {},
            //   child: BlocBuilder<SignInBloc, SignInState>(
            //       builder: (BuildContext context, state) {
            //     return Container(
            //       padding: EdgeInsets.all(25),
            //       margin: EdgeInsets.symmetric(horizontal: 25),
            //       decoration: BoxDecoration(
            //           color: (state is SignInValidState)
            //               ? Colors.deepPurpleAccent
            //               : Colors.grey,
            //           borderRadius: BorderRadius.circular(20)),
            //       child: Center(
            //         child: Text(
            //           "Sign In",
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),
            // ),
            //       ),
            //     );
            //   }),
            // ),

            SizedBox(
                height: 60, //height of button
                width: double.infinity, //width of button equal to parent widget
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      if (state is SignInLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: (state is SignInValidState)
                                        ? Colors.deepPurpleAccent
                                        : Colors.grey.shade600)),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              (state is SignInValidState)
                                  ? Colors.deepPurpleAccent
                                  : Colors.grey),
                        ),
                        onPressed: () {
                          signInUser(emailController.text,passwordController.text);
                          if (state is SignInValidState) {
                            BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmittedEvent(emailController.text,
                                  passwordController.text),
                            );
                          }
                          if(state is SignInLoadingState){

                          }
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        //parameters of Button class
                      );
                    },
                  ),
                )),

            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
