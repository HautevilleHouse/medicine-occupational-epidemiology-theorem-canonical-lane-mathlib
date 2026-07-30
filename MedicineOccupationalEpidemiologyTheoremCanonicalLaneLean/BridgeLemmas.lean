import MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EpidemiologyObjectClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse