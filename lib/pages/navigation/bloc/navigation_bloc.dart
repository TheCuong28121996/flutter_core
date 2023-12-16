import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

part 'navigation_bloc.freezed.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const InitialNavigationState()) {
    on<NavigationChanged>(_onNavigationChanged);
  }

  void _onNavigationChanged(
      NavigationChanged event,
      Emitter<NavigationState> emit,
      ) {
    emit(InitialNavigationState(index: event.index));
  }
}
