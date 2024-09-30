import 'package:weather/weather/domain/entities/weather_entities.dart';

abstract class BaseWeatherRepository {
  Future<WeatherEntities> getWeatherByCityName(String cityName);
}
//2
//بعمل فيها الداله ال انا عايزه انفذها