import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Prop
  survivalFunction : Prop
  medianSurvivalTime : Prop
  proportionalHazards : Prop
  censoringMechanism : Prop
  kaplanMeierEstimator : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  medianSurvivalTimeClosed : S.medianSurvivalTime
  proportionalHazardsClosed : S.proportionalHazards
  censoringMechanismClosed : S.censoringMechanism
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.medianSurvivalTime ∧
  S.proportionalHazards ∧ S.censoringMechanism ∧ S.kaplanMeierEstimator

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.medianSurvivalTimeClosed
        (And.intro E.proportionalHazardsClosed
          (And.intro E.censoringMechanismClosed E.kaplanMeierEstimatorClosed))))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse