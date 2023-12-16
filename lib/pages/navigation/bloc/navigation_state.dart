part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initialNavigation({
    @Default(0) int index,
  }) = InitialNavigationState;
}
