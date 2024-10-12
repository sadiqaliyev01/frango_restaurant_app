import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/burger_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/doner_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/doner_kombo_menyu_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_iskenderun_usulu_doner_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_izgara_kofte_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_izgara_kofte_menyu_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_pizza_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_tako_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_tako_menyu_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/lahmacun_card.dart';

import '../../../../cubits/home/home_state.dart';
import 'kombo_menyu_card.dart';
import 'qarnir_card.dart';
import 'souslar_card.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // List<MenuCategoriesData> menuCategories = MenuCategoriesData.getCategories;
    //
    // final ScrollController verticalScrollController = ScrollController();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        int selectedIndex = 0;
        if (state is HomeIndexChanged) {
          selectedIndex = state.currentIndex;
        }
        return ListView(
          // controller: verticalScrollController,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: const [
            FrangoIzgaraKofteCard(),
            FrangoIzgaraKofteMenyuCard(),
            FrangoTakoCard(),
            FrangoTakoMenyuCard(),
            DonerCard(),
            DonerKomboMenyuCard(),
            BurgerCard(),
            KomboMenyuCard(),
            LahmacunCard(),
            FrangoPizzaCard(),
            FrangoIskenderunUsuluDonerCard(),
            QarnirCard(),
            SouslarCard(),
          ],
        );
      },
    );
  }
}
