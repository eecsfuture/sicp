http://community.schemewiki.org/?sicp-ex-1.13

This is a solution by Phillip Bushee (aka phillbush).

The solution is divided in two proofs, the first one divided in two parts. First, it's proved by induction that Fib(n)=(φⁿ-ψⁿ)/√5, this involves two parts: proving for the base case, and proving for the inductive case. Then, that proof is used to prove that Fib(n) is the closest integer to φⁿ/√5.

The solution uses the ⊦ notation, known as sequent calculus. What is after the ⊦ is what we want to prove. So, for example, ⊦ A means that we want to prove A; we will simplify or apply properties to A during the proof. What comes before the ⊦ are hypotheses that are helpful for our proof. So, for example, H₁ ⊦ A means that we are using the hypothesis H₁ to prove A. We may use ellipsis to omit previous hypotheses. The symbol ⊤ means tautology or truth.

Proof 1, part 1 (base case).

We need to prove that Fib(n)=(φⁿ-ψⁿ)/√5 is valid for n=0 and for n=1.

      ⊦ Fib(0)=(φ⁰-ψ⁰)/√5 ∧ Fib(1)=(φ¹-ψ¹)/√5.
Simplifying both sides of the conjunction.

      ⊦ Fib(0)=0 ∧ Fib(1)=1.
By definition, Fib(0)=0 and Fib(1)=1, so both sides of the conjunction are true.

      ⊦ ⊤ ∧ ⊤.
Simplifying this conjunction, we prove this part.

      ⊦ ⊤.
Proof 1, part 2 (inductive case).

Let k be a natural number. We are given the two inductive hypothesis H₁ and H₂, and we need to prove that Fib(n) = (φⁿ-ψⁿ)/√5 is valid for n=k+2.

      k:ℕ;
      H₁:Fib(k) = (φᵏ-ψᵏ)/√5;
      H₂:Fib(k+1) = (φᵏ⁺¹-ψᵏ⁺¹)/√5
      ⊦ Fib(k+2) = (φᵏ⁺²-ψᵏ⁺²)/√5.
By the definition of Fib on the goal, we know that Fib(k+2) is equal to Fib(k) + Fib(k+1). We can rewrite the goal with this fact.

      … ⊦ Fib(k) + Fib(k+2) = (φᵏ⁺²-ψᵏ⁺²)/√5.
We can rewrite the goal with the hypotheses H₁ and H₂.

      … ⊦ (φᵏ-ψᵏ)/√5 + (φᵏ⁺¹-ψᵏ⁺¹)/√5 = (φᵏ⁺²-ψᵏ⁺²)/√5.
We can simplify the left side of the equation on the goal.

      … ⊦ (φᵏ(φ+1) - ψᵏ(ψ+1))/√5 = (φᵏ⁺²-ψᵏ⁺²)/√5.
As declared in page 38, φ is the golden ratio, the only positive solution to the equation x²=x+1. The ψ constant also share that property, being the only negative solution to that equation. We can apply this equation to φ and to ψ:

      … ⊦ (φᵏ·φ² - ψᵏ·ψ²)/√5 = (φᵏ⁺²-ψᵏ⁺²)/√5.
We can simplify the left side of the equation on the goal.

      … ⊦ (φᵏ⁺² - ψᵏ⁺²)/√5 = (φᵏ⁺²-ψᵏ⁺²)/√5.
Both sides of the equation on the goal are equal. We achieved truth.

      … ⊦ ⊤.
Proof 2.

Now that we proved that Fib(n)=(φⁿ-ψⁿ)/√5, we can use this fact as hypothesis H₁ to prove that Fib(n) is the closest integer to φⁿ/√5. Formally, we want to prove that the absolute value of Fib(n) minus φⁿ/√5 is less than 1/2, for all n natural.

      n:ℕ;
      H₁:Fib(n)=(φⁿ-ψⁿ)/√5
      ⊦ |Fib(n) - φⁿ/√5| < 1/2.
We can rewrite Fib(n) on the goal with the hypothesis H₁.

      … ⊦ |(φⁿ-ψⁿ)/√5 - φⁿ/√5| < 1/2.
We can simplify the left side of the inequality on the goal.

      … ⊦ |ψⁿ|/√5 < 1/2.
We can then apply the definition of ψ.

      … ⊦ |((1-√5)/2)ⁿ|/√5 < 1/2.
We can simplify the left side of the inequality on the goal.

      … ⊦ ((√5-1)/2)ⁿ/√5 < 1/2.
We can add another hypothesis (H₂) for the fact that √5<3.

      …; H₂:√5<3 ⊦ ((√5-1)/2)ⁿ/√5 < 1/2.
We can subtract both sides of the inequality in the hypothesis H₂ by one, then divide both sides by two, raise both sides to the n-th power, and multiply both sides by 1/√5.

      …; H₂:1/√5 × ((√5-1)/2)ⁿ < 1/√5 ⊦ ((√5-1)/2)ⁿ/√5 < 1/2.
It's a fact that 1/√5 < 1/2, we can apply this fact to H₂.

      …; H₂:((√5-1)/2)ⁿ/√5 < 1/√5 < 1/2 ⊦ ((√5-1)/2)ⁿ/√5 < 1/2.
We can fold the double inequality in H₂ by removing the middle part.

      …; H₂:((√5-1)/2)ⁿ/√5 < 1/2 ⊦ ((√5-1)/2)ⁿ/√5 < 1/2.
The hypothesis H₂ is exactly what we want to prove, we achieved the truth by redundancy.

      … ⊦ ⊤.
QED.