part of '../../pages.dart';

class LocalDashboard extends StatefulWidget {
  const LocalDashboard({
    Key? key,
  }) : super(key: key);

  @override
  _LocalDashboardState createState() => _LocalDashboardState();
}

class _LocalDashboardState extends State<LocalDashboard> {
  CovidApiServices covidApiService = CovidApiServices();
  final TextEditingController _searchController = TextEditingController();
  late Future<List<CountryData>> countryDataLists;
  late Future<List<Countries>> countries;

  @override
  initState() {
    super.initState();
    countries = covidApiService.getCountryList();

    this._searchController.text = "Indonesia";
    countryDataLists = covidApiService.getCountryData("id");
  }

  List<String> _getSuggestions(List<Countries> countries, String query) {
    List<String> matches = [];

    // Add all country name to the list
    for (var country in countries) {
      matches.add(country.countryName);
    }

    // find countries that match the query
    matches.retainWhere(
        (country) => country.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            LocalHeader(),
            // INPUT BOX
            FutureBuilder(
                future: countries,
                builder: (context, AsyncSnapshot<List<Countries>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Error"));
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: Text("Please wait..."));
                    default:
                      return !snapshot.hasData
                          ? Center(
                              child: Text("There is no data."),
                            )
                          : Container(
                              width: 360,
                              margin: EdgeInsets.only(top: 36),
                              child: TypeAheadFormField(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: this._searchController,
                                  decoration: InputDecoration(
                                    hintText: "Type country name",
                                    labelText: "Search country",
                                    fillColor: secondaryColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          countryDataLists = covidApiService
                                              .getCountryData(snapshot.data!
                                                  .firstWhere((country) =>
                                                      country.countryName ==
                                                      this
                                                          ._searchController
                                                          .text)
                                                  .slug);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            defaultPadding * 0.75),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: defaultPadding / 2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/ic_search.svg",
                                          width: 16,
                                          color: bgColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                suggestionsCallback: (query) =>
                                    _getSuggestions(snapshot.data!, query),
                                itemBuilder: (context, suggestion) => ListTile(
                                    title: Text(suggestion.toString())),
                                transitionBuilder:
                                    (context, suggestionsBox, controller) =>
                                        suggestionsBox,
                                onSuggestionSelected: (suggestion) {
                                  this._searchController.text =
                                      suggestion.toString();
                                  setState(() {
                                    countryDataLists = covidApiService
                                        .getCountryData(snapshot.data!
                                            .firstWhere((country) =>
                                                country.countryName ==
                                                suggestion)
                                            .slug);
                                  });
                                },
                              ),
                            );
                  }
                }),
            SizedBox(height: 20),
            FutureBuilder(
              future: countryDataLists,
              builder: (context, AsyncSnapshot<List<CountryData>> snapshot) {
                if (snapshot.hasError) return Center(child: Text("Error"));
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                        child: SpinKitFadingCube(
                      color: Colors.white,
                    ));
                  default:
                    return (!snapshot.hasData)
                        ? Center(child: Text("There is no data."))
                        : DataCards(dataList: snapshot.data!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DataCards extends StatelessWidget {
  const DataCards({Key? key, required this.dataList}) : super(key: key);
  final List<CountryData> dataList;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataCard(
                      title: "Confirmed",
                      totalCase: dataList[dataList.length - 1].confirmed,
                      dailyCase: dataList[dataList.length - 1].confirmed -
                          dataList[dataList.length - 2].confirmed,
                      textColor: Colors.redAccent,
                    ),
                    DataCard(
                      title: "Active",
                      totalCase: dataList[dataList.length - 1].active,
                      dailyCase: dataList[dataList.length - 1].active -
                          dataList[dataList.length - 2].active,
                      textColor: Colors.cyanAccent,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataCard(
                      title: "Recovered",
                      totalCase: dataList[dataList.length - 1].recovered,
                      dailyCase: dataList[dataList.length - 1].recovered -
                          dataList[dataList.length - 2].recovered,
                      textColor: Colors.lightGreenAccent,
                    ),
                    DataCard(
                      title: "Death",
                      totalCase: dataList[dataList.length - 1].deaths,
                      dailyCase: dataList[dataList.length - 1].deaths -
                          dataList[dataList.length - 2].deaths,
                      textColor: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LocalHeader extends StatelessWidget {
  const LocalHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Local Case",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              Text(
                "A local real time data of Covid-19 for any country.",
                style: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(0.6)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
