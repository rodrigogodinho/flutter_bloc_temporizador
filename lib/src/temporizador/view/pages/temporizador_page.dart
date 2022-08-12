import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_temporizador/src/temporizador/bloc/temporizador_bloc.dart';
import 'package:flutter_bloc_temporizador/src/temporizador/view/components/temporizador_widget.dart';

import '../../../shared/ticker.dart';

class TemporizadorPage extends StatelessWidget {
  const TemporizadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TemporizadorBloc(ticker: const Ticker()),
      child: const TemporizadorWidget(),
    );
  }
}
