part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(builder: (_, pageState) {
      if (pageState is OnGlobalCasePage) {
        return GlobalCase();
      } else if (pageState is OnLocalCasePage) {
        return LocalCase();
      } else if (pageState is OnSymptomsPage) {
        return Symptoms();
      } else if (pageState is OnPreventionsPage) {
        return Preventions();
      }
      return GlobalCase();
    });
  }
}
