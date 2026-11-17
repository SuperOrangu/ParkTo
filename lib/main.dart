import 'package:material_ui/material_ui.dart';
import 'theme/app_theme.dart';
import 'theme/app_text_styles.dart';

void main() => runApp(const ParkToApp());

class ParkToApp extends StatelessWidget {
  const ParkToApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkTo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dove parcheggi oggi?', style: AppTextStyles.titleHome),
              const SizedBox(height: 8),
              Text('Trova un posto libero vicino a te',
                  style: AppTextStyles.bodyMuted),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: () {}, child: const Text('Portami lì')),
              const SizedBox(height: 12),
              OutlinedButton(
                  onPressed: () {}, child: const Text('Aggiungi ai preferiti')),
            ],
          ),
        ),
      ),
    );
  }
}