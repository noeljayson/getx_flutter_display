import 'package:http/http.dart' as http;
import 'model.dart';
import 'model/newpostmodel.dart';

class httpHelper {
  static Future fetchDetails() async {
    var response = await http
        .get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    }
  }

  static Future fetchpostDetails() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var data = response.body;
      return newPostModelFromMap(data);
    }
  }


  static Future fetchpostnewDetails(value) async {
    print("nhnh");
    print(value);

    var response = await http
        .post(Uri.parse("https://jsonplaceholder.typicode.com/posts/$value"));
    print("newresponse");
    print(response);
    if (response.statusCode == 200) {
      var data = response.body;
      print("hehehe");
      print(response);
      return newPostModelFromMap(data);
    }
  }
}
