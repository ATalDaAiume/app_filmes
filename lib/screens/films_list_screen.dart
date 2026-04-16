import 'package:flutter/material.dart';
import '../models/film.dart';

class FilmsListScreen extends StatefulWidget {
  @override
  State<FilmsListScreen> createState() => _FilmsListScreenState();
}

class _FilmsListScreenState extends State<FilmsListScreen> {
  List<Film> meusFilmes = [];

  // Função para deletar filme
  void _removerFilme(int index) {
    setState(() {
      meusFilmes.removeAt(index);
    });
  }

  // Função inteligente que serve tanto para ADICIONAR quanto para EDITAR
  void _abrirDialogoFilme({Film? filmeExistente, int? index}) {
    final isEdit = filmeExistente != null; // Verifica se estamos editando
    
    // Inicia os controladores com o texto em branco ou com as informações do filme clicado
    final tituloCtrl = TextEditingController(text: isEdit ? filmeExistente.titulo : '');
    final generoCtrl = TextEditingController(text: isEdit ? filmeExistente.genero : '');
    final avaliacaoCtrl = TextEditingController(text: isEdit ? filmeExistente.avaliacao.toString() : '');
    final resumoCtrl = TextEditingController(text: isEdit ? filmeExistente.resumo : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEdit ? 'Editar Filme' : 'Adicionar Novo Filme', style: const TextStyle(color: Colors.deepPurple)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: tituloCtrl, decoration: const InputDecoration(labelText: 'Título')),
                TextField(controller: generoCtrl, decoration: const InputDecoration(labelText: 'Gênero')),
                TextField(
                  controller: avaliacaoCtrl, 
                  decoration: const InputDecoration(labelText: 'Avaliação (ex: 4.5)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: resumoCtrl, 
                  decoration: const InputDecoration(labelText: 'Breve resumo / Opinião'),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancelar', style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                if(tituloCtrl.text.isNotEmpty) {
                  // Atualiza a interface usando setState
                  setState(() {
                    final novoFilme = Film(
                      tituloCtrl.text, 
                      generoCtrl.text, 
                      double.tryParse(avaliacaoCtrl.text) ?? 0.0,
                      resumoCtrl.text,
                    );

                    if (isEdit) {
                      meusFilmes[index!] = novoFilme; // Substitui o antigo pelo novo
                    } else {
                      meusFilmes.add(novoFilme); // Adiciona um novo na lista
                    }
                  });
                  Navigator.pop(context); 
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Resgata o nome do usuário passado na tela de login
    final nomeUsuario = ModalRoute.of(context)?.settings.arguments as String? ?? 'Usuário';

    return Scaffold(
      appBar: AppBar(
        // Botão de Sair à esquerda
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          tooltip: 'Sair',
          onPressed: () {
            // Substitui a tela atual voltando para a raiz (Login)
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: const Text('Meus Filmes', style: TextStyle(fontSize: 18)),
        // Nome e Logo do Usuário à direita
        actions: [
          Center(child: Text('Olá, $nomeUsuario!', style: const TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
            child: Icon(Icons.person, color: Colors.deepPurple, size: 20),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: meusFilmes.isEmpty
          ? const Center(
              child: Text('Nenhum filme cadastrado.\nClique no + para adicionar!', 
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black54)))
          : ListView.builder(
              itemCount: meusFilmes.length,
              itemBuilder: (context, index) {
                final filme = meusFilmes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.movie, color: Colors.deepPurple),
                    title: Text(filme.titulo, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    subtitle: Text('${filme.genero} • Nota: ${filme.avaliacao}'),
                    // Ações de Editar e Excluir
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blueAccent),
                          onPressed: () => _abrirDialogoFilme(filmeExistente: filme, index: index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => _removerFilme(index),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/detalhes', arguments: filme);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: () => _abrirDialogoFilme(), // Chama a função sem argumentos para ADICIONAR
        child: const Icon(Icons.add),
      ),
    );
  }
}