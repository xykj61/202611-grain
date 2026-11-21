# Checklist -- Dimeroll Market Linengrow Interface (Vantage Station)

**Stamp:** `20261121.123651` (EST)
**Voice:** Kyri (Gauge + Civic + Radiant)
**Theme:** Galaxy/Star/Planet buy-sell-trade-spawn-invite on macOS

---

## Problem

The d15-3-9-405 council topology is proven on metal but has no citizen
interface. Galaxy holders, star sponsors, and planet settlers need a
real surface to:
  - Buy/sell/trade galaxy and star sponsor choices (Dimeroll market)
  - Spawn/invite new planets under their stars (settlement)
  - Send gift links (email drafts via Gmail MCP or print-to-mail)
  - See their constellation's live state (Brushstroke/Skate/Realidream)

## Design -- Vantage Station macOS (Swift Terrarium + Rye Core)

**Surface:** `Vantage Station` posture on macOS via `terrarium/app/`
Swift shell. All UI logic lives in `modules/comlink/vantage/`.

**Dimeroll Market:** `modules/market/` -- `sum(nets) == 0` ledger for
WOOD token transactions on galaxy/star/planet transfers. Extends
existing `wood_token.rye` and `constellation.rye`.

**Brushstroke/Skate/Realidream:** Write-only RLCD rendering of the
council sky constellation -- live 15-galaxy star map with settlement
state, sponsor chains, and transaction history.

**Gmail MCP:** Invite/gift links composed as email drafts via the
Gmail MCP connector. TAME-guided: no ambient INTERNET, no tracking.

**New Libraries:**
  - `libraries/dimeroll_market_bridge/` -- TAME-guided bridge between
    Dimeroll ledger, constellation settlement, and Vantage Station UI
  - `libraries/invite_link_compose/` -- gift link + email draft
    composition (Gmail MCP + print-to-mail fallback)

## Architecture

```
Vantage Station (macOS Swift) -- terrarium/app/
  |
  +-- vantage_market_deck.rye -- market buy/sell/trade UI
  +-- vantage_invite_compose.rye -- gift link + email draft
  +-- vantage_constellation_view.rye -- live sky map (Skate)
  |
modules/market/
  +-- dimeroll_market.rye -- WOOD ledger for galaxy/star trades
  +-- settlement/constellation.rye -- (existing, now council_sky)
  |
libraries/
  +-- dimeroll_market_bridge/ -- Vantage <-> Dimeroll bridge
  +-- invite_link_compose/ -- email draft + gift link
```

## Journey (Movements)

- [ ] **[Gemini]** Scaffold `dimeroll_market.rye` -- WOOD buy/sell/trade
      for galaxy and star sponsor choices on the council sky
- [ ] **[Cancer]** Wire `vantage_market_deck.rye` -- Vantage Station
      buy/sell/trade surface with Brushstroke/Skate rendering
- [ ] **[Leo]** Implement star-planet spawn/invite flow -- settlement
      `mint` from Vantage with signed cap + bind
- [ ] **[Virgo]** `invite_link_compose` -- gift links as email drafts
      via Gmail MCP connector or print-to-mail fallback
- [ ] **[Libra]** `dimeroll_market_bridge` library -- TAME-guided bridge
      with bounded queues and explicit capability fences
- [ ] **[Scorpio]** Realidream constellation view -- live 15-galaxy sky
      map with settlement state and transaction history
- [ ] **[Sagittarius]** End-to-end witness: buy galaxy, spawn star,
      invite planet, send gift link, verify on metal

---

*Sovereignty starts with a galaxy. Every citizen sponsors their own sky.*
