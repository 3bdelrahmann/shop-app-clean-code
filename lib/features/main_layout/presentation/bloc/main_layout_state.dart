part of 'main_layout_bloc.dart';

abstract class MainLayoutState extends Equatable {
  const MainLayoutState();

  @override
  List<Object> get props => [];
}

class MainLayoutInitial extends MainLayoutState {}

class ChangeNavBarSelectedSuccess extends MainLayoutState {
  final NavBarItems navBarItem;

  const ChangeNavBarSelectedSuccess({required this.navBarItem});

  @override
  List<Object> get props => [navBarItem];
}
