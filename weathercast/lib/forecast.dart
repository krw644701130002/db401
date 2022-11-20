/*
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjM3OWRjODEwMTU3MzlmMjA0Y2RkYjE1OGIyZjAxMDg1NzViNjMyNzkzNTQzNmJiYjA5YTllMjdmMDMwNDNkY2QwN2U1NGUyYWIwZmYwMWMzIn0.eyJhdWQiOiIyIiwianRpIjoiMzc5ZGM4MTAxNTczOWYyMDRjZGRiMTU4YjJmMDEwODU3NWI2MzI3OTM1NDM2YmJiMDlhOWUyN2YwMzA0M2RjZDA3ZTU0ZTJhYjBmZjAxYzMiLCJpYXQiOjE2Njg5MzM1MDUsIm5iZiI6MTY2ODkzMzUwNSwiZXhwIjoxNzAwNDY5NTA1LCJzdWIiOiIyMjc5Iiwic2NvcGVzIjpbXX0.evF8XS5cgPq0SF-eKNR4rg8CaYzPIKV-PD00D34miE6B4O4iqJdhGXbD6DZCybMQatI_Z68EDPT-kEeSW96CyrOWyaRxDTPPHLX3Fz81NZ9W3Jf81lY25Bv-hYa0WKGYagRa5OnsOcxL2Uz9YhYh1XWb4Nk13jL4lh4UgOmA7GNtpnoHJUKOzLyRQ9ufvBg51zViX3PJVsT-lH5ouBwskii9WPh2HcjGZ5M-hiQjXCGJydiwAuQBHx0DS2AC8hUCpZVGyLyMUoiKdij477Z1oixOn8iXwWh1xyXi_uqwx96EknTyZDkI-SX-e5w_nfVws5kYOv9vvsdxyyCoMZkpuqdz3BDqUZZqeniDsCzEeGcddEPvLIOdo_eiWBx0LyeAyHqmOn5ptfD2PCe3ZS1SQQdZcIGbDnu3f9FBtPrD8r0iFuQWQvbdA8SiqGJO1oC3DGit3lefw8Dr08V_ik65cFDNzDKf-oTPC3yzPY-z3mOgH1OZXJuyh20UBNX30BYhbjJn0-Xip-xC2-LwjrkyyH1jD2DX-kurU6EepfxfB06U4fJmnqic7Dh3OCiAdJDp-JWASXReWT6gD2vASxDK99fqnwk_9fg5UfLwNJcFk6Bdc6uYAaHQC0C4TMPuTsyAfmkhmqAjFVpInze2pXxULfY6VomI4NHBkhneCEf4Luw
*/
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjM3OWRjODEwMTU3MzlmMjA0Y2RkYjE1OGIyZjAxMDg1NzViNjMyNzkzNTQzNmJiYjA5YTllMjdmMDMwNDNkY2QwN2U1NGUyYWIwZmYwMWMzIn0.eyJhdWQiOiIyIiwianRpIjoiMzc5ZGM4MTAxNTczOWYyMDRjZGRiMTU4YjJmMDEwODU3NWI2MzI3OTM1NDM2YmJiMDlhOWUyN2YwMzA0M2RjZDA3ZTU0ZTJhYjBmZjAxYzMiLCJpYXQiOjE2Njg5MzM1MDUsIm5iZiI6MTY2ODkzMzUwNSwiZXhwIjoxNzAwNDY5NTA1LCJzdWIiOiIyMjc5Iiwic2NvcGVzIjpbXX0.evF8XS5cgPq0SF-eKNR4rg8CaYzPIKV-PD00D34miE6B4O4iqJdhGXbD6DZCybMQatI_Z68EDPT-kEeSW96CyrOWyaRxDTPPHLX3Fz81NZ9W3Jf81lY25Bv-hYa0WKGYagRa5OnsOcxL2Uz9YhYh1XWb4Nk13jL4lh4UgOmA7GNtpnoHJUKOzLyRQ9ufvBg51zViX3PJVsT-lH5ouBwskii9WPh2HcjGZ5M-hiQjXCGJydiwAuQBHx0DS2AC8hUCpZVGyLyMUoiKdij477Z1oixOn8iXwWh1xyXi_uqwx96EknTyZDkI-SX-e5w_nfVws5kYOv9vvsdxyyCoMZkpuqdz3BDqUZZqeniDsCzEeGcddEPvLIOdo_eiWBx0LyeAyHqmOn5ptfD2PCe3ZS1SQQdZcIGbDnu3f9FBtPrD8r0iFuQWQvbdA8SiqGJO1oC3DGit3lefw8Dr08V_ik65cFDNzDKf-oTPC3yzPY-z3mOgH1OZXJuyh20UBNX30BYhbjJn0-Xip-xC2-LwjrkyyH1jD2DX-kurU6EepfxfB06U4fJmnqic7Dh3OCiAdJDp-JWASXReWT6gD2vASxDK99fqnwk_9fg5UfLwNJcFk6Bdc6uYAaHQC0C4TMPuTsyAfmkhmqAjFVpInze2pXxULfY6VomI4NHBkhneCEf4Luw';

  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['WeatherForecasts'][0]['forecasts']
          [0]['data'];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
        address: '${address.subLocality}\n${address.administrativeArea}',
        temperature: result['tc'],
        cond: result['cond'],
      );
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
