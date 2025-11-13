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
                    title: Text("Meu primeiro Scaffold"),
                    backgroundColor: Colors.blue,
                ),
                body: Center(
                    child: Text("Olá, árvore de widgets"),
                ),
            ),
        );
    }
}
