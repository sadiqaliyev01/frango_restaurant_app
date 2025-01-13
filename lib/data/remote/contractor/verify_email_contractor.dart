import '../../models/remote/verify_email_response.dart';

abstract class VerifyEmailContractor {
  Future<VerifyEmailResponse> verifyEmail({
    required String email,
  });
}
