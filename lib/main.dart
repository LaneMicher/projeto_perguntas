import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

void main() => runApp(PerguntasApp());

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita',
      'respostas': [
        {'texto': 'Amarelo', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 10},
        {'texto': 'Azul', 'nota': 8},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito',
      'respostas': [
        {'texto': 'Texugo', 'nota': 10},
        {'texto': 'Cobra', 'nota': 8},
        {'texto': 'Águia', 'nota': 10},
        {'texto': 'Leão', 'nota': 10},
      ]
    },
    {
      'texto': 'Qual é o seu fundador de Hogwarts favorito?',
      'respostas': [
        {'texto': 'Godric Gryffindor', 'nota': 10},
        {'texto': 'Rowena Ravenclaw', 'nota': 10},
        {'texto': 'Salazar Slytherin', 'nota': 10},
        {'texto': 'Helga Hufflepuff', 'nota': 10},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgets = [];

    //atribuição condicional.

    //widgets = respostas.map((t) => Resposta(t, _responder)).toList();
    //for (String textoResp in respostas) {
    // widgets.add(Resposta(texto: textoResp, onSelected: _responder));
    //}

    print(_perguntas[_perguntaSelecionada]['respostas']);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Perguntas")),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado('Parabéns'),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntasAppState createState() {
    return _PerguntasAppState();
  }
}
