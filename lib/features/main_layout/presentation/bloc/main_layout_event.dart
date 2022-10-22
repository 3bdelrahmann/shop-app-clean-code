part of 'main_layout_bloc.dart';

abstract class MainLayoutEvent extends Equatable {
  const MainLayoutEvent();

  @override
  List<Object> get props => [];
}

class ChangeNavBarSelected extends MainLayoutEvent {
  final NavBarItems navBarItem;

  const ChangeNavBarSelected({required this.navBarItem});

  @override
  List<Object> get props => [navBarItem];
}
