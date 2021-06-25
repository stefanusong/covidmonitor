part of 'widgets.dart';

class DataCard extends StatelessWidget {
  DataCard({
    Key? key,
    required this.title,
    required this.totalCase,
    required this.dailyCase,
    this.textColor = Colors.white,
  }) : super(key: key);
  final int totalCase, dailyCase;
  final String title;
  final Color textColor;
  final NumberFormat formatter = NumberFormat.decimalPattern("id");

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(defaultPadding),
      elevation: 10,
      color: secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.fromLTRB(defaultPadding * 2, defaultPadding,
            defaultPadding * 2, defaultPadding),
        height: 200,
        width: 265,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              "Total",
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            Text(
              formatter.format(totalCase),
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w800, color: textColor),
            ),
            // SizedBox(height: 10),
            Text(
              "Today",
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            Text(
              formatter.format(dailyCase),
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w800, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
