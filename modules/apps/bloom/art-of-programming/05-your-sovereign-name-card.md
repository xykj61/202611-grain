# 05 -- Your Sovereign Name Card (`kumara` Profile SLC)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 04](04-plain-names-for-powerful-rooms.md).

---

## 1. Owning Your Own Identity Without a Password Server

On the old web, a company owns your username and can lock your account overnight. In Grain, **`modules/kumara/`** uses **Ed25519 public-key cryptography**:

- Your **secret key** stays solely on your Mac,
- Your **public key** (`32` bytes) is your mathematical seal that friends can verify anywhere offline or online.

---

## 2. Build and Prove `kumara` on Your Mac

Paste these two lines into `Terminal.app`:

```sh
mkdir -p modules/kumara/bin
languages/rye/bin/rye build modules/kumara/kumara.rye -femit-bin=modules/kumara/bin/kumara && modules/kumara/bin/kumara selftest
```

Notice the two lines printed:
1. First, `kumara` signs a real message and verifies it,
2. Second, `kumara` flips a single byte in a tampered message and proves **`tampered message refused -- GREEN unwelcome path`**.

Next: **[06 -- Two Macs Talking Across the Room (`comlink` P2P Chat SLC)](06-two-macs-talking-over-comlink.md)**.
