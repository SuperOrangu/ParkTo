/* SEZIONE DEDICATA ALLA NAVIGAZIONE */

import 'package:material_ui/material_ui.dart';

import 'home_screen.dart';
import 'map_screen.dart';
import 'list_screen.dart';
import 'favorites_screen.dart';

// Classe principale che gestisce la navigazione tra le schermate
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _indiceCorrente = 0;

  // Lista delle schermate disponibili nell'app
  final List<Widget> _schermate = [
    HomeScreen(),
    const MapScreen(),
    const ListScreen(),
    const FavoritesScreen(),
  ];

  // Metodo per aggiornare l'indice corrente della schermata
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _indiceCorrente, children: _schermate),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indiceCorrente,
        onDestinationSelected: (int nuovoIndice) {
          setState(() {
            _indiceCorrente = nuovoIndice;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Mappa',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            selectedIcon: Icon(Icons.list_alt),
            label: 'Lista',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Preferiti',
          ),
        ],
      ),
    );
  }
}
