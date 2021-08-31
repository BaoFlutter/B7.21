import 'package:bloc_event_state/blocs/timer_bloc/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đồng hồ đếm ngược")
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocProvider<TimerBloc>(
          create: (context)=> TimerBloc(),
          child: BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state ){
              final String minutesStr =
              ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
              final String secondsStr =
              (state.duration % 60).floor().toString().padLeft(2, '0');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // timer
                    Text('$minutesStr:$secondsStr',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // widgets
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children:
                       actionWidgets(state, context),

                   )

                  ],
                ),

              );

            },
          ),

        ),
      )

    );
  }

  actionWidgets(state, context)
  {
    final TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    if(state is TimerInitial){
      return[
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.add(TimerStarted(state.duration)),
        )];

    }
    else if(state is TimerInProgress)
      {
        return  [
            FloatingActionButton(
              child: Icon(Icons.pause),
              onPressed: () => timerBloc.add(TimerPause()),
            ),
            FloatingActionButton(
              child: Icon(Icons.replay),
              onPressed: () => timerBloc.add(TimerReset()),
            ),
          ];
      }

    else if(state is TimerStatePaused){
      return [
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () => timerBloc.add(TimerResume()),
          ),
          FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed: () => timerBloc.add(TimerReset()),
          ),
        ];
    }
    else if(state is TimerCompleted){
      return [ FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () => timerBloc.add(TimerReset()),
      )];
    }
    return [];
  }



}
