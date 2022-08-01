import 'package:bloc/bloc.dart';
import 'package:breakingbad/data/models/characters.dart';
import 'package:breakingbad/data/repository/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'character_cubit_state.dart';

class CharacterCubitCubit extends Cubit<CharacterCubitState> {
  CharactersRepository charactersRepository;

  CharacterCubitCubit(this.charactersRepository)
      : super(CharacterCubitInitial());
  static CharacterCubitCubit get(context) => BlocProvider.of(context);
  List<character> characterData = [];
  List<character> getData() {
    charactersRepository.getData().then((value) {
      characterData = value;
      emit(CharacterLoaded(characterData));
    });
    return characterData;
  }

  List<Qoate> characterDataQuate = [];
  List<Qoate> getDataQuate(charQuate) {
    charactersRepository
        .getDataForCharQuate(charQuate: charQuate)
        .then((dynamic value) {
      characterDataQuate = value;
      print(value.toString());
      emit(CharacterQuateLoaded(characterDataQuate));
    });
    return characterDataQuate;
  }

  bool isSearch = false;
  changeAppBarLayout() {
    isSearch = !isSearch;
    print(isSearch);
    emit(ChangeSearchState());
  }

  List<character> characterFromSearch = [];
  searchCharacter(String value) {
    try {
      characterFromSearch = characterData
          .where((element) => element.name!.startsWith(value.toLowerCase()))
          .toList();
      emit(SearchSuccessState());
    } catch (error) {
      print(error);
      emit(SearchErrorState());
    }
  }
}
