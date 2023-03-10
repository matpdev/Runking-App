import 'package:runking_app/globalController/user_controller.dart';
import 'package:runking_app/repository/auth_repository.dart';
import 'package:runking_app/utils/utils.dart';
import 'package:get/instance_manager.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Database? db;

  final userController = Get.put<UserController>(
    UserController(),
  );

  Future<dynamic> openDbUser() async {
    db = await openDatabase(
      'user_db3.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        create table user(
          id integer primary key autoincrement,
          email text not null UNIQUE,
          password text,
          integrationtoken text,
          loggeddate text
        )
        ''');
      },
    );
  }

  Future<dynamic> getUserData() async {
    await openDbUser();
    if (db!.isOpen) {
      final List<Map> userData = await db!.query('user');
      if (userData.isNotEmpty) {
        return userData[0];
      } else {
        return userData;
      }
    }
  }

  Future<dynamic> setUserdata(
      String email, String password, bool isIntegration) async {
    await openDbUser();
    if (db!.isOpen) {
      await db!.insert(
        'user',
        {
          'email': email,
          'password': isIntegration ? '' : password,
          'integrationtoken': isIntegration ? password : '',
          'loggeddate': DateTime.now().toString(),
        },
      );
    }
  }

  Future<dynamic> loginUser() async {
    await openDbUser();
    if (db!.isOpen) {
      final List<Map> userData = await db!.query('user');
      if (userData.isNotEmpty) {
        final response = await AuthRepo.loginUser(
          userData[0]['email'].toString(),
          userData[0]['password'].toString(),
        );

        if (response.statusCode == 200) {
          await saveUserToken(response.data['jwt'].toString());

          userController.setUserData(
            response.data,
          );

          await db!.update(
            'user',
            userData[0]['password'] != null
                ? {
                    'email': userData[0]['email'],
                    'password': userData[0]['password'],
                    'loggeddate': DateTime.now().toString(),
                  }
                : {
                    'email': userData[0]['email'],
                    'integrationtoken': userData[0]['integrationtoken'],
                    'loggeddate': DateTime.now().toString(),
                  },
          );
        }
      } else {
        return userData;
      }
    }
  }

  Future<dynamic> logoutUser() async {
    await openDbUser();
    if (db!.isOpen) {
      await deleteUser();
      userController.setUserData(
        {},
      );
      // Get.to(const OnboardingScreen());
    }
  }

  Future<dynamic> deleteUser() async {
    await openDbUser();
    if (db!.isOpen) {
      await db!.delete('user');
    }
  }
}
