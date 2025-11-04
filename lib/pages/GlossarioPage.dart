import 'package:flutter/material.dart';
import 'package:projeto_923/api/propriedadesApi.dart';
import 'package:projeto_923/domain/propriedade.dart';
import 'package:projeto_923/widget/CardPropriedade.dart';

class GlossarioPage extends StatefulWidget {
  const GlossarioPage({super.key});

  @override
  State<GlossarioPage> createState() => _GlossarioPageState();
}

class _GlossarioPageState extends State<GlossarioPage> {
  late Future<List<Propriedade>> futurePropriedades;

  @override
  void initState() {
    super.initState();
    futurePropriedades = PropriedadesApi().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Glossário"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Propriedade>>(
          future: futurePropriedades,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFE41D56),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao carregar: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Nenhum termo encontrado."),
              );
            }

            List<Propriedade> listaPropriedades = snapshot.requireData;
            return buildListView(listaPropriedades);
          },
        ),
      ),
    );
  }

  Widget buildListView(List<Propriedade> listaPropriedades) {
    return ListView.builder(
      itemCount: listaPropriedades.length,
      itemBuilder: (context, i) {
        return CardPropriedade(
          propriedade: listaPropriedades[i],
        );
      },
    );
  }
}

