class EndPoints {
  static String baseUrl = 'https://api.rtb-app.com/api/v1/';

  static String login = 'authentication/login';
  static String logout = 'authentication/logout';
  static String userRegister = 'authentication/init';
  static String verifyEmail = 'authentication/verify-email';
  static String resendOtp = 'authentication/verify-email/resend-otp';
  static String forgetPassword = 'authentication/forgot-password';
  static String changePassword = 'authentication/reset-password';

  // Profile =========================================>
  static String getUserByToken = 'user/profile';
  static String setupProfile = 'authentication/profile';
  static String questionnaire = 'questionnaire';
  static String userAnswers = 'user/answers';
  static String work = 'work';
  static String countries = 'countries';
  static String nationality = 'nationality';
  static String habits = 'habits';
  static String deleteAccount = 'user';
  static String changeOlaPassword = 'user/changePassword';
  static String contactUs = 'contact';

  //==========================================>
  static String afterLogin = 'site/device-token';
  static String termsAndConditions = 'site/term';
  static String verificationPrivacyPolicy = 'site/verification-privacy-policy';
  static String onBoarding = 'site/slider';
  static String category = 'questionnaire/categories';
  static String addCategory = 'questionnaire/category';
  //========================tasks==================>

  static String tasks = 'tasks';
  static String upload = 'upload';
  static String notes = 'notes';
  static String allTasks = 'tasks/all';
  static String subtasks = 'tasks/subTask';
}
