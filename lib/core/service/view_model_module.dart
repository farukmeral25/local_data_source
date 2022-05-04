import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_data_source/feature/credential/viewmodel/credential_view_model.dart';
import 'package:local_data_source/feature/splash/viewmodel/splash_view_model.dart';

Future<void> viewModelServices() async {
  splashViewModelProvider = Provider.autoDispose((ref) => SplashViewModel(ref));
  credentialViewModelProvider =
      Provider.autoDispose((ref) => CredentialViewModel(ref));
}

late final AutoDisposeProvider<SplashViewModel> splashViewModelProvider;
late final AutoDisposeProvider<CredentialViewModel> credentialViewModelProvider;
