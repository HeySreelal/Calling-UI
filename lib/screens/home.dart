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
              Container(
                width: 200,
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
                children: const [
                  AcceptRejectButtons(
                    icon: Icon(Icons.call_end),
                    color: CallTheme.red,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  AcceptRejectButtons(
                    icon: Icon(Icons.call),
                    color: CallTheme.green,
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

class CallerDetails extends StatelessWidget {
  const CallerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Incoming call via ',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextSpan(
                text: 'JIO',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: CallTheme.orange,
                    ),
              ),
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
          "Mobile +91-9876543210",
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}

class AcceptRejectButtons extends StatelessWidget {
  final Icon icon;
  final Color color;
  const AcceptRejectButtons({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: icon,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.resolveWith(
          (states) => CallTheme.white.withOpacity(
            0.1,
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
          (states) => 1,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => const CircleBorder(),
        ),
        padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.all(22),
        ),
      ),
    );
  }
}
