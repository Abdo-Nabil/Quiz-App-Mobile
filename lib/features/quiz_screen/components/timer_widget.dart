import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerWidget extends StatefulWidget {
  final int durationInMin;
  const TimerWidget({required this.durationInMin, Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  //
  late StopWatchTimer _stopWatchTimer;
  //
  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  void initState() {
    initTimer();
    super.initState();
  }

  initTimer() async {
    _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      onStop: () {},
      onEnded: () {
        //ToDo:
        // End quiz navigating to finish screen
      },
    );
    _stopWatchTimer.setPresetMinuteTime(widget.durationInMin);
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  //
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: _stopWatchTimer.rawTime.value,
      builder: (context, snap) {
        final value = snap.data!;
        final displayTime = StopWatchTimer.getDisplayTime(
          value,
          milliSecond: false,
          second: true,
          minute: true,
          hours: false,
        );
        return Text(displayTime,
            style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize));
      },
    );
  }
}