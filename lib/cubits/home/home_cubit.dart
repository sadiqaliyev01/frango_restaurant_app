import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<int> categoryHeights = [
    222, // izqara kofte 1
    222, // izqara kofte menyu 1
    432, // tako 2
    620, // tako menyu 3
    1348, // doner 7
    432, // doner kombo menyu 2
    1168, // burger 6
    1534, // kombo menyu 8
    614, // lahmacun 3
    1718, // pizza 9
    2086, // ickiler 11
    1168, // iskenderun 6
    430, // qarnir 2
    1348 // souslar 7


// Kateqoriya başına düşən hündürlük
    // 1ci kateqoriyada 1 product var - 254 pixeldir
    // 2ci kateqoriyada da 1 product var - 254 pixeldir
    // 3cu kateqoriyada 2 product var - 462 pixeldir
    // her kateqoriyadaki 2ci ve novbeti prodcutlar ucun 254 + n*208 dusturunu isledeceyik
    // (n = 1 kateqoriyadaki productlarin sayindan 1 vahid azdir)
    // product sayi 4 ve ya daha cox olduqda dustur islemeye biler, bezen dusturda 208 yerin 190 yazanda isleyir
    // bunun ucun her defe kontrol etmek lazimdir
    // yeni kateqoriya elave olunduqda, yeni kateqoriyadaki productlarin sayina gore hundurluyu deyismeliyi
  ];

  List<int> verticalWidths = [
    220, // izqara kofte
    220, // izqara kofte menyu
    220, // tako
    220, // tako menyu
    180, // doner
    180,// doner kombo menyu
    180, // burger
    180, // kombo menyu
    180, // lahmacun
    180, // pizza
    250, // ickiler
    140, // iskenderun
    140, // qarnir
    100,   // souslar
  ];

  void changeIndex(int index) {
    emit(HomeIndexChanged(index));
  }

  double calculateScrollOffset(int selectedIndex) {
    double offset = 0.0;
    for (int i = 0; i < selectedIndex; i++) {
      offset += verticalWidths[i];
    }
    return offset;
  }

  double calculateScrollHeight(int selectedIndex) {
    double height = 0.0;
    for (int i = 0; i < selectedIndex; i++) {
      height += categoryHeights[i];  // Burada categoryHeights kullanılıyor
    }
    return height;
  }

  void jumpToIndex(int index, ScrollController controller) {
    final position = calculateScrollHeight(index);
    controller.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onVerticalScrollCurrentCategory(ScrollController controller) {
    double offset = controller.offset;
    double currentOffset = 0;
    for (int i = 0; i < categoryHeights.length; i++) {
      currentOffset += categoryHeights[i];
      if (offset < currentOffset) {
        emit(HomeIndexChanged(i));
        break;
      }
    }
  }
}