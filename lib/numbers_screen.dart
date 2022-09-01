import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({Key? key}) : super(key: key);

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  List<int> numbers = List<int>.generate(60, (i) => i + 1);
  List<int> selectedNumbers = [];
  List<Container> selectedNumbersCards = [];
  String formattedDate = "";

  @override
  void initState() {
    super.initState();
    _bet();
  }

  void _bet() {
    setState(() {
      selectedNumbers = (numbers..shuffle()).take(6).toList();
      selectedNumbers.sort();
      selectedNumbersCards = [];
      for (int i = 0; i < selectedNumbers.length; i++) {
        selectedNumbersCards.add(Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  (i + 1).toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
                Text(
                  selectedNumbers[i] < 10
                      ? '0${selectedNumbers[i]}'
                      : '${selectedNumbers[i]}',
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
      }
      formattedDate =
          DateFormat('dd-MM-yyyy – kk:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mega Sena'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedNumbersCards[0],
                selectedNumbersCards[1],
                selectedNumbersCards[2],
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedNumbersCards[3],
                selectedNumbersCards[4],
                selectedNumbersCards[5],
              ],
            ),
            const SizedBox(width: 200, height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedDate,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 200, height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {
                          _bet(),
                        },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Bet',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
