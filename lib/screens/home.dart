import 'package:calls/screens/call.dart';
import 'package:calls/utils/slide.dart';
import 'package:calls/utils/theme.dart';
import 'package:calls/widgets/caller_details.dart';
import 'package:calls/widgets/contact_image.dart';
import 'package:calls/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class IncomingCallPage extends StatelessWidget {
  const IncomingCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CallerDetails(),
              const SizedBox(height: 30),
              const ContactImage(),
              const SizedBox(height: 30),
              SizedBox(
                width: 100,
                height: 35,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message,
                      color: CallTheme.blue, size: 18),
                  label: const Text(
                    "Reply",
                    style: TextStyle(
                      color: CallTheme.blue,
                      fontSize: 13,
                    ),
                  ),
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.resolveWith(
                      (states) => CallTheme.white.withOpacity(
                        0.1,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => CallTheme.white,
                    ),
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) => CallTheme.white.withOpacity(0.1),
                    ),
                    elevation: MaterialStateProperty.resolveWith(
                      (states) => 1,
                    ),
                    shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Hero(
                    tag: "Decline",
                    child: PrimaryButton(
                      icon: Icon(Icons.call_end),
                      color: CallTheme.red,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  PrimaryButton(
                    icon: const Icon(Icons.call),
                    color: CallTheme.green,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        slidingRoute(const CallScreen()),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
