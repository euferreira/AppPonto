import 'package:app_ponto/src/core/app.binding.dart';
import 'package:app_ponto/src/modules/auth/token/domain/itoken.usecase.dart';
import 'package:get/get.dart';

import '../../ponto/domain/iponto.usecase.dart';
import '../../ponto/domain/usecase/ponto.usecase.dart';
import '../../ponto/infra/datasource/ponto.dio.datasource.dart';
import '../../ponto/infra/datasource/ponto.hive.datasource.dart';
import '../../ponto/infra/repository/ponto.repository.dart';
import 'home.controller.dart';

class HomeBinding extends Binding {
  @override
  void dependencies() {
    exports();

    Get.lazyPut<HomeController>(
      () => HomeController(
        tokenUsecase: Get.find<ITokenUsecase>(),
        pontoUsecase: Get.find<IPontoUsecase>(),
      ),
    );
  }

  @override
  void exports() {
    Get.lazyPut<IPontoUsecase>(() {
      final dioDatasource = PontoDioDatasource();
      final hiveDatasource = PontoHiveDatasource();
      final repository = PontoRepository(
        dioDatasource: dioDatasource,
        hiveDatasource: hiveDatasource,
      );
      return PontoUsecase(repository);
    });
  }
}
