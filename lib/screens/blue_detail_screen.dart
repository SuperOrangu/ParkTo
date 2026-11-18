/* SEZIONE DETTAGLIO BLU */

import 'package:material_ui/material_ui.dart';
import '../models/parking.dart';

class BlueDetailScreen extends StatelessWidget {
  final Parcheggio parcheggio;

  const BlueDetailScreen({super.key, required this.parcheggio});

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
            Text('Occupazione: ${parcheggio.postiLiberi} liberi su ${parcheggio.postiTotali}'),
            Text('Tariffa: ${parcheggio.tariffa}'),
            Text('Orari: ${parcheggio.orari}'),
            const Text('Tipo: Strisce blu e garage'),
          ],
        ),
      ),
    );
  }
}