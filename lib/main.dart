import 'package:flutter/material.dart';
import './question.dart';
import './response.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaState createState() => PerguntaState();
}

class PerguntaState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;

  final List<Map<String, dynamic>> perguntasRespostas = [
    {
      "pergunta": "Qual é a sua cor favorita?",
      "resposta": ["Preto", "Azul", "Verde"],
    },
    {
      "pergunta": "Qual é o seu animal favorito?",
      "resposta": ["Cachorro", "Gato", "Coelho"],
    },
    {
      "pergunta": "Qual é o seu instrutor favorito?",
      "resposta": ["Maria", "João", "Leo"],
    },
  ];

  void funcaoResponder(String resposta) {
    setState(() {
      perguntaSelecionada++;
    });

    print("Resposta selecionada: $resposta");
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool finalizou = perguntaSelecionada >= perguntasRespostas.length;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Perguntas",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: finalizou
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "🎉 Parabéns!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Você concluiu o questionário.",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: reiniciarQuestionario,
                      child: const Text("Reiniciar"),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Question(
                      perguntasRespostas[perguntaSelecionada]["pergunta"],
                    ),

                    const SizedBox(height: 16),

                    for (String resposta
                        in perguntasRespostas[perguntaSelecionada]["resposta"])
                      ResponseQuestion(
                        text: resposta,
                        onPressed: () => funcaoResponder(resposta),
                      ),

                    const SizedBox(height: 16),

                    Text(
                      "Pergunta ${perguntaSelecionada + 1} de ${perguntasRespostas.length}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
