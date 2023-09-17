import 'package:anywhere_variant_one/core/widgets/dot_loading.dart';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/entity/simpsons_character_entity.dart';
import '../bloc/simpsons_character_bloc.dart';
import '../bloc/simpsons_status.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    BlocProvider.of<SimpsonsCharacterBloc>(context).add(LoadScEvent());

    return SafeArea(
        child: Column(
      children: [


        BlocBuilder<SimpsonsCharacterBloc, SimpsonsCharacterState>(
            buildWhen: (previous, current) {
          if (previous.scStatus == current.scStatus) {
            return false;
          }
          return true;
        }, builder: (context, state) {
          if (state.scStatus is ScLoading) {
            return const Expanded(child: DotLoadingWWidget());
          }
          if (state.scStatus is ScCompleted) {
            final ScCompleted simCompleted = state.scStatus as ScCompleted;

            final SimpsonsCharacterEntity characterEntity =
                simCompleted.simpsonsCharacterEntity;

            print(characterEntity);
            return Expanded(
                child: ListView.builder(
              itemCount: characterEntity.relatedTopics!.length,
              itemBuilder: (context, index) {
                final url = characterEntity.relatedTopics![index].icon!.url;
                print('this is icon url $url');
                return Center(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(20.0), // Border radius
                        child: Card(
                          borderOnForeground: false,
                          shadowColor: Colors.white,
                          elevation: 20,
                          color: const Color(0xB3005b96),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 80,
                                width: 40,
                                child: url!.isNotEmpty
                                    ? Image.network(
                                        'https://duckduckgo.com$url')
                                    : const Icon(
                                        Icons.person,
                                        size: 32,
                                        color: Colors.white,
                                      ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  characterEntity.relatedTopics![index].text ??
                                      "",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ))
                            ],
                          ),
                        ),
                      )),
                );
              },
            ));
          }
          if (state.scStatus is ScError) {
            return const Center(
                child: Text(
              ' Error...',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ));
          }
          return Container();
        })
      ],
    ));
  }
}
