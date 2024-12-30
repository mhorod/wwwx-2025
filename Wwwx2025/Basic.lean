import Mathlib.Data.Set.Basic
import Mathlib.Order.SetNotation

-- Simple function
def hello := "world"


-- Simple theorem using basic lean
theorem two_plus_two_is_four : 2 + 2 = 4 :=
  rfl -- rfl states that x = x is true for any x


-- Simple theorem using mathlib
theorem empty_set_subset_of_any_set :
    ∀ {α : Type} (s : Set α), ∅ ⊆ s := by
  intro α s -- introduce variables under ∀ quantifier
  -- expand (∅ ⊆ s) to ∀ x, x ∈ ∅ → x ∈ s
  intro x  -- introduce x under quantifier
  intro x_mem_empty -- introduce left side of implication

  -- The rest of proof is done by contradiction
  by_contra x_not_mem_s -- assume that x ∉ s and get False somehow
  have x_not_mem_empty : x ∉ ∅ := Set.not_mem_empty x -- Mathlib has a lemma for this
  exact x_not_mem_empty x_mem_empty -- combine x ∉ ∅ and x ∈ ∅ to get False
