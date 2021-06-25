part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToGlobalCasePage extends PageEvent {}

class GoToLocalCasePage extends PageEvent {}

class GoToSymptomsPage extends PageEvent {}

class GoToPreventionsPage extends PageEvent {}