import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/features/order_info/data/repositories/order_info_repository.dart';

part 'order_info_event.dart';
part 'order_info_state.dart';

class OrderInfoBloc extends Bloc<OrderInfoEvent, OrderInfoState> {
  final OrderInfoRepository repo;

  OrderInfoBloc({
    required this.repo,
    required OrderInfoState orderInfoState,
  }) : super(OrderInfoInitial()) {
    on<GetInfo>(
      (event, emit) async {
        emit(InfoGetting());
        try {
          final res = await repo.getInfo(trackingNumber: event.trackin_number);
          if (res != null) {
            emit(InfoGot(orderModel: res));
          } else {
            emit(InfoGetError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(InfoGetError());
        }
      },
    );
    on<Delete>(
      (event, emit) async {
        try {
          await repo.delete(trackingNumber: event.trackin_number);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      },
    );
  }
}
