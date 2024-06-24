import 'package:rest_api_client/rest_api_client.dart';
import 'package:trakya_arge/src/config/app_config.dart';

class RestApiService {
  static final RestApiService _instance = RestApiService._internal();

  RestApiService._internal();

  static RestApiService get instance => _instance;

  Future<RestApiClient> init() async {
    late final RestApiClient client;

    await RestApiClient.initFlutter();
    client = RestApiClientImpl(
      options: RestApiClientOptions(
        baseUrl: AppConfig.BASE_URL,
        cacheEnabled: true,
        overrideBadCertificate: false,
      ),
      loggingOptions: const LoggingOptions(
        logNetworkTraffic: true,
      ),
    );
    await client.init();
    return client;
  }
}
