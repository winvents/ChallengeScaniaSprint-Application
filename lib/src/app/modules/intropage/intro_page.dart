import 'package:challengescania_sprint2/src/app/components/standard_appbar.dart';
import 'package:challengescania_sprint2/src/app/components/standard_button.dart';
import 'package:challengescania_sprint2/src/app/modules/homepage/home_page.dart';
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
            SizedBox(
              width: 5,
            ),
            Text(
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
              SizedBox(
                height: 45,
              ),
              const Text(
                '${welcome} ${'User'}',
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                height: 30,
              ),
              const Text(introText, textAlign: TextAlign.justify,),
              SizedBox(
                height: 45,
              ),
              StandardButton(
                buttonText: start,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => HomePage()),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(promoted),
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
