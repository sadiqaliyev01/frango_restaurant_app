sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeIndexChanged extends HomeState {
  final  currentIndex;

  HomeIndexChanged(this.currentIndex);
}

final class MenuCategoriesVisible extends HomeState {}

final class MenuCategoriesHidden extends HomeState {}
//
// final class HomeHorizontalIndexChanged extends HomeState {
//   final int currentHorizontalIndex;
//
//   HomeHorizontalIndexChanged(this.currentHorizontalIndex);
// }
