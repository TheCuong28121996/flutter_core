part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

final class NavigationChanged extends NavigationEvent {
  const NavigationChanged(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
