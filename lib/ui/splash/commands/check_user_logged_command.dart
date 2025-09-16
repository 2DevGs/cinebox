import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../data/exceptions/data_exception.dart';
import '../../../data/repositories/repositories_providers.dart';

part 'check_user_logged_command.g.dart';

@riverpod
class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
      state = AsyncLoading();
    try {
      final authRepository = ref.read(authRepositoryProvider);
      final isLoggedResult = await authRepository.isLogged();
      state = switch(isLoggedResult) {
        Success(value: final isLogged) => AsyncData(isLogged),
        Failure(: final error) => AsyncError(error, StackTrace.current),
      };
    } on DioException catch (e, s) {
      log('Erro ao verificar o login, por favor conecte-se novamente', error: e, stackTrace: s);
      Failure(DataException(message: 'Erro ao verificar o login, por favor conecte-se novamente'));
      state = AsyncData(false);
    }
  }

}