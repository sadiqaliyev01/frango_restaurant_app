import '../contractor/register_contractor.dart';
import '../services/remote/register_service.dart';

class RegisterRepository implements RegisterContractor {
  const RegisterRepository(this._registerService);

  final RegisterService _registerService;

  @override
  Future<bool> register({
    required String otpCode,
    required String email,
    required String name,
    required String surname,
    required String phone,
    required String password,
    required String birthDate,
  }) =>
      _registerService.register(
        otpCode: otpCode,
        email: email,
        name: name,
        surname: surname,
        phone: phone,
        password: password,
        birthDate: birthDate,
      );
}
