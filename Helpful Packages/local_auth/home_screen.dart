import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // local auth
  final LocalAuthentication auth = LocalAuthentication();
  // is device capable of checking biometrics
  bool _canCheckBiometrics;
  // list of available biometrics
  List<BiometricType> _availableBiometrics;
  // is user authorised to use the app?
  String _authorized = 'Not Authorized';
  // is current authentication is progress
  bool _isAuthenticating = false;

  /// check for biometrics capability of device
  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  /// get list of available biometrics options
  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  /// authenticate using biometrics
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  /// cancel current in-process authentication
  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biometrics Authentication',
        ),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Can check biometrics: $_canCheckBiometrics\n',
            ),
            RaisedButton(
              child: const Text(
                'Check biometrics',
              ),
              onPressed: _checkBiometrics,
            ),
            Text(
              'Available biometrics: $_availableBiometrics\n',
            ),
            RaisedButton(
              child: const Text(
                'Get available biometrics',
              ),
              onPressed: _getAvailableBiometrics,
            ),
            Text(
              'Current State: $_authorized\n',
            ),
            RaisedButton(
              child: Text(
                _isAuthenticating ? 'Cancel' : 'Authenticate',
              ),
              onPressed:
                  _isAuthenticating ? _cancelAuthentication : _authenticate,
            )
          ],
        ),
      ),
    );
  }
}
