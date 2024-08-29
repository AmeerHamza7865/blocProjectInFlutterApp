part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState{}
sealed class HomeLoadingState extends HomeState{}

final class HomeInitial extends HomeState {}
