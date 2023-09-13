

import 'package:get_it/get_it.dart';

import 'features/home_feature/data_layer/data_source/remote/api_provider.dart';
import 'features/home_feature/data_layer/repository/simpsons_character_repositoryImpl.dart';
import 'features/home_feature/domain_layer/repository/simpsons_character_repository.dart';
import 'features/home_feature/domain_layer/usecase/simpsons_character_usecase.dart';
import 'features/home_feature/presentation_layer/bloc/simpsons_character_bloc.dart';

GetIt locator = GetIt.instance;
setup()async{
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<SimpsonsCharacterRepository>(SimpsonsCharacterRepositoryImpl(locator()));
  locator.registerSingleton<GetSimpsonsCharacterUseCase>(GetSimpsonsCharacterUseCase(locator()));
  locator.registerSingleton<SimpsonsCharacterBloc>(SimpsonsCharacterBloc(locator()));
}