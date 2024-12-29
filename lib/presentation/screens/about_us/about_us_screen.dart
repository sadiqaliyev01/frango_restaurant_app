import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/about_us/about_us_cubit.dart';
import 'package:frango_restaurant_app/cubits/about_us/about_us_state.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

/*
  bu screen bizimle elaqe sehifesinde olacaq. haqqimizda hissesinde restoranin
  ozu haqqinda melumatlar olacaq(tarixi, filiallari, iscileri ve s.)
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Haqqımızda')),
      body: BlocBuilder<AboutUsCubit, AboutUsState>(
        builder: (context, state) {
          if (state is AboutUsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AboutUsSuccess) {
            final aboutUs = state.aboutUs;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text('Address: ${aboutUs.address}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text('Phone: ${aboutUs.number}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text('Email: ${aboutUs.email}',
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            );
          } else if (state is AboutUsFailure) {
            return const Center(child: Text("Haqqımızda ekranı hatası"));
          } else {
            return const Center(child: Text("Bilinmeyen bir durum"));
          }
        },
      ),
    );
  }
}
