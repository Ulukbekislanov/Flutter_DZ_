part of 'cat_bloc.dart';

sealed class CatState extends Equatable {
  const CatState();
  
  @override
  List<Object> get props => [];
}

final class CatInitial extends CatState {}

final class LoadingCatImageState extends CatState{}

final class ErrorCatImageState extends CatState{}

final class GetCatImageState extends CatState{
  GetCatImageState ({required this.catImage});

  final String catImage;
  @override
  // TODO: implement props
  List<Object> get props => [catImage];
}