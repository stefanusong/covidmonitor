import 'package:covid_tracker/bloc/bloc.dart';
import 'package:covid_tracker/models/models.dart';
import 'package:covid_tracker/services/services.dart';
import 'package:covid_tracker/utils/utils.dart';
import 'package:covid_tracker/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

part 'wrapper.dart';
part 'global_case/global_case.dart';
part 'local_case/local_case.dart';
part 'symptoms/symptoms.dart';
part 'preventions/preventions.dart';

part 'global_case/components/global_dashboard.dart';
part 'local_case/components/local_dashboard.dart';
