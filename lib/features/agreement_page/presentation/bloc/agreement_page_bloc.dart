import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'agreement_page_event.dart';
part 'agreement_page_state.dart';

class AgreementPageBloc extends Bloc<AgreementPageEvent, AgreementPageState> {
  AgreementPageBloc() : super(AgreementPageInitial()) {
    on<AgreementPageEvent>((event, emit) {});
  }
}
