import "dart:async";
import 'package:chopper/chopper.dart';

// Именна файлов должны совпадать
part "api.chopper.dart";

abstract class IApi {
  void getResource(String id);

  void getMapResource(String id);

  void postResources(
    Map a,
    Map b,
    String c,
  );

  void postFile(List<int> bytes);
}

@ChopperApi(baseUrl: "/resources")
abstract class MyService extends ChopperService {
  static MyService create([ChopperClient client]) => _$MyService(client);

  @Get(path: "{id}")
  Future<Response> getResource(@Path() String id);

  @Get(headers: const {"foo": "bar"})
  Future<Response<Map>> getMapResource(@Query() String id);

  @Post(path: 'multi')
  @multipart
  Future<Response> postResources(
    @Part('1') Map a,
    @Part('2') Map b,
    @Part('3') String c,
  );

  @Post(path: 'file')
  @multipart
  Future<Response> postFile(
    @FileField('file') List<int> bytes,
  );
}

class MyErrorConverter extends ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    // TODO: implement convertError
    return null;
  }
}

class ApiHelper implements IApi {
  var chopper;
  var apiService;
  var baseUrl = "http://localhost:8000";

  void onCreate() {
    chopper = ChopperClient(
      baseUrl: baseUrl,
      services: [
        // the generated service
        MyService.create()
      ],
      converter: JsonConverter(),
      errorConverter: MyErrorConverter(),
    );

    apiService = MyService.create(chopper);
  }

  void onDestroy() {
    chopper.close();
  }

  @override
  void getMapResource(String id) {
    apiService.getMapResource(id);
  }

  @override
  void getResource(String id) {
    apiService.getResource(id);
  }

  @override
  void postFile(List<int> bytes) {
    apiService.postFile(bytes);
  }

  @override
  void postResources(Map a, Map b, String c) {
    apiService.postResources(a, b, c);
  }
}
