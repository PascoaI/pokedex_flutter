import 'package:pokedex_flutter/base/data_source.dart';
import 'package:pokedex_flutter/features/pokemon_list/data/model/pokemon_model.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';

class GetPokemonRepositoryImpl implements GetPokemonRepository {
  final DataSource _dataSource;

  GetPokemonRepositoryImpl(this._dataSource);

  @override
  Future<List<Pokemon>> call() async {
    return await _dataSource((json) => PokemonModel.fromJson(json));
  }
}
