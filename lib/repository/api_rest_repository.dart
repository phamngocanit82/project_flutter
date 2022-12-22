import '/data/serialization/album.dart';
import '/data/serialization/pollution_station.dart';
import '/repository/api_exception.dart';
import '/repository/http_client.dart';
import '/repository/api_repository.dart';

class _Urls {
  static const baseUrl = "https://api.gios.gov.pl/pjp-api/rest/";
  static const allStations = "${baseUrl}station/findAll";
}

class ApiRestRepository extends ApiRepository {
  final HttpClient _httpClient = HttpClient();

  @override
  Future<PollutionStation> getFirstStation() async {
    final List<dynamic> stationListJson =
        await _httpClient.getRequest(_Urls.allStations);

    if (stationListJson.isEmpty) {
      throw EmptyResultException();
    }

    return PollutionStation.fromJson(stationListJson.first);
  }

  @override
  Future<List<PollutionStation>> getAllStations() async {
    final List<dynamic> stationListJson =
        await _httpClient.getRequest(_Urls.allStations);

    return stationListJson
        .map((stationJson) => PollutionStation.fromJson(stationJson))
        .toList();
  }

  @override
  Future<Album> createAlbum(String title) async {
    final Map<String, dynamic> sensorDataJson =
        await _httpClient.createAlbum(title);
    return Album.fromJson(sensorDataJson);
  }
}
