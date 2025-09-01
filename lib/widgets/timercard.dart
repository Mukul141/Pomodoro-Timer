import 'package:flutter/material.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:provider/provider.dart';

import '../timerservice.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;
    final minutes = provider.currentDuration ~/ 60;

    return Column(
      children: [
        Text(provider.currentState, style: textStyle(35, Colors.white, FontWeight.w700)),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular((15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(0, 2)
                  )
                ]
              ),
              child: Center(
                child: Text((minutes == 0 ? "00" : minutes).toString(),
                  style: textStyle(70, renderColor(provider.currentState), FontWeight.bold),),
              ),
            ),
            SizedBox(width: 10,),
            Text(":",style: textStyle(60, Colors.red[200], FontWeight.bold),),
            SizedBox(width: 10,),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 2)
                    )
                  ]
              ),
              child: Center(
                  child: Text(seconds == 0 ? "00" : seconds.round().toString(),
                  style: textStyle(70, renderColor(provider.currentState), FontWeight.bold),),
              ),
            ),
          ],
        )
      ],
    );
  }
}
