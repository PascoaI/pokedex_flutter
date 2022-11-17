
import 'package:pokedex_flutter/base/base_model.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon implements BaseModel {
  PokemonModel(name, num, id, img, type)
      : super(name, num, id, img, type);

  factory PokemonModel.fromJson(Map json) {
    PokemonModel model = PokemonModel(
        json['name'] ?? '',
        json['num'] ?? '',
        json['id'] ?? '',
        json['img'] ?? '',
        (json['type']  as List<String>).map((e) => e).toList()
    );

    return model;
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['name'] = name;
    map['num'] = num;
    map['id'] = id;
    map['img'] = img;
    map['type'] = type;

    return map;
  }
}