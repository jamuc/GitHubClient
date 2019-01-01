import 'package:test/test.dart';
import 'dart:convert';
import 'package:github_client/repository.dart';

void main() {
  group("::fromJSON", () {
    test('Takes a JSON object and de-serilizes into a repository object', () {
      final _response = { "name": "Algorithms",
                          "forked": true,
                          "description": "A repository description",
                          "randomKey": "A random key that should be ignrored" };

      final _repository = Repository.fromJSON(jsonEncode(_response));
      expect(_repository.name, "Algorithms");
      expect(_repository.description, "A repository description");
      expect(_repository.forked, true);
    });

    test("Returns null object if JSON cannot be parsed", () {
      final _corruptJSONString = "|a{";
      final _repository = Repository.fromJSON(_corruptJSONString);

      expect(_repository, null);
    });
  });
}