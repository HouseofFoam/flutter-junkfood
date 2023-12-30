import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_try/components/introbutton.dart';
import 'package:flutter_application_try/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: primaryColor,
            statusBarColor: primaryColor),
        title: Text(
          "JUNK FOODS",
          style: GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/food_assets/pizza.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "EAT UNTIL YOU DIE",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 48, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "The unhealthiest junkfood restaurant in the world get ready to die",
              style: TextStyle(color: Colors.grey[200], height: 2),
            ),
            const SizedBox(height: 25),
            IntroButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
