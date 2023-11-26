import EuclideanGeometry.Foundation.Index

noncomputable section

namespace EuclidGeom

variable {P : Type _} [EuclideanPlane P]

namespace Wuwowuji_Problem_1_2
/-
Given $AB = DC$, $DB = AC$, Prove that $∠B = ∠ C$.
-/

-- $AB = DC$, $DB = AC$.
variable {A B C D : P} {h₁ : (SEG A B).length = (SEG D C).length} {h₂ : (SEG D B).length = (SEG A C).length}
-- nondegenerate
variable {hnd1 : ¬ colinear D B A} {hnd2 : ¬ colinear A C D}
lemma a_ne_b : A ≠ B := by sorry
lemma a_ne_c : A ≠ C := by sorry
lemma a_ne_d : A ≠ D := by sorry
lemma b_ne_d : B ≠ D := by sorry
lemma c_ne_d : C ≠ D := by sorry
-- State the main goal.
theorem Wuwowuji_Problem_1_2 : ∠ A B D a_ne_b b_ne_d.symm = ∠ D C A c_ne_d.symm a_ne_c ∨ ∠ A B D a_ne_b b_ne_d.symm = -∠ D C A c_ne_d.symm a_ne_c := by
  have h : (TRI_nd D B A hnd1) ≅ (TRI_nd A C D hnd2) ∨ (TRI_nd D B A hnd1) ≅ₐ (TRI_nd A C D hnd2) := by
    apply Triangle_nd.congr_or_acongr_of_SSS
    · calc
        _ = (SEG A B).length := length_of_rev_eq_length'
        _ = (SEG D C).length := h₁
        _ = _ := length_of_rev_eq_length'
    · exact length_of_rev_eq_length'
    · exact h₂
  rcases h with t | t
  · left; exact t.angle₂
  · right; exact t.angle₂

end Wuwowuji_Problem_1_2
