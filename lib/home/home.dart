import 'package:desafio_dio_lista_contatos/contato/lista_contato.dart';
import 'package:flutter/material.dart';

import '../contato/cadastra_contato.dart';
import '../contato/lista_contato_viewmodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            const Text(
              "Lista de contatos:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastraContato()),
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle,
                  ),
                  label: const Text('Adicionar novo contato')),
            ),
            const SizedBox(
              height: 22,
            ),
            ListaContato(),
          ],
        ),
      ),
    );
  }
}
