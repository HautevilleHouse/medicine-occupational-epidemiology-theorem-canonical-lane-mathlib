import MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean.EpidemiologyFoundation

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure PharmacokineticsPackage where
  absorptionModel : Type u
  distributionModel : Type v
  metabolismModel : Type w
  excretionModel : Type x
  doseRegimen : Prop
  concentrationTimeCourse : Prop
  bioavailability : Prop
  clearance : Prop

structure PharmacokineticsEvidence (P : PharmacokineticsPackage) where
  doseRegimenClosed : P.doseRegimen
  concentrationTimeCourseClosed : P.concentrationTimeCourse
  bioavailabilityClosed : P.bioavailability
  clearanceClosed : P.clearance

def PharmacokineticsClosed (P : PharmacokineticsPackage) : Prop :=
  P.doseRegimen ∧ P.concentrationTimeCourse ∧ P.bioavailability ∧ P.clearance

theorem pharmacokinetics_closed_from_evidence (P : PharmacokineticsPackage)
    (E : PharmacokineticsEvidence P) : PharmacokineticsClosed P := by
  exact And.intro E.doseRegimenClosed
    (And.intro E.concentrationTimeCourseClosed
      (And.intro E.bioavailabilityClosed E.clearanceClosed))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse