import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure DiagnosticTestEvaluation where
  sensitivity : ℝ
  specificity : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  areaUnderROC : ℝ
  testValid : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestEvaluation) where
  sensitivityInRange : 0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1
  specificityInRange : 0 ≤ D.specificity ∧ D.specificity ≤ 1
  positivePredictiveValueInRange : 0 ≤ D.positivePredictiveValue ∧ D.positivePredictiveValue ≤ 1
  negativePredictiveValueInRange : 0 ≤ D.negativePredictiveValue ∧ D.negativePredictiveValue ≤ 1
  areaUnderROCValid : 0.5 ≤ D.areaUnderROC ∧ D.areaUnderROC ≤ 1
  testValidClosed : D.testValid

def DiagnosticTestClosed (D : DiagnosticTestEvaluation) : Prop :=
  (0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1) ∧
  (0 ≤ D.specificity ∧ D.specificity ≤ 1) ∧
  (0 ≤ D.positivePredictiveValue ∧ D.positivePredictiveValue ≤ 1) ∧
  (0 ≤ D.negativePredictiveValue ∧ D.negativePredictiveValue ≤ 1) ∧
  (0.5 ≤ D.areaUnderROC ∧ D.areaUnderROC ≤ 1) ∧
  D.testValid

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestEvaluation) (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.sensitivityInRange
    (And.intro E.specificityInRange
      (And.intro E.positivePredictiveValueInRange
        (And.intro E.negativePredictiveValueInRange
          (And.intro E.areaUnderROCValid E.testValidClosed))))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse