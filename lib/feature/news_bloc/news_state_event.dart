import '../business_news/business_news_model.dart';

abstract class NewsState {}

class NewInitialState extends NewsState {}

class NewLoadingState extends NewsState {}

class NewLoadedState extends NewsState {
  final List<Articles>? newsList;
  NewLoadedState(this.newsList);
}

class NewErrorState extends NewsState {
  final String errorMessage;
  NewErrorState(this.errorMessage);
}

abstract class NewsEvent {}

class FetchTechNewsEvent extends NewsEvent {}

class FetchBusinessNewsEvent extends NewsEvent {}

class FetchWallStreetNewsEvent extends NewsEvent {}
