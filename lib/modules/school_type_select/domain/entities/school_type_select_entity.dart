import 'package:flutter/foundation.dart' show immutable;

@immutable
class SchoolTypeSelectEntity {
  const SchoolTypeSelectEntity(this.firstName, this.lastName, this.nextStep, this.accessMode, this.statusCode, {
    this.trials,
    this.remainingTrials,
  });

  final String? trials;
  final String? remainingTrials;
  final String? firstName;
  final String? lastName;
  final String? nextStep;
  final String? accessMode;
  final String? statusCode;

// final String token;
// final int? conversationExpiryInSec;

}

