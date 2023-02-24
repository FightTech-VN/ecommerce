import 'dart:async';

import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/usecase/product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductUsecase _productUsecase;

  HomeBloc(
    this._productUsecase,
  ) : super(InitHome()) {
    on<LoadListProductEvent>(_onLoadListProductEvent);
  }

  FutureOr<void> _onLoadListProductEvent(
      LoadListProductEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const LoadingDataHome());
      final listProduct = await _productUsecase.getListProduct();
      emit(LoadHomeSuccess(products: listProduct));
    } catch (e) {
      emit(LoadHomeFailed(e.toString()));
    }
  }
}
