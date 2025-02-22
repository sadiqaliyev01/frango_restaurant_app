import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/widgets/profile_photo.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/widgets/custom_section_divider.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/widgets/edit_profile_text_form.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final _formKey = GlobalKey<FormState>();

  String? username = "";
  String? email = "";
  String? phone = "";
  String? homeAddress = "";
  String? officeAddress = "";

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.successMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppColors.primaryYellow : AppColors.black;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDark ? AppColors.primaryYellow : AppColors.black,
            ),
          ),
          titleSpacing: 95,
          title: Text(
            'Edit Profile',
            style: TextStyle(
              color: isDark ? AppColors.lightGray : AppColors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfilePhoto(),
                  const SizedBox(height: 40),
                  EditProfileTextForm(
                    labelText: 'Username',
                    initialValue: username,
                    validator: (value) =>
                        value!.isEmpty ? 'Username cannot be empty' : null,
                    onSaved: (value) => username = value,
                  ),
                  const SizedBox(height: 20),
                  EditProfileTextForm(
                    labelText: 'Email',
                    initialValue: email,
                    validator: (value) =>
                        value!.contains('@') ? null : 'Enter a valid email',
                    onSaved: (value) => email = value,
                  ),
                  const SizedBox(height: 20),
                  EditProfileTextForm(
                    labelText: 'Phone Number',
                    initialValue: phone,
                    validator: (value) => value!.length == 10
                        ? null
                        : 'Enter a valid phone number',
                    onSaved: (value) => phone = value,
                  ),
                  const SizedBox(height: 20),
                  const CustomSectionDivider(title: 'Address Info'),
                  const SizedBox(height: 20),
                  EditProfileTextForm(
                    labelText: 'Home Address',
                    initialValue: homeAddress,
                    onSaved: (value) => homeAddress = value,
                  ),
                  const SizedBox(height: 20),
                  EditProfileTextForm(
                    labelText: 'Office Address',
                    initialValue: officeAddress,
                    onSaved: (value) => officeAddress = value,
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryYellow,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
