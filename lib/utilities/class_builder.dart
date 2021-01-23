import 'package:meetcampus_mobil/screens/home.dart';
import 'package:meetcampus_mobil/screens/meet_with_graduates.dart';
import 'package:meetcampus_mobil/screens/settings.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Settings>(() => Settings());
    register<MeetWithGraduates>(() => MeetWithGraduates());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
