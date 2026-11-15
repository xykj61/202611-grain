# 06 -- Two Macs Talking Across the Room (`comlink` P2P Chat SLC)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 05](05-your-sovereign-name-card.md).

---

## 1. How Comlink Carries a Turn Safely

When you send a message across Wi-Fi or the internet in **`modules/comlink/`**, your words travel inside a fixed-size encrypted **112-byte** (or **1,200-byte**) UDP packet authenticated by your **Kumara** key:

- Fixed packet ceilings prevent memory-exhaustion attacks,
- Vowel-free local test piers (`modules/comlink/constel/`) let you practice on your own Mac (`127.0.0.1` loopback) with zero chance of accidentally messaging a real ship on the public network!

---

## 2. Verify Comlink Topology on Your Mac

Inspect [`../../../modules/comlink/README.md`](../../../modules/comlink/README.md) and run our root brick check to confirm `modules/comlink/topology.rye` stands verified:

```sh
languages/rishi/bin/rishi run tools/b/bricks_exist_witness.rish
```

Next: **[07 -- Installing Tools Over the Wire (`comlink parcel` SLC)](07-installing-tools-with-comlink-parcel.md)**.
