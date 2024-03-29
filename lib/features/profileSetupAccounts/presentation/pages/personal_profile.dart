import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:camera/camera.dart';

class PersonalProfileTwo extends StatefulWidget {
  const PersonalProfileTwo({Key? key}) : super(key: key);

  @override
  State<PersonalProfileTwo> createState() => _PersonalProfileTwoState();
}

class _PersonalProfileTwoState extends State<PersonalProfileTwo> {
  String selectedCountryCode = '';
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Obtain a list of available cameras
    final cameras = await availableCameras();

    // Use the first camera in the list
    final firstCamera = cameras.first;

    // Initialize the camera controller with the selected camera
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    // Initialize the controller future
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the camera controller when not needed
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: AppBackButton(),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          //Text at the center Top
                          TextSemiBold(
                            "Fill Your Profile",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: SvgPicture.asset(AppAssets.user),
                                ),
                              ),
                              Positioned(
                                bottom: -30,
                                right: 0,
                                child: GestureDetector(
                                  // Inside your GestureDetector onTap handler for the edit icon
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200, // Adjust the height as needed
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                height: 4, // Height of the draggable handle
                                                width: 20, // Width of the draggable handle
                                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 130),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.9),
                                                  borderRadius: BorderRadius.circular(2),
                                                ),
                                              ),
                                              TextSemiBold(
                                                'Upload Image',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const Gap(20),
                                              // First Row
                                              ListTile(
                                                dense: true,
                                                leading: SvgPicture.asset(AppAssets.camera),
                                                title: Text('Take a picture'),
                                                onTap: () async {
                                                  // Ensure that the camera is initialized before opening it
                                                  await _initializeControllerFuture;

                                                  // Open the camera and wait for the user to take a picture
                                                  final XFile? picture = await _controller.takePicture();

                                                  // If the user took a picture, you can use it
                                                  if (picture != null) {
                                                    // TODO: Upload the picture and fill the container
                                                  }

                                                  // Close the bottom sheet
                                                  Navigator.pop(context);
                                                },
                                              ),

                                              // Second Row
                                              ListTile(
                                                dense: true,
                                                leading:  SvgPicture.asset(AppAssets.gallery),
                                                title: Text(
                                                    'Choose from Gallery',
                                                ),
                                                onTap: () {
                                                  // Handle upload from gallery action
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },


                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: SvgPicture.asset(AppAssets.edit),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Gap(20),
                      TextField(
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightBackground,
                          hintText: 'First Name',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always, // Display label text always
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        cursorColor: AppColors.primaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightBackground,
                          hintText: 'Last Name',

                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always, // Display label text
                        ),
                      ),
                      const Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Country Code Dropdown
                          GestureDetector(
                            onTap: (){
                              showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  countryListTheme: CountryListThemeData(
                                    flagSize: 25,
                                    backgroundColor: Colors.white,
                                    textStyle: const TextStyle(fontSize: 16, color: AppColors.textColor),
                                    bottomSheetHeight: MediaQuery.of(context).size.height * 0.9,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                    inputDecoration: InputDecoration(
                                      fillColor: AppColors.textFieldBackground,
                                      hintText: 'Search Country',
                                      suffix: SvgPicture.asset(
                                          AppAssets.search
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSelect: (Country country){
                                    setState(() {
                                      selectedCountryCode = country.phoneCode; // Update the selected country code
                                    });
                                  }
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.textFieldBackground,
                                border: Border.all(color: AppColors.textFieldBackground),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      TextSmall(
                                        selectedCountryCode == ''
                                            ? 'code'
                                            : "+$selectedCountryCode",
                                        fontWeight:FontWeight.w500,

                                      ),
                                      const Gap(5),
                                      const Icon(
                                          Icons.arrow_drop_down_outlined
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ),
                          const Gap(5),
                          const Expanded(
                            child: InputField(
                              placeholder: 'Phone Number',
                              textInputType: TextInputType.number,
                              controller: null,
                            ),
                          ),
                        ],
                      ),
                      //Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 00, 20, 8),
              child: BusyButton(
                title: 'Continue',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.securityVerificationTwo);
                },// Placeholder function for disabled state
                disabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
