part of 'cat_bloc.dart';

sealed class CatEvent extends Equatable {
  const CatEvent();

}
 
 final class GetRandommCatImageEvent extends CatEvent {
  @override
  List<Object?> get props => throw UnimplementedError();

 }