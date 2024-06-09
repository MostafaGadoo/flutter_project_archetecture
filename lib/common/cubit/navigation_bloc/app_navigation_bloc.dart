
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/common/cubit/navigation_bloc/app_navigation_states.dart';



class NavigationBloc extends Cubit<NavigationStates>{
  NavigationBloc():super(AppInitialState());
  static NavigationBloc get(context) => BlocProvider.of(context);

  // final SchoolTypeSelectUseCase schoolTypeSelectUseCase;
  //
  // NavigationBloc({required this.schoolTypeSelectUseCase});

  int currentIndex = 0;

  List<Widget> screens=[
    HomePageScreen(),
    OnGoingCoursesScreen(),
    const OpportunitiesScreen(),
    const CommunityMainScreen(),
    const MoreScreen(),
  ];



  void changeBottomNav(int index){
    currentIndex = index;
    debugPrint(currentIndex.toString());
    emit(AppChangeBottomNavState());
  }

// TabController tabController = TabController(length: 2, vsync: const ScrollableState());




}