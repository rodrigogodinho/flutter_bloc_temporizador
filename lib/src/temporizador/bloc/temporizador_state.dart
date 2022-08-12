part of 'temporizador_bloc.dart';

abstract class TemporizadorState extends Equatable {
  final int duracao;

  const TemporizadorState(this.duracao);

  @override
  List<Object> get props => [duracao];
}

class TemporizadorInitial extends TemporizadorState {
  const TemporizadorInitial(super.duracao);

  @override
  String toString() => 'Temporizador inicial - duracao: $duracao .';
}

class TemporizadorRunPause extends TemporizadorState {
  const TemporizadorRunPause(super.duracao);

  @override
  String toString() => 'Temporizador pausado - duracao: $duracao .';
}

class TemporizadorRunInProgress extends TemporizadorState {
  const TemporizadorRunInProgress(super.duracao);

  @override
  String toString() => 'Temporizador executando - duracao: $duracao .';
}

class TemporizadorRunComplete extends TemporizadorState {
  const TemporizadorRunComplete() : super(0);

  @override
  String toString() => 'Temporizador finalizado';
}
