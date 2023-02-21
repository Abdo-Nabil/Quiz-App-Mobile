String? extractOtpNumber(String msg, int length) {
  List otpResults = [];
  String exp = '[0-9]';
  String regResult = '';
  for (int i = 0; i < length; i++) {
    regResult = regResult + exp;
  }
  RegExp reg1 = RegExp(regResult);
  Iterable allMatches = reg1.allMatches(msg);
  for (var match in allMatches) {
    otpResults.add(msg.substring(match.start, match.end));
  }
  if (otpResults.isNotEmpty) {
    return otpResults.first.toString();
  }
  return null;
}
