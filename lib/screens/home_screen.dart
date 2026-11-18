import 'package:material_ui/material_ui.dart';
import '../models/parking.dart';
import '../services/parking_service.dart';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ParkingService _service = ParkingService();
  late Future<List<Parcheggio>> _futureParcheggi;

  @override
  void initState() {
    super.initState();
    _futureParcheggi = _service.getParcheggi();
  }

  void _ricarica() {
    setState(() {
      _futureParcheggi = _service.getParcheggi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ParkTo')),
      body: FutureBuilder<List<Parcheggio>>(
        future: _futureParcheggi,
        builder: (context, snapshot) {
          // 1. Caricamento
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Errore + Riprova
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Impossibile caricare i parcheggi'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _ricarica,
                    child: const Text('Riprova'),
                  ),
                ],
              ),
            );
          }

          // 3. Nessun risultato
          final parcheggi = snapshot.data ?? [];
          if (parcheggi.isEmpty) {
            return const Center(child: Text('Nessun parcheggio trovato'));
          }

          // 4. Elenco
          return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: parcheggi.length,
              itemBuilder: (context, index) {
                final p = parcheggi[index];
                return Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.grey.shade300),
                    ),
                child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(p.nome),
                    subtitle: Text(p.via),
                    onTap: () => apriDettaglio(context, p),
                ),
                );
              },
          );
        },
      ),
    );
  }
}