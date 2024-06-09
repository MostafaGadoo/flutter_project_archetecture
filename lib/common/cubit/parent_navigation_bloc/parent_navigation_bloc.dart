
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/common/cubit/parent_navigation_bloc/parent_navigation_states.dart';
import 'package:real_state/core/utils/color_helper.dart';



class ParentNavigationBloc extends Cubit<ParentNavigationStates>{
  ParentNavigationBloc():super(ParentAppInitialState());
  static ParentNavigationBloc get(context) => BlocProvider.of(context);

  // final SchoolTypeSelectUseCase schoolTypeSelectUseCase;
  //
  // ParentNavigationBloc({required this.schoolTypeSelectUseCase});

  int currentIndex = 0;

  List<Widget> screens=[
    const ChooseKidProfileScreen(),
    ParentFAQScreen(),
    ParentArticlesScreen(),
    const ParentMoreScreen(),
  ];


  colorChange(int index){
    if(index == currentIndex){
      return ColorHelper.primaryBlue;
    }else{
      return Colors.grey;
    }
  }

  void changeBottomNav(int index){
    currentIndex = index;
    debugPrint(currentIndex.toString());
    emit(ParentAppChangeBottomNavState());
  }


// TabController tabController = TabController(length: 2, vsync: const ScrollableState());



}