import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure PharmacokineticPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  halfLife : Prop
  steadyStateConcentration : Prop
  doseResponse : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  halfLifeClosed : P.halfLife
  steadyStateConcentrationClosed : P.steadyStateConcentration
  doseResponseClosed : P.doseResponse

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧
  P.halfLife ∧ P.steadyStateConcentration ∧ P.doseResponse

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.halfLifeClosed
          (And.intro E.steadyStateConcentrationClosed E.doseResponseClosed))))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse