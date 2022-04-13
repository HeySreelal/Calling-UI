import 'package:calls/screens/home.dart';
import 'package:calls/utils/slide.dart';
import 'package:calls/utils/theme.dart';
import 'package:calls/widgets/action_buttons.dart';
import 'package:calls/widgets/call_time.dart';
import 'package:calls/widgets/caller_details.dart';
import 'package:calls/widgets/contact_image.dart';
import 'package:calls/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(
                child: ContactImage(
                  width: 100,
                ),
              ),
              const CallerDetails(
                isCalling: false,
              ),
              const SizedBox(height: 10),
              const CallTime(),
              const SizedBox(height: 30),
              const ActionButtons(),
              const SizedBox(height: 60),
              Center(
                child: Hero(
                  tag: "Decline",
                  child: PrimaryButton(
                    icon: const Icon(Icons.call_end),
                    color: CallTheme.red,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        slidingRoute(const IncomingCallPage()),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
