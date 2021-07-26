import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = new Location();
    await loc.getCurrentLocation();
    var lat = loc.latitude;
    var long = loc.longitude;

    NetworkOps netops = NetworkOps(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$APIKEY&units=metric');
    var weatherData = await netops.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(city) async {
    NetworkOps netops = NetworkOps(
        url:
            'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$APIKEY&units=metric');
    var weatherData = await netops.getData();
    return weatherData;
  }
}
