import 'package:api1/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Welcome>?> getPosts() async {
    var client = http.Client(); // client object

    var uri = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts',
    );
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    }
  }
}
