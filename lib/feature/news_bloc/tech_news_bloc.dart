import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/business_news/business_news.dart';
import 'package:news_app/feature/news_bloc/news_state_event.dart';

class TechNewsBloc extends Bloc<NewsEvent,NewsState>{

  TechNewsBloc(super.initialState){
      on<NewsEvent>(handleNewsEvent);
  }


}

FutureOr<void> handleNewsEvent(NewsEvent event, Emitter<NewsState> emit) async{

  if(event is FetchTechNewsEvent){
    emit(NewLoadingState());
    try{
      var businessNews = await NetworkRequest().getBusinessNews();
      print("Tech News: ${businessNews}");
      emit(NewLoadedState(businessNews));
    }
    catch(e){
      
     print("Error : ${e.toString()}");
      emit(NewErrorState('An error occured while fetching the data'));
    }
  }
}