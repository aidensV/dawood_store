import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image(image: AssetImage('assets/img_login_top.png')),
            ),
            SizedBox(height: 34),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 64.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email'),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
              ),
            ),
            SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute( builder: (BuildContext context) => Home()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
