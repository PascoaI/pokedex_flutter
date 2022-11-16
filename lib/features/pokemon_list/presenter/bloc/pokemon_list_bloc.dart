import 'dart:async';
import 'package:pokedex_flutter/features/pokemon_list/domain/usecase/get_pokemon_usecase.dart';

class PokemonListBloc {
  final GetPokemonUseCase usecase;
  PokemonListBloc(this.usecase);

  var _controller = StreamController.broadcast();

  Stream get stream => _controller.stream;

  var pokemon = [];

  onLoadPokemon() async {
    var list = await usecase();
    pokemon.addAll(list);

    _controller.sink.add(true);
  }

  dispose() {
    _controller.close();
  }
}
