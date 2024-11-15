import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/widgets/custom_section_divider.dart';
import 'package:frango_restaurant_app/presentation/screens/settings_screen/widgets/edit_profile_text_form.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final _formKey = GlobalKey<FormState>();

  String? username = "";
  String? email = "";
  String? phone = "";
  String? homeAddress = "";
  String? officeAddress = "";
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: AppColors.primaryYellow),
          ),
          titleSpacing: 95,
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: AppColors.lightGray),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!) as ImageProvider
                            : const AssetImage("assets/png/user_pp.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: _pickProfileImage,
                          icon:
                              const Icon(Icons.camera_alt, color: Colors.white),
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  validator: (value) =>
                      value!.length == 10 ? null : 'Enter a valid phone number',
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
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
