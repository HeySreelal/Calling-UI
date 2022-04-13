import 'package:calls/screens/call.dart';
import 'package:calls/utils/slide.dart';
import 'package:calls/utils/theme.dart';
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

class ContactImage extends StatelessWidget {
  final double width;
  const ContactImage({
    this.width = 200.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "contact",
      child: Container(
        width: width,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 0),
              spreadRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(600),
          child: Image.asset(
            "images/stacy.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CallerDetails extends StatelessWidget {
  final bool isCalling;
  const CallerDetails({
    Key? key,
    this.isCalling = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "caller",
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: isCalling ? 'Incoming call via ' : "Calling via ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextSpan(
                  text: 'VI',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: CallTheme.orange,
                      ),
                ),
                if (isCalling)
                  TextSpan(
                    text: ' from ',
                    style: Theme.of(context).textTheme.headline6,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "Stacy Smith",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Mobile +1 (919) 919-9191",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String? label;
  final bool isSelected;
  final Icon icon;
  final Color color;
  final VoidCallback? onTap;
  const PrimaryButton({
    Key? key,
    required this.icon,
    required this.color,
    this.onTap,
    this.isSelected = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap ?? () {},
          child: icon,
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.resolveWith(
              (states) => CallTheme.white.withOpacity(
                0.2,
              ),
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => CallTheme.white,
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => color,
            ),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => CallTheme.white.withOpacity(0.1),
            ),
            elevation: MaterialStateProperty.resolveWith(
              (states) => 2,
            ),
            shape: MaterialStateProperty.resolveWith(
              (states) => CircleBorder(
                side: isSelected
                    ? BorderSide(color: CallTheme.white.withOpacity(0.2))
                    : BorderSide.none,
              ),
            ),
            padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.all(22),
            ),
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 12),
          Text(
            label!,
            style: TextStyle(
              color: isSelected ? CallTheme.white : CallTheme.greyish,
              fontSize: 13,
            ),
          ),
        ]
      ],
    );
  }
}
