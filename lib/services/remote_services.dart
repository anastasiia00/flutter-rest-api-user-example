import 'package:api1/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Welcome>?> getPosts() async {
    http.Client client = http.Client(); // client object

    Uri uri = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts',
    );
    http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      String json = response.body;
      return welcomeFromJson(json);
    }
  }
}
