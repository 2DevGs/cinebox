import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/rest_client/backend_rest_client_provider.dart';
import '../core/rest_client/tmdb_rest_client_provider.dart';
import 'auth/auth_service.dart';
import 'google_signin/google_signin_service.dart';
import 'google_signin/google_signin_service_impl.dart';
import 'local_storage/local_storage_service.dart';
import 'local_storage/local_storage_service_impl.dart';
import 'movies/movies_service.dart';
import 'tmdb/tmdb_service.dart';

part 'services_providers.g.dart';

@riverpod
GoogleSigninService googleSignInService(Ref ref) {
  return GoogleSigninServiceImpl();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(flutterSecureStorage: FlutterSecureStorage());
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.read(backendRestClientProvider));
}

@riverpod
TmdbService tmdbService(Ref ref) {
  return TmdbService(ref.read(tmdbRestClientProvider));
}

@riverpod
MoviesService moviesService(Ref ref) {
  return MoviesService(ref.read(backendRestClientProvider));
}