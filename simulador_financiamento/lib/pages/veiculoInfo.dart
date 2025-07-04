import 'package:flutter/material.dart';

class ViewVeiculo extends StatelessWidget {
  final String nome;
  final String descricao;
  final double preco;
  final Image imagem;

  final String? capacidadeCarga;
  final String? tamanhoRoda;
  final String? cambio;
  final String? tipo;

  const ViewVeiculo({
    super.key,
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.preco,
    this.capacidadeCarga,
    this.cambio,
    this.tipo,
    this.tamanhoRoda, 
  });

  showProdutoInfo() {
    if (tipo != null && cambio != null) {
      return Text("Tipo: $tipo \n Câmbio: $cambio");
    } 
    if (tamanhoRoda != null) {
      return Text("Tamanho da roda: $tamanhoRoda");   
    }
    if (capacidadeCarga != null) {
      return Text("Capacidade da carga: $capacidadeCarga");   
    }
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto $nome"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(nome, style: TextStyle(fontSize: 30),),
            Text(descricao),
            imagem,
            Text("R\$${preco.toStringAsFixed(2)}", style: TextStyle(fontSize: 25)),
            showProdutoInfo(),
          ],
        ),
      )
    );
  }
}