mixin AppLocale {
  static const String title = 'title';
  static const String name = 'name';
  static const String login = 'login';
  static const String subTitle = 'subTitle';
  static const String emailLogin = 'emailLogin';
  static const String forgotPass = 'forgotPass';
  static const String passwordLogin = 'passwordLogin';
  static const String bottomLogin = 'bottomLogin';
  static const String doNotHaveAccount = 'doNotHaveAccount';
  static const String registerNow = 'registerNow';
  static const String Phone = 'Phone';

  static const Map<String, dynamic> EN = {
    login: 'Login',
    subTitle:'welcome backe.. Sign in with your email and password or continue with social media',
    emailLogin:'email',
    passwordLogin:'Password',
    forgotPass:'Forgot Password',
    bottomLogin:'LOGIN',
    doNotHaveAccount:"You don't have an account?",
    registerNow:'Register now',
    Phone:"Phone",
    name:"name"

  };
  static const Map<String, dynamic> AR = {
    login: 'تسجيل الدخول',
    subTitle:'مرحبًا بعودتك.. قم بتسجيل الدخول باستخدام بريدك الإلكتروني \nكلمة المرور أو تابع التواصل مع وسائل\n التواصل الاجتماعي',
    emailLogin:'البريد الالكتروني',
    passwordLogin:'كلمة المرور',
    forgotPass:'نسيت كلمة المرور',
    bottomLogin:'تسجيل الدخول',
    doNotHaveAccount:'لا تملك حساب',
    registerNow:'سجل الان',
    Phone:"رقم الهاتف",
    name:"الاسم"
  };
}