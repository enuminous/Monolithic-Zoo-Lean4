import copy
import unittest
from alternative_report import load_policy, report

POLICY, DIGEST = load_policy()
NAMES = POLICY["animals"]


def evidence(status="PASS", **kwargs):
    return {"status": status, "basis": "observed", "evidence": ["fixture://test-only"], **kwargs}


def claim(cid="A", **kwargs):
    return {"id": cid, "target": "fixture://not-a-real-audit", "obligation_inventory_complete": True,
            "results": {a: evidence() for a in NAMES}, **kwargs}


def run(*claims):
    return report({"claims": list(claims)}, POLICY, DIGEST)["claims"]


class LimiterTests(unittest.TestCase):
    def test_all_fail_cannot_establish(self):
        c = claim(results={a: evidence("FAIL") for a in NAMES})
        r = run(c)[0]
        self.assertEqual(r["fractions"]["d"]["numerator"], 46)
        self.assertEqual(r["propagated_status"], "QUALIFIED")
        self.assertIn("FAILURE_VETO", r["reasons"])

    def test_missing_outputs_have_fixed_denominator(self):
        r = run(claim(results={}))[0]
        self.assertEqual(r["counts"]["UNRESOLVED"], 46)
        self.assertEqual(len(r["results"]), 46)
        self.assertEqual(r["fractions"]["u"], {"numerator": 46, "denominator": 46})

    def test_na_requires_applicability_evidence(self):
        c = claim()
        c["results"][NAMES[0]] = evidence("N/A", basis="missing_evidence", reason="No labels")
        r = run(c)[0]
        self.assertEqual(r["counts"]["UNRESOLVED"], 1)
        self.assertEqual(r["counts"]["N/A"], 0)

    def test_documented_na_stays_in_denominator(self):
        c = claim()
        for a in NAMES[:10]:
            c["results"][a] = evidence("N/A", basis="inapplicable", reason="Fixture scope excludes operation")
        r = run(c)[0]
        self.assertEqual(r["counts"]["N/A"], 10)
        self.assertEqual(r["propagated_status"], "QUALIFIED")
        self.assertIn("DETERMINED_BELOW_THRESHOLD", r["reasons"])

    def test_unresolved_threshold_boundary(self):
        for count, expected in [(4, "ESTABLISHED"), (5, "QUALIFIED")]:
            c = claim()
            for a in NAMES[:count]:
                c["results"][a] = evidence("UNRESOLVED")
            self.assertEqual(run(c)[0]["local_status"], expected)

    def test_mandatory_missing_blocks_all_pass(self):
        r = run(claim(mandatory_obligations=["BIANCHI"]))[0]
        self.assertEqual(r["counts"]["PASS"], 46)
        self.assertEqual(r["obligations"]["BIANCHI"]["status"], "UNRESOLVED")
        self.assertEqual(r["propagated_status"], "QUALIFIED")

    def test_chain_propagates_and_reports_descendants(self):
        a = claim("A", results={})
        b = claim("B", dependencies=["A"])
        c = claim("C", dependencies=["B"])
        rows = {r["id"]: r for r in run(c, b, a)}
        self.assertEqual(rows["C"]["local_status"], "ESTABLISHED")
        self.assertEqual(rows["C"]["propagated_status"], "QUALIFIED")
        self.assertEqual(rows["A"]["affected_descendants"], ["B", "C"])

    def test_missing_dependencies_and_cycles_fail_closed(self):
        rows = run(claim("A", dependencies=["B"]), claim("B", dependencies=["A"]),
                   claim("C", dependencies=["A"]), claim("D", dependencies=["missing"]),
                   claim("E", dependencies=["E"]))
        self.assertTrue(all(r["propagated_status"] == "QUALIFIED" for r in rows))
        self.assertIn("UNSUPPORTED_REQUIRED_CYCLE", rows[2]["reasons"])
        self.assertEqual(rows[3]["blockers"]["missing_dependencies"], ["missing"])

    def test_pass_without_evidence_cannot_be_determined(self):
        c = claim(results={a: {"status": "PASS"} for a in NAMES})
        self.assertEqual(run(c)[0]["counts"]["UNRESOLVED"], 46)

    def test_undocumented_failure_cannot_be_laundered_into_optional_gap(self):
        c = claim()
        c["results"][NAMES[0]] = {"status": "FAIL"}
        r = run(c)[0]
        self.assertEqual(r["counts"]["UNRESOLVED"], 1)
        self.assertEqual(r["local_status"], "QUALIFIED")
        self.assertIn("UNDOCUMENTED_FAILURE_REQUIRES_ADJUDICATION", r["reasons"])

    def test_unknown_status_animal_and_duplicate_claim_rejected(self):
        for c in [claim(results={"invented": evidence()}), claim(results={NAMES[0]: evidence("MAYBE")})]:
            with self.assertRaises(ValueError):
                run(c)
        with self.assertRaises(ValueError):
            run(claim(), claim())

    def test_unresolved_to_pass_monotonic_and_fail_never_improves(self):
        for unresolved in range(1, 47):
            c = claim()
            for a in NAMES[:unresolved]:
                c["results"][a] = evidence("UNRESOLVED")
            before = run(c)[0]["propagated_status"]
            passed, failed = copy.deepcopy(c), copy.deepcopy(c)
            passed["results"][NAMES[0]] = evidence()
            failed["results"][NAMES[0]] = evidence("FAIL")
            if before == "ESTABLISHED":
                self.assertEqual(run(passed)[0]["propagated_status"], "ESTABLISHED")
            self.assertEqual(run(failed)[0]["propagated_status"], "QUALIFIED")

    def test_inventory_gap_and_obligation_na_block(self):
        self.assertEqual(run(claim(obligation_inventory_complete=False))[0]["local_status"], "QUALIFIED")
        c = claim(mandatory_obligations=["M"], obligations={"M": evidence("N/A", basis="inapplicable", reason="Not done")})
        self.assertEqual(run(c)[0]["local_status"], "QUALIFIED")


if __name__ == "__main__":
    unittest.main()
