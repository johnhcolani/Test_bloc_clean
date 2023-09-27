
import 'package:anywhere_variant_one/features/bookmark_feature/domain/entity/character_entity.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/presentation_layer/bloc/get_simpsons_status.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/presentation_layer/bloc/save_simpsons_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bookmark_feature/presentation_layer/bloc/bookmark_bloc.dart';



class BookMarkIcon extends StatelessWidget {
  final String name;

  const BookMarkIcon({super.key, required this.name});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<BookmarkBloc,BookmarkState>(
        buildWhen: (previous, current){
          /// if state don't change => don't rebuild UI
          if(current.getSimpsonsStatus == previous.getSimpsonsStatus){
            return false;
          }
          return true;
        },
        builder: (context, state){
          /// initial save Bloc
          BlocProvider.of<BookmarkBloc>(context).add(SaveSimpsonsInitialEvent());

          /// show Loading for CityStatus
          if(state.getSimpsonsStatus is GetSimpsonsLoading){
            return const CircularProgressIndicator();
          }

          /// show completed for CityStatus
          if(state.getSimpsonsStatus is GetSimpsonsCompleted){

            /// casting for Getting city
            final GetSimpsonsCompleted getSimpsonsCompleted = state.getSimpsonsStatus as GetSimpsonsCompleted;
            final Simpsons? simpsons = getSimpsonsCompleted.simpsons;

            return BlocConsumer<BookmarkBloc, BookmarkState>(
              listenWhen: (previous, current){
                /// if state don't change => don't listen to changes
                if(current.saveSimpsonStatus == previous.saveSimpsonStatus){
                  return false;
                }
                return true;
              },
              buildWhen: (previous, current){
                /// if state don't change => don't rebuild UI
                if(current.saveSimpsonStatus == previous.saveSimpsonStatus){
                  return false;
                }
                return true;
              },
              listener: (context, simpsonState) {

                /// show Error as SnackBar
                if (simpsonState.saveSimpsonStatus is SaveSimpsonsError) {
                  /// cast for getting Error
                  final SaveSimpsonsError saveSimpsonsError = simpsonState.saveSimpsonStatus as SaveSimpsonsError;

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(saveSimpsonsError.message!),
                    behavior: SnackBarBehavior.floating, // Add this line
                  ),);
                }

                /// show Success SnackBar
                if (simpsonState.saveSimpsonStatus is SaveSimpsonsCompleted) {
                  /// cast for getting Data
                  final SaveSimpsonsCompleted saveSimpsonsCompleted = simpsonState.saveSimpsonStatus as SaveSimpsonsCompleted;

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${saveSimpsonsCompleted.simpsons.name} Added to Bookmark"),
                    behavior: SnackBarBehavior.floating, // Add this line
                  ),);
                }
              },
              builder: (context, simpsonsState) {

                /// show UI for initial SaveCity
                if(simpsonsState.saveSimpsonStatus is SaveSimpsonsInitial){
                  return IconButton(
                      onPressed: () {
                        /// call event for save Current City in Database
                        BlocProvider.of<BookmarkBloc>(context).add(SaveSimpsonsEvent(name));
                      },
                      icon: Icon(simpsons == null ? Icons.star_border : Icons.star, color: Colors.white, size: height * 0.04,),);
                }

                /// show UI for Loading SaveCity
                if (simpsonsState.saveSimpsonStatus is SaveSimpsonsLoading) {
                  return const CircularProgressIndicator();
                }

                /// show UI for Completed or Error SaveCity
                return IconButton(
                    onPressed: () {
                      /// call event for save Current City in Database
                      BlocProvider.of<BookmarkBloc>(context).add(SaveSimpsonsEvent(name));
                    },
                    icon: const Icon(Icons.star, color: Colors.white, size: 35,),);

              },
            );
          }

          /// show Error for CityStatus
          if(state.getSimpsonsStatus is GetSimpsonsError){
            return IconButton(
                onPressed: (){
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Text("please load a city!"),
                  //   behavior: SnackBarBehavior.floating, // Add this line
                  // ));
                },
                icon: const Icon(Icons.error,color: Colors.white,size: 35),);
          }

          /// default value
          return Container();
        },
    );
  }
}
