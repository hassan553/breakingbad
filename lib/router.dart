import 'package:breakingbad/constants/strings.dart';
import 'package:breakingbad/cubit/character_cubit_cubit.dart';
import 'package:breakingbad/data/models/characters.dart';
import 'package:breakingbad/data/repository/characters_repository.dart';
import 'package:breakingbad/data/web_screvice/character_web_services.dart';
import 'package:breakingbad/presentation/screens/character_detail_screen.dart';
import 'package:breakingbad/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubitCubit characterCubitCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    characterCubitCubit = CharacterCubitCubit(charactersRepository);
  }
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case charaterHomeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => CharacterCubitCubit(charactersRepository),
              child: const CharacterScreen(),
            );
          },
        );

      case characterDetailScreen:
        final charaters = settings.arguments as character;
        return MaterialPageRoute(
          builder: (_) {
            return  BlocProvider(
              create: (context) => CharacterCubitCubit(charactersRepository),
              child: CharacterDetailScreen(characte:charaters));
          },
        );
    }
  }
}
