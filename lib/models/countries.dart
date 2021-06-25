part of 'models.dart';
class Countries {
  final String countryName;
  final String slug;
  final String iso2;

  Countries(this.countryName, this.slug, this.iso2);

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(json["Country"], json["Slug"], json["ISO2"]);
  }
}
