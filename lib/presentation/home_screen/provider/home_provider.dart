import 'package:family_wifi/core/network/result.dart';
import 'package:family_wifi/core/utils/alert_state_provider.dart';
import 'package:family_wifi/core/utils/base_bloc.dart';
import 'package:family_wifi/core/utils/loading_state_provider.dart';
import 'package:family_wifi/presentation/home_screen/bottom_bar_item.dart';
import 'package:family_wifi/presentation/home_screen/repository/home_repository.dart';
import 'package:flutter/widgets.dart';

class HomeProvider with BaseBloc {
  late final HomeRepository _repository;
  final PageController pageController = PageController(initialPage: 0);
  final ValueNotifier<BottomBarItem> selectedNavBarItem =
      ValueNotifier<BottomBarItem>(NAV_BOTTOM_BAR_ITEMS[0]);

  HomeProvider(
    LoadingStateProvider loadingStateProvider,
    AlertStateProvider alertStateProvider,
    this._repository,
  ) {
    initialize(loadingStateProvider, alertStateProvider);
  }

  void onNavBarItemSelected(index) {
    selectedNavBarItem.value = NAV_BOTTOM_BAR_ITEMS.firstWhere(
      (item) => item.index == index,
    );
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void init() {
    initialSubscribe();
  }

  Future<void> initialSubscribe() async {
    startLoading();

    try {
      Result result = await _repository.subscriber();

      dismissLoading();
      if (result.isSuccess) {
      } else {
        // showAlert(result.message, title: await 'login_failed'.tr());
      }
    } catch (error) {
      dismissLoading();
    }
  }
}
