import 'package:flutter/material.dart';

class ViewVeiculo extends StatefulWidget {
  final String nome;
  final String descricao;
  final double preco;
  final Image imagem;

  final int? capacidadeCarga;
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
      return Text("Capacidade da carga: ${widget.capacidadeCarga} toneladas");   
    }
  }

  double valorFinanciado = 0.0;
  double valorParcela = 0.0;

  calcularFinanciamento(double valorEntrada, int prazoMeses) {
    setState(() {
      valorFinanciado = widget.preco - valorEntrada;
      valorParcela = (valorFinanciado / prazoMeses) * 1.02;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veículo ${widget.nome}", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 60, 88, 159),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.descricao, style: TextStyle(fontSize: 20),),
              ),
              widget.imagem,
              Text("R\$${widget.preco.toStringAsFixed(2)}", style: TextStyle(fontSize: 25)),
              showProdutoInfo(),
              if (valorFinanciado != 0.0 && valorParcela != 0.0) 
              Column(
                children: [
                  Text("Valor financiado: R\$ ${valorFinanciado.toStringAsFixed(2)}"),
                  Text("Valor das parcelas: R\$ ${valorParcela.toStringAsFixed(2)}"),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
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
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          calcularFinanciamento(double.parse(valorEntrada.text), int.parse(prazoMeses.text));
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(const Color.fromARGB(255, 60, 88, 159)),
                        ),
                        child: Text("Calcular Financiamento", style: TextStyle(color: Colors.white))
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}