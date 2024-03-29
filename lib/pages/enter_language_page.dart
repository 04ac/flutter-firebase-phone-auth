import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class EnterLanguagePage extends StatefulWidget {
  const EnterLanguagePage({super.key});

  @override
  State<EnterLanguagePage> createState() => _EnterLanguagePageState();
}

class _EnterLanguagePageState extends State<EnterLanguagePage> {
  String dropDownValue = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Icon(
                      Icons.image_outlined,
                      size: 84,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Please select your Language",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "You can change the language\nat any time.",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6A6C7B),
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropDownValue,
                        items: <String>['English'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            dropDownValue = newVal!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF2E3B62),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(),
                            ),
                          ),
                        ),
                        child: Text(
                          "NEXT",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "images/bottom1.png",
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "images/bottom2.png",
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
