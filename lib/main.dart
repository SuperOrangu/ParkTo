import 'package:material_ui/material_ui.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const ParkToApp());

class ParkToApp extends StatelessWidget {
  const ParkToApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkTo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
