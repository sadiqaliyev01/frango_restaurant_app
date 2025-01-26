class Endpoints {
  Endpoints._();

  static const _baseUrl = "http://134.122.65.76:8080/api";
  static const login = "$_baseUrl/auth/login";
  static const register = "$_baseUrl/user/register";
  static const verifyEmail = "$_baseUrl/user/verifyEmail";

  static const aboutUs = "$_baseUrl/aboutUs";
  static const meals = "$_baseUrl/meal";
  static const categoryNames = "$_baseUrl/mealCategory";
  static const table = "$_baseUrl/table";
  static const reservation = "$_baseUrl/reservation";
}
