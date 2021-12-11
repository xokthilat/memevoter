import 'package:dio/dio.dart';
import 'package:memevoter/core/interface/models/base_network_model.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/model/imgflip_response_model.dart';

class NetworkDecoder {
  //TODO handle in case the response is not list
  K decode<T extends BaseNetworkModel, K>(
      {required Response<dynamic> response, required T responseType}) {
    try {
      ImgFlipResponseModel<K> imgFlipResponseData = ImgFlipResponseModel<K>()
          .fromJson(
              response.data,
              (json) => List<T>.from(
                      json.map((item) => responseType.fromJson(item)).toList())
                  as K);
      if (imgFlipResponseData.sucess) {
        return imgFlipResponseData.data!;
      } else {
        throw NetworkError.imgflipInternal(
            message: imgFlipResponseData.errorMessage);
      }
    } on TypeError {
      rethrow;
    }
  }
}
