import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/news_bloc/news_state_event.dart';
import 'package:news_app/feature/news_bloc/tech_news_bloc.dart';

class TechNewsBlocPage extends StatefulWidget {
  TechNewsBlocPage ({Key? key}) : super(key: key);

  @override
  State<TechNewsBlocPage> createState() => _TechNewsBlocPageState();
}

class _TechNewsBlocPageState extends State<TechNewsBlocPage> {
  late TechNewsBloc _newsBloc;
  @override
  void initState() {
    super.initState();
    _newsBloc = BlocProvider.of<TechNewsBloc>(context);
    _newsBloc.add(FetchTechNewsEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _newsBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        _newsBloc.add(FetchTechNewsEvent());
    },
      child: Scaffold(
        body: BlocBuilder<TechNewsBloc, NewsState>(
            builder: (context, state) {
              if(state is NewLoadingState){
                return Center(
                    child: CircularProgressIndicator(),);
              }
              else if( state is NewLoadedState){
                return ListView.separated(
                  // physics: NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.newsList?.length ?? 0,
                  itemBuilder: (context, index) {
                    var news = state.newsList?[index];

                      return

                        // padding:  widget.setPadding? const EdgeInsets.all(8.0):const EdgeInsets.all(0.0),
                         GestureDetector(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: [
                                  Text(news?.title??''),

                                ],
                              ),
                            ),
                          ),

                      );



                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                );
              }
              else if( state is NewErrorState){
                return Center(
                  child: Text('Error : ${state.errorMessage}'),
                );
              }
              else{
                return const Center(
                  child: Text('Unknown State'),
                );
              }
            },),
      ),
    );
  }
}
