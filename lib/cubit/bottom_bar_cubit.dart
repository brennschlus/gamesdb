import 'package:bloc/bloc.dart';

class BottomBarCubit extends Cubit<int> {
  BottomBarCubit() : super(0);

  /// update index function to update the index onTap in BottomNavigationBar
  void updateIndex(int index) => emit(index);

  /// for navigation button on single page
  void getHome() => emit(0);
  void getSearch() => emit(1);
  void getFavorites() => emit(2);
}
