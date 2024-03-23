import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/app_constants.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';
import 'Api.dart';



Future<void> createPersona( String name) async {

    var url = Uri.http(AppConstants.localHost, '/persona');
    try {
      var response = await http.post(
        url,
        headers: await makeHeader(),
        body: jsonEncode({'name': name}),
      );

      if (response.statusCode == 200) {
        print('Persona created successfully');

      } else {
        print('Failed to create persona: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

}

Future<List<PersonaCard>> makePersonaList(String body) async {
  try {
    List<PersonaCard> personaList;
    personaList =
        (json.decode(body) as List).map((i) => PersonaCard.fromJson(i)).toList();
    print(personaList[0]);
    return personaList;
  } catch (e) {
    throw Exception("Error parsing list $e");
  }
}


Future<List<PersonaCard>> fetchPersonaCards() async {
  var url = Uri.http(AppConstants.localHost, '/persona');

  try {
    var response = await http.get(
      url,
      headers:await makeHeader(),
    );

    if (response.statusCode == 200) {
      return makePersonaList(response.body);
    } else {
      throw Exception(
          'Failed to fetch persona cards. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
