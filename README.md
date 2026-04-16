![Avaliação](https://img.shields.io/badge/Avaliação-Recuperação-red)
![Flutter](https://img.shields.io/badge/Framework-Flutter-blue)
![Dart](https://img.shields.io/badge/Linguagem-Dart-00b4ab)

# 🎬 App de Registro de Filmes Assistidos
> Avaliação Prática de Recuperação — Desenvolvimento Mobile | Análise e Desenvolvimento de Sistemas | 5ª Fase

**Aluna:** Eloize Aiume de Liz Pereira | **Turma:** 5ª Fase — Análise e Desenvolvimento de Sistemas (2026/1)

Repositório criado para armazenar o projeto completo da avaliação prática de recuperação da disciplina de **Desenvolvimento para Dispositivos Móveis**, da Faculdade Senac Joinville.

---

## 📚 Descrição do Aplicativo e seu Objetivo

Este aplicativo é um **Registro de Filmes Assistidos** totalmente construído em Flutter. O objetivo principal da aplicação é permitir que o utilizador mantenha um histórico simples dos filmes que já assistiu, guardando informações essenciais como título, gênero e nota de avaliação. 

A atividade tem como foco principal a aplicação prática dos conceitos fundamentais estudados em aula, consolidando o conhecimento em linguagem Dart, estruturação de widgets, navegação entre telas, gerenciamento de estado básico e organização profissional de projetos mobile, sem a necessidade de um backend ou banco de dados externo.

---

## 📸 Capturas de Tela (Screenshots)

Abaixo estão as demonstrações do aplicativo a funcionar em seus diferentes estados:

| 🔐 Tela de Login | 🎬 Meus Filmes (Lista) | 🍿 Detalhes do Filme |
| :---: | :---: | :---: |
| <img src="https://i.postimg.cc/25cymgQp/Tela_de_Login_Film.png" width="250"> | <img src="https://i.postimg.cc/W4WzjxMB/Meus_Filmes_Lista.png" width="250"> | <img src="https://i.postimg.cc/rpnsc71L/Detalhes_do_Filme.png" width="250"> |

---

## ✨ Funcionalidades Implementadas

- [x] **Autenticação Simples:** Captura do nome do usuário na entrada.
- [x] **Listagem Dinâmica:** Visualização em formato de lista de todos os filmes cadastrados.
- [x] **Cadastro de Filmes:** Botão interativo para adicionar novos filmes à lista com título, gênero e avaliação.
- [x] **Visualização de Detalhes:** Ecrã dedicado para exibir as informações completas de um filme selecionado.

---

## 📱 Descrição das Telas

1. **Tela de Login (`login_screen.dart`):** 
   - Contém um campo de texto (`TextField`) para inserir o nome do utilizador e uma mensagem de boas-vindas.
   - Possui um botão "Entrar" que, ao ser clicado, redireciona o utilizador para a tela principal, removendo o Login da pilha de navegação para impedir o retorno acidental.
   
2. **Tela Meus Filmes (`films_list_screen.dart`):** 
   - Apresenta um `ListView` contendo os filmes registados (exibindo título, gênero e avaliação).
   - Contém um `FloatingActionButton` para adicionar um novo filme ao estado da aplicação. 
   - Ao clicar num item da lista, o utilizador é encaminhado para a tela de detalhes.

3. **Tela Home / Detalhes (`film_detail_screen.dart`):** 
   - Exibe as informações completas e detalhadas do filme selecionado.
   - Inclui um botão de voltar integrado (`AppBar` e botão manual) para retornar à lista de filmes.

---

## 🧠 Conceitos Estudados e Aplicados

Para a construção deste app, foram aplicados os seguintes conceitos técnicos exigidos:

* **Linguagem Dart:** Utilização de tipagem forte, orientação a objetos e criação de classes modelo (`class Film`) para gerenciar os dados da aplicação de forma estruturada.
* **Widgets e UI Básica:** Criação das interfaces usando componentes fundamentais do framework, como `Scaffold`, `Column`, `ListView.builder`, `ListTile` e `TextField`.
* **Gerenciamento de Estado:** Utilização de `StatefulWidget` em conjunto com o método `setState()` na tela de listagem para reagir a eventos (adição de filmes) e redesenhar a interface instantaneamente.
* **Navegação e Rotas:** Implementação do padrão de Rotas Nomeadas (`routes` no `MaterialApp`). Foi utilizado `Navigator.pushReplacementNamed` no login para limpar a pilha, `Navigator.pushNamed` com `arguments` para passar o objeto do filme para a tela de detalhes, e `Navigator.pop()` para retornar.
* **Organização do Projeto:** Código modularizado seguindo boas práticas de mercado, com separação clara de responsabilidades em pastas como `lib/screens/`, `lib/models/` e `lib/widgets/`.

---

## 🚀 Instruções para executar o projeto localmente

Siga os passos abaixo para rodar o aplicativo no seu ambiente de desenvolvimento:

1. Certifique-se de ter o [Flutter SDK](https://flutter.dev/docs/get-started/install) devidamente instalado e configurado (verifique rodando `flutter doctor`).
2. Clone este repositório no seu terminal:
   ```bash
   git clone https://github.com/seu-usuario/app_filmes_recuperacao.git
   ```
Aceda à pasta do projeto:
Baixe as dependências do projeto:
Inicie um emulador (Android/iOS) ou conecte um dispositivo físico e execute a aplicação:

## 🛠️ Tecnologias Utilizadas
- Framework Flutter
- Linguagem Dart
- IDE: VS Code
