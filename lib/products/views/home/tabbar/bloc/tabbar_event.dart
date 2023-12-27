part of 'tabbar_bloc.dart';

sealed class TabbarEvent extends Equatable {
  const TabbarEvent({required this.tabIndex});
  final int tabIndex;
  @override
  List<Object> get props => [tabIndex];
}
class TabChange extends TabbarEvent{
  const TabChange({required super.tabIndex});
}