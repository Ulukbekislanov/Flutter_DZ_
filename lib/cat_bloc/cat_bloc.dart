import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/api_service.dart';
part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final ApiService apiService =ApiService();
  CatBloc() :  super(CatInitial()) {
    on<GetRandommCatImageEvent>((event, emit) async {
      try{
emit(LoadingCatImageState());
      final String img = await apiService.getCatImage();
      emit(GetCatImageState(catImage: img));
      }catch(e){
        print(e);
        emit(ErrorCatImageState());
      }
      
    });
  }
}