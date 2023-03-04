import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(color: Colors.grey),
      child: Center(
        child: Text("Sign In",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
