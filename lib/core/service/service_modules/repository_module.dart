import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/core/utils/local_data_source/data/repository/local_repository.dart';
import 'package:local_data_source/core/utils/local_data_source/domain/repository/i_local_repository.dart';
import 'package:local_data_source/feature/credential/data/repository/credential_repository.dart';
import 'package:local_data_source/feature/credential/domain/repository/i_credential_repository.dart';

Future<void> repositoryServices() async {
  localRepositoryProvider = Provider(
    (ref) => LocalRepository(ref),
  );
  credentialRepositoryProvider = Provider((ref) => CredentialRepository(ref));
}

late final Provider<ILocalRepository> localRepositoryProvider;
late final Provider<ICredentialRepository> credentialRepositoryProvider;
