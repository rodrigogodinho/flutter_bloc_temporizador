import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/temporizador_bloc.dart';

class ActionsTemporizador extends StatelessWidget {
  const ActionsTemporizador({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemporizadorBloc, TemporizadorState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TemporizadorInitial) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TemporizadorBloc>()
                    .add(TemporizadorStarted(duracao: state.duracao)),
              ),
            ],
            if (state is TemporizadorRunInProgress) ...[
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () =>
                    context.read<TemporizadorBloc>().add(TemporizadorPaused()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () =>
                    context.read<TemporizadorBloc>().add(TemporizadorReset()),
              ),
            ],
            if (state is TemporizadorRunPause) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () =>
                    context.read<TemporizadorBloc>().add(TemporizadorResumed()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () =>
                    context.read<TemporizadorBloc>().add(TemporizadorReset()),
              ),
            ],
            if (state is TemporizadorRunComplete) ...[
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () =>
                    context.read<TemporizadorBloc>().add(TemporizadorReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}
