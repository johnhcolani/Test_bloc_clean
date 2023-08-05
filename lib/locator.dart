
import 'package:anywhere_variant_one/features/data_layer/data_source/remote/api_provider.dart';
import 'package:anywhere_variant_one/features/domain_layer/repository/simpsons_character_repository.dart';
import 'package:anywhere_variant_one/features/domain_layer/usecase/simpsons_character_usecase.dart';
import 'package:anywhere_variant_one/features/presentation_layer/bloc/simpsons_character_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/data_layer/repository/simpsons_character_repositoryImpl.dart';

GetIt locator = GetIt.instance;
setup()async{
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<SimpsonsCharacterRepository>(SimpsonsCharacterRepositoryImpl(locator()));
  locator.registerSingleton<GetSimpsonsCharacterUseCase>(GetSimpsonsCharacterUseCase(locator()));
  locator.registerSingleton<SimpsonsCharacterBloc>(SimpsonsCharacterBloc(locator()));
}