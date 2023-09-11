part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

/// home states ///

class HomeSuccess extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String messageError;

  const HomeError({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}
