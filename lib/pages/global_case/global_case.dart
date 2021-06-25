part of '../pages.dart';

class GlobalCase extends StatefulWidget {
  @override
  _GlobalCaseState createState() => _GlobalCaseState();
}

class _GlobalCaseState extends State<GlobalCase> {
  CovidApiServices covidApiServices = CovidApiServices();

  late Future<GlobalData> globalData;

  @override
  void initState() {
    super.initState();
    globalData = covidApiServices.getGlobalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SideBar(selectedIndex: 0),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                SizedBox(height: 25),
                GlobalHeader(),
                SizedBox(height: 25),
                FutureBuilder(
                  future: globalData,
                  builder: (context, AsyncSnapshot<GlobalData> snapshot) {
                    if (snapshot.hasError)
                      return Center(
                          child: Text("Error" + snapshot.error.toString()));

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                            child: SpinKitFadingCube(
                          color: Colors.white,
                        ));
                      default:
                        return (!snapshot.hasData)
                            ? Center(child: Text("There is no data."))
                            : GlobalDashboard(globalData: snapshot.data!);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalHeader extends StatelessWidget {
  const GlobalHeader({
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
                "Global Case",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              Text(
                "A global updated data of COVID-19",
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
