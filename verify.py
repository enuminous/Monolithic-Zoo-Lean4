"""Static integrity checks only; no claim of Lean compilation or proof checking."""
from pathlib import Path
import hashlib
import json
import re

ROOT = Path(__file__).resolve().parent
rows = json.loads((ROOT / 'coverage.json').read_text())
names = [r['module'] for r in rows]
assert len(names) == len(set(names)) == 46
assert [r['id'] for r in rows] == list(range(1, 47))
assert names[0] == 'Tortoise' and names[-1] == 'Butterfly'
allowed_dirs = {'.git', '.lake', '.github', 'scripts', '__pycache__'}
assert all(p.is_file() or p.name in allowed_dirs for p in ROOT.iterdir()), 'Unexpected source subdirectory'
lean_files = list(ROOT.glob('*.lean'))
assert {p.stem for p in lean_files} == set(names + ['Core', 'Registry', 'Zoo', 'Main', 'Regression', 'ProofAudit', 'Audit', 'lakefile', 'Extensions', 'ExtensionFixtures', 'SourceRecords'])
imports = re.findall(r'^import (\S+)', (ROOT / 'Zoo.lean').read_text(), re.M)
assert imports == names + ['Registry']
audit = (ROOT / 'ProofAudit.lean').read_text()
for row in rows:
    content = (ROOT / (row['module'] + '.lean')).read_text()
    assert 'namespace ' + row['namespace'] in content
    for theorem in row['theorems']:
        assert re.search(r'^theorem\s+' + re.escape(theorem) + r'\b', content, re.M)
        assert '#print axioms ' + row['namespace'] + '.' + theorem in audit
for path in lean_files:
    content = path.read_text()
    # Conservative lexical screen, not a Lean parser.
    content = re.sub(r'/\-.*?\-/', '', content, flags=re.S)
    content = re.sub(r'--[^\n]*', '', content)
    content = re.sub(r'"(?:\\.|[^"\\])*"', '', content)
    assert not re.search(r'\b(sorry|admit|axiom|unsafe|native_decide)\b', content), path
    for module in re.findall(r'^import (\S+)', content, re.M):
        assert module in {'Std', 'Lake', 'Lean'} or (ROOT / (module + '.lean')).is_file(), module
registry = (ROOT / 'Registry.lean').read_text()
constructors = re.findall(r'^  \| (\w+)$', registry, re.M)
assert constructors == [n.lower() for n in names]
assert 'all.length = 46' in registry
sources = json.loads((ROOT / 'UPSTREAM_SOURCES.json').read_text())
assert {s['name'] for s in sources} == set(names)
source_count = 0
for source in sources:
    row = next(r for r in rows if r['module'] == source['name'])
    assert source['commit'] == row['commit']
    for item in source['files']:
        data = item['content'].encode('utf-8')
        digest = hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()
        assert digest == item['git_blob_sha1'], (source['name'], item['path'])
        source_count += 1
fixtures = json.loads((ROOT / 'reference-fixtures.json').read_text())
runner = (ROOT / 'Regression.lean').read_text()
assert len(fixtures) == 90
assert re.findall(r'^  assert(?:Near|Bool) "([^"]+)"', runner, re.M) == [f['label'] for f in fixtures]
for f in fixtures:
    assert f['label'].split('.')[0] in {n.lower() for n in names}
    assert f['expression'] in runner
    assert f['kind'] == 'near'
    line = next(line for line in runner.splitlines() if '"' + f['label'] + '"' in line)
    actual_literal = re.search(r'\(([-+0-9.eE]+)\)$', line).group(1)
    assert float(actual_literal) == float(f['expected'])
for line in (ROOT / 'MANIFEST_SHA256.txt').read_text().splitlines():
    digest, name = line.split('  ', 1)
    assert '/' not in name
    assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == digest, name
print(f'Static checks passed: 46 animals, {len(fixtures)} fixture entries, {source_count} original source hashes.')
print('This command checks static integrity only. Compiler and runtime evidence is recorded in BUILD_STATUS.md.')
