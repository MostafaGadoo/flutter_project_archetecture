import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/common/network/connectivity/connection_status_listener.dart';
import 'package:real_state/modules/school_type_select/data/models/school_type_select_model.dart';
import 'package:real_state/modules/school_type_select/presentation/cubit/school_type_select_cubit.dart';

import '../../../../common/cubit/generic_cubit_state.dart';

class SchoolTypeSelectPage extends StatefulWidget {
  const SchoolTypeSelectPage({super.key});

  @override
  State<SchoolTypeSelectPage> createState() => _SchoolTypeSelectPageState();
}

class _SchoolTypeSelectPageState extends State<SchoolTypeSelectPage> {

  SchoolTypeSelectModel? schoolTypesModel;

  @override
  void initState() {
    getSchoolTypesData();
    callSchoolTypes();
    ConnectionStatusListener.getInstance().connectionChange.listen((event) {
      callSchoolTypes();
    });
    super.initState();
    WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      callSchoolTypes();
    }
  }

  void getSchoolTypesData() async {
    // schoolTypesModel = await LocalStorage().();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolTypeSelectCubit, GenericCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold();
      },
    );
  }

  void callSchoolTypes() {
    var tempSchoolTypeCubit = context.read<SchoolTypeSelectCubit>();
    tempSchoolTypeCubit.doSchoolTypeSelect();
  }
}
