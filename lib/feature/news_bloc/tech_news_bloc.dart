import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/business_news/business_news_model.dart';

import 'package:news_app/feature/news_bloc/news_state_event.dart';

class TechNewsBloc extends Bloc<NewsEvent, NewsState> {
  TechNewsBloc(super.initialState) {
    on<NewsEvent>(handleNewsEvent);
  }
}

Future<void> handleNewsEvent(NewsEvent event, Emitter<NewsState> emit) async {
  if (event is FetchTechNewsEvent) {
    emit(NewLoadingState());
    try {
      var businessNews = await NetworkRequest.getTechCrunchNews();

      emit(NewLoadedState(businessNews?.cast<Articles>()));
    } catch (e) {
      print("Error : ${e.toString()}");
      emit(NewErrorState('An error occured while fetching the data'));
    }
  } else if (event is FetchWallStreetNewsEvent) {
    emit(NewLoadingState());
    try {
      var wallStreetNews = await NetworkRequest.getWallStreetNews();
      // print("Tech News: ${businessNews}");
      emit(NewLoadedState(wallStreetNews?.cast<Articles>()));
    } catch (e) {
      print("Error : ${e.toString()}");
      emit(NewErrorState('An error occured while fetching the data'));
    }
  } else if (event is FetchBusinessNewsEvent) {
    emit(NewLoadingState());
    try {
      var businessNews = await NetworkRequest.getBusinessNews();
      // print("Tech News: ${businessNews}");
      emit(NewLoadedState(businessNews?.cast<Articles>()));
    } catch (e) {
      print("Error : ${e.toString()}");
      emit(NewErrorState('An error occured while fetching the data'));
    }
  }
}
