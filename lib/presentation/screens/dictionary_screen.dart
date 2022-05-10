import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'package:alphanum_comparator/alphanum_comparator.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> keyslist = dictionary.keys.toList();
    final List<int> numbers = keyslist.map(int.parse).toList();

    List<String> valueslist = dictionary.values.toList();
    List<String> sortedvaluelist = valueslist;
    sortedvaluelist.sort(AlphanumComparator.compare);
    print(sortedvaluelist);
    numbers.sort();

    print(numbers.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
      ),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                    color: Colors.white,
                    height: 40,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(numbers[index].toString()),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(sortedvaluelist[index]),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

var dictionary = {
  '34': 'thirty-four',
  '90': 'ninety',
  '91': 'ninety-one',
  '21': 'twenty-one',
  '61': 'sixty-one',
  '9': 'nine',
  '2': 'two',
  '6': 'six',
  '3': 'three',
  '8': 'eight',
  '80': 'eighty',
  '81': 'eighty-one',
  '99': 'Ninety-Nine',
  '900': 'nine-hundred'
};
