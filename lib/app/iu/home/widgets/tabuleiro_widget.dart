import 'package:flutter/material.dart';

import '../../../domain/entities/field_entity.dart';
import '../../../domain/entities/tabuleiro_entity.dart';
import 'campo_widget.dart';

class TabuleiroWidget extends StatelessWidget {
  final TabuleiroEntity tabuleiro;
  final void Function(CampoEntity) onAbrir;
  final void Function(CampoEntity) onAlternarMarcacao;

  const TabuleiroWidget({
    required this.tabuleiro,
    required this.onAbrir,
    required this.onAlternarMarcacao,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: tabuleiro.colunas,
      children: tabuleiro.campos.map((c) {
        return CampoWidget(
          campo: c,
          onAbrir: onAbrir,
          onAlternarMarcacao: onAlternarMarcacao,
        );
      }).toList(),
    );
  }
}
