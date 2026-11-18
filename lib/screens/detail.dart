/* SEZIONE DETTAGLIO */

import 'package:material_ui/material_ui.dart';

import '../models/parking.dart';
import 'blue_detail_screen.dart';
import 'yellow_detail_screen.dart';

void apriDettaglio(BuildContext context, Parcheggio parcheggio) {
  final bool eGiallo = parcheggio.tipo == 'giallo';

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => eGiallo
          ? YellowDetailScreen(parcheggio: parcheggio)
          : BlueDetailScreen(parcheggio: parcheggio),
    ),
  );
}
