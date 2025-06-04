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
      'texto': 'Qual a sua cor favorita?',
        'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 0}, 
        {'texto': 'Branco', 'pontuacao': 5}]
    },
    {
      'texto': 'Qual seu animal favorito?',
        'respostas': [
        {'texto': 'Yeti', 'pontuacao': 10},
        {'texto': 'Lula', 'pontuacao': 0}, 
        {'texto': 'Cachorro', 'pontuacao': 5}]
    },
      {
      'texto': 'Qual seu time favorito?',
        'respostas': [
        {'texto': 'Ceará', 'pontuacao': 10},
        {'texto': 'Flamengo', 'pontuacao': 5}, 
        {'texto': 'Fortalza', 'pontuacao': 0}]
    },
      {
      'texto': 'Qual seu esporte favorito?',
        'respostas': [
        {'texto': 'Basquete', 'pontuacao': 5},
        {'texto': 'Futebol', 'pontuacao': 10}, 
        {'texto': 'Beach Tenis', 'pontuacao': 0}]
    },
      {
      'texto': 'Qual o seu professor favorito?',
        'respostas': [
        {'texto': 'Julião', 'pontuacao': 10},
        {'texto': 'Olegário', 'pontuacao': 10}, 
        {'texto': 'Alan', 'pontuacao': 10}]
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