part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeFeedListInitial extends HomeState {}

class OnHomeFeedListLoaded extends HomeState {
  final HomeFeedListModel homeFeedListModel;

  OnHomeFeedListLoaded(this.homeFeedListModel);
}

class ErrorHomeFeedLoading extends HomeState {}

class HomeFeedLoadingState extends HomeState {}
