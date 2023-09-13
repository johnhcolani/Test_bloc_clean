import 'package:anywhere_variant_one/core/widgets/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home_feature/presentation_layer/bloc/simpsons_character_bloc.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
       providers: [
         BlocProvider(create: (_)=>locator<SimpsonsCharacterBloc>()),
       ],
        child:  MainWrapper(),
      ),
    );
  }
}
