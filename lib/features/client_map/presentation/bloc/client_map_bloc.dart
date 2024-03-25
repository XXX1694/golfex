import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_map_event.dart';
part 'client_map_state.dart';

class ClientMapBloc extends Bloc<ClientMapEvent, ClientMapState> {
  ClientMapBloc() : super(ClientMapInitial()) {
    on<ClientMapEvent>((event, emit) {});
  }
}
