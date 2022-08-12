import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_temporizador/src/shared/ticker.dart';

part 'temporizador_event.dart';
part 'temporizador_state.dart';

class TemporizadorBloc extends Bloc<TemporizadorEvent, TemporizadorState> {
  final Ticker _ticker;
  static const int _duracao = 60;
  StreamSubscription<int>? _tickerSubscription;

  TemporizadorBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TemporizadorInitial(_duracao)) {
    on<TemporizadorStarted>(_onStarted);
    on<TemporizadorPaused>(_onPaused);
    on<TemporizadorResumed>(_onResumed);
    on<TemporizadorReset>(_onReset);
    on<TemporizadorTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TemporizadorStarted event, Emitter<TemporizadorState> emit) {
    emit(TemporizadorRunInProgress(event.duracao));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(segundos: event.duracao)
        .listen((duracao) => add(TemporizadorTicked(duracao: duracao)));
  }

  void _onPaused(TemporizadorPaused event, Emitter<TemporizadorState> emit) {
    if (state is TemporizadorRunInProgress) {
      _tickerSubscription?.pause();
      emit(TemporizadorRunPause(state.duracao));
    }
  }

  void _onResumed(TemporizadorResumed resume, Emitter<TemporizadorState> emit) {
    if (state is TemporizadorRunPause) {
      _tickerSubscription?.resume();
      emit(TemporizadorRunInProgress(state.duracao));
    }
  }

  void _onReset(TemporizadorReset event, Emitter<TemporizadorState> emit) {
    _tickerSubscription?.cancel();
    emit(const TemporizadorInitial(_duracao));
  }

  void _onTicked(TemporizadorTicked event, Emitter<TemporizadorState> emit) {
    emit(
      event.duracao > 0
          ? TemporizadorRunInProgress(event.duracao)
          : const TemporizadorRunComplete(),
    );
  }
}
