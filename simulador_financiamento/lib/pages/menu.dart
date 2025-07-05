import 'package:flutter/material.dart';
import 'package:simulador_financiamento/pages/veiculoInfo.dart';
import 'package:simulador_financiamento/widgets/CaminhaoWidget.dart';
import 'package:simulador_financiamento/widgets/CarroWidget.dart';
import 'package:simulador_financiamento/widgets/MotoWidget.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catálogo de produtos"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CarroWidget(
                nome: "Fiat 500", 
                preco: 56000, 
                descricao: "Fiat 500 com teto conversível", 
                imagemUrl: Image.asset("images/carro.jpg", width: 200), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewVeiculo(
                        nome: "Fiat 500",
                        descricao: "Fiat 500 com teto conversível", 
                        preco: 56000,
                        tipo: "Compacto",
                        cambio: "Manual",
                        imagem: Image.asset("images/carro.jpg"),
                      ),
                    ),
                  );
                }, 
                tipo: "Compacto", 
                cambio: "Manual"
              )
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: MotoWidget(
                nome: "FLUO ABS Hybrid Connected", 
                preco: 16000,
                descricao: "Moto com motor com sistema híbrido leve", 
                imagemUrl: Image.asset("images/moto.jpg", width: 200), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewVeiculo(
                        nome: "FLUO ABS Hybrid Connected", 
                        descricao: "Moto com motor com sistema híbrido leve", 
                        preco: 16000,
                        tamanhoRoda: "Aro 12", 
                        imagem: Image.asset("images/moto.jpg"),
                      ),
                    ),
                  );
                }, 
                tamanhoRoda: "Aro 12", 
              )
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CaminhaoWidget(
                nome: "Volvo FH", 
                preco: 400000,
                descricao: "Caminhão Volvo", 
                imagemUrl: Image.asset("images/moto.jpg", width: 200), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewVeiculo(
                        nome: "Volvo FH",  
                        descricao: "Caminhão Volvo", 
                        preco: 400000,
                        imagem: Image.asset("images/moto.jpg"),
                      ),
                    ),
                  );
                }, 
                capacidadeCarga: 250, 
              )
            ),
          ],
        ),
      ),
    );
  }
}