import 'package:flutter/material.dart';

import '../../../domain/entities/field_entity.dart';

class CampoWidget extends StatelessWidget {
  final CampoEntity campo;
  final void Function(CampoEntity) onAbrir;
  final void Function(CampoEntity) onAlternarMarcacao;

  const CampoWidget({
    required this.campo,
    required this.onAbrir,
    required this.onAlternarMarcacao,
    super.key,
  });

  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhaca;

    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
