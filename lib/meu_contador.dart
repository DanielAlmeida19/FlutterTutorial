import 'package:flutter/material.dart';

// 1. Classe StatefulWidget (imutável)
class MeuContador extends StatefulWidget {
    const MeuContador({super.key});

    @override
    State<StatefulWidget> createState() => _MeuContadorState();
    
}

// 2. Classe State (mutável)
class _MeuContadorState extends State<MeuContador> {
    // Variável de estado que mudará
    int contador = 0;

    // Método que altera o estado e modifica o Flutter
    void _incrementarContador() {
        // setState() diz ao Flutter para reconstruir esse Widget
        setState(() {
            contador++;
        });
    }
    
    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Text("Você pressionou o botão esta quantidade de vezes:"),
                Text(
                    "$contador",
                    style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20,), // Espaçamento
                FloatingActionButton(
                    onPressed: _incrementarContador,
                    tooltip: "Incrementar",
                    child: const Icon(Icons.add),
                )
            ],
        );
    }
}
