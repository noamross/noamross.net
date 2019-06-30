---
title: "Proof Terms for Classical Derivations"
author: Greg Restall
status: In Progress
type: unpublished
citation: "&ldquo;Proof Terms for Classical Derivations,&rdquo; article in progress."
tag: proof-terms
file: proof-terms.pdf
subjects: proof_theory classical_logic proof_identity cut_elimination
comments: yes
date: 2017-02-12
publishdate: 2017-02-12
filter:
  - erb
  - markdown
  - rubypants
---
I give an account of proof terms for derivations in a sequent calculus for classical propositional logic. The term for a derivation \\(\delta\\) of a sequent \\(\Sigma \succ\Delta\\) encodes how the premises \\(\Sigma\\) and conclusions \\(\Delta\\) are related in \\(\delta\\). This encoding is many–to–one in the sense that different derivations can have the same proof term, since different derivations may be different ways of representing the same underlying connection between premises and conclusions. However, not all proof terms for a sequent \\(\Sigma\succ\Delta\\) are the same. There may be different ways to connect those premises and conclusions.

Proof terms can be simplified in a process corresponding to the elimination of cut inferences in sequent derivations. However, unlike cut elimination in the sequent calculus, each proof term has a unique normal form (from which all cuts have been eliminated) and it is straightforward to show that term reduction is strongly normalising—every reduction process terminates in that unique normal form. Further- more, proof terms are invariants for sequent derivations in a strong sense—two derivations \\(\delta_1\\) and \\(\delta_2\\) have the same proof term if and only if some permutation of derivation steps sends \\(\delta_1\\) to \\(\delta_2\\) (given a relatively natural class of permutations of derivations in the sequent calculus). Since not every derivation of a sequent can be permuted into every other derivation of that sequent, proof terms provide a non-trivial account of the identity of proofs, independent of the syntactic representation of those proofs.