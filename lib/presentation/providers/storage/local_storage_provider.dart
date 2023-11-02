import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repositories/local_storage_repository.dart';
import '../../../infraestructure/datasources/isar_datasource.dart';
import '../../../infraestructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider<LocalStorageRepository>((ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
});
