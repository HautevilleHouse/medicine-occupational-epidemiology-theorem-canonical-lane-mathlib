import MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EpidemiologySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EpidemiologyAdmittedObject where
  space : EpidemiologySpace
  populationClosed : Prop
  exposureMeasured : Prop
  outcomeModel : Type
  outcomeTopology : TopologicalSpace outcomeModel
  causalEstimand : Prop
  conclusion : causalEstimand

structure EpidemiologyEndgameState where
  object : EpidemiologyAdmittedObject

def EpidemiologyObjectClosed (O : EpidemiologyAdmittedObject) : Prop :=
  O.causalEstimand

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse