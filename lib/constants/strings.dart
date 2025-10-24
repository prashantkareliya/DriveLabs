//Error messages
class ErrorString {
  static const String internalSeverError = "ⓘ Internal sever error";
  static const String noInternet = "ⓘ No Internet";
  static const String somethingWentWrong = "ⓘ Something Went Wrong";
  static const String fullNameErr = "ⓘ Please enter full name";
  static const String emailAddressErr = "ⓘ Please enter email address";
  static const String emailAddressValidErr = "ⓘ Please enter valid email address";
  static const String phoneErr = "ⓘ Please enter phone number";
  static const String passwordErr = "ⓘ Please enter password";
  static const String passwordErr1 = "ⓘ Password & Confirm Password do not match";
  static const String hospitalErr = "ⓘ Please select hospital";
  static const String occupationErr = "ⓘ Select occupation";
  static const String bloodErr = "ⓘ Select blood";
  static const String genderErr = "ⓘ Select gender";
  static const String doctorTypeErr = "ⓘ Please Select doctor type";
  static const String otpErr = "ⓘ Please enter OTP";
  static const String experienceErr = "ⓘ Enter experience";
  static const String ageErr = "ⓘ Enter age";
  static const String pickupLocationErr = "ⓘ Please enter pickup location";
  static const String dropLocationErr = "ⓘ Please enter drop location";
  static const String emsErr = "ⓘ Select ambulance type";

  static const String reasonErr = "ⓘ Select reason";
  static const String pickTimeErr = "ⓘ Please select pickup time";

  ///emp
  static const String employeeIdErr = "ⓘ Enter Employee ID";
  static const String notesErr = "ⓘ Enter Notes";
  static const String msgErr = "ⓘ Enter Message";

}
//271828
//Messages
class Message {
  static const String msgDemo = "";
}

//Label Strings
class LabelString {
  static const String labelEmail = 'Email Address';
  static const String labelEnterEmail = 'Enter Email Address';
  static const String labelPassword = 'Password';
  static const String labelEnterPassword = 'Enter Password';
  static const String labelForgotPassword = 'Forgot Password?';
  static const String labelStartLearning = 'START LEARNING';
  static const String labelSignInWith = 'Sign-in with';
  static const String labelEmployeeLogin = 'Employee Login';
  static const String labelFamilyLogin = 'Family Login';
  static const String labelFullName = 'Full Name';
  static const String labelEnterFullName = 'Enter Full Name';
  static const String labelPhoneNumber = 'Phone Number';
  static const String labelEnterPhoneNumber = 'Enter Phone Number';
  static const String labelConfirmPassword = 'Confirm Password';
  static const String labelEnterConfirmPassword = 'Enter Confirm Password';
  static const String labelEnterYourPincode = 'Enter Your Pincode';
  static const String labelEnterPincode = 'Enter Pincode';
  static const String labelFullAddress = 'Full Address';
  static const String labelEnterFullAddress = 'Enter Full Address';
  static const String labelSubmit = 'Submit';
  static const String labelReferFriend = 'Refer a friend';
  static const String labelYesIn = 'Yes, I’m In';
  static const String labelContactUs = 'Contact Us';
  static const String labelEnterCode = 'Enter code';
  static const String labelEnterReferralCode = 'Enter referral/discount code';
  static const String labelApply = 'Apply';
  static const String labelDone = 'DONE';
  static const String labelPayNow = 'Paynow';
  static const String labelChooseCar = 'Choose Your Car';
  static const String labelNext = 'Next';
  static const String labelLicensingProcedures = 'Licensing Procedures';
  static const String labelProceed = 'Proceed';

///Emp
  static const String labelEmployeeID = 'EmployeeID';
  static const String labelUname = 'Username/Phone number';

  static const String labelLastClassNotes = 'Last Class Notes';
  static const String labelEnterNotes = 'Enter Notes';

  static const String labelStudentMessage = 'Student Message';
  static const String labelTotalRating = 'Total Rating';

}

//Button Strings
class OtherString {

}

//Button Strings
class ImageString {
  static const String icPlaceHolder = "";
  static const String imgProfile = "assets/images/emp_profile.png";
  static const String imgLoader = "assets/images/loader.png";
  static const String imgLoginRegistration = "assets/images/login_registration_2.png";
  static const String imgLogin = "assets/images/tab_login.png";
  static const String imgRegister = "assets/images/tab_register.png";
  static const String imgRegisterInactive = "assets/images/tab_register_inactive.png";
  static const String imgLoginInactive = "assets/images/tab_login_inactive.png";
  static const String imgIntro2 = "assets/images/intro_2.png";
  static const String imgIntro3 = "assets/images/intro_3.png";
  static const String imgIntro4 = "assets/images/intro_4.png";
  static const String imgEmpLogin = "assets/images/emp_btm_bg.png";
  static const String imgStudentDetailBtm = "assets/images/student_detail_btm.png";


}

class PreferenceString {
  static const String prefsToken = "token";
  static const String prefsRole = "role";
  static const String prefsUserId = "userId";
  static const String prefsName = "name";
  static const String prefsPhone = "phone";
  static const String userResponse = "userData";
  //static const String userRole = "userRole";
}

class StaticList {

}



class GreetingMessage {
  static String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }


}
