class Persona{
  String name;
  String lastName;
  String email;
  DateTime birth;
  String? password;

  Persona({
    required String name,
    required String lastName,
    required String email,
    required DateTime birth,
    String? password }):
    this.name = name,
    this.lastName = lastName,
    this.email = email,
    this.birth = birth,
    this.password = password;

    String get getName => name;
    String get getLastName => lastName;
    String get getEmail => email;
    DateTime get getBirth => birth;
    String? get getPassword => password;
}