
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
        (json['type']  as List<dynamic>).map((e) => e as String).toList()
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
// class PokemonListing {
//   final int id;
//   final String name;
// //
//   String get imageUrl =>
//       'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
//
//   PokemonListing({@required this.id, @required this.name});
//
//   factory PokemonListing.fromJson(Map<String, dynamic> json) {
//     final name = json['name'];
//     final url = json['url'] as String;
//     final id = int.parse(url.split('/')[6]);
//
//     return PokemonListing(id: id, name: name);
//   }
// }