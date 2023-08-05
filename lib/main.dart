import 'package:anywhere_variant_one/features/presentation_layer/bloc/simpsons_character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/presentation_layer/screens/home_screen.dart';
import 'locator.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MultiBlocProvider(
       providers: [
         BlocProvider(create: (_)=>locator<SimpsonsCharacterBloc>()),
       ],
        child: HomeScreen(),
      ),
    );
  }
}
