import MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : EpidemiologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EpidemiologyObjectClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse