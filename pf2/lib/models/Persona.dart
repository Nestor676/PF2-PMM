class Persona{
  String fullName;
  String email;
  DateTime birth;

  Persona.new({
    required String fullName,
    required String email,
    required DateTime birth}):
    this.fullName = fullName,
    this.email = email,
    this.birth = birth;

    String get getFullName => fullName;
    String get getEmail => email;
    DateTime get getBirth => birth;
}