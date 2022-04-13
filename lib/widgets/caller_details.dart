import 'package:calls/utils/theme.dart';
import 'package:flutter/material.dart';

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
