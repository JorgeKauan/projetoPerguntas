import 'package:flutter/material.dart';
import './respostas.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;
  final int totalPerguntas;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
    required this.totalPerguntas,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  Color _getNivelColor(String nivel) {
    switch (nivel) {
      case 'Fácil':
        return Colors.green;
      case 'Médio':
        return Colors.orange;
      case 'Difícil':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> respostasList = temPerguntaSelecionada 
        ? (perguntas[perguntaSelecionada]['respostas'] as List<dynamic>? ?? [])
        : [];

    final String nivel = temPerguntaSelecionada 
        ? perguntas[perguntaSelecionada]['nivel'].toString()
        : '';

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          // Progresso
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pergunta ${perguntaSelecionada + 1} de $totalPerguntas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getNivelColor(nivel),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        nivel,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (perguntaSelecionada + 1) / totalPerguntas,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ],
            ),
          ),
          
          // Questão
          Questao(perguntas[perguntaSelecionada]['texto'].toString()),
          
          SizedBox(height: 20),
          
          // Respostas
                      ...respostasList
                .map((resp) => Respostas(
                      resp['texto'], 
                      () => responder(resp['pontuacao'])
                    )),
        ],
      ),
    );
  }
}