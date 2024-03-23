import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/app_constants.dart';
import '../Storage/storage.dart';

AppConstants appConstant = AppConstants();


Future<Map<String, String>> makeHeader() async {
  try {
    String token =  await appConstant.tokenStorage.getToken() ;
    Map<String, String> header = {};
    header['Content-Type'] = 'application/json; charset=UTF-8';
    header['x-jwt-token'] = token;
    return header;
  } catch (e) {
    throw Exception('not authenticated because $e');
  }
}

authenticationToken() async {
  var url = Uri.http(AppConstants.localHost, '/user');
  try {
    var response = await http.get(
      url,
      headers: await makeHeader(),
    );
    authenticationResponse(response);
  } catch (e) {
    rethrow;
  }
}

authenticationResponse(http.Response response) async {
  TokenStorage ts = TokenStorage();
  if (response.statusCode == 403) {
    ts.deletetoken();
    throw Exception("invalid token");
  }
}



