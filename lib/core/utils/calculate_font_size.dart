import 'dart:math';

import 'package:flutter/material.dart';

double calculateFontSize(BoxConstraints constraints, int length) {
    const double maxFontSize = 24.0;

    double maxHeight = constraints.maxHeight;

    double maxWidth = constraints.maxWidth;

    double availableArea = maxHeight * maxWidth;

    int textLength = length;

    double areaPerCharacter = availableArea / textLength;

    double fontSize = sqrt(areaPerCharacter);

    fontSize = min(fontSize, maxFontSize);

    return fontSize;
  }