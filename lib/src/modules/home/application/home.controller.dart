import 'package:app_ponto/src/modules/home/application/component/delete.registro.bottomsheet.component.dart';
import 'package:app_ponto/src/shared/constants.dart';
import 'package:app_ponto/src/shared/utils/datetime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/token/domain/itoken.usecase.dart';
import '../../ponto/domain/entity/ponto.entity.dart';
import '../../ponto/domain/entity/ponto.enum.dart';
import '../../ponto/domain/iponto.usecase.dart';
import 'component/edit.registro.bottomsheet.component.dart';

class HomeController extends GetxController {
  final ITokenUsecase tokenUsecase;
  final IPontoUsecase pontoUsecase;

  HomeController({
    required this.tokenUsecase,
    required this.pontoUsecase,
  });

  Rx<DateTime> dataSelecionada = DateTime.now().obs;
  Rxn<PontoEntity> ponto = Rxn<PontoEntity>();

  RxString headerText = RxString('');
  RxBool loadingList = false.obs;
  RxBool isLogged = false.obs;
  RxBool isFeriado = false.obs;
  RxBool isFolga = false.obs;

  TextEditingController timeController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await _initData();
  }

  Future<void> _initData() async {
    Future<void> initHeader() async {
      final token = await tokenUsecase.getToken();
      token.fold((l) => headerText.value = 'Marque seu ponto!', (r) {
        headerText.value = 'Olá, ${r.user}!';
        isLogged.value = true;
      });
    }

    await initHeader();
    await loadList();
  }

  void onEdit(PontoType type) {
    EditRegistroBottomsheet(type: type).show().then((value) {
      if (value != null) {}
    });
  }

  void deletePonto(PontoType type) {
    DeleteRegistroBottomsheet(type: type).show().then((value) {
      if (value != null) {}
    });
  }

  void openCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: dataSelecionada.value,
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) async {
      if (value != null) {
        dataSelecionada.value = value;
        loadList();
      }
    });
  }

  String get verifyDate {
    if (dataSelecionada.value.isSameDay(DateTime.now())) {
      return "Hoje";
    }
    return dataSelecionada.value.format(formato: 'dd/MM/yy');
  }

  Future<void> loadList() async {
    loadingList.value = true;
    final ponto = await pontoUsecase.getPonto(PontoParam(
      data: dataSelecionada.value,
      isLogged: isLogged.isTrue,
    ));
    ponto.fold((l) => this.ponto.value = PontoEntity(), (r) => this.ponto.value = r);
    loadingList.value = false;
  }

  Future<void> savePonto({bool isDelete = false}) async {
    loadingList.value = true;
    bool validate = this.ponto.value!.validateByType(isDelete: isDelete);
    if (!validate) {
      loadingList.value = false;
      Alerts.showError(message: 'Horário inválido!');
      return;
    }

    final ponto = await pontoUsecase.savePonto(PontoParam(
      data: dataSelecionada.value,
      isLogged: isLogged.isTrue,
      ponto: this.ponto.value,
    ));
    ponto.fold((l) => this.ponto.value = PontoEntity(), (r) async {
      this.ponto.value = r;
      Get.back();
      Alerts.showSuccess(message: 'Ponto ${isDelete ? "excluido" : "salvo"} com sucesso!');
      this.ponto.value = this.ponto.value?.makeSuggestions();
    });
    loadingList.value = false;
  }

  Future<void> deleteRegistro(PontoType type) async {
    switch (type) {
      case PontoType.entrada1:
        ponto.value?.entrada1 = null;
        break;
      case PontoType.saida1:
        ponto.value?.saida1 = null;
        break;
      case PontoType.entrada2:
        ponto.value?.entrada2 = null;
        break;
      case PontoType.saida2:
        ponto.value?.saida2 = null;
        break;
      default:
    }
    ponto.value?.sugestaoInicioAlmoco = null;
    ponto.value?.sugestaoFimAlmoco = null;
    ponto.value?.sugestaoFimJornada = null;
    await savePonto(isDelete: true);
  }
}
