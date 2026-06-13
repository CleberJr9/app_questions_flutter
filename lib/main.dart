import 'package:app_questions/response.dart';
import 'package:flutter/material.dart';
import './question.dart';

main() => runApp(PerguntaApp());

class PerguntaState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  void funcaoResponder(String resposta) {
    if (perguntaSelecionada < perguntasRespostas.length - 1) {
      setState(() {
        perguntaSelecionada++;
      });
    } else {
      setState(() {
        perguntaSelecionada = 0;
      });
    }
    print("Resposta selecionada: $resposta");
  }

  final List<String> perguntas = [
    "Qual é a sua cor favorita?",
    "Qual é o seu animal favorito?",
    "Qual é o seu instrutor favorito?",
  ];
  final List<String> respostas = [
    "Preto",
    "Azul",
    "Verde",
    "Cachorro",
    "Gato",
    "Coelho",
    "Maria",
    "João",
    "Leo",
  ];

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Perguntas",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 145, 255),
        ),
        body: Center(
          child: Column(
            spacing: 12,
            children: <Widget>[
              Question(perguntasRespostas[perguntaSelecionada]["pergunta"]),
              for (String resposta
                  in perguntasRespostas[perguntaSelecionada]["resposta"])
                ResponseQuestion(
                  text: resposta,
                  onPressed: () => funcaoResponder(resposta),
                ),
              Text(
                "Pergunta ${perguntaSelecionada + 1} de ${perguntasRespostas.length}",
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaState createState() {
    return PerguntaState();
  }
}
