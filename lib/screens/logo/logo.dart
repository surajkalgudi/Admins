import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:co_ordinators/screens/SignIn/SignIn.dart';
import 'package:co_ordinators/screens/SignIn/bloc/SignIn_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/images/logo.png'),
        nextScreen: BlocProvider(
            create: (BuildContext context)=>SignInBloc(),
            child: SignIn()),
        splashTransition: SplashTransition.scaleTransition,
        duration: 2200,
        splashIconSize: 150,
      ),
    );
  }
}
