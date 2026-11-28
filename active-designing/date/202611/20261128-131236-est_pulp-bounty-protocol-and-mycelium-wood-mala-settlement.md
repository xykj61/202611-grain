# Pulp Bounty Protocol and Mycelium WOOD/MALA Settlement

**Language:** EN
**Stamp:** `20261128.131236` (EST)
**Voice:** Reya (Teacher + Radiant)
**Style:** Gauge at Bench (`0.0%` prose negation)
**Room:** vision (advancing toward checkable)
**Silo Technique:** Gratitude to DJINN and the MOX network for
their fair-ordering beacon design, sealed-until-ordered execution,
and verifiable batch commitment. Every principle distilled through
the silo clean room and dressed wholly in Grain's own vocabulary.
**Siloed from:** `gratitude/djinn-and-mox-network.md` (to be written)
**Runs on:** Comlink Mycelium over Pond, settled in WOOD/MALA
through Dimeroll, surfaced in Pulp boards on Vantage Station
and Vantage Carry

---

*Dear friend, come sit beside me for a moment.*

*What follows is a design for how honest work on a Pulp board
finds honest reward -- how a task completed by a constellation
of people across galaxies settles fairly, verifiably, and
without anyone buying position in the queue.*

---

## The Problem Pulp Bounties Solve

A Pulp board holds cards. Cards move through columns. When a
card reaches its final column, the work is done. But who did
the work, and how does the board reward them?

Today, Dimeroll handles double-entry MALA transfers with
`sum(nets) == 0` conservation. HearthGrants flow from patrons
to creators through the same ledger. But there is no mechanism
for a board to say: "This card carries a bounty of 500 WOOD.
When the card is complete and witnessed GREEN, the bounty
settles to the people who did the work, in proportion to their
verified contributions."

That is what this protocol provides.

---

## Design Principles (Dressed in Grain's Own Cloth)

### 1. Fair Ordering Through Mycelium Beacon

When multiple contributors complete work on the same card in
the same epoch, the settlement order is determined by the
Mycelium round seed -- a value nobody knows before the
commitment is fixed.

This is inspired by MOX's sealed-until-ordered execution and
per-commit random beacon. In Grain's vocabulary: each Mycelium
gossip round carries a `round_seed` derived from the threshold
of participating council seats. The seed is computed after the
round's ballot box merges, so no contributor can predict their
settlement position before their work is committed.

The seed is publicly verifiable through `chain_verify_seed` on
the Mycelium weave, using the council's group key. Anyone can
check that the ordering was fair.

### 2. Sealed Contributions Until Witnessed

A contributor's claim on a bounty stays sealed (encrypted to
the board's council threshold key) until a witness proves the
card's work is GREEN. This prevents front-running: nobody can
see who else is working on a bounty card until the work is
verified and the settlement round opens.

In practice: a contributor submits a sealed `BountyClaimFact`
to the card's feed. The fact contains their Kumara identity,
their contribution description, and their proposed share. The
fact is Blaze content-addressed but its body is encrypted. When
the card's witness passes GREEN, the round's beacon seed
decrypts all sealed claims, and the settlement runs in the
order the beacon determines.

### 3. Conserved Settlement Through Dimeroll

A bounty is a `BountyEscrow` -- a Dimeroll double-entry hold
that moves WOOD from the patron's balance to an escrow account
when the bounty is posted. The escrow is locked: the WOOD
cannot move until the card is witnessed GREEN or the bounty
is cancelled by the patron.

On settlement, the escrow splits according to the verified
contribution shares. Each split is a Dimeroll double-entry
transfer from the escrow account to the contributor's galaxy
balance. `sum(nets) == 0` holds across the entire settlement.
The patron receives a portable receipt (a Blaze fact in the
feed) showing exactly where their WOOD went.

### 4. Constellation Task Topology

A bounty card can be assigned to a **constellation** -- a
subset of the 405 council seats that form a working group.
The constellation is defined by the board's visibility fence
(Pond capability) and defaults to the board's galaxy.

The 405-seat council topology (`15 galaxies x 3 stars x 9
planets`) is the default, but the protocol accepts any
topology that implements the `TopologyProvider` interface:
a function from seat count to galaxy/star/planet coordinates.
This keeps the bounty protocol configurable without breaking
the conservation law.

### 5. WOOD as Provenance Unit, MALA as Settlement Unit

WOOD is the ecological provenance unit -- embodied carbon,
biocyclic harvest checks, honest consensus rounds. MALA is
the internal settlement unit that Dimeroll uses for double-
entry accounting.

The bounty protocol operates in WOOD. Dimeroll settles in
MALA. The bridge between them is `wood_weave_bridge.rye`,
which maintains exact supply conservation across up to 8
independent Blaze weaves. A bounty posted in WOOD is held
in MALA escrow at the current WOOD/MALA parity (initially
1:1), and settled back to WOOD on completion.

This is configured once and single-stranded: one token model,
one bridge, one conservation law. Sameness is the macro.

---

## The Bounty Lifecycle

### Step 1: Post a Bounty

A patron opens a Pulp card and attaches a bounty:

```
BountyEscrow {
    board_id:    BoardId,
    card_id:     CardId,
    patron:      KumaraIdentity,
    amount_wood: u64,
    topology:    TopologyId (default: council_405),
    witness_req: WitnessRequirement,
    deadline_ms: u64 (One-Clock timestamp),
    sealed:      true,
}
```

The WOOD moves from the patron's galaxy balance to the
escrow account via Dimeroll. A `bounty_posted` feed entry
lands in the card's Social Feed.

### Step 2: Claim Work (Sealed)

Contributors submit sealed claims:

```
BountyClaimFact {
    card_id:      CardId,
    contributor:  KumaraIdentity,
    description:  [128]u8 (sealed),
    share_basis:  u16 (basis points, sealed),
    blaze_sha3:   [32]u8,
}
```

Each claim is Blaze content-addressed and encrypted to the
board's council threshold key. Claims accumulate in the feed
as sealed entries. Nobody -- not even the patron -- can see
the claims until the witness round.

### Step 3: Witness GREEN

The card's witness requirement fires. If the witness passes
GREEN, the settlement round opens. The round's Mycelium
beacon seed decrypts all sealed claims. The claims are ordered
by the beacon and their share_basis values are normalized to
sum to 10,000 basis points (100%).

### Step 4: Settle

Each contributor receives their share of the escrowed WOOD:

```
for each claim in beacon_ordered_claims:
    share_wood = escrow.amount_wood * claim.share_basis / 10000
    dimeroll.transfer(escrow_acct, claim.contributor, share_wood)
    feed.append(settlement_receipt)
```

`sum(nets) == 0` holds. The patron's receipt shows every split.
Every contributor's receipt shows their share. The beacon seed
is verifiable. The ordering is fair.

### Step 5: Cancel (If Deadline Passes)

If the deadline passes without a GREEN witness, the patron
can cancel. The WOOD returns from escrow to the patron's
galaxy balance. A `bounty_cancelled` feed entry lands. The
sealed claims are never decrypted -- the contributors'
privacy is preserved.

---

## What We Carry from MOX (Through the Silo)

| MOX Pattern | Grain Vocabulary | Where It Lives |
|---|---|---|
| Per-commit random beacon | Mycelium `round_seed` from council threshold | `council_mycelium_weave.rye` |
| Sealed-until-ordered execution | `BountyClaimFact` encrypted to council key | `pulp_bounty.rye` |
| Verifiable ordering | `chain_verify_seed` on Mycelium weave | `council_mycelium_weave.rye` |
| Batch settlement | Dimeroll multi-transfer with `sum(nets) == 0` | `dimeroll_market.rye` |
| Uniform-price clearing | Normalized basis-point shares across all claims | `pulp_bounty.rye` |
| Sponsor-pays fees | HearthGrant patron covers settlement overhead | `wood_token.rye` |
| No paid priority | Beacon-determined order, no position market | Protocol invariant |

We do NOT carry: MOX's MUR token (DJINN and Keaton will
collaborate on MOX validator software separately), MOX's
WebAssembly contract model (Grain uses Rye + Glow), or MOX's
gateway architecture (Grain uses Pond + Comlink).

---

## What We Already Have (Foundations)

| Module | Role in Bounty Protocol |
|---|---|
| `wood_token.rye` | 15-galaxy conserved WOOD ledger |
| `wood_weave_bridge.rye` | Cross-weave WOOD supply conservation |
| `council_405.rye` | 405-seat council with 243/324 quorum thresholds |
| `council_mycelium_weave.rye` | CRDT gossip merge for offline ballot boxes |
| `vantage_mutations.rye` | Dimeroll double-entry with `sum(nets) == 0` |
| `pulp_board.rye` | Board/card data model (just seeded) |
| `pulp_feed.rye` | Append-only Blaze chain feed (just seeded) |
| `kumara.rye` | Cryptographic identity for contributors |
| `pond_sanctuary_airlock.rye` | Capability fences for board visibility |

---

## Implementation Path

The bounty protocol is the third leg of Pulp's three features:
Living Board (seeded), Social Feed (seeded), Civic Canvas
(this protocol). It infuses into the existing Pulp husk project
at `active-husk/date/202611/00/20261128-123702-est_pulp-
living-board-social-feed-and-civic-canvas/`.

Concrete next steps:

1. `modules/vantage/pulp/pulp_bounty.rye` -- bounty escrow,
   sealed claim, settlement, and cancellation data models
   with TAME bounds and paired welcome/refusal witnesses.
2. `modules/vantage/pulp/glow/fold-pulp-bounty.glow` -- the
   Glow fold that steps the bounty state machine through
   post / claim / witness / settle / cancel transitions.
3. Extend `council_mycelium_weave.rye` with `round_seed`
   derivation from merged ballot threshold (the fair-ordering
   beacon).
4. Extend `pulp_feed.rye` with `bounty_posted`, `bounty_claimed`
   (sealed), `bounty_settled`, and `bounty_cancelled` entry
   kinds.
5. Gratitude entry for DJINN and MOX network.

---

*Dear friend, every honest bounty is a promise kept in
daylight. The beacon shuffles the queue so nobody cuts the
line. The escrow holds the WOOD so nobody breaks the promise.
The receipt travels the whole distance so the patron sees
exactly where their generosity landed.*

*May every task find its bounty, every bounty find its workers,
and every settlement land as fairly as the seed that ordered
it.*
