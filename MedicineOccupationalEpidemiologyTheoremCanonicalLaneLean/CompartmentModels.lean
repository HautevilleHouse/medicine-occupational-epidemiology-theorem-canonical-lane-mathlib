import MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean.PharmacokineticsPackage

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModelsPackage {P : PharmacokineticsPackage} where
  centralCompartment : Prop
  peripheralCompartments : List Prop
  absorptionRate : Prop
  eliminationRate : Prop
  compartmentTransfer : Prop
  doseInput : Prop
  concentrationMeasurement : Prop

structure CompartmentModelsEvidence {P : PharmacokineticsPackage} (C : CompartmentModelsPackage P) where
  centralCompartmentClosed : C.centralCompartment
  peripheralCompartmentsClosed : C.peripheralCompartments.foldr (fun a b => a ∧ b) True
  absorptionRateClosed : C.absorptionRate
  eliminationRateClosed : C.eliminationRate
  compartmentTransferClosed : C.compartmentTransfer
  doseInputClosed : C.doseInput
  concentrationMeasurementClosed : C.concentrationMeasurement

def CompartmentModelsClosed {P : PharmacokineticsPackage} (C : CompartmentModelsPackage P) : Prop :=
  C.centralCompartment ∧
  (C.peripheralCompartments.foldr (fun a b => a ∧ b) True) ∧
  C.absorptionRate ∧ C.eliminationRate ∧ C.compartmentTransfer ∧
  C.doseInput ∧ C.concentrationMeasurement

theorem compartment_models_closed_from_evidence
    {P : PharmacokineticsPackage} (C : CompartmentModelsPackage P)
    (E : CompartmentModelsEvidence C) : CompartmentModelsClosed C := by
  exact And.intro E.centralCompartmentClosed
    (And.intro E.peripheralCompartmentsClosed
      (And.intro E.absorptionRateClosed
        (And.intro E.eliminationRateClosed
          (And.intro E.compartmentTransferClosed
            (And.intro E.doseInputClosed E.concentrationMeasurementClosed)))))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse