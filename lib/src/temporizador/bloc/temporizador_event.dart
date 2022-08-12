part of 'temporizador_bloc.dart';

abstract class TemporizadorEvent extends Equatable {
  const TemporizadorEvent();

  @override
  List<Object> get props => [];
}

class TemporizadorStarted extends TemporizadorEvent {
  final int duracao;

  const TemporizadorStarted({required this.duracao});
}

class TemporizadorPaused extends TemporizadorEvent {
  const TemporizadorPaused();
}

class TemporizadorResumed extends TemporizadorEvent {
  const TemporizadorResumed();
}

class TemporizadorReset extends TemporizadorEvent {
  const TemporizadorReset();
}

class TemporizadorTicked extends TemporizadorEvent {
  const TemporizadorTicked({required this.duracao});
  final int duracao;

  @override
  List<Object> get props => [duracao];
}
