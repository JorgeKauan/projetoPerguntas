import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarFormulario;
  final int perguntasRespondidas;

  const Resultado(this.pontuacao, this.quandoReiniciarFormulario, this.perguntasRespondidas, {super.key});

  String get fraseResultado {
    double porcentagem = (pontuacao / (perguntasRespondidas * 20)) * 100;
    
    if (porcentagem < 30) {
      return 'Iniciante';
    } else if (porcentagem < 50) {
      return 'Bom Conhecimento';
    } else if (porcentagem < 70) {
      return 'Muito Bom!';
    } else if (porcentagem < 90) {
      return 'Excelente!';
    } else {
      return 'Gênio!';
    }
  }

  String get mensagemMotivacional {
    double porcentagem = (pontuacao / (perguntasRespondidas * 20)) * 100;
    
    if (porcentagem < 30) {
      return 'Continue estudando! O conhecimento é uma jornada.';
    } else if (porcentagem < 50) {
      return 'Você tem uma boa base de conhecimentos gerais!';
    } else if (porcentagem < 70) {
      return 'Parabéns! Você demonstrou um conhecimento sólido.';
    } else if (porcentagem < 90) {
      return 'Impressionante! Você é muito bem informado!';
    } else {
      return 'Incrível! Você é um verdadeiro mestre do conhecimento!';
    }
  }

  Color get corResultado {
    double porcentagem = (pontuacao / (perguntasRespondidas * 20)) * 100;
    
    if (porcentagem < 30) {
      return Colors.red;
    } else if (porcentagem < 50) {
      return Colors.orange;
    } else if (porcentagem < 70) {
      return Colors.blue;
    } else if (porcentagem < 90) {
      return Colors.green;
    } else {
      return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    double porcentagem = (pontuacao / (perguntasRespondidas * 20)) * 100;
    
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ícone de resultado
          Icon(
            porcentagem >= 70 ? Icons.emoji_events : Icons.school,
            size: 80,
            color: corResultado,
          ),
          
          SizedBox(height: 24),
          
          // Título do resultado
          Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: corResultado,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 16),
          
          // Mensagem motivacional
          Text(
            mensagemMotivacional,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 32),
          
          // Estatísticas
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pontuação:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$pontuacao pontos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: corResultado,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Perguntas:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$perguntasRespondidas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Aproveitamento:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${porcentagem.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: corResultado,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          SizedBox(height: 32),
          
          // Botão de reiniciar
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              onPressed: quandoReiniciarFormulario,
              child: Text(
                'Jogar Novamente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}