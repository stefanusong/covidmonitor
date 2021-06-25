import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToGlobalCasePage) {
      yield OnGlobalCasePage();
    } else if (event is GoToLocalCasePage) {
      yield OnLocalCasePage();
    } else if (event is GoToSymptomsPage) {
      yield OnSymptomsPage();
    } else if (event is GoToPreventionsPage) {
      yield OnPreventionsPage();
    }
  }
}
