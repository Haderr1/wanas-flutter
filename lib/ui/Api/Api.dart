import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import '../Storage/storage.dart';

appConstants appConstant = appConstants();


Future<Map<String, String>> makeHeader() async {
  try {
    String eltoken =  appConstant.tokenStorage.getToken() as String;
    Map<String, String> elheader = new Map();
    elheader['Content-Type'] = 'application/json; charset=UTF-8';
    elheader['x-jwt-token'] = eltoken;
    return elheader;
  } catch (e) {
    throw Exception('not authenticated because $e');
  }
}

authenttoken() async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/user');
  try {
    var response = await http.get(
      url,
      headers: await makeHeader(),
    );
    authentresp(response);
  } catch (e) {
    rethrow;
  }
}

authentresp(http.Response response) async {
  TokenStorage ts = TokenStorage();
  if (response.statusCode == 403) {
    ts.deletetoken();
    throw Exception("invalid token");
  }
}



