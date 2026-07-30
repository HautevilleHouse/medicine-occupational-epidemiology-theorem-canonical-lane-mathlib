import MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def epidemiologyProjection : Projection EpidemiologyEndgameState :=
  { toFun := fun x => x,
    idempotent := by intro x; rfl
  }

theorem epidemiology_projection_idempotent (x : EpidemiologyEndgameState) :
    epidemiologyProjection.toFun (epidemiologyProjection.toFun x) = epidemiologyProjection.toFun x := by
  exact epidemiologyProjection.idempotent x

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse