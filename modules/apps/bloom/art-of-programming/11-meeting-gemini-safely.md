# 11 -- Meeting Gemini Safely (`comlink-gemini` TAME Package SLC)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 10](10-singing-in-pure-math-with-resonance.md).

---

## 1. Keeping Your API Key Inside a Sealed Vault

When you connect your Grain programs to **Google Gemini (`gemini-4-carbon`)** using our inaugural Comlink Parcel ([`../../../modules/comlink/parcel/gemini/`](../../../modules/comlink/parcel/gemini/parcel.brix)), two guardians stand watch:

1. **`VaultedGeminiKey`:** Holds your `AIza...` key inside a fixed 64-byte vault (`AIza...[SEALED-IN-VAULT]`) and refuses to send any prompt that accidentally contains your raw key!
2. **10-Stage Input Airlock:** Strips invisible control characters and smuggling tricks before framing clean, bounded JSON.

---

## 2. Run the Gemini Airlock Proof on Your Mac

```sh
mkdir -p modules/comlink/parcel/bin
languages/rye/bin/rye build modules/comlink/parcel/gemini/gemini_airlock.rye -femit-bin=modules/comlink/parcel/bin/gemini_airlock
modules/comlink/parcel/bin/gemini_airlock
```

Next: **[12 -- Conducting a Helpful Agent Choir (`harness` Capstone SLC)](12-conducting-a-helpful-agent-choir.md)**.
