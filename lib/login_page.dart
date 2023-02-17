import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sphinix_test/colorConverter.dart';
import 'package:sphinix_test/dashboard_page.dart';
import 'package:truecaller_sdk/truecaller_sdk.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State {
  late Stream<TruecallerSdkCallback>? _stream;
  TextEditingController txt_name = new TextEditingController();
  TextEditingController txt_phone_no = new TextEditingController();
  TextEditingController txt_email = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream = TruecallerSdk.streamCallbackData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      "Please enter your login details",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey.shade600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Name"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TextField(
                        enabled: true,
                        controller: txt_name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          isDense: true,
                          hintText: "Enter your name",
                          hintStyle: new TextStyle(
                              fontSize: 12.0,
                              color: ColorConverter.hexToColor("#838383")),
                          border: InputBorder.none,
                        ),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Phone number"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textCapitalization: TextCapitalization.sentences,
                        enabled: true,
                        controller: txt_phone_no,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          counterText: "",
                          isDense: true,
                          hintText: "Enter your phone number",
                          hintStyle: new TextStyle(
                              fontSize: 12.0,
                              color: ColorConverter.hexToColor("#838383")),
                          border: InputBorder.none,
                        ),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Email"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TextField(
                        enabled: true,
                        controller: txt_email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          isDense: true,
                          hintText: "Enter your email",
                          hintStyle: new TextStyle(
                              fontSize: 12.0,
                              color: ColorConverter.hexToColor("#838383")),
                          border: InputBorder.none,
                        ),
                        minLines: 1,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        verifyEmail();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                        ),
                        height: 30,
                        width: MediaQuery.of(context).size.width - 100,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Verify email",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        //getTruecallerProfileInfo();
                        if(txt_name.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please enter your name'),
                          ));
                        }else if(txt_phone_no.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please enter your phone number'),
                          ));
                        }else if(txt_email.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please enter your email'),
                          ));
                        }else{
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Dashboard()));
                        }

                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Login",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<TruecallerSdkCallback>(
                  stream: _stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data!.result) {
                        case TruecallerSdkCallbackResult.success:
                          return Text(
                              "Hi, ${snapshot.data!.profile!.firstName} ${snapshot.data!.profile!.lastName}"
                              "\nBusiness Profile: ${snapshot.data!.profile!.isBusiness}");
                        case TruecallerSdkCallbackResult.failure:
                          return Text(
                              "Oops!! Error type ${snapshot.data!.error!.code}");
                        case TruecallerSdkCallbackResult.verification:
                          return Column(
                            children: [
                              Text("Verification Required : "
                                  "${snapshot.data!.error != null ? snapshot.data!.error!.code : ""}"),
                              MaterialButton(
                                color: Colors.green,
                                onPressed: () {
                                  print("OK NON TC Required");
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NonTcVerification()));*/
                                },
                                child: Text(
                                  "Do manual verification",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          );
                        default:
                          return Text("Invalid result");
                      }
                    } else
                      return Text("");
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void verifyEmail() async {
    var acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: 'https://www.google.com/',
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.task.sphinixTest',
        androidPackageName: 'com.task.sphinix_test',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '10');

    var emailAuth = txt_email.text.trim();
    FirebaseAuth.instance
        .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
        .catchError(
            (onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));
  }

  void getTruecallerProfileInfo() async {
    TruecallerSdk.initializeSDK(
        sdkOptions: TruecallerSdkScope.SDK_OPTION_WITH_OTP);
    TruecallerSdk.isUsable.then((isUsable) {
      if (isUsable) {
        TruecallerSdk.getProfile;
        print("Profile Is-->${TruecallerSdk.getProfile}");
      } else {
        final snackBar = SnackBar(content: Text("Not Usable"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("***Not usable***");
      }
    });
  }
}
