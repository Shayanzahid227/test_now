
import 'package:flutter/material.dart';
import 'package:test_now/core/constant/colors.dart';
import 'package:test_now/core/constant/text_style.dart';

final InputDecoration customAuthField = InputDecoration(
  hintText: "User Name",
  hintStyle: style14,

  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 38),

  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(99),
    borderSide: const BorderSide(color: greyBorder, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(99),
    borderSide: const BorderSide(color: greyBorder, width: 1),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(99),
    borderSide: const BorderSide(color: greyBorder, width: 1),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(99),
    borderSide: const BorderSide(color: greyBorder, width: 1),
  ),
);
