import 'package:flutter/material.dart';
import '../models/film.dart';

class FilmDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recebe o objeto Filme via parâmetro de navegação
    final filme = ModalRoute.of(context)!.settings.arguments as Film;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Filme')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView( // Permite rolagem se o resumo for muito longo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.theaters, size: 100, color: Colors.black12),
              const SizedBox(height: 20),
              Text(
                filme.titulo, 
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              const Divider(color: Colors.black26, height: 40, thickness: 1),
              ListTile(
                leading: const Icon(Icons.category, color: Colors.black),
                title: const Text('Gênero', style: TextStyle(color: Colors.black54)),
                subtitle: Text(filme.genero, style: const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text('Avaliação', style: TextStyle(color: Colors.black54)),
                subtitle: Text('${filme.avaliacao} / 5.0', style: const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              const SizedBox(height: 20),
              const Text('Resumo / Minha Opinião', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300)
                ),
                child: Text(
                  filme.resumo.isNotEmpty ? filme.resumo : 'Nenhum resumo informado.',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar para a lista', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}