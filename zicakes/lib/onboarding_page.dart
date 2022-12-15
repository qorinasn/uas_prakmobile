import 'package:flutter/material.dart';
import 'package:zicakes/view/login.dart';
import 'package:zicakes/home.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg.jfif"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset('assets/images/logo.png', height: 100, width: 98),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/onboard.png',
            height: 280,
            width: 290,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'A gift of wanderful \n taste',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Made by hand, from scratch, \n with love',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 31, 0, 0).withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 55,
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 33, 22, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                print("tesss");
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home_page()));
              },
              child: const Text(
                'GO',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
