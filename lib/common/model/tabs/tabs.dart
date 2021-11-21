import 'package:twitter_clone/common/common.dart';

class Tabs extends BaseModel {
  final AppTab? tab;

  Tabs({
    this.tab,
  }) : super({
          "tab": tab,
        });

  @override
  copyWith({
    AppTab? tab,
  }) {
    return Tabs(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object?> get props => [
        tab,
      ];
}
