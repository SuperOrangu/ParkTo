/* SEZIONE DEDICATA AI MODELLI */

// Modello per rappresentare un parcheggio
class Parcheggio {
  final int id;
  final String nome;
  final String via;
  final double lat;
  final double lng;
  final String tipo; // "blu", "giallo"
  final double? tariffa;
  final String orari;
  final int? postiLiberi;
  final int? postiTotali;
  final String? stato; // "libero", "occupato" (solo gialli)
  final String? categoria;

  const Parcheggio({
    required this.id,
    required this.nome,
    required this.via,
    required this.lat,
    required this.lng,
    required this.tipo,
    this.tariffa,
    required this.orari,
    this.postiLiberi,
    this.postiTotali,
    this.stato,
    this.categoria,
  });

  // Metodo per creare un'istanza di Parcheggio a partire da un JSON
  factory Parcheggio.fromJson(Map<String, dynamic> json) {
    return Parcheggio(
      id: json['id'] as int,
      nome: json['nome'] as String,
      via: json['via'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      tipo: json['tipo'] as String,
      tariffa: (json['tariffa'] as num?)?.toDouble(),
      orari: json['orari'] as String,
      postiLiberi: json['postiLiberi'] as int?,
      postiTotali: json['postiTotali'] as int?,
      stato: json['stato'] as String?,
      categoria: json['categoria'] as String?,
    );
  }

  bool get isBlu => tipo == 'blu';
  bool get isGiallo => tipo == 'giallo';
  bool get isPieno => isBlu && postiLiberi == 0;
}
