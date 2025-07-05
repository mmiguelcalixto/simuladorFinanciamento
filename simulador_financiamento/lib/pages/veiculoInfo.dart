import 'package:flutter/material.dart';

class ViewVeiculo extends StatefulWidget {
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

  @override
  State<ViewVeiculo> createState() => _ViewVeiculoState();
}

class _ViewVeiculoState extends State<ViewVeiculo> {
  final valorEntrada = TextEditingController();
  final prazoMeses = TextEditingController();

  showProdutoInfo() {
    if (widget.tipo != null && widget.cambio != null) {
      return Text("Tipo: ${widget.tipo} \n Câmbio: ${widget.cambio}");
    } 
    if (widget.tamanhoRoda != null) {
      return Text("Tamanho da roda: ${widget.tamanhoRoda}");   
    }
    if (widget.capacidadeCarga != null) {
      return Text("Capacidade da carga: ${widget.capacidadeCarga}");   
    }
  }

  double valorFinanciado = 0.0;
  double valorParcela = 0.0;

  calcularFinanciamento(double valorEntrada, int prazoMeses) {
    valorFinanciado = widget.preco - valorEntrada;
    valorParcela = (valorFinanciado / prazoMeses) * 1.02;

    return Container(
      child: Column(
        children: [
          Text("Valor financiado: R\$$valorFinanciado."),
          Text("Valor das parcelas: R\$$valorParcela.")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veículo ${widget.nome}"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.nome, style: TextStyle(fontSize: 30),),
            Text(widget.descricao),
            widget.imagem,
            Text("R\$${widget.preco.toStringAsFixed(2)}", style: TextStyle(fontSize: 25)),
            showProdutoInfo(),
            Container(
              child: Column(
                children: [
                  TextField(
                    controller: valorEntrada,
                    decoration: InputDecoration(
                      hintText: 'Digite o valor de entrada',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: prazoMeses,
                    decoration: InputDecoration(
                      hintText: 'Digite o prazo em meses',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: calcularFinanciamento(double.parse(valorEntrada.text), int.parse(prazoMeses.text)),
                    child: Text("Calcular Financiamento")
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}