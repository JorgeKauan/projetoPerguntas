import 'package:flutter/material.dart';
import 'dart:math';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  var _perguntasRespondidas = 0;
  late List<Map<String, Object>> _perguntasSelecionadas;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _selecionarPerguntasAleatorias();
  }

  void _selecionarPerguntasAleatorias() {
    List<Map<String, Object>> todasPerguntas = _todasPerguntas;
    _perguntasSelecionadas = [];
    
    // Seleciona 10 perguntas aleatórias
    while (_perguntasSelecionadas.length < 10) {
      int indiceAleatorio = _random.nextInt(todasPerguntas.length);
      Map<String, Object> pergunta = todasPerguntas[indiceAleatorio];
      
      if (!_perguntasSelecionadas.contains(pergunta)) {
        _perguntasSelecionadas.add(pergunta);
      }
    }
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
        _perguntasRespondidas++;
      });
    }
  }

  void _reiniciarFormulario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
      _perguntasRespondidas = 0;
      _selecionarPerguntasAleatorias();
    });
  }
  
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntasSelecionadas.length;
  }

  final List<Map<String, Object>> _todasPerguntas = const [
    // FÁCIL
    {
      'texto': 'Qual é a capital do Brasil?',
      'nivel': 'Fácil',
      'respostas': [
        {'texto': 'São Paulo', 'pontuacao': 0},
        {'texto': 'Rio de Janeiro', 'pontuacao': 0}, 
        {'texto': 'Brasília', 'pontuacao': 10}]
    },
    {
      'texto': 'Quantos planetas existem no Sistema Solar?',
      'nivel': 'Fácil',
      'respostas': [
        {'texto': '7', 'pontuacao': 0},
        {'texto': '8', 'pontuacao': 10}, 
        {'texto': '9', 'pontuacao': 0}]
    },
    {
      'texto': 'Qual é o maior oceano do mundo?',
      'nivel': 'Fácil',
      'respostas': [
        {'texto': 'Atlântico', 'pontuacao': 0},
        {'texto': 'Índico', 'pontuacao': 0}, 
        {'texto': 'Pacífico', 'pontuacao': 10}]
    },
    {
      'texto': 'Quem pintou a Mona Lisa?',
      'nivel': 'Fácil',
      'respostas': [
        {'texto': 'Van Gogh', 'pontuacao': 0},
        {'texto': 'Leonardo da Vinci', 'pontuacao': 10}, 
        {'texto': 'Michelangelo', 'pontuacao': 0}]
    },
    {
      'texto': 'Qual é o elemento químico mais abundante no universo?',
      'nivel': 'Fácil',
      'respostas': [
        {'texto': 'Hélio', 'pontuacao': 0},
        {'texto': 'Hidrogênio', 'pontuacao': 10}, 
        {'texto': 'Carbono', 'pontuacao': 0}]
    },
    
    // MÉDIO
    {
      'texto': 'Em que ano o Brasil foi descoberto?',
      'nivel': 'Médio',
      'respostas': [
        {'texto': '1492', 'pontuacao': 0},
        {'texto': '1500', 'pontuacao': 15}, 
        {'texto': '1498', 'pontuacao': 0}]
    },
    {
      'texto': 'Qual é a velocidade da luz?',
      'nivel': 'Médio',
      'respostas': [
        {'texto': '299.792 km/s', 'pontuacao': 15},
        {'texto': '199.792 km/s', 'pontuacao': 0}, 
        {'texto': '399.792 km/s', 'pontuacao': 0}]
    },
    {
      'texto': 'Quem escreveu "Dom Casmurro"?',
      'nivel': 'Médio',
      'respostas': [
        {'texto': 'Machado de Assis', 'pontuacao': 15},
        {'texto': 'José de Alencar', 'pontuacao': 0}, 
        {'texto': 'Eça de Queirós', 'pontuacao': 0}]
    },
    {
      'texto': 'Qual é a fórmula química da água?',
      'nivel': 'Médio',
      'respostas': [
        {'texto': 'CO2', 'pontuacao': 0},
        {'texto': 'H2O', 'pontuacao': 15}, 
        {'texto': 'O2', 'pontuacao': 0}]
    },
    {
      'texto': 'Em que continente fica o Egito?',
      'nivel': 'Médio',
      'respostas': [
        {'texto': 'Ásia', 'pontuacao': 0},
        {'texto': 'Europa', 'pontuacao': 0}, 
        {'texto': 'África', 'pontuacao': 15}]
    },
    
    // DIFÍCIL
    {
      'texto': 'Qual é o nome da teoria que explica a origem do universo?',
      'nivel': 'Difícil',
      'respostas': [
        {'texto': 'Teoria da Evolução', 'pontuacao': 0},
        {'texto': 'Teoria do Big Bang', 'pontuacao': 20}, 
        {'texto': 'Teoria da Relatividade', 'pontuacao': 0}]
    },
    {
      'texto': 'Quem foi o primeiro presidente do Brasil?',
      'nivel': 'Difícil',
      'respostas': [
        {'texto': 'Deodoro da Fonseca', 'pontuacao': 20},
        {'texto': 'Floriano Peixoto', 'pontuacao': 0}, 
        {'texto': 'Prudente de Morais', 'pontuacao': 0}]
    },
    {
      'texto': 'Qual é o nome do processo de divisão celular?',
      'nivel': 'Difícil',
      'respostas': [
        {'texto': 'Mitose', 'pontuacao': 20},
        {'texto': 'Meiose', 'pontuacao': 0}, 
        {'texto': 'Fotossíntese', 'pontuacao': 0}]
    },
    {
      'texto': 'Em que ano foi proclamada a República no Brasil?',
      'nivel': 'Difícil',
      'respostas': [
        {'texto': '1889', 'pontuacao': 20},
        {'texto': '1891', 'pontuacao': 0}, 
        {'texto': '1888', 'pontuacao': 0}]
    },
    {
      'texto': 'Qual é o nome da maior cordilheira do mundo?',
      'nivel': 'Difícil',
      'respostas': [
        {'texto': 'Himalaia', 'pontuacao': 0},
        {'texto': 'Andes', 'pontuacao': 20}, 
        {'texto': 'Alpes', 'pontuacao': 0}]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz de Conhecimentos Gerais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz de Conhecimentos Gerais'),
          backgroundColor: Colors.blue[700],
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[50]!, Colors.white],
            ),
          ),
          child: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntasSelecionadas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                  totalPerguntas: _perguntasSelecionadas.length,
                )
              : Resultado(_pontuacaoTotal, _reiniciarFormulario, _perguntasRespondidas),
        ),
      ),
    );
  }
}