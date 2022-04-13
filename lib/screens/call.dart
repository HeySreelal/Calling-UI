import 'package:calls/screens/home.dart';
import 'package:calls/utils/slide.dart';
import 'package:calls/utils/theme.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
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

class ActionButtons extends StatefulWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  bool muteSelect = false;
  bool dialpadSelect = false;
  bool speakerSelect = false;

  void updateMute(bool val) {
    setState(() {
      muteSelect = val;
    });
  }

  void updateDialpad(bool val) {
    setState(() {
      dialpadSelect = val;
    });
  }

  void updateSpeaker(bool val) {
    setState(() {
      speakerSelect = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PrimaryButton(
              onTap: () {
                updateMute(!muteSelect);
              },
              icon: Icon(
                Icons.mic_off,
                color: muteSelect ? CallTheme.white : CallTheme.greyish,
              ),
              color: CallTheme.black,
              isSelected: muteSelect,
              label: "Mute",
            ),
            PrimaryButton(
              onTap: () {
                updateDialpad(!dialpadSelect);
              },
              icon: Icon(
                Icons.dialpad,
                color: dialpadSelect ? CallTheme.white : CallTheme.greyish,
              ),
              color: CallTheme.black,
              isSelected: dialpadSelect,
              label: "Dialpad",
            ),
            PrimaryButton(
              onTap: () {
                updateSpeaker(!speakerSelect);
              },
              icon: Icon(
                Icons.volume_up,
                color: speakerSelect ? CallTheme.white : CallTheme.greyish,
              ),
              color: CallTheme.black,
              isSelected: speakerSelect,
              label: "Speaker",
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            PrimaryButton(
              icon: Icon(
                Icons.add_call,
                color: CallTheme.greyish,
              ),
              color: CallTheme.black,
              label: "Add Call",
            ),
            PrimaryButton(
              icon: Icon(
                Icons.sim_card,
                color: CallTheme.greyish,
              ),
              color: CallTheme.black,
              label: "Change SIM",
            ),
            PrimaryButton(
              icon: Icon(
                Icons.people,
                color: CallTheme.greyish,
              ),
              color: CallTheme.black,
              label: "Contacts",
            ),
          ],
        ),
      ],
    );
  }
}
