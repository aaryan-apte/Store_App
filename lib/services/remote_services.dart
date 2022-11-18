import 'package:http/http.dart' as http;
import 'package:store_app_git/models/Product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    Uri myUri = Uri.parse("https://fakestoreapi.com/products");
    var response = await client.get(myUri);

    if(response.statusCode == 200) {
      var jsonString = response.body;
      return fromJson(jsonString);
    }
    else{
      return [];
    }
  }
}