import 'package:flutter_test/flutter_test.dart';
import 'package:rawant/counter.dart';

void main() {
  // late na dele nulable dete hoto.
  late Counter counter;
  //Pretest
  setUp(() {
    counter = Counter();
  });
  setUpAll(() {});
  //Testing
  group("counter class - ", () {
    //given when then
    test("given class counter and the value will be 0", () {
      //Arrange - guchano

      //Act - jeta dhorte chai
      final val = counter.counter;
      //Assert - mane ki expect kori seti
      expect(val, 0);
    });

    test(
        "given counter class when it is incrementd the value of count shouild be 1",
        () {
      //Arrange - guchano

      //Act
      counter.increamentCounter();
      final val = counter.counter;
      //Assert
      expect(val, 1);
    });

    test("given counter class when it is reset the value of count shouild be 0",
        () {
      //Arrange - guchano

      //Act
      counter.reset();
      final val = counter.counter;
      //Assert
      expect(val, 0);
    });
  });

  //Post test
  tearDown(() {});
  tearDownAll(() {});
}
