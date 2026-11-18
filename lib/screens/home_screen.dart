import 'package:material_ui/material_ui.dart';

import '../models/parking.dart';
import '../services/parking_service.dart';
import '../theme/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ParkingService _service = ParkingService();
  late Future<List<Parcheggio>> _future;

  @override
  void initState() {
    super.initState();
    _future = _service.getParcheggi();
  }

  void _riprova() {
    setState(() {
      _future = _service.getParcheggi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parcheggi')),
      body: FutureBuilder<List<Parcheggio>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Impossibile caricare i parcheggi.\n${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMuted,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _riprova,
                      child: const Text('Riprova'),
                    ),
                  ],
                ),
              ),
            );
          }

          final parcheggi = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: parcheggi.length,
            itemBuilder: (context, index) {
              final parcheggio = parcheggi[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(parcheggio.nome, style: AppTextStyles.cardTitle),
                  subtitle: Text(
                    parcheggio.via,
                    style: AppTextStyles.cardSubtitle,
                  ),
                  trailing: Text(
                    parcheggio.isBlu
                        ? '${parcheggio.postiLiberi ?? 0} posti'
                        : parcheggio.stato ?? parcheggio.tipo,
                    style: AppTextStyles.body,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
