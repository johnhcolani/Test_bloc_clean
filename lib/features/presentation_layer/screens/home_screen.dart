import 'package:anywhere_variant_one/features/data_layer/data_source/remote/api_provider.dart';
import 'package:anywhere_variant_one/features/domain_layer/entity/simpsons_character_entity.dart';
import 'package:anywhere_variant_one/features/presentation_layer/bloc/simpsons_character_bloc.dart';
import 'package:anywhere_variant_one/features/presentation_layer/bloc/simpsons_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/color_manager.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiProvider apiProvider=ApiProvider();
  @override
  void initState() {
    BlocProvider.of<SimpsonsCharacterBloc>(context).add(LoadScEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SimpsonsCharacterEntity simpsonsCharacterEntity;
    return  Scaffold(
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SimpsonsCharacterBloc, SimpsonsCharacterState>(
                // buildWhen: (previous, current){
                //   if(previous.scStatus == current.scStatus){
                //     return false;
                //   }
                //   return true;
                // },
                builder:(context, state){
                  if(state.scStatus is ScLoading){
                    return const Center(child: Text(' Loading...',style: TextStyle(color: Colors.white,fontSize: 24),));
                  }
                  if(state.scStatus is ScCompleted){
                    return const Center(child: Text(' Completed...',style: TextStyle(color: Colors.white,fontSize: 24),));
                  }
                  if(state.scStatus is ScError){
                    return const Center(child: Text(' Error...',style: TextStyle(color: Colors.white,fontSize: 24),));
                  }
                  return Container();
                })
          ],
        )
      ),
    );
  }
}
