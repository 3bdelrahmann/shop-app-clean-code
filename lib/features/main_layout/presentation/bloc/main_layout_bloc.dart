import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/enums/enums.dart';

part 'main_layout_event.dart';
part 'main_layout_state.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  NavBarItems isSelected = NavBarItems.home;

  PageController pageController = PageController();
  MainLayoutBloc() : super(MainLayoutInitial()) {
    on<MainLayoutEvent>((event, emit) {
      if (event is ChangeNavBarSelected) {
        if (event.navBarItem == NavBarItems.cart &&
            isSelected == NavBarItems.home) {
          pageController.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn);

          isSelected = NavBarItems.cart;
          emit(const ChangeNavBarSelectedSuccess(navBarItem: NavBarItems.cart));
        } else if (event.navBarItem == NavBarItems.home &&
            isSelected == NavBarItems.cart) {
          pageController.previousPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn);

          isSelected = NavBarItems.home;
          emit(const ChangeNavBarSelectedSuccess(navBarItem: NavBarItems.home));
        }
      }
    });
  }
}
