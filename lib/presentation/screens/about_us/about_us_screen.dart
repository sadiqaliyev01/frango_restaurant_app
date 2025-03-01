import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLightMode ? AppColors.white : AppColors.primaryBlack,
      appBar: AppBar(
        backgroundColor: isLightMode ? AppColors.white : AppColors.primaryBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
              color: isLightMode
                  ? AppColors.primaryBlack
                  : AppColors.primaryYellow),
        ),
        titleSpacing: 100,
        title: Text(
          AppStrings.aboutUsText,
          style: TextStyle(
            color: isLightMode ? AppColors.black : AppColors.lightGray,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              'assets/png/frango_logo.png',
              height: 120,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: AppColors.primaryYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.aboutUsText,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '“Dönər sousla yeyilir” devizi ilə bu yola çıxdıq və bir ili tamamlamadan artıq müştərilərimiz tərəfindən sevildik. Müştərilərimiz həm üz-üzə, həm də virtual olaraq Franqo Döneri nə qədər çox sevdiklərini vaxtaşırı ifadə edirlər. Biz bu işi sevirik. Müştərilərimizin xoşbəxt olması bizi də sevindirir. Ötən gün Facebook səhifəmizdə bizə göndərilən bir mesajı sizinlə bölüşmək istərdik. Bu mesajı bizə göndərən şəxsin adı məxfi saxlanılacaq, lakin bunun kimi onlarla mesajın bizə çatmağa davam edəcəyini bilirik. Mesaj budur: Əziz Franqo. Mən sadəcə yemək arabasından sifariş vermişəm. Amma qeyd yaza bilmədim. Çünki qeyd yazanda sifarişim keçmədi. Mən səni qeydsiz buraxmaq istəmirdim. Bax, yay gəlir. Sizcə mən bir qədər kökəlmişəm? Amma hər halda, sən də məni belə sevirsən, hə? Deyirəm ki, yox, pəhriz dönəri mümkün deyil, amma nə edək? İdmanla məşğul olsam yaxşı olar. Mən səni sevirəm, şadam ki, varsan Frango. Təşəkkürlər!',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
