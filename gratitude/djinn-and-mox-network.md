# Gratitude: DJINN and the MOX Network

**Stamp:** `20261128.131236` (EST)

Thank you to DJINN and the MOX network for the following
design patterns that inspired Grain's Pulp Bounty Protocol:

1. **Per-commit random beacon:** MOX derives a threshold BLS
   signature per round that nobody knows before the commit is
   fixed. This inspired Grain's Mycelium `round_seed` for
   fair ordering of bounty settlement.

2. **Sealed-until-ordered execution:** MOX encrypts
   transactions to the committee's threshold key until
   ordering is final. This inspired Grain's sealed
   `BountyClaimFact` entries that stay encrypted until the
   card's witness passes GREEN.

3. **Verifiable batch commitment:** MOX publishes every seed
   for public verification using the chain's group key. This
   inspired Grain's `chain_verify_seed` on the Mycelium
   weave.

4. **No paid priority:** MOX shuffles contended batches by
   the beacon seed rather than selling position. This
   inspired Grain's protocol invariant that beacon-determined
   order has no position market.

5. **Sponsor-pays model:** MOX's fee tanks and sponsors allow
   one party to pay fees for another. This reinforced Grain's
   HearthGrant patron model where the bounty poster covers
   settlement overhead.

6. **Evidence-labeled measurements:** MOX's compare page tags
   every number with its evidence kind (OBS, TEST, LAB, SIM,
   CLAIM, TARGET, DOC, NP). This resonates with Grain's
   Two Rooms distinction between checkable claims and vision.

Every principle was distilled through the silo clean room and
dressed wholly in Grain's own vocabulary (WOOD/MALA, Mycelium,
Dimeroll, Kumara, Blaze, Pond). MOX's MUR token is not used
on Grain; DJINN and Keaton will collaborate separately on what
the MOX validator software should be.
