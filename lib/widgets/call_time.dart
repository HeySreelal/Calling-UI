import 'package:calls/utils/theme.dart';
import 'package:calls/utils/time.dart';
import 'package:flutter/material.dart';

class CallTime extends StatelessWidget {
  const CallTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
      builder: (BuildContext context, AsyncSnapshot<int> snap) {
        return Text(
          getTimeFromSeconds(snap.data ?? 0),
          style: const TextStyle(
            color: CallTheme.white,
          ),
        );
      },
    );
  }
}
