import 'package:flutter_test/flutter_test.dart';
import 'package:memevoter/constants.dart';
import 'package:memevoter/core/service/api_holder.dart';

void main() {
  group("fetch list of memes holder", () {
    const apiHolder = ApiHolder.fetchListMeme();

    test("should return base url", () {
      expect(apiHolder.baseURL, baseUrl);
    });
    test("should return application/json in header", () {
      var expectedHeader = {"Content-Type": "application/json"};
      expect(apiHolder.header, expectedHeader);
    });
    test("should return application/json in header", () {
      var expectedHeader = {"Content-Type": "application/json"};
      expect(apiHolder.header, expectedHeader);
    });
    test("should return correct path", () {
      var expectedPath = "get_memes";
      expect(apiHolder.path, expectedPath);
    });
    test("should return correct http method", () {
      var expectedHttpMethod = "GET";
      expect(apiHolder.method, expectedHttpMethod);
    });
    test("should return null body", () {
      expect(apiHolder.body, null);
    });
    test("should return correct query parameters", () {
      expect(apiHolder.queryParameters, null);
    });
  });
}
