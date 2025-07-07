import 'package:flutter/material.dart';
import 'package:simulador_financiamento/pages/veiculoInfo.dart';
import 'package:simulador_financiamento/widgets/caminhao_widget.dart';
import 'package:simulador_financiamento/widgets/carro_widget.dart';
import 'package:simulador_financiamento/widgets/moto_widget.dart';

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
        title: Text("Catálogo de produtos", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 60, 88, 159),
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
                imagemUrl: Image.asset("images/carro.jpg", width: 185), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewVeiculo(
                        nome: "Fiat 500",
                        descricao: "Fiat 500 com teto conversível", 
                        preco: 56000,
                        tipo: "Hatch",
                        cambio: "Manual",
                        imagem: Image.asset("images/carro.jpg"),
                      ),
                    ),
                  );
                }, 
                tipo: "Hatch", 
                cambio: "Manual"
              )
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: MotoWidget(
                nome: "FLUO ABS Hybrid Connected", 
                preco: 16000,
                descricao: "Moto com motor com sistema híbrido leve", 
                imagemUrl: Image.asset("images/moto.webp", width: 185), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewVeiculo(
                        nome: "FLUO ABS Hybrid Connected", 
                        descricao: "Moto com motor com sistema híbrido leve", 
                        preco: 16000,
                        tamanhoRoda: "Aro 12", 
                        imagem: Image.asset("images/moto.webp"),
                      ),
                    ),
                  );
                }, 
                tamanhoRoda: "Aro 12", 
              )
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CaminhaoWidget(
                nome: "Volvo FH", 
                preco: 400000,
                descricao: "Caminhão Volvo", 
                imagemUrl: Image.asset("images/caminhao.webp", width: 185), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewVeiculo(
                        nome: "Volvo FH",  
                        descricao: "Caminhão Volvo", 
                        preco: 400000,
                        imagem: Image.asset("images/caminhao.webp"),
                        capacidadeCarga: 250,
                      ),
                    ),
                  );
                }, 
                capacidadeCarga: 250, 
              )
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CarroWidget(
                nome: "Toyota Corolla Cross", 
                preco: 164.990, 
                descricao: "Combina conforto, robustez e tecnologia", 
                imagemUrl: Image.asset("images/carro2.jpg", width: 185), 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewVeiculo(
                        nome: "Toyota Corolla Cross", 
                        descricao: "Combina conforto, robustez e tecnologia", 
                        preco: 164.990,
                        tipo: "SUV",
                        cambio: "Manual",
                        imagem: Image.asset("images/carro2.jpg"),
                      ),
                    ),
                  );
                }, 
                tipo: "SUV", 
                cambio: "Manual"
              )
            ),
          ],
        ),
      ),
    );
  }
}