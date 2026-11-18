/* SEZIONE DETTAGLIO GIALLO */

import 'package:material_ui/material_ui.dart';
import '../models/parking.dart';

class YellowDetailScreen extends StatelessWidget {
  final Parcheggio parcheggio;

  const YellowDetailScreen({super.key, required this.parcheggio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(parcheggio.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(parcheggio.via),
            const SizedBox(height: 16),
            Text('Stato posto: ${parcheggio.stato}'),
            Text('Categoria: ${parcheggio.categoria}'),
            const Text('Validità: Sempre attivo'),
            const Text('Tipo: Strisce gialle'),
            const SizedBox(height: 16),
            const Text('Posto riservato: serve un permesso valido.'),
          ],
        ),
      ),
    );
  }
}