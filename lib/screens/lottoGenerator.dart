import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/AppCommon.dart';
import 'package:flutter_application_1/common/strings.dart';

import '../util/util.dart';

class LottoGenerator extends StatefulWidget {
  const LottoGenerator({super.key});

  @override
  State<StatefulWidget> createState() => _LottoGeneratorState();
}

class _LottoGeneratorState extends State<LottoGenerator> {
  late bool startedFlag = false;

  @override
  void initState() {
    super.initState();
  }

  List<int> ez2 = [];
  List<int> numberCombination_42 = [];
  List<int> numberCombination_45 = [];
  List<int> numberCombination_49 = [];
  List<int> numberCombination_55 = [];
  List<int> numberCombination_58 = [];

  void _generateCombination() {
    setState(() {
      startedFlag = true;
      _clearList();
      Util().generateRandomCombination(ez2, 31, 2);
      Util().generateRandomCombination(numberCombination_42, 42, 6);
      Util().generateRandomCombination(numberCombination_45, 45, 6);
      Util().generateRandomCombination(numberCombination_49, 49, 6);
      Util().generateRandomCombination(numberCombination_55, 55, 6);
      Util().generateRandomCombination(numberCombination_58, 58, 6);
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
                    lottoCategory(Strings().lottoCategoryList[0],
                        ez2.join(Strings().separateBy)),
                    lottoCategory(Strings().lottoCategoryList[1],
                        numberCombination_42.join(Strings().separateBy)),
                    lottoCategory(Strings().lottoCategoryList[2],
                        numberCombination_45.join(Strings().separateBy)),
                    lottoCategory(Strings().lottoCategoryList[3],
                        numberCombination_49.join(Strings().separateBy)),
                    lottoCategory(Strings().lottoCategoryList[4],
                        numberCombination_55.join(Strings().separateBy)),
                    lottoCategory(Strings().lottoCategoryList[5],
                        numberCombination_58.join(Strings().separateBy)),
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
              : Text(Strings().generateCombinationStr)),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateCombination,
        tooltip: Strings().generateCombinationToolTip,
        child: (!startedFlag)
            ? const Icon(Icons.start)
            : const Icon(Icons.autorenew),
      ), // This trailing,
    );
  }
}
