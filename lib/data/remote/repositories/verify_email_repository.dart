import 'package:frango_restaurant_app/data/remote/contractor/verify_email_contractor.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/verify_email_service.dart';

class VerifyEmailRepository implements VerifyEmailContractor {
  const VerifyEmailRepository(this._verifyEmailService);

  final VerifyEmailService _verifyEmailService;

  @override
  Future<bool> verifyEmail(String email) =>
      _verifyEmailService.verifyEmail(email);
}
