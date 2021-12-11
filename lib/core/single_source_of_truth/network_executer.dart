import 'package:memevoter/core/interface/api_client/base_client_generator.dart';
import 'package:memevoter/core/interface/models/base_network_model.dart';
import 'package:memevoter/core/interface/response/network_error.dart';
import 'package:memevoter/core/interface/response/result.dart';
import 'package:memevoter/core/service/network_connectivity.dart';
import 'package:memevoter/core/service/network_creator.dart';
import 'package:memevoter/core/service/network_options/network_options.dart';
import 'network_decoder.dart';
import 'package:dio/dio.dart';

class NetworkExecuter {
  final NetworkConnectivity networkConnectivity;
  final NetworkCreator networkCreator;
  final NetworkDecoder networkDecoder;

  NetworkExecuter({
    required this.networkConnectivity,
    required this.networkCreator,
    required this.networkDecoder,
  });
  Future<Result<K, NetworkError>> execute<T extends BaseNetworkModel, K>(
      {required BaseClientGenerator route,
      required T responseType,
      NetworkOptions? options}) async {
    // Check Network Connectivity
    if (await networkConnectivity.status) {
      try {
        var response =
            await networkCreator.request(route: route, options: options);
        var data = networkDecoder.decode<T, K>(
            response: response, responseType: responseType);
        return Result.success(data);

        // NETWORK ERROR
      } on DioError catch (dioError) {
        return Result.failure(NetworkError.request(error: dioError));

        // TYPE ERROR
      } on TypeError catch (e) {
        return Result.failure(NetworkError.type(error: e.toString()));
      }

      // No Internet Connection
    } else {
      return const Result.failure(
          NetworkError.connectivity(message: 'No Internet Connection'));
    }
  }
}
