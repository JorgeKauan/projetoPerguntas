import 'package:flutter/material.dart';

class Respostas extends StatelessWidget{

  final String texto;
  final void Function() quandoSelecionado;

  Respostas (this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext){
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: quandoSelecionado, 
        child: Text(texto)
        ),
    );
  }
}