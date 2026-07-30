import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure ExposureModel where
  exposureVariable : String
  exposureMetric : Type u
  timeWeightedAverage : Prop
  peakExposure : Prop
  cumulativeExposure : Prop

structure ExposureEvidence (M : ExposureModel) where
  timeWeightedAverageClosed : M.timeWeightedAverage
  peakExposureClosed : M.peakExposure
  cumulativeExposureClosed : M.cumulativeExposure

def ExposureClosed (M : ExposureModel) : Prop :=
  M.timeWeightedAverage ∧ M.peakExposure ∧ M.cumulativeExposure

theorem exposure_closed_from_evidence (M : ExposureModel) (E : ExposureEvidence M) : ExposureClosed M := by
  exact And.intro E.timeWeightedAverageClosed (And.intro E.peakExposureClosed E.cumulativeExposureClosed)

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse