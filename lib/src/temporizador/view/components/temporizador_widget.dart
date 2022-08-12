import 'package:flutter/material.dart';
import 'package:flutter_bloc_temporizador/src/temporizador/view/components/action_widget.dart';

import 'background.dart';
import 'timetext.dart';

class TemporizadorWidget extends StatelessWidget {
  const TemporizadorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporizador con Bloc'),
      ),
      body: Stack(
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              ActionsTemporizador(),
            ],
          ),
        ],
      ),
    );
  }
}
