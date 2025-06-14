import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {


  final int pontuacao;
  final void Function() quandoReiniciarFormulario;

  Resultado(this.pontuacao, this.quandoReiniciarFormulario);

  String get fraseResultado{
    if(pontuacao < 8 ){
      return 'Parabéns!!!';
    }else if (pontuacao < 12){
      return 'Você é bom';
    }else if(pontuacao < 16){
      return 'Impressionante';
    }else{
      return 'Lenda';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado,
          style: TextStyle(
            fontSize: 28,
          ),),
        ),
        ElevatedButton(onPressed: quandoReiniciarFormulario,
         child: Text('Reiniciar?',
         style: TextStyle(color: Colors.blue,
         fontSize: 18),)
         )
      ],
    );
  }
}