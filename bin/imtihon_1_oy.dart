import 'dart:io';

void main(List<String> arguments) {
  List<String> userinput = userInput();
  User user = User(
      username: userinput[0],
      password: userinput[1],
      fullName: userinput[2],
      email: userinput[3]);

  user.changePassword();
  user.updateProfile();
}

// ! Foydalamuvchida ma'lumotlarni qabul qiluvchi funksiya
List<String> userInput() {
  String? usernamebox = '';
  while (true) {
    stdout.write("Username ni kiriting:");
    usernamebox = stdin.readLineSync();
    if (usernamebox!.length < 3) {
      print("Kamida 3ta belgi bo'lishi kerak!");
    } else {
      break;
    }
  }

  String? passworbox = '';
  while (true) {
    stdout.write("Parolni kiriting:");
    passworbox = stdin.readLineSync();
    if (passworbox!.length < 6) {
      print("Kamida 6ta belgi bo'lishi kerak!");
    } else {
      break;
    }
  }

  stdout.write("Ism familyangizni kiriting: ");
  String? namebox = stdin.readLineSync();

  String? emailbox = '';
  while (true) {
    stdout.write("Yangi emailni kiriting:");
    emailbox = stdin.readLineSync();
    if (emailbox!.contains("@") && emailbox.contains('.')) {
      break;
    } else {
      print("Emailni to'g'ri kiriting!");
    }
  }

  return [usernamebox, passworbox, namebox!, emailbox];
}

// ! Foydalamuvchini ma'lumotlarini saqlovchi class
class User {
  String username;
  String password;
  String fullName;
  String email;

  User(
      {required this.username,
      required this.password,
      required this.fullName,
      required this.email});

  // ! Foydalamuvchini parolini o'zgartiruvchi funksiya
  void changePassword() {
    String? box = '';
    while (true) {
      stdout.write("Yangi parolni kiriting:");
      box = stdin.readLineSync();
      if (box!.length < 6) {
        print("Kamida 6ta belgi bo'lishi kerak!");
      } else {
        break;
      }
    }
    password = box;
    print("Parol o'zgartirildi1");
  }

  // ! Foydalamuvchini ma'lumotlarini o'zgartiruvchi funksiya
  void updateProfile() {
    stdout.write("Ism familyangizni kiriting: ");
    String? namebox = stdin.readLineSync();

    String? emailbox = '';
    while (true) {
      stdout.write("Yangi emailni kiriting:");
      emailbox = stdin.readLineSync();
      if (emailbox!.contains("@") && emailbox.contains('.')) {
        break;
      } else {
        print("Emailni to'g'ri kiriting!");
      }
    }

    fullName = namebox!;
    email = emailbox;

    print("Ism familya va email o'zgartirildi");
  }
}
