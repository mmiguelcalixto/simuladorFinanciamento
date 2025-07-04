import 'package:flutter/material.dart';
import 'package:simulador_financiamento/widgets/VeiculoWidget.dart';

class MotoWidget extends VeiculoWidget {
  final String tamanhoRoda;

  const MotoWidget({
    super.key,
    required super.nome,
    required super.preco,
    required super.descricao,
    required super.imagemUrl,
    required super.onTap,
    required this.tamanhoRoda,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0)
            ]),
        child: Row(
          children: [
            imagemUrl,
            Column(
              children: [
                Text(
                  nome,
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "R\$${preco.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 25),
                ),
                Text(descricao),
                Column(
                  children: [
                    Text("Tamanho da roda: $tamanhoRoda"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
