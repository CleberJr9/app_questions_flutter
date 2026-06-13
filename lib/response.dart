import 'package:flutter/material.dart';

class ResponseQuestion extends StatelessWidget {
  String text;
  final VoidCallback? onPressed;
  ResponseQuestion({super.key, this.text = "Resposta 1", this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          onPressed ??
          () {
            print("nenhuma resposta selecionada");
          },
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Text(text),
    );
  }
}
