import 'dart:convert';
import 'package:http/http.dart' as http;

// Classe simples para mapear a resposta JSON
class Usuario{
  final int id;
  final String nome;
  final String email;

  Usuario({required this.id, required this.nome, required this.email});

  // Construtor nomeado que facilita a criação de usuário a partir de um Map (JSON)
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json["id"],
      nome: json["name"],
      email: json["email"],
    );
  }
}

// Função assíncrona para buscar dados de uma API
Future<List<Usuario>> buscarUsuarios() async {
  // A requisição HTTP retorna um Future<Response>
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

  if (response.statusCode == 200) {
    // Se a requisição foi bem sucedida, código 200

    List jsonResponse = json.decode(response.body);

    // Mapeia a lista Json para uma lista de objetos Usuario
    return jsonResponse.map((data) => Usuario.fromJson(data)).toList();
  } else {
    // Lança uma exceção se a requisição falhar
    throw Exception("Falha ao carregar usuários: ${response.statusCode}");
  }
}