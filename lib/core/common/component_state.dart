import 'package:equatable/equatable.dart';

sealed class ComponentState<T>{}

class InitialState<T> extends ComponentState<T> with EquatableMixin {
  @override
  List<Object?> get props => [];
}
class LoadingState<T> extends ComponentState<T> with EquatableMixin{
  @override
  List<Object?> get props => [];
}
class ErrorState<T> extends ComponentState<T>{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState<T> extends ComponentState<T> with EquatableMixin{
  T data;
  SuccessState(this.data);
  @override
  List<Object?> get props => [data];
}