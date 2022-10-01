import 'package:challengescania_sprint2/src/app/components/standard_button.dart';
import 'package:challengescania_sprint2/src/app/modules/home_page.dart';
import 'package:challengescania_sprint2/src/utils/exports.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Color.fromARGB(206, 0, 0, 0)]),
          ),
        ),
        // backgroundColor: Color.fromARGB(255, 13, 13, 13),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scanialogo.png',
              fit: BoxFit.cover,
              height: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              title,
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgintro.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              const Text(
                '$welcome',
                style: TextStyle(fontSize: 35),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                introText,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 45,
              ),
              StandardButton(
                buttonText: start,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HomePage()),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(promoted),
                  Image.asset(
                    'assets/images/logo branco.png',
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
