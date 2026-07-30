import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure AttributableRisk where
  exposedGroupSize : ℕ
  unexposedGroupSize : ℕ
  exposedCases : ℕ
  unexposedCases : ℕ
  relativeRisk : ℝ
  attributableFraction : ℝ
  riskDifference : ℝ

structure AttributableRiskEvidence (A : AttributableRisk) where
  countsNonNegative : A.exposedCases ≥ 0 ∧ A.unexposedCases ≥ 0 ∧ A.exposedGroupSize > 0 ∧ A.unexposedGroupSize > 0
  relativeRiskComputed : A.relativeRisk = (A.exposedCases.toℝ / A.exposedGroupSize.toℝ) / (A.unexposedCases.toℝ / A.unexposedGroupSize.toℝ)
  attributableFractionComputed : A.attributableFraction = (A.relativeRisk - 1) / A.relativeRisk
  riskDifferenceComputed : A.riskDifference = (A.exposedCases.toℝ / A.exposedGroupSize.toℝ) - (A.unexposedCases.toℝ / A.unexposedGroupSize.toℝ)

def AttributableRiskClosed (A : AttributableRisk) : Prop :=
  (A.exposedCases ≥ 0 ∧ A.unexposedCases ≥ 0 ∧ A.exposedGroupSize > 0 ∧ A.unexposedGroupSize > 0) ∧
  A.relativeRisk = (A.exposedCases.toℝ / A.exposedGroupSize.toℝ) / (A.unexposedCases.toℝ / A.unexposedGroupSize.toℝ) ∧
  A.attributableFraction = (A.relativeRisk - 1) / A.relativeRisk ∧
  A.riskDifference = (A.exposedCases.toℝ / A.exposedGroupSize.toℝ) - (A.unexposedCases.toℝ / A.unexposedGroupSize.toℝ)

theorem attributable_risk_closed_from_evidence (A : AttributableRisk) (E : AttributableRiskEvidence A) : AttributableRiskClosed A := by
  exact And.intro E.countsNonNegative
    (And.intro E.relativeRiskComputed
      (And.intro E.attributableFractionComputed E.riskDifferenceComputed))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse