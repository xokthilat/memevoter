import 'package:equatable/equatable.dart';
import 'package:memevoter/core/entities/imgflip_response.dart';

class ImgFlipResponseModel<T> extends Equatable implements ImgFlipResponse<T> {
  //decode json from imgflip. im checking if json.data.memes is not null for detect if the current request is requesting list of meme
  //TODO use contractor tear off to check if type of T is list<meme> inteads of checking null in json.data.memes
  ImgFlipResponseModel<T> fromJson(
    Map<String, dynamic> json,
    T Function(List<dynamic> json) fromJsonT,
  ) {
    if (json["data"]?["memes"] != null) {
      return ImgFlipResponseModel<T>()
        ..data = fromJsonT(json["data"]["memes"])
        ..errorMessage = json["error_message"]
        ..sucess = json["success"];
    }
    return ImgFlipResponseModel<T>()
      ..data = null
      ..errorMessage = json["error_message"]
      ..sucess = json["success"];
  }

  @override
  late final T? data;

  @override
  late final bool sucess;

  @override
  late final String? errorMessage;

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
