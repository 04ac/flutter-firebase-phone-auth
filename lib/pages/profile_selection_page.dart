import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/auth_service.dart';
import 'enter_language_page.dart';

class ProfileSelectionPage extends StatefulWidget {
  const ProfileSelectionPage({super.key});

  @override
  State<ProfileSelectionPage> createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  int selectedButton = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please select your profile",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                ),
                child: Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      fillColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF2E3B62),
                      ),
                      groupValue: selectedButton,
                      onChanged: (selected) {
                        setState(() {
                          selectedButton = selected!;
                        });
                      },
                    ),
                    const Icon(
                      Icons.house_outlined,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipper",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet,\n"
                          "consectetur adipiscing",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                ),
                child: Row(
                  children: [
                    Radio<int>(
                      value: 2,
                      fillColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF2E3B62),
                      ),
                      groupValue: selectedButton,
                      onChanged: (selected) {
                        setState(() {
                          selectedButton = selected!;
                        });
                      },
                    ),
                    const Icon(
                      Icons.fire_truck,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transporter",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet,\n"
                          "consectetur adipiscing",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF2E3B62),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(),
                      ),
                    ),
                  ),
                  child: Text(
                    "CONTINUE",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                  onPressed: () {
                    AuthService.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnterLanguagePage(),
                      ),
                    );
                  },
                  child: const Text("Logout"))
            ],
          ),
        ),
      )),
    );
  }
}
