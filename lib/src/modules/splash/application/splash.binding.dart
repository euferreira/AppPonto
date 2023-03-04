import 'package:app_ponto/src/modules/auth/login/domain/iauth.usecase.dart';
import 'package:app_ponto/src/modules/auth/login/infra/datasource/auth.datasource.dart';
import 'package:get/get.dart';

import '../../../core/app.binding.dart';
import '../../auth/login/domain/usecase/auth.usecase.dart';
import '../../auth/login/infra/repository/auth.repository.dart';
import '../../auth/token/domain/itoken.usecase.dart';
import '../../auth/token/domain/usecase/token.usecase.dart';
import '../../auth/token/infra/datasource/token.datasource.dart';
import '../../auth/token/infra/repository/token.repository.dart';
import 'splash.controller.dart';

class SplashBinding extends Binding {
  @override
  void dependencies() {
    exports();

    Get.lazyPut(() => SplashController());
  }

  @override
  void exports() {
    Get.lazyPut<ITokenUsecase>(() {
      final datasource = TokenDatasource();
      final repository = TokenRepository(datasource);
      return TokenUsecase(repository);
    }, fenix: true);

    Get.lazyPut<IAuthUsecase>(() {
      final datasource = AuthDatasource();
      final repository = AuthRepository(dataSource: datasource);
      return AuthUsecase(repository: repository);
    }, fenix: true);
  }
}
