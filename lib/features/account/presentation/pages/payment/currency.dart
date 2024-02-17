import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/app/view/widget/app_back_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //const Gap(10),
                  const AppBackButton(),
                  TextSemiBold(
                    'Currency',
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(''),
                  )
                ],
              ),
              const Gap(20),
              InputField(
                  controller: _controller,
                  suffix: SvgPicture.asset(AppAssets.search),
                  placeholder: 'Search for currency',
              ),
              const SizedBox(height: 30,),
              Column(
                children: currencies.map((e){
                  return Material(
                    color: e['code']! == 'NGN'? const Color(0xffFAFAFA):Colors.white,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.fundWallet);
                            },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBody(e['code']!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff344054)
                                    ),),
                                  TextSmall(e['title']!,style: const TextStyle(
                                      fontSize: 14,color: Color(0xff667085)
                                  ),),


                                ],
                              ),
                              const Spacer(),
                              e['code']! == 'NGN'?
                              const Icon(Icons.check,color:  Color(0xffF26520),):const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String,String>> currencies = [
  {
    'code':'NGN',
    'title':"Nigerian Naira"
  },
  {
    'code':'USD',
    'title':"US  Dollar"
  },{
    'code':'EUR',
    'title':"Euro"
  },
  {
    'code':'AED',
    'title':"UAE Dirham"
  },
  {
    'code':'AUD',
    'title':"Australian Dollar"
  },
  {
    'code':'Ars',
    'title':"Argentine Peso"
  },



];