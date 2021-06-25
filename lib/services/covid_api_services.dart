part of 'services.dart';

class CovidApiServices {
  Future<GlobalData> getGlobalData() async {
    final Uri endpoint = Uri.parse("https://api.covid19api.com/summary");
    final response = await http.get(endpoint);

    if (response.statusCode != 200) throw Exception();

    GlobalData globalData = new GlobalData.fromJson(jsonDecode(response.body));
    return globalData;
  }

  Future<List<CountryData>> getCountryData(String slug) async {
    final Uri endpoint =
        Uri.parse("https://api.covid19api.com/total/dayone/country/" + slug);
    final response = await http.get(endpoint);

    if (response.statusCode != 200) throw Exception();

    List<CountryData> countryDataLists = (jsonDecode(response.body) as List)
        .map((item) => new CountryData.fromJson(item))
        .toList();

    return countryDataLists;
  }

  Future<List<Countries>> getCountryList() async {
    final Uri endpoint = Uri.parse("https://api.covid19api.com/countries");
    final response = await http.get(endpoint);

    if (response.statusCode != 200) throw Exception();

    List<Countries> countries = (json.decode(response.body) as List)
        .map((item) => new Countries.fromJson(item))
        .toList();
    
    return countries;
  }
}
