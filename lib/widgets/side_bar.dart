part of 'widgets.dart';

// ignore: must_be_immutable
class SideBar extends StatefulWidget {
  SideBar({Key? key, required this.selectedIndex}) : super(key: key);
  int selectedIndex;
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List tileList = [
    {
      "svg": "assets/ic_global.svg",
      "title": "Global Case",
    },
    {
      "svg": "assets/ic_local.svg",
      "title": "Local Case",
    },
    {
      "svg": "assets/ic_symptom.svg",
      "title": "Symptoms",
    },
    {
      "svg": "assets/ic_prevent.svg",
      "title": "Preventions",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("assets/logo.png")),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return DrawerTile(
                      svgAsset: tileList[index]["svg"],
                      navTitle: tileList[index]["title"],
                      isActive: widget.selectedIndex == index,
                      onTap: () {
                        setState(() {
                          widget.selectedIndex = index;
                        });
                        if (index == 0) {
                          context.read<PageBloc>().add(GoToGlobalCasePage());
                        } else if (index == 1) {
                          context.read<PageBloc>().add(GoToLocalCasePage());
                        } else if (index == 2) {
                          context.read<PageBloc>().add(GoToSymptomsPage());
                        } else if (index == 3) {
                          context.read<PageBloc>().add(GoToPreventionsPage());
                        }
                      },
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 190),
              child: ListTile(
                title: Center(
                  child: Text("github.com/stefanusong",
                      style: TextStyle(color: Colors.white60, fontSize: 12)),
                ),
                onTap: () async {
                  final String _url = "https://github.com/stefanusong";
                  await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatefulWidget {
  DrawerTile(
      {Key? key,
      required this.svgAsset,
      required this.navTitle,
      required this.onTap,
      required this.isActive})
      : super(key: key);

  final String svgAsset, navTitle;
  final VoidCallback onTap;
  final bool isActive;

  @override
  _DrawerTileState createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.white10,
      selected: widget.isActive,
      onTap: widget.onTap,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        widget.svgAsset,
        color: widget.isActive ? Colors.cyan : Colors.white60,
        height: 18,
      ),
      title: Text(
        widget.navTitle,
        style: TextStyle(
            color: Colors.white60, fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
