import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_flutter/features/pokemon_list/data/datasource/get_pokemon_data_source.dart';
import 'package:pokedex_flutter/features/pokemon_list/data/repositories/get_pokemon_repository_impl.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/usecase/get_pokemon_usecase.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/bloc/pokemon_list_bloc.dart';

GetIt _l = GetIt.instance;

void setupDependenceInjection() {
  setup();
  setupPokemon();
}

void setup() async {
  _l.registerFactory<Dio>(() => Dio());
}

void setupPokemon() async {
  _l.registerFactory<GetPokemonDataSource>(
      () => GetPokemonDataSource(_l<Dio>()));

  _l.registerFactory<GetPokemonRepository>(
      () => GetPokemonRepositoryImpl(_l<GetPokemonDataSource>()));

  _l.registerFactory<GetPokemonUseCase>(
      () => GetPokemonUseCaseImpl(_l<GetPokemonRepository>()));

  _l.registerFactory<PokemonListBloc>(
      () => PokemonListBloc(_l<GetPokemonUseCase>()));
}
