import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure CohortStudyDesign where
  cohortSize : ℕ
  followUpPeriod : ℝ
  exposureAssessment : String
  outcomeDefinition : String
  confoundingVariables : List String
  studyValid : Prop

structure CohortStudyEvidence (C : CohortStudyDesign) where
  cohortSizePositive : C.cohortSize > 0
  followUpPeriodPositive : C.followUpPeriod > 0
  exposureAssessmentDefined : C.exposureAssessment ≠ ""
  outcomeDefined : C.outcomeDefinition ≠ ""
  studyValidClosed : C.studyValid

def CohortStudyClosed (C : CohortStudyDesign) : Prop :=
  C.cohortSize > 0 ∧ C.followUpPeriod > 0 ∧
  C.exposureAssessment ≠ "" ∧ C.outcomeDefinition ≠ "" ∧ C.studyValid

theorem cohort_study_closed_from_evidence (C : CohortStudyDesign) (E : CohortStudyEvidence C) : CohortStudyClosed C := by
  exact And.intro E.cohortSizePositive
    (And.intro E.followUpPeriodPositive
      (And.intro E.exposureAssessmentDefined
        (And.intro E.outcomeDefined E.studyValidClosed)))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse