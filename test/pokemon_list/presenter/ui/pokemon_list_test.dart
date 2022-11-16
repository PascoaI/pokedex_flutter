import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/di/injection.dart';
import 'package:pokedex_flutter/features/pokemon_list/data/model/pokemon_model.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/usecase/get_pokemon_usecase.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/bloc/pokemon_list_bloc.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/ui/pokemon_list.dart';

class GetRestaurantsUseCaseMock extends Mock implements GetPokemonUseCase {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetPokemonUseCase useCase;
  late PokemonListBloc bloc;
  late Pokemon restaurant;
  late Widget app;
  setUp(() {
    app = MaterialApp(home: Scaffold(body: PokemonList()));
    useCase = GetRestaurantsUseCaseMock();
    bloc = PokemonListBloc(useCase);
    setupDependenceInjection();
    GetIt.I.allowReassignment = true;
    GetIt.I.registerFactory<PokemonListBloc>(() => bloc);

    restaurant = PokemonModel.fromJson({
      'name': 'A',
      'logo': 'B',
      'score': 'C',
      'colorScore': 'D',
      'delivery': 'E',
      'cousine': 'F',
      'photoPlate': 'G',
      'plateName': 'H',
      'description': 'I',
      'price': 'J'
    });

    when(useCase()).thenAnswer((_) async => [restaurant]);
  });

  tearDown(() {
    bloc.dispose();
  });

  testWidgets('Verify  visibility  fields', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(Duration(milliseconds: 200));
    expect(find.byKey(Key('THUMB-LOGO')), findsOneWidget);
    expect(find.byKey(Key('NAME')), findsOneWidget);
    expect(find.byKey(Key('SCORE')), findsOneWidget);
    expect(find.byKey(Key('COUSINE')), findsOneWidget);
    expect(find.byKey(Key('CARD-ITEM-0')), findsOneWidget);
  });

  testWidgets('Verify fields content', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(Duration(milliseconds: 200));

    Finder name = find.byKey(Key('NAME'));
    Text text = tester.firstWidget(name);

    expect(text.data, 'A');
    expect(text.style!.color, Color(0xFF090909));
    expect(text.style!.fontSize, 18);

    Finder thumb = find.byKey(Key('THUMB-LOGO'));
    FadeInImage image = tester.widget(thumb);
    expect(image.placeholder, AssetImage('assets/placeholder.png'));

    ///...
  });

  testWidgets('Select pokemon and open detail page',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(Duration(milliseconds: 200));

    Finder detail = find.byKey(Key('DETAIL-PAGE'));
    expect(detail, findsNothing);

    Finder card = find.byKey(Key('CARD-ITEM-0'));

    await tester.tap(card);
    await tester.pump();
    await tester.pump();

    Finder detailpage = find.byKey(Key('DETAIL-PAGE'));

    expect(detailpage, findsOneWidget);
  });
}
