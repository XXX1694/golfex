import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_article_event.dart';
part 'main_article_state.dart';

class MainArticleBloc extends Bloc<MainArticleEvent, MainArticleState> {
  MainArticleBloc() : super(MainArticleInitial()) {
    on<MainArticleEvent>((event, emit) {});
  }
}
