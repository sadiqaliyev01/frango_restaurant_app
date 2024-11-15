import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/screens/contact_us_screen/widgets/social_media_contact.dart';
import 'package:frango_restaurant_app/presentation/screens/contact_us_screen/widgets/custom_contact_widget.dart';
import 'package:frango_restaurant_app/presentation/screens/contact_us_screen/widgets/rectangle_contact_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.primaryYellow),
        ),
        titleSpacing: 95,
        title: const Text(
          AppStrings.displayContactUs,
          style: TextStyle(color: AppColors.lightGray),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 25, top: 10),
            child: Text(
              AppStrings.contactUsTitleText,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: AppColors.primaryYellow.withOpacity(0.7),
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              CustomContactWidget(
                icon: Icons.phone,
                text: AppStrings.frangoCallUsText,
                onTap: () {
                  SocialMediaContact.makePhoneCall("+994516899925");
                },
              ),
              const Spacer(),
              CustomContactWidget(
                icon: Icons.email,
                text: AppStrings.frangoEmailText,
                onTap: () {
                  SocialMediaContact.sendEmail(
                    "frangobaku@gmail.com",
                    AppStrings.contactUsEmailContext,
                    AppStrings.conttactUsEmailMessage,
                  );
                },
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          RectangleContactWidget(
            iconLeading: FontAwesomeIcons.locationArrow,
            text: AppStrings.frangoAddressDisplayText,
            iconTrailing: Icons.arrow_forward_ios,
            onTap: () {
              SocialMediaContact.openLocationInMaps();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          RectangleContactWidget(
            iconLeading: FontAwesomeIcons.instagram,
            text: AppStrings.followFrangoInstagram,
            iconTrailing: Icons.arrow_forward_ios,
            onTap: () {
              SocialMediaContact.openInstagram();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          RectangleContactWidget(
            iconLeading: FontAwesomeIcons.tiktok,
            text: AppStrings.followFrangoTikTok,
            iconTrailing: Icons.arrow_forward_ios,
            onTap: () {
              SocialMediaContact.openTikTok();
            },
          )
        ],
      ),
    ));
  }
}
