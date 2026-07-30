import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean

structure CausalInferencePackage where
  causalGraph : Prop
  confoundingControl : Prop
  instrumentalVariable : Prop
  treatmentEffect : Prop
  counterfactualConsistency : Prop

structure CausalInferenceEvidence (C : CausalInferencePackage) where
  causalGraphClosed : C.causalGraph
  confoundingControlClosed : C.confoundingControl
  instrumentalVariableClosed : C.instrumentalVariable
  treatmentEffectClosed : C.treatmentEffect
  counterfactualConsistencyClosed : C.counterfactualConsistency

def CausalInferenceClosed (C : CausalInferencePackage) : Prop :=
  C.causalGraph ∧ C.confoundingControl ∧ C.instrumentalVariable ∧
  C.treatmentEffect ∧ C.counterfactualConsistency

theorem causal_inference_closed_from_evidence
    (C : CausalInferencePackage) (E : CausalInferenceEvidence C) :
    CausalInferenceClosed C := by
  exact And.intro E.causalGraphClosed
    (And.intro E.confoundingControlClosed
      (And.intro E.instrumentalVariableClosed
        (And.intro E.treatmentEffectClosed E.counterfactualConsistencyClosed)))

end MedicineOccupationalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse