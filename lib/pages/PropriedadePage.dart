import 'package:flutter/material.dart';
import 'package:projeto_923/domain/propriedade.dart';

class PropriedadePage extends StatelessWidget {
  final Propriedade propriedade;

  const PropriedadePage({super.key, required this.propriedade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(propriedade.termo),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                propriedade.termo,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE41D56),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                propriedade.definicao,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );

  }
}