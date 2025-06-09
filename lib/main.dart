import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;


  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  
    print(_pontuacaoTotal);
  }

  void _reiniciarFormulario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
  
   bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual o maior campeão da NBA?',
        'respostas': [
        {'texto': 'Los Angeles Lakers', 'pontuacao': 0},
        {'texto': 'Golden State Warriors', 'pontuacao': 0}, 
        {'texto': 'Boston Celtics', 'pontuacao': 10}]
    },
    {
      'texto': 'Qual o maior pontuador de 3 da NBA?',
        'respostas': [
        {'texto': 'Kevin Durant', 'pontuacao': 0},
        {'texto': 'LeBron James', 'pontuacao': 0}, 
        {'texto': 'Stephen Curry', 'pontuacao': 10}]
    },
      {
      'texto': 'Quantos pontos tem LeBron James em toda a sua carreira?',
        'respostas': [
        {'texto': '50.033', 'pontuacao': 10},
        {'texto': '51.989', 'pontuacao': 0}, 
        {'texto': '52.500', 'pontuacao': 0}
        ]
    },
      {
      'texto': 'Quantos titulos tem Stephen Curry?',
        'respostas': [
        {'texto': '16', 'pontuacao': 0},
        {'texto': '4', 'pontuacao': 0}, 
        {'texto': '7', 'pontuacao': 10}]
    },
      {
      'texto': 'Qual dos times abaixo Kevin Durat nunca jogou?',
        'respostas': [
        {'texto': 'Golden State Warriors', 'pontuacao': 0},
        {'texto': 'Brooklyn Nets', 'pontuacao': 0}, 
        {'texto': 'Indiana Pacers', 'pontuacao': 10}]
    },
   
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas!!!'),
        ),
        body: temPerguntaSelecionada ?
        Questionario(perguntas: _perguntas,
         perguntaSelecionada: _perguntaSelecionada,
          responder: _responder
          ) : Resultado(_pontuacaoTotal, _reiniciarFormulario)
        ),
    );
  }
}