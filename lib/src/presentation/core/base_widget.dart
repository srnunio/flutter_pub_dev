import 'package:flutter/material.dart';

abstract class BaseComponent extends StatelessWidget {
  final String? value;

  BaseComponent({Key? key, this.value}) : super(key: key);
}
