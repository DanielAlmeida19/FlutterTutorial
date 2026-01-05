// Segunda tela
import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  // 1. recebendo dados
  final String mensagem;

  // 2. Construtor para obrigar a passagem de dados 
  const SegundaTela({super.key, required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda tela"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(mensagem, style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                // 3. Voltar para a tela anterior (pop)
                // Remove a tela atual da pilha
                Navigator.pop(context, "Dados de retorno: OK");
              },
              child: const Text("Voltar e enviar dados"),
            )
          ],
        ),
      ),
    );
  }
}