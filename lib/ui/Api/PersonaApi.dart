import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';
import 'Api.dart';



Future<void> createPersona( BuildContext context) async {
  String? name;
  name = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Enter Name'),
      content: TextField(
        onChanged: (value) => name = value,
        decoration: InputDecoration(hintText: 'Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(name);
          },
          child: Text('OK'),
        ),
      ],
    ),
  );

  if (name != null) {
    var url = Uri.http(appConstants.LOCAL_HOST, '/persona');
    //var getPersonasUrl = Uri.http('$local_host:3000', '/getpersonas');
    try {
      // Send a POST request to create a persona
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
}

Future<List<PersonaCard>> makePersonaList(String elbody) async {
  try {
    List<PersonaCard> PersonaList;
    PersonaList =
        (json.decode(elbody) as List).map((i) => PersonaCard.fromJson(i)).toList();
    print(PersonaList[0]);
    return PersonaList;
  } catch (e) {
    throw Exception("Error parsing list $e");
  }
}


Future<List<PersonaCard>> fetchPersonaCards() async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/persona');

  // var url = Uri.parse('http://your-go-server-ip:port/getpersonacards'); // Adjust the URL

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
