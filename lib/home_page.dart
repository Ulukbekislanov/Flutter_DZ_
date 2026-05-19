import 'package:flutter/material.dart';
import 'package:flutter_application_1/cat_bloc/cat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CatBloc _catBloc = CatBloc();

  @override
  void initState() {
    _catBloc.add(GetRandommCatImageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: BlocBuilder<CatBloc, CatState>(
          bloc: _catBloc,
          builder: (context, state) {
            if (state is GetCatImageState){
              return Image.network(state.catImage);
            }
            if(state is ErrorCatImageState){
              return Text('Ошибка',style: TextStyle(color: Colors.red, fontSize: 50),);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { _catBloc.add(GetRandommCatImageEvent());
      },
      child: Icon(Icons.refresh),
),
    );
  }
}