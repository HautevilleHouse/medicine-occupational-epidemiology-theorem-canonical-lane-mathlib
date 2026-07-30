import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  exposedPopulation : Type
  latentPeriod : Prop
  infectiousPeriod : Prop
  removalRate : Prop
  basicReproductiveNumber : Prop
  equilibrium : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  exposedPopulationClosed : C.exposedPopulation
  latentPeriodClosed : C.latentPeriod
  infectiousPeriodClosed : C.infectiousPeriod
  removalRateClosed : C.removalRate
  basicReproductiveNumberClosed : C.basicReproductiveNumber
  equilibriumClosed : C.equilibrium

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.exposedPopulation ∧ C.latentPeriod ∧ C.infectiousPeriod ∧
  C.removalRate ∧ C.basicReproductiveNumber ∧ C.equilibrium

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.exposedPopulationClosed
    (And.intro E.latentPeriodClosed
      (And.intro E.infectiousPeriodClosed
        (And.intro E.removalRateClosed
          (And.intro E.basicReproductiveNumberClosed E.equilibriumClosed))))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse