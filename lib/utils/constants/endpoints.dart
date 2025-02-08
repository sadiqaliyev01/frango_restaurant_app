class Endpoints {
  Endpoints._();

  static const _baseUrl = "https://backend.frango.software/api";

  // auth
  static const login = "$_baseUrl/auth/login";
  static const register = "$_baseUrl/users/register";
  static const verifyEmail = "$_baseUrl/users/verify-email";

  static const aboutUs = "$_baseUrl/aboutUs";
  static const meals = "$_baseUrl/meals";
  static const categoryNames = "$_baseUrl/meal-categories";
  static const table = "$_baseUrl/tables";
  static const reservation = "$_baseUrl/reservations";
}
