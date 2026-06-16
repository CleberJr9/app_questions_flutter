import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final int perguntaselecionada;
  final void Function() reiniciarQuestionario;

  Result({
    required this.pontuacao,
    required this.perguntaselecionada,
    required this.reiniciarQuestionario,
  
  })

  String get fraseResultado {
    if (pontuacao <= 8) {
      return "Parabéns!";
    } else if (pontuacao <= 12) {
      return "Você é bom!";
    } else if (pontuacao <= 16) {
      return "Impressionante!";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fraseResultado,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: reiniciarQuestionario,
          child: const Text("Reiniciar Questionário"),
        ),
      ],
    );
  }
}
