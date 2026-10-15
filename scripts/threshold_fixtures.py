#!/usr/bin/env python3
"""Compare actual pinned WOODPECKER with exact arithmetic on a frozen grid.
Each binary64 operation on this grid is checked against fractions.Fraction;
these are finite certificates, not a universal floating-point equivalence proof.
"""
from fractions import Fraction
import hashlib
import itertools
import json
from pathlib import Path
import sys
import types

ROOT = Path(__file__).resolve().parents[1]
row = next(r for r in json.loads((ROOT / 'extension-sources.json').read_text())
           if r['repository'] == 'enuminous/woodpecker')
data = row['content'].encode()
assert hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest() == row['git_blob_sha1']
mod = types.ModuleType('exact_woodpecker')
sys.modules[mod.__name__] = mod
exec(compile(row['content'], row['path'], 'exec'), mod.__dict__)
names = {'NECESSARY': '.necessary', 'CONTRIBUTORY': '.contributory',
         'REDUNDANT': '.redundant', 'INDETERMINATE': '.indeterminate'}
proofs = []
for b, a, eps, numerator, higher, evidence in itertools.product(
        [-4, -1, 0, 1, 4], [-5, -1, 0, 1, 5], [-1, 0, 1],
        [-1, 0, 1, 2, 3, 4, 5], [False, True], [False, True]):
    fraction = Fraction(numerator, 4)
    case = dict(claim='frozen claim', component='component', baseline_value=b,
                ablated_value=a, metric='score', higher_is_better=higher,
                epsilon=eps, contributory_fraction=float(fraction), ablation='removed',
                preserved_conditions=[], violations=[], pre_registered=evidence,
                proxy_leakage=False, claim_type='necessity')
    result = mod.evaluate(case)
    if result.disposition.value != 'INDETERMINATE':
        sign = 1 if higher else -1
        loss = Fraction(sign*b-sign*a)
        threshold = max(Fraction(eps), abs(Fraction(sign*b))*(1-fraction))
        assert Fraction.from_float(result.oriented_baseline) == sign*b
        assert Fraction.from_float(result.oriented_ablated) == sign*a
        assert Fraction.from_float(result.loss) == loss
        assert Fraction.from_float(result.epsilon) == eps
        binary_threshold = max(float(eps), abs(float(sign*b))*(1.0-float(fraction)))
        assert Fraction.from_float(binary_threshold) == threshold
    inp = f'⟨{b}, {a}, {eps}, {numerator}, 4, {str(higher).lower()}, {str(evidence).lower()}⟩'
    proofs.append(f'theorem case_{len(proofs):04d} : Zoo.ExactThresholds.evaluate {inp} = '
                  + names[result.disposition.value] + ' := by decide')
assert len(proofs) == 2100
header, body = (ROOT / 'Audit.lean').read_text().split('open Lean in\nrun_cmd do', 1)
target = ROOT / '.lake/ThresholdFixtures.lean'
target.parent.mkdir(exist_ok=True)
target.write_text(header + '\nnamespace AuditProbe.Thresholds\n' + '\n'.join(proofs) +
                  '\nend AuditProbe.Thresholds\n\nopen Lean in\nrun_cmd do' + body)
print('Generated 2100 exact-arithmetic source certificates; all included binary64 intermediates agree with Fraction.')
