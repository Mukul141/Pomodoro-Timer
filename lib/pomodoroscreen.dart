import 'package:flutter/material.dart';
import 'package:pomodoro_timer/timerservice.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:pomodoro_timer/widgets/progresswidget.dart';
import 'package:pomodoro_timer/widgets/timecontroller.dart';
import 'package:pomodoro_timer/widgets/timeoptions.dart';
import 'package:pomodoro_timer/widgets/timercard.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text("POMODORO TIMER", style: textStyle(25, Colors.white, FontWeight.w700)),
        actions: [
          IconButton(
            onPressed: () => Provider.of<TimerService>(context, listen: false).reset(),
            icon: Icon(Icons.refresh,
              color: Colors.white,),
            iconSize: 40,)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 15,),
              TimerCard(),
              SizedBox(height: 40,),
              TimeOptions(),
              SizedBox(height: 40,),
              TimeController(),
              SizedBox(height: 40,),
              ProgressWidget()
            ],
          ),
        )
      )
    );
  }
}
