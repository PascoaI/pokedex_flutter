import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'features/pokemon_list/presenter/ui/pokemon_list.dart';

void main() {
  setupDependenceInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Pokédex',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokemonList(key: Key('LIST-PAGE')));
  }
}
