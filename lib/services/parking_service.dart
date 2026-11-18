/* SEZIONE DEDICATA AI SERVIZI */

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/parking.dart';

// Servizio per gestire le operazioni legate ai parcheggi
class ParkingService {
  static const String _url =
      'https://raw.githubusercontent.com/SuperOrangu/ParkTo/refs/heads/main/data/parking.json';

  // Metodo per ottenere tutti i parcheggi
  Future<List<Parcheggio>> getParcheggi() async {
    final response = await http
        .get(Uri.parse(_url))
        .timeout(const Duration(seconds: 10));

    // Controllo dello stato della risposta
    if (response.statusCode != 200) {
      throw Exception('Errore server: ${response.statusCode}');
    }

    // Decodifica della risposta JSON e creazione della lista di parcheggi
    final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
    return data
        .map((e) => Parcheggio.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Metodo per ottenere un parcheggio specifico per ID
  Future<Parcheggio?> getParcheggioById(int id) async {
    final tutti = await getParcheggi();
    for (final p in tutti) {
      if (p.id == id) return p;
    }
    return null;
  }
}
