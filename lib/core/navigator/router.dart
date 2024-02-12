import 'package:flutter/material.dart';
import 'package:shipoka/core/navigator/route_extentions.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/account/presentation/pages/add_new_card.dart';
import 'package:shipoka/features/account/presentation/pages/card_otp_verification.dart';
import 'package:shipoka/features/account/presentation/pages/manage_card.dart';
import 'package:shipoka/features/account/presentation/pages/my_account.dart';
import 'package:shipoka/features/account/presentation/pages/payment/currency.dart';
import 'package:shipoka/features/account/presentation/pages/payment/fund_payment.dart';
import 'package:shipoka/features/account/presentation/pages/payment/fund_wallet.dart';
import 'package:shipoka/features/account/presentation/pages/payment/payment.dart';
import 'package:shipoka/features/account/presentation/pages/payment/payment_method.dart';
import 'package:shipoka/features/account/presentation/pages/payment/shipoka_pin.dart';
import 'package:shipoka/features/auth/presentation/pages/add_person.dart';
import 'package:shipoka/features/auth/presentation/pages/business_profile.dart';
import 'package:shipoka/features/auth/presentation/pages/change_number.dart';
import 'package:shipoka/features/auth/presentation/pages/get_otp.dart';
import 'package:shipoka/features/auth/presentation/pages/login.dart';
import 'package:shipoka/features/auth/presentation/pages/otp_verification.dart';
import 'package:shipoka/features/auth/presentation/pages/personal_profile.dart';
import 'package:shipoka/features/auth/presentation/pages/setup_profile.dart';
import 'package:shipoka/features/auth/presentation/pages/signup.dart';
import 'package:shipoka/features/auth/presentation/pages/verify_email.dart';
import 'package:shipoka/features/home/presentation/pages/home_navbar.dart';
import 'package:shipoka/features/home/presentation/pages/home_screen.dart';
import 'package:shipoka/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:shipoka/features/shipment/presentation/pages/check_out.dart';
import 'package:shipoka/features/shipment/presentation/pages/create_shipment.dart';
import 'package:shipoka/features/shipment/presentation/pages/destination_details.dart';
import 'package:shipoka/features/shipment/presentation/pages/destination_list.dart';
import 'package:shipoka/features/shipment/presentation/pages/multi_package_details.dart';
import 'package:shipoka/features/shipment/presentation/pages/package_detail.dart';
import 'package:shipoka/features/shipment/presentation/pages/receiver_information.dart';
import 'package:shipoka/features/shipment/presentation/pages/schedule_success.dart';
import 'package:shipoka/features/shipment/presentation/pages/sender_information.dart';
import 'package:shipoka/features/shipment/presentation/pages/vehicle_details.dart';
import 'package:shipoka/features/track/presentation/pages/package_return.dart';
import 'package:shipoka/features/track/presentation/pages/shipment_complete.dart';
import 'package:shipoka/features/track/presentation/pages/trach_overview.dart';
import 'package:shipoka/features/track/presentation/pages/track_shipment.dart';
import 'package:shipoka/features/track/presentation/pages/view_package.dart';



Route<T> onGenerateRoute<T>(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splashScreen:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashScreen(),
      );
    case RouteName.signUp:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Signup(),
      );
    case RouteName.setupProfile:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SetupProfile(),
      );
    case RouteName.personalProfile:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const PersonalProfile(),
      );
    case RouteName.getOTP:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const GetOTP(),
      );
    case RouteName.changePhoneNumber:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const ChangePhoneNumber(),
      );
    case RouteName.verifyOTP:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const VerifyOTP(),
      );
    case RouteName.businessProfile:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const BusinessProfile(),
      );
    case RouteName.addPersonContact:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const AddPersonContact(),
      );
    case RouteName.verifyEmail:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const VerifyEmail(),
      );
    case RouteName.login:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Login(),
      );
    case RouteName.homeScreen:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const HomeScreen(),
      );
    case RouteName.createShipment:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const CreateShipment(),
      );
    case RouteName.senderInformation:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SenderInformation(),
      );
    case RouteName.receiverInformation:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const ReceiverInformation(),
      );
    case RouteName.packageDetails:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const PackageDetail(),
      );
    case RouteName.destinationDetails:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const DestinationDetails(),
      );

    case RouteName.destinationList:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const DestinationList(),
      );
    case RouteName.multiPackageDetails:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const MultiPackageDetails(),
      );
    case RouteName.vehicleDetails:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const VehicleDetails(),
      );
    case RouteName.checkOut:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const CheckOut(),
      );
    case RouteName.scheduleSuccess:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const ScheduleSuccess(),
      );
    case RouteName.trackShipment:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const TrackShipment(),
      );
    case RouteName.account:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const MyAccount(),
      );
    case RouteName.packageReturn:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const PackageReturn(),
      );
    case RouteName.trackOverView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const TrackingOverViewDetail(),
      );
    case RouteName.viewPackage:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const ViewPackage(),
      );
    case RouteName.shipmentComplete:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const ShipmentComplete(),
      );
    case RouteName.addNewCard:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const AddNewCardScreen(),
      );
    case RouteName.manageCard:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const ManageCard(),
      );
    case RouteName.cardOtpVerification:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const CardOtpVerification(),
      );
    case RouteName.payment:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const PaymentScreen(),
      );
    case RouteName.currency:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Currency(),
      );
    case RouteName.fundWallet:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const FundWallet(),
      );
    case RouteName.fundPayment:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const FundPayment(),
      );
    case RouteName.paymentMethod:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const PaymentMethod(),
      );
    case RouteName.shipokaPin:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const ShipokaPin(),
      );
    case RouteName.navBar:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const HomeNavigation(),
      );
    default:
      return MaterialPageRoute<T>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Route<T> _getPageRoute<T>({
  required String routeName,
  required Widget viewToShow,
}) {
  return PageRoutes.fadeThrough(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}