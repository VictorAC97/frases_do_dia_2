// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_constructors_in_immutables

import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _frases = [
    "Você tem tudo para dar errado.",
    "Daqui a um ano, você vai desejar ter desistido hoje.",
    "Antes de começar, desista.",
    "Nada é tão ruim que não possa piorar!",
    "Calma. Tudo passa, nem que seja por cima de você.",
    "Trabalhe com o que você ama e nunca mais amará nada.",
    "Depois da tempestade vem o lamaçal.",
    "Tudo dando errado conforme esperado.",
    "Depois do sacrificio, vem a derrota.",
    "De sucesso em sucesso, chegaremos no fracasso.",
  ];

  String _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);

    _fraseGerada = _frases[numeroSorteado];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Frases do Dia"),
      ),
      body: Center(
        child: Container(
          //importante pois as telas tem largura diferente, logo o infinity pega a largura da tela do respectivo dispositivo
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
              ),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _gerarFrase();
                  });
                },
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontFamily: 'Arial',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
