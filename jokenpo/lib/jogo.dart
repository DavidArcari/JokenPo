import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = "assets/images/padrao.png";
  var _mensagemUsuario = "Sua escolha";

  void jogar(String escolhaUsuario) {
    var numero = Random().nextInt(3);
    var opcoes = ["pedra", "papel", "tesoura"];
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = "assets/images/pedra.png";
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = "assets/images/papel.png";
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = "assets/images/tesoura.png";
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        _mensagemUsuario = "PARABÉNS VOCÊ GANHOU !!! =)";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        _mensagemUsuario = "Você perdeu =/ Tente novamente...";
      });
    } else {
      setState(() {
        _mensagemUsuario = "Empate =|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(_imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagemUsuario,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => jogar("pedra"),
                child: Image.asset("assets/images/pedra.png"),
              ),
              GestureDetector(
                onTap: () => jogar("papel"),
                child: Image.asset("assets/images/papel.png"),
              ),
              GestureDetector(
                onTap: () => jogar("tesoura"),
                child: Image.asset("assets/images/tesoura.png"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
