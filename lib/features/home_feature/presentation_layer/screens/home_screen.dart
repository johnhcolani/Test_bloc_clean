import 'package:anywhere_variant_one/core/widgets/dot_loading.dart';
import 'package:anywhere_variant_one/features/home_feature/presentation_layer/widgets/bookmark_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchable_listview/searchable_listview.dart';
import '../../domain_layer/entity/simpsons_character_entity.dart';
import '../bloc/simpsons_character_bloc.dart';
import '../bloc/simpsons_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final List mySuggestion = [];
    print('This is my suggestion List :$mySuggestion');
    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    BlocProvider.of<SimpsonsCharacterBloc>(context).add(LoadScEvent());
setState(() {

});
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBar(),
        ),


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
mySuggestion.add(simCompleted.simpsonsCharacterEntity.relatedTopics);
            final SimpsonsCharacterEntity characterEntity =
                simCompleted.simpsonsCharacterEntity;


            return Expanded(
                child: ListView.builder(
              itemCount: characterEntity.relatedTopics!.length,
              itemBuilder: (context, index) {
                final url = characterEntity.relatedTopics![index].icon!.url;
                final pathUrl =
                    characterEntity.relatedTopics![index].firstURL! ?? "";
                final Uri uri = Uri.parse(pathUrl);
                final String name =
                    uri.pathSegments.isNotEmpty ? uri.pathSegments.last : "";
                final String content =
                    characterEntity.relatedTopics![index].text ?? "";
                final String image='https://duckduckgo.com$url';
                mySuggestion.add(characterEntity.relatedTopics![index].text ?? "");
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
                          //shadowColor: Colors.white,
                          elevation: 2,
                          //color: const Color(0xFF005b96),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 40,
                                    child: url!.isNotEmpty
                                        ? Image.network(image)
                                        : const Icon(
                                            Icons.person,
                                            size: 32,
                                            color: Colors.black,
                                          ),
                                  ),

                                  IconButton(onPressed: (){
                                    BookMarkIcon;

                                  },
                                    icon: Icon(Icons.star_border),


                                      ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        content,
                                        style:
                                            const TextStyle(color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
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
