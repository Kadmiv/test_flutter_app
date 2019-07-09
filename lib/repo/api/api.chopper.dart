// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$MyService extends MyService {
  _$MyService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = MyService;

  Future<Response> getResource(String id) {
    final $url = '/resources';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response<Map>> getMapResource(String id) {
    final $url = '/resources';
    final Map<String, dynamic> $params = {'id': id};
    final $headers = {'foo': 'bar'};
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<Map, Map>($request);
  }

  Future<Response> postResources(Map a, Map b, String c) {
    final $url = '/resources';
    final $parts = <PartValue>[
      PartValue<Map>('1', a),
      PartValue<Map>('2', b),
      PartValue<String>('3', c)
    ];
    final $request =
        Request('POST', $url, client.baseUrl, parts: $parts, multipart: true);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> postFile(List<int> bytes) {
    final $url = '/resources';
    final $parts = <PartValue>[PartValueFile<List<int>>('file', bytes)];
    final $request =
        Request('POST', $url, client.baseUrl, parts: $parts, multipart: true);
    return client.send<dynamic, dynamic>($request);
  }
}
