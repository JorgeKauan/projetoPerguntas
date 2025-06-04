import 'package:flutter/material.dart';
import './respostas.dart';
import './questão.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder
  });

   bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }


  @override
  Widget build(BuildContext context) {

    final List<dynamic> respostasList = temPerguntaSelecionada 
    ? (perguntas[perguntaSelecionada]['respostas'] as List<dynamic>? ?? [])
    : [];

    return Column(
      children: <Widget>[
        
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            ...respostasList
            .map((resp) => Respostas(resp['texto'], () => responder(resp['pontuacao'])))
            .toList(),

      ],
    );
  }
  
}