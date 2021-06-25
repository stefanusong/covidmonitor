part of 'page_bloc.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class OnGlobalCasePage extends PageState {}

class OnLocalCasePage extends PageState {}

class OnSymptomsPage extends PageState {}

class OnPreventionsPage extends PageState {}