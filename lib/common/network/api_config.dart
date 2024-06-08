class ApiConfig {
  ApiConfig._();

  static const token = "";

  //Testing Url


  static const String baseUrl = "http://144.126.200.46";


  static const Duration receiveTimeout = Duration(milliseconds: 150000);
  static const Duration connectionTimeout = Duration(milliseconds: 150000);

  static const String login = '/api/auth/login/';

  static const String register = '/api/auth/signup/';
  static const String refreshToken = '/api/auth/refresh-token/';
  static const String resetPassword = '/api/auth/reset-password/';
  static const String sendOTP = '/api/otp/send/';
  static const String validateOtp = '/api/otp/validate/';
  static const String getSchools = '/api/user/school/';
  static const String getCategories = '/api/user/school/';
  static const String getCategory = '/api/user/category/add-selected';
  static const String homeFeedPost = '/api/posts/';




  static const header = {
    'API_Key': '',
    'Language': '',
    'SIA': '',
    'Authorization': 'Bearer $token',
    'content-Type': 'application/json',
  };
}
