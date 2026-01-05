// lib/main.dart (classe MeuApp e PrimeiraTela)
import 'package:flutter/material.dart';
import 'segunda_tela.dart';

void main(List<String> args) {
  return runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App de navegação",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PrimeiraTela()
    );
  }
}

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  String _resultado = "Nenhum dado de volta ainda";
  
  // Função assíncrona para navegar e esperar o resultado
  void _navegarParaSegundaTela() async {
    // 1. Navegar (push) e aguardar (await)
    final resultado = await Navigator.push(
      context,
      // MaterialPageRoute define a transição e a tela de destino
      MaterialPageRoute(
        builder: (context) => const SegundaTela(
          mensagem: "Essa é uma mensagem enviada da primeira tela!",
        )
      )
    );

    // 3. Atualizar estado com o que veio do 'pop'
    if (resultado != null) {
      setState(() {
        _resultado =resultado.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Primeira Tela"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Resultado: $_resultado", style: const TextStyle(fontSize: 18),),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _navegarParaSegundaTela,
              child: const Text("Ir para segunda tela") 
            )
          ],
        ),
      ),
    );
  }
}