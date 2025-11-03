import 'package:flutter/material.dart';
import 'package:projeto_923/domain/propriedade.dart';
import 'package:projeto_923/pages/PropriedadePage.dart';

class CardPropriedade extends StatelessWidget {
  final Propriedade propriedade;

  const CardPropriedade({super.key, required this.propriedade});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(propriedade.termo),
        subtitle: Text(
            propriedade.definicao
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PropriedadePage(
                    propriedade: propriedade,
                  ),

            ),
          );
        },
      ),
    );
  }}