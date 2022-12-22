import '/data/serialization/album.dart';
import '/data/serialization/pollution_station.dart';

abstract class ApiRepository {
  Future<PollutionStation> getFirstStation();
  Future<List<PollutionStation>> getAllStations();
  Future<Album> createAlbum(String title);
}
