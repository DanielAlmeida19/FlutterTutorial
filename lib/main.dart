// lib/main.dart
import 'package:flutter/material.dart';

void main(List<String> args) {
    runApp(const MeuApp());
}

// A classe 'MeuApp' herda de 'StatelessWidget'
class MeuApp extends StatelessWidget {
    // O construtor é usado para passar a chave (key)
    const MeuApp({super.key});

    // O método 'build' será chamado sempre que flutter precisar desenhar um widget
    @override
    Widget build(BuildContext context) {
        // 1. MaterialApp: fornece a estrutura de design Material design
        return MaterialApp(
            title: "App de Widgets",
            // 2. Scaffold: é a estrutura básica de tela (cabeçalho, corpo, etc.) 
            home: Scaffold(
                appBar: AppBar(
                    title: Text("Layouts essenciais"),
                    backgroundColor: Colors.teal,
                ),
                body: Column( // Começando a coluna principal
                    // Alinha os itens na vertical (Main Axis)
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // Alinha os itens na horizontal (Cross Axis)
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[ // A lista de Widgets filhos
                        const Text("Primeiro Item (Column)"),

                        // Row aninhada (Layout horizontal)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const <Widget>[
                                Icon(Icons.thumb_up, color: Colors.blue, size: 40,),
                                Icon(Icons.star, color: Colors.amber, size: 40,),
                                Icon(Icons.favorite, color: Colors.red, size: 40,),
                            ],
                        ),

                        Container(
                            height: 100,
                            width: 100,
                            color: Colors.purple,
                            alignment: Alignment.center,
                            child: const Text("Container!", style: TextStyle(color: Colors.white),),
                        )
                    ],
                )
            ),
        );
    }
}
