import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/AppCommon.dart';
import 'package:flutter_application_1/common/strings.dart';

class LottoGenerator extends StatefulWidget {
  const LottoGenerator({super.key});

  @override
  State<StatefulWidget> createState() => _LottoGeneratorState();
}

class _LottoGeneratorState extends State<LottoGenerator> {
  final String generateCombinationStr =
      'Tap button to Generate Lotto Combination!';
  final String generateCombination = 'Generate Combination';

  final String separateBy = ", ";
  List<String> lottoCategoryList = [
    'ez2',
    '6/42',
    '6/45',
    '6/49',
    '6/55',
    '6/58'
  ];

  List<int> ez2 = [];
  List<int> numberCombination_42 = [];
  List<int> numberCombination_45 = [];
  List<int> numberCombination_49 = [];
  List<int> numberCombination_55 = [];
  List<int> numberCombination_58 = [];
  bool startedFlag = false;

  void _generateCombination() {
    setState(() {
      startedFlag = true;
      _clearList();
      _generateRandomCombination(ez2, 31, 2);
      _generateRandomCombination(numberCombination_42, 42, 6);
      _generateRandomCombination(numberCombination_45, 45, 6);
      _generateRandomCombination(numberCombination_49, 49, 6);
      _generateRandomCombination(numberCombination_55, 55, 6);
      _generateRandomCombination(numberCombination_58, 58, 6);
      _sortList();
    });
  }

  void _clearList() {
    ez2.clear();
    numberCombination_42.clear();
    numberCombination_45.clear();
    numberCombination_58.clear();
    numberCombination_55.clear();
    numberCombination_49.clear();
  }

  void _sortList() {
    ez2.sort();
    numberCombination_42.sort();
    numberCombination_45.sort();
    numberCombination_49.sort();
    numberCombination_55.sort();
    numberCombination_58.sort();
  }

  void _generateRandomCombination(List<int> arr, int maxRange, int maxNumber) {
    Random random = Random();

    while (arr.length != maxNumber) {
      var number = random.nextInt(maxRange);
      if (!arr.contains(number) && number > 0) {
        arr.add(number);
      }
    }
  }

  Widget lottoCategory(String title, String value) => Column(children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.redAccent,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
          ),
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: numberCombination_45.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    lottoCategory(lottoCategoryList[0], ez2.join(separateBy)),
                    lottoCategory(lottoCategoryList[1],
                        numberCombination_42.join(separateBy)),
                    lottoCategory(lottoCategoryList[2],
                        numberCombination_45.join(separateBy)),
                    lottoCategory(lottoCategoryList[3],
                        numberCombination_49.join(separateBy)),
                    lottoCategory(lottoCategoryList[4],
                        numberCombination_55.join(separateBy)),
                    lottoCategory(lottoCategoryList[5],
                        numberCombination_58.join(separateBy)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            AppCommon().appThemeColor, // foreground
                      ),
                      onPressed: () {},
                      child: Text(Strings().save),
                    )
                  ],
                )
              : Text(generateCombinationStr)),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateCombination,
        tooltip: generateCombination,
        child: (!startedFlag)
            ? const Icon(Icons.start)
            : const Icon(Icons.autorenew),
      ), // This trailing,
    );
  }
}
