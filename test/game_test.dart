import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ritim_diktesi/oyun_ritim_diktesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ritimDiktesiConfig.title.length, 33);
    expect(ritimDiktesiConfig.tagline.length, 33);
    for (final s in ritimDiktesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ritimDiktesiConfig.gameId, ritimDiktesiId);
    expect(ritimDiktesiRules.gameId, ritimDiktesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ritimDiktesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ritimDiktesiId, optionalMechanics: ritimDiktesiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ritimDiktesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
