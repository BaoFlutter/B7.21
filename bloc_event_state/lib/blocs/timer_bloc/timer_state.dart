import 'package:equatable/equatable.dart';

class TimerState extends Equatable {
  final int duration;

  TimerState(this.duration);

  @override
  // TODO: implement props
  List<Object?> get props => [duration];

}

class TimerInitial extends TimerState {
  TimerInitial(int duration) : super(duration);
  @override
  String toString()  => "[Initial State ]: $duration";

}

class TimerInProgress extends TimerState {
  TimerInProgress(int duration) : super(duration);

  @override
  String toString()  => "[Progress State ]: $duration";

}

class TimerStatePaused extends TimerState {
  TimerStatePaused(int duration) : super(duration);
  @override
  String toString()  => "[Paused State ]: $duration";

}

class TimerCompleted extends TimerState {
  TimerCompleted() : super(0);
}