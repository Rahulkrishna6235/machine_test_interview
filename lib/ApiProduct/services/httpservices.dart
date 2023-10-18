import '../modal/productmodal.dart';
import 'package:http/http.dart'as http;

class RemoteServices{
 static var client=http.Client();
  static Future<List<Productmodal>> fetchProducts() async {
    var response = await client.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
    if (response.statusCode == 200) {
      var jsonString=response.body;
      //var data = response.body;
      return productmodalFromJson(jsonString);
    }else{
      throw Exception();
    }
  }
}
