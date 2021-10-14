import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trancentum_web_app/services/expeditions.dart';

import 'calculate_percentage_of_expeditions_per_status_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([Expeditions])
void main() {
  group("Percentage of expeditions per Status", () {
    test("returns a double", () {
      final expeditions = MockExpeditions();
      when(expeditions.calculatePercentageOfExpeditionsPerStatus(10, 5)).thenReturn(0.2);

      expect(expeditions.calculatePercentageOfExpeditionsPerStatus(10, 5), 0.2);
    });
    });

    test("If there are no expeditions declared", () {
      final expeditions = MockExpeditions();
      when(expeditions.calculatePercentageOfExpeditionsPerStatus(0, 0)).thenReturn(0.0);

      expect(expeditions.calculatePercentageOfExpeditionsPerStatus(0, 0), 0.0);
    });
}
