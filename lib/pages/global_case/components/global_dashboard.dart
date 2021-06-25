part of '../../pages.dart';

class GlobalDashboard extends StatelessWidget {
  const GlobalDashboard({
    Key? key,
    required this.globalData,
  }) : super(key: key);

  final GlobalData globalData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
                              totalCase: globalData.totalConfirmed,
                              dailyCase: globalData.newConfirmed,
                              textColor: Colors.redAccent,
                            ),
                            DataCard(
                              title: "Active",
                              totalCase: globalData.totalConfirmed -
                                  globalData.totalRecovered -
                                  globalData.totalDeaths,
                              dailyCase: globalData.newConfirmed -
                                  globalData.newRecovered -
                                  globalData.newDeaths,
                              textColor: Colors.cyanAccent,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DataCard(
                              title: "Recovered",
                              totalCase: globalData.totalRecovered,
                              dailyCase: globalData.newRecovered,
                              textColor: Colors.lightGreenAccent,
                            ),
                            DataCard(
                              title: "Death",
                              totalCase: globalData.totalDeaths,
                              dailyCase: globalData.newDeaths,
                              textColor: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
