import 'package:weather/weather/domain/entities/weather_entities.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByCountryName {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCountryName(this.baseWeatherRepository);

  Future<WeatherEntities> execute(String cityName) async{
    return await baseWeatherRepository.getWeatherByCityName(cityName);
  }
}
//3
// باخذ ريفرنس من الريبو وانفذ بقي الداله ال في الريبو هنا