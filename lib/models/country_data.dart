part of 'models.dart';

class CountryData {
  final String country;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;
  final DateTime date;

  CountryData(this.country, this.confirmed, this.deaths, this.recovered,
      this.active, this.date);

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      json["Country"],
      json["Confirmed"],
      json["Deaths"],
      json["Recovered"],
      json["Active"],
      DateTime.parse(json["Date"]),
    );
  }
}
