// lib/main.dart (classe MeuApp e PrimeiraTela)
import 'package:flutter/material.dart';

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
  // Lista de dados simulada (1000 nomes)
  final List<String> nomes = List<String>.generate(1000, (i) => "Item $i");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista Eficiente (ListView.builder)"),),
      // Substituindo o Body
      body: ListView.builder(
        // 1. itemCount: o número total de itens na lista
        itemCount: nomes.length,
        // 2. itemBuilder: A função chamada para construir cada item
        // O index indica qual item deve ser construído (0, 1, 2, ...)
        itemBuilder: (context, index) {
          // O widget que representa cada linha da lista
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(nomes[index]),
              subtitle: Text("Índice $index"),
              onTap: () {
                // Adicionar interatatividade a lista
                print("Clicou no item ${nomes[index]}");
              },
            ),
          );
        },
      ),
    );
  }
}