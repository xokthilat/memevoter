import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memevoter/core/interface/api_client/base_client_generator.dart';
import '../../constants.dart';
part 'api_holder.freezed.dart';

@freezed
class ApiHolder extends BaseClientGenerator with _$ApiHolder {
  const ApiHolder._() : super();

  const factory ApiHolder.fetchListMeme() = _FetchListMeme;
  @override
  String get baseURL => baseUrl;

  @override
  Map<String, dynamic> get header {
    return maybeWhen<Map<String, dynamic>>(
        orElse: () => {"Content-Type": "application/json"});
  }

  @override
  String get path {
    return when<String>(fetchListMeme: () => "get_memes");
  }

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => 'GET',
    );
  }

  @override
  dynamic get body {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }
}
