import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Future initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(),
          height: MediaQuery.of(context).size.height * 3 / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Contate-me",
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
