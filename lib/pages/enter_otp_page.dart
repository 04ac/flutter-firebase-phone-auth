import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy_flutter_assignment/pages/profile_selection_page.dart';
import 'package:pinput/pinput.dart';
import '../controllers/auth_service.dart';
import 'login_page.dart';

class EnterOtpPage extends StatefulWidget {
  final String phoneNum;
  const EnterOtpPage({super.key, required this.phoneNum});

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                "Verify Phone",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Code is sent to ${widget.phoneNum}",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6A6C7B),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                controller: _otpController,
                length: 6,
                defaultPinTheme: const PinTheme(
                  width: 48,
                  height: 48,
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    color: Color(0xFF93D2F3),
                  ),
                ),
                showCursor: true,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code?",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6A6C7B),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Request again",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6A6C7B),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 328,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    handleSubmit(context, _otpController.text);
                  },
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
                    "VERIFY AND CONTINUE",
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
    );
  }
}

void handleSubmit(BuildContext context, String otp) {
  if (otp.length == 6) {
    AuthService.loginWithOtp(otp: otp).then((value) {
      if (value == "Success") {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ProfileSelectionPage()));
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
    });
  }
}
