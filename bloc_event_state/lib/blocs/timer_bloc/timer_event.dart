import 'package:equatable/equatable.dart';

class TimerEvent extends Equatable{
  const TimerEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TimerStarted extends TimerEvent {
  final int duration;
  TimerStarted(this.duration);
}

class TimerStepRun extends TimerEvent{
  final int duration;
  TimerStepRun(this.duration);
}

class TimerPause extends TimerEvent{}

class TimerResume extends TimerEvent{}

class TimerReset extends TimerEvent{}

