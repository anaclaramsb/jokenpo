import 'dart:math';

import 'package:flutter/material.dart';

class jogo extends StatefulWidget {
  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  var _status = "Escolha uma opção abaixo para jogar:";
  var _imagemComputador = "images/padrao.png";

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaComputador = opcoes[numero];
    if (escolhaComputador == "papel") {
      setState(() {
        _imagemComputador = "images/papel.png";
      });
      if (escolhaUsuario == "papel") {
        setState(() {
          _status = "Você empatou :o";
        });
      } else if (escolhaUsuario == "pedra") {
        setState(() {
          _status = "Você perdeu :(. Tente novamente.";
        });
      } else {
        setState(() {
          _status = "Você ganhou :D. Parabéns!";
        });
      }
    }
    if (escolhaComputador == "pedra") {
      setState(() {
        _imagemComputador = "images/pedra.png";
      });
      if (escolhaUsuario == "papel") {
        setState(() {
          _status = "Você ganhou :D. Parabéns!";
        });
      } else if (escolhaUsuario == "pedra") {
        setState(() {
          _status = "Você empatou :o";
        });
      } else {
        setState(() {
          _status = "Você perdeu :(. Tente novamente.";
        });
      }
    }
    if (escolhaComputador == "tesoura") {
      setState(() {
        _imagemComputador = "images/tesoura.png";
      });
      if (escolhaUsuario == "papel") {
        setState(() {
          _status = "Você perdeu :(. Tente novamente.";
        });
      } else if (escolhaUsuario == "pedra") {
        setState(() {
          _status = "Você ganhou :D. Parabéns!";
        });
      } else {
        setState(() {
          _status = "Você empatou :o";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Text(
              "Escolha do Computador:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Image.asset("$_imagemComputador"),
          Text(
            "$_status",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 95,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
