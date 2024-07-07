import 'package:dio/dio.dart';
import '/new_app/data/model/newapp_contact_us_model.dart';
import '/new_app/data/model/newapp_services_mode.dart';

import 'package:retrofit/retrofit.dart';

part 'new_app_client.g.dart';

@RestApi(baseUrl: "https://home-services.ndsegypt.com/api/")
abstract class NewAppClient {
  factory NewAppClient(Dio dio, {String baseUrl}) = _NewAppClient;

  @GET("services")
  Future<NewAppServicesMode> getNewAppService({
    @Header('Accept-Language') required String lang,
  });

  @GET("contact-us")
  Future<NewAppCuntactUsModel> getNewAppContactUsData({
    @Header('Accept-Language') required String lang,
  });
}
