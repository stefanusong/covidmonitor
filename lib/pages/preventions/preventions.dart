part of './../pages.dart';

class Preventions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SideBar(selectedIndex: 3),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                "Sorry this page is currently not available",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
