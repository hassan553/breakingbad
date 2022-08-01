import 'package:breakingbad/data/web_screvice/character_web_services.dart';
import 'package:breakingbad/data/models/characters.dart';

class CharactersRepository {
  CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);
  Future<List<character>> getData() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((charact) {
      return character.fromJson(charact);
    }).toList();
  }
   Future<List<Qoate>> getDataForCharQuate({required String charQuate}) async {
    final character = await charactersWebServices.getAllCharactersQuate(charQuate: charQuate );
    return character.map((charact) {
      return Qoate.fromjson(charact);
    }).toList();
  }
}
