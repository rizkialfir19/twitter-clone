import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/common/common.dart';

/// Cubit for handling tab interaction
///
/// We can add more logic as the user tap the tab
class TabCubit extends Cubit<Tabs> {
  TabCubit() : super(Tabs(tab: AppTab.home));

  /// Change tab
  void changeTab({
    required AppTab tab,
  }) {
    emit(Tabs(
      tab: tab,
    ));
  }
}
