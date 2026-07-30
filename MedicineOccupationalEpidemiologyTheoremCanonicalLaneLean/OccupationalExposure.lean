import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure OccupationalExposurePackage where
  exposureAssessment : Prop
  exposureResponseRelation : Prop
  exposureLimit : Prop
  exposureControl : Prop
  exposureMonitoring : Prop

structure OccupationalExposureEvidence (O : OccupationalExposurePackage) where
  exposureAssessmentClosed : O.exposureAssessment
  exposureResponseRelationClosed : O.exposureResponseRelation
  exposureLimitClosed : O.exposureLimit
  exposureControlClosed : O.exposureControl
  exposureMonitoringClosed : O.exposureMonitoring

def OccupationalExposureClosed (O : OccupationalExposurePackage) : Prop :=
  O.exposureAssessment ∧ O.exposureResponseRelation ∧ O.exposureLimit ∧ O.exposureControl ∧ O.exposureMonitoring

theorem occupational_exposure_closed_from_evidence (O : OccupationalExposurePackage) (E : OccupationalExposureEvidence O) : OccupationalExposureClosed O := by
  exact And.intro E.exposureAssessmentClosed
    (And.intro E.exposureResponseRelationClosed
      (And.intro E.exposureLimitClosed
        (And.intro E.exposureControlClosed E.exposureMonitoringClosed)))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse