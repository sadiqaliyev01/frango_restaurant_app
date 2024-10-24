import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/home/home_state.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/burger_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/doner_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/doner_kombo_menyu_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_iskenderun_usulu_doner_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_izgara_kofte_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_izgara_kofte_menyu_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_pizza_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_tako_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/frango_tako_menyu_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/ickiler_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/lahmacun_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/kombo_menyu_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/qarnir_card.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/widgets/souslar_card.dart';

class AllProducts extends StatelessWidget {
  final ScrollController scrollController;

  const AllProducts({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
          controller: scrollController,
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
            IckilerCard(),
            FrangoIskenderunUsuluDonerCard(),
            QarnirCard(),
            SouslarCard(),
          ],
        );
      },
    );
  }
}
