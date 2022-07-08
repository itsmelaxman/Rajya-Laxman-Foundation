import 'dart:async';
import 'package:laxman_foundation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _alignment = Alignment.bottomCenter;

  @override
  initState() {
    super.initState();
    Timer(const Duration(milliseconds: 10), animate);
  }

  Future<Timer> loadTimer() async {
    return Timer(const Duration(milliseconds: 500), navigate);
  }

  navigate() {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (_) => const HomeScreen()));
  }

  animate() {
    setState(() {
      _alignment = Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          const Center(
            child: FadeInImage(
              placeholder: AssetImage('assets/images/fade.jpg'),
              image: AssetImage('assets/images/splash_bg.png'),
              fadeInDuration: Duration(milliseconds: 300),
              fit: BoxFit.fitHeight,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            alignment: _alignment,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Rajya Laxman',
                  style: GoogleFonts.raleway(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Foundation',
                  style: GoogleFonts.raleway(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onEnd: loadTimer,
          ),
        ],
      ),
    );
  }
}
