// lib/main.dart (classe MeuApp e PrimeiraTela)
import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/user.dart';

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
// 1. Declarar o Future que será usado pelo FutureBuilder
  late Future<List<Usuario>> _usuarioFuture;

  @override
  void initState() {
    super.initState();
    // 2. Chamar a função de busca na inicialização do Widget (apenas uma vez)
    _usuarioFuture = buscarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dados da API"),),
      body: FutureBuilder<List<Usuario>>(
        // 3. Fornece o future que ele deve observar
        future: _usuarioFuture,
        // 4. builder: Chamado a cada mudança do estado do Future
        builder: (context, snapshot) {
          // A. Estado de espera (Carregando)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          // B. Estado de erro
          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"),);
          }

          // C. Estado de conclusão (com dados)
          if (snapshot.hasData) {
            // Usa a lista de dados do Snapshot
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Usuario usuario = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(child: Text(usuario.id.toString()),),
                  title: Text(usuario.nome),
                  subtitle: Text(usuario.email),
                );
              }
            );
          }

          // Caso padrão
          return const Center(child: Text("Nenhum dado encontrado"),);
        }
      ),
    );
  }
}