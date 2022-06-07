import 'package:cocktails/cubit/cubit/cocktail_cubit.dart';
import 'package:cocktails/pages/cocktails_list_screen.dart';
import 'package:cocktails/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CocktailCubit>(
        create: (context) => CocktailCubit(
          data: DataService(),
        )..getData(),
        child: const CocktailsListScreen(),
      ),
    );
  }
}
