part of 'home_bloc.dart';

@immutable
class HomeState {
  final List<Product>? products;

  const HomeState({this.products});
}

@immutable
class InitHome extends HomeState {}

@immutable
class LoadingDataHome extends HomeState {
  const LoadingDataHome({super.products});
}

@immutable
class LoadHomeSuccess extends HomeState {
  const LoadHomeSuccess({super.products});
}

@immutable
class LoadHomeFailed extends HomeState {
  final String message;

  const LoadHomeFailed(this.message, {super.products});
}
