import 'package:flutter/material.dart';
import 'package:jobseek/pages/choose_role_page.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  final textStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "JobSeek",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Image.asset(
                  "assets/images/welcome.png",
                  height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Find Your",
                style: textStyle.copyWith(color: Colors.blue[900]),
              ),
              Text(
                "Dream Job",
                style: textStyle.copyWith(
                  color: Colors.yellow[700],
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.yellow[700],
                ),
              ),
              Text("Here!", style: textStyle.copyWith(color: Colors.blue[900])),
              SizedBox(height: 10),
              Text("Explore all the most exciting job roles based"),
              Text("on your interest and study major."),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FloatingActionButton(
                    heroTag: 'welcomeFAB',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseRole()),
                      );
                    },
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
