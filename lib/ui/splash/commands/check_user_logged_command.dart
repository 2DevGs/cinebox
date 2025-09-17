import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../data/repositories/repositories_providers.dart';

part 'check_user_logged_command.g.dart';

@riverpod
class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
      state = AsyncLoading();
      final authRepository = ref.read(authRepositoryProvider);
      final isLoggedResult = await authRepository.isLogged();
      state = switch(isLoggedResult) {
        Success(value: final isLogged) => AsyncData(isLogged),
        Failure(: final error) => AsyncError(error, StackTrace.current),
      };
  }

}