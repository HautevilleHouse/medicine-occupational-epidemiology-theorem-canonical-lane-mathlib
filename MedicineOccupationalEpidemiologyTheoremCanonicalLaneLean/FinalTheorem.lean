import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MedicineOccupationalEpidemiologyAdmittedObject where
  studyPopulation : Type
  studyDesign : Prop
  exposureMeasurement : Prop
  outcomeAssessment : Prop
  confoundingControl : Prop
  conclusion : Prop

structure MedicineOccupationalEpidemiologyAdmissibleClass where
  object : MedicineOccupationalEpidemiologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : MedicineOccupationalEpidemiologyAdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : MedicineOccupationalEpidemiologyAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : MedicineOccupationalEpidemiologyAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MedicineOccupationalEpidemiologyAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedMedicineOccupationalEpidemiologyClosure (A : MedicineOccupationalEpidemiologyAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_medicine_occupational_epidemiology_endgame (A : MedicineOccupationalEpidemiologyAdmissibleClass) :
    ConstrainedMedicineOccupationalEpidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse