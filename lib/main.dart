// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/meu_contador.dart';

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
        return MaterialApp(
            title: "Meu App de Contador",
            theme: ThemeData(primarySwatch: Colors.green),
            home: Scaffold(
                appBar: AppBar(title: const Text("Contador Stateful"),),
                // Usamos o StatefulWidget que acabamos de criar
                body: const Center(
                    child: MeuContador(),
                ),
            ),
        );
    }
}
