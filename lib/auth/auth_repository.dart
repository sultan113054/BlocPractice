class AuthRepository{
  Future<void>login() async{
    print("Attempt Login");
   await Future.delayed(Duration(seconds: 3));
   print('logged in');
  }
}