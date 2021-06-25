part of '../pages.dart';

class LocalCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SideBar(selectedIndex: 1),
          ),
          Expanded(
            flex: 5,
            child: LocalDashboard(),
          ),
        ],
      ),
    );
  }
}
