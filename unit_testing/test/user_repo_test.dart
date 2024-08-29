import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:rawant/user_mode.dart';
import 'package:rawant/user_repo.dart';
import 'package:mocktail/mocktail.dart';

//Basically ekhane amra 2ti kaj korbo. 1st one : resopnse 200 asche kena and 2nds na ele error taki elo

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepo userRepo;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepo = UserRepo(mockHTTPClient);
  });
  group("User Repo - ", () {
    group("getUser function -", () {
      test(
          "given userRepo class when getUser function called and status code is 200 the useromodel shouild returned",
          () async {
        //Arrenge
        when(() => mockHTTPClient
                .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")))
            .thenAnswer((inovocation) async {
          return Response(""" {
          
          "id":1,
          "name":"Tapsof"
          } """, 200);
        });
        //act
        final user = await userRepo.getUser();
        //assert
        expect(user, isA<User>());
      });

      //Ei code tay error asar karon holo amra to 200 peye gesi to error to exception to asbe na. karon amra jodi user peye jai taile error asbe koi deye. etai holo problem. amra bolte partesi na je 300,400 ele ki hbe. full access nei amader hate.
      //Test kono external fator er upore nervor kore na. like wifi off. oy eta dekhbe na. etake thik korte amra bivinno package use  korte pari
      test(
          "given userRepo class when getUser function called and status code is not 200 then an exception shouild trhorowned",
          () async {
        //Arrenge
        //act
        final user = userRepo.getUser();
        //assert
        expect(user, throwsException);
      });

      test(
          "given userRepo class when getUser function called and status code is not 200 then an exception shouild trhorowned",
          () async {
        //Arrenge
        when(() => mockHTTPClient
                .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")))
            .thenAnswer((inovocation) async {
          return Response("{}", 500);
        });
        //act
        //ekhane amra await kte debo karon amra dekhbo just error ase kena. solve to ar korbo na. await deya mane holo amra wait kori data ele to valo na ele setake resolve kori. but amra ehane just dekhtesi je sob thik ase kena coltese kena sob valo moto not error handling
        final user = userRepo.getUser();
        //assert
        expect(user, throwsException);
      });
    });
  });
}
