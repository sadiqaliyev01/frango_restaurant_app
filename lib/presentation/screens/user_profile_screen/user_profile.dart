import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_expansion_panel.dart';
import 'package:frango_restaurant_app/presentation/screens/user_profile_screen/widgets/custom_red_line.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage("assets/png/user_pp.png"))),
                ),
                const SizedBox(height: 10),
                const Text(
                  AppStrings.displayName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const Text(
                  AppStrings.phoneNumber,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                ),
                const Text(
                  AppStrings.displayEmail,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: AppColors.primaryBlack,
                ),
                const SizedBox(height: 20),
                const CustomExpansionPanel(
                  title: AppStrings.displayAddress,
                  leadingIcon: Icons.home,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.displayHomeAddress,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 11),
                        CustomRedLine(),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            AppStrings.displayUserHomeAddress,
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.displayOfficeAddress,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        CustomRedLine(),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            AppStrings.displayUserOfficeAddress,
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const CustomExpansionPanel(
                  title: AppStrings.displayOrderHistory,
                  leadingIcon: Icons.history,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order 1',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        CustomRedLine(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Order 2',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        CustomRedLine(),
                      ],
                    ),
                  ],
                ),
                const CustomExpansionPanel(
                  title: AppStrings.displayPayments,
                  leadingIcon: Icons.credit_card,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(width: 10),
                        CustomRedLine(),
                      ],
                    ),
                  ],
                ),
                const CustomExpansionPanel(
                  title: AppStrings.displayTableReserv,
                  leadingIcon: Icons.table_restaurant,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Reserv Info',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(width: 10),
                        CustomRedLine(),
                        SizedBox(width: 10),
                        Text(
                          '4 tables ',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'January 2, 2024',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                const CustomExpansionPanel(
                  title: AppStrings.displayFoodPlanner,
                  leadingIcon: Icons.fastfood,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                        ),
                        Text(
                          'Today',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          'This week',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          'Next week',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                const CustomExpansionPanel(
                  title: AppStrings.displayContactUs,
                  leadingIcon: Icons.phone,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                        ),
                        Text('Contact',
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
