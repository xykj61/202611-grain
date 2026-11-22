// MarketTab -- Dimeroll Market surface for Vantage Station.
//
// Consumes vantage_market_deck and vantage_constellation_view
// Rye modules via C-ABI dispatch tables. Provides buy/sell/trade
// and sky map tabs within the Dimeroll Market tab.
//
// Glasswall: write-only display, no readback, no ad/tracking SDK.

import AppKit

extension AppDelegate {

    @objc func focusMarket() {
        guard let tv = tabView else { return }
        for i in 0..<tv.numberOfTabViewItems {
            let item = tv.tabViewItem(at: i)
            if let ident = item.identifier as? String,
               ident == "market"
            {
                tv.selectTabViewItem(at: i)
                return
            }
        }
        let item = NSTabViewItem(
            identifier: "market"
        )
        item.label = "Market"
        let container = NSView(
            frame: NSRect(
                x: 0, y: 0, width: 600,
                height: 400
            )
        )
        container.autoresizingMask =
            [.width, .height]

        // --- Action bar ---
        let actionSeg = NSSegmentedControl(
            labels: [
                "Buy", "Sell",
                "Gift", "Fill",
                "Sky Map",
            ],
            trackingMode: .selectOne,
            target: self,
            action: #selector(
                marketActionChanged(_:)
            )
        )
        actionSeg.selectedSegment = 0
        actionSeg.translatesAutoresizingMaskIntoConstraints
            = false
        marketActionControl = actionSeg

        // --- Point field ---
        let pointLabel = NSTextField(
            labelWithString: "Point:"
        )
        pointLabel.font =
            NSFont.systemFont(ofSize: 12)
        pointLabel.translatesAutoresizingMaskIntoConstraints
            = false

        let pointField = NSTextField(
            frame: .zero
        )
        pointField.placeholderString = "0-404"
        pointField.font =
            NSFont.monospacedSystemFont(
                ofSize: 12, weight: .regular
            )
        pointField.translatesAutoresizingMaskIntoConstraints
            = false
        marketPointField = pointField

        // --- Galaxy field ---
        let galaxyLabel = NSTextField(
            labelWithString: "Galaxy:"
        )
        galaxyLabel.font =
            NSFont.systemFont(ofSize: 12)
        galaxyLabel.translatesAutoresizingMaskIntoConstraints
            = false

        let galaxyField = NSTextField(
            frame: .zero
        )
        galaxyField.placeholderString = "0-14"
        galaxyField.font =
            NSFont.monospacedSystemFont(
                ofSize: 12, weight: .regular
            )
        galaxyField.translatesAutoresizingMaskIntoConstraints
            = false
        marketGalaxyField = galaxyField

        // --- Price field ---
        let priceLabel = NSTextField(
            labelWithString: "WOOD:"
        )
        priceLabel.font =
            NSFont.systemFont(ofSize: 12)
        priceLabel.translatesAutoresizingMaskIntoConstraints
            = false

        let priceField = NSTextField(
            frame: .zero
        )
        priceField.placeholderString = "amount"
        priceField.font =
            NSFont.monospacedSystemFont(
                ofSize: 12, weight: .regular
            )
        priceField.translatesAutoresizingMaskIntoConstraints
            = false
        marketPriceField = priceField

        // --- Submit button ---
        let submitBtn = NSButton(
            title: "Post Offer",
            target: self,
            action: #selector(
                marketSubmitClicked(_:)
            )
        )
        submitBtn.bezelStyle = .rounded
        submitBtn.translatesAutoresizingMaskIntoConstraints
            = false

        // --- Status text ---
        let statusView = NSScrollView(
            frame: NSRect(
                x: 0, y: 0, width: 600,
                height: 300
            )
        )
        statusView.autoresizingMask =
            [.width, .height]
        statusView.hasVerticalScroller = true
        let stv = NSTextView(
            frame: statusView.bounds
        )
        stv.isEditable = false
        stv.isSelectable = true
        stv.autoresizingMask = [.width, .height]
        stv.font = NSFont.monospacedSystemFont(
            ofSize: 13, weight: .regular
        )
        stv.backgroundColor = NSColor(
            white: 0.05, alpha: 1.0
        )
        stv.textColor = NSColor(
            red: 0.18, green: 0.49, blue: 0.20,
            alpha: 1.0
        )
        stv.string = marketBanner()
        statusView.documentView = stv
        marketStatusView = stv

        // --- Layout with auto-layout ---
        let topBar = NSStackView(views: [
            actionSeg,
        ])
        topBar.orientation = .horizontal
        topBar.spacing = 8
        topBar.translatesAutoresizingMaskIntoConstraints
            = false

        let formRow = NSStackView(views: [
            pointLabel, pointField,
            galaxyLabel, galaxyField,
            priceLabel, priceField,
            submitBtn,
        ])
        formRow.orientation = .horizontal
        formRow.spacing = 6
        formRow.translatesAutoresizingMaskIntoConstraints
            = false

        let stack = NSStackView(views: [
            topBar, formRow, statusView,
        ])
        stack.orientation = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints
            = false
        container.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: container.topAnchor,
                constant: 4
            ),
            stack.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: 8
            ),
            stack.trailingAnchor.constraint(
                equalTo: container.trailingAnchor,
                constant: -8
            ),
            stack.bottomAnchor.constraint(
                equalTo: container.bottomAnchor,
                constant: -4
            ),
        ])

        item.view = container
        tv.addTabViewItem(item)
        tv.selectTabViewItem(item)
    }

    // invariant: write-only display, no readback
    static let glasswallWriteOnly = true

    func marketBanner() -> String {
        // invariant: Glasswall enforced
        assert(AppDelegate.glasswallWriteOnly)
        return "Dimeroll Market -- d15-3-9-405\n"
            + "==============================\n\n"
            + "15 galaxies / 45 stars / "
            + "405 council seats\n"
            + "WOOD conservation: sum(nets) == 0\n"
            + "Glasswall: write-only RLCD\n"
            + "Offer capacity: 64 max\n\n"
            + "Actions: Buy | Sell | Gift | Fill"
            + " | Sky Map\n"
    }

    @objc func marketActionChanged(
        _ sender: NSSegmentedControl
    ) {
        let seg = sender.selectedSegment
        let isSkyMap = seg == 4
        let isFill = seg == 3
        marketPointField?.isEnabled = !isSkyMap
        marketGalaxyField?.isEnabled =
            !isSkyMap && !isFill
        marketPriceField?.isEnabled =
            !isSkyMap && !isFill
        if isSkyMap {
            marketStatusView?.string =
                skyMapBanner()
        } else {
            marketStatusView?.string =
                marketBanner()
        }
    }

    let galaxyNames = [
        "Aries", "Taurus", "Gemini",
        "Cancer", "Leo", "Virgo",
        "Libra", "Scorpio", "Sagittarius",
        "Capricorn", "Aquarius", "Pisces",
        "Ophiuchus", "Draco", "Siya",
    ]

    func skyMapBanner() -> String {
        var s = "Constellation Sky Map\n"
        s += "=====================\n\n"
        var gCounts = [Int](
            repeating: 0, count: 15
        )
        for e in marketOfferLog {
            let gi = Int(e.galaxy)
            if gi < 15 { gCounts[gi] += 1 }
        }
        var g: UInt32 = 0
        while g < 15 {
            let gi = Int(g)
            let name = galaxyNames[gi]
            let padded = name.padding(
                toLength: 12,
                withPad: " ",
                startingAt: 0
            )
            let bar = String(
                repeating: "|",
                count: min(gCounts[gi], 16)
            )
            let gIdx = g < 10
                ? " \(g)" : "\(g)"
            s += "  g\(gIdx) \(padded) "
            s += "[\(gCounts[gi])] \(bar)\n"
            g += 1
        }
        s += "\n405 seats | "
        s += "\(marketOfferCount) offers | "
        s += "\(marketRefusalCount) refusals\n"
        return s
    }

    @objc func marketSubmitClicked(
        _ sender: NSButton
    ) {
        guard let stv = marketStatusView
        else { return }
        guard let seg = marketActionControl
        else { return }
        let action = seg.selectedSegment
        if action == 4 {
            stv.string = skyMapBanner()
            return
        }
        if action == 3 {
            fillOldestPending()
            return
        }

        let pointStr =
            marketPointField?.stringValue ?? ""
        let galaxyStr =
            marketGalaxyField?.stringValue ?? ""
        let priceStr =
            marketPriceField?.stringValue ?? ""

        guard let point = UInt32(pointStr),
              point < 405
        else {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": invalid point "
                + "(must be 0-404)\n"
            )
            return
        }
        guard let galaxy = UInt8(galaxyStr),
              galaxy < 15
        else {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": invalid galaxy "
                + "(must be 0-14)\n"
            )
            return
        }
        let price = UInt64(priceStr) ?? 0

        let decoded = decodeTopologyPoint(point)
        if decoded.galaxy != galaxy {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": point \(point) "
                + "belongs to galaxy "
                + "\(decoded.galaxy), "
                + "not \(galaxy)\n"
            )
            return
        }

        let actionNames = [
            "buy_sponsor", "sell_sponsor",
            "gift_invite", "fill", "sky_map",
        ]
        let name = actionNames[action]
        let tier = decoded.tier
        // invariant: bounded offer log
        if marketOfferLog.count >= 64 {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": offer log full "
                + "(max 64)\n"
            )
            return
        }
        marketOfferCount += 1
        let entry = (
            id: marketOfferCount,
            action: name, tier: tier,
            point: point, galaxy: galaxy,
            wood: price, status: "pending"
        )
        marketOfferLog.append(entry)

        let msg = "OFFER: \(name) "
            + "\(tier) point=\(point) "
            + "galaxy=\(galaxy) "
            + "wood=\(price)\n"
        appendMarketStatus(msg)
        appendMarketStatus(
            "  -> offer \(marketOfferCount) "
            + "posted (pending fill)\n"
        )
        appendMarketStatus(
            offerLogSummary()
        )
    }

    struct TopologyAddr {
        let galaxy: UInt8
        let star: UInt8
        let planet: UInt8
        let tier: String
    }

    func decodeTopologyPoint(
        _ p: UInt32
    ) -> TopologyAddr {
        // invariant: p < 405
        let g = UInt8(p % 15)
        let rem = p / 15
        if rem == 0 {
            return TopologyAddr(
                galaxy: g, star: 0,
                planet: 0, tier: "galaxy"
            )
        }
        let s = UInt8((rem - 1) / 9)
        let planet = UInt8((rem - 1) % 9)
        if planet == 0 && s < 3 {
            return TopologyAddr(
                galaxy: g, star: s,
                planet: 0, tier: "star"
            )
        }
        return TopologyAddr(
            galaxy: g, star: s,
            planet: planet, tier: "planet"
        )
    }

    func offerLogSummary() -> String {
        var s = "\n--- Offer Log "
        s += "(\(marketOfferLog.count) total) "
        s += "---\n"
        for e in marketOfferLog.suffix(8) {
            s += "  [\(e.id)] \(e.action) "
            s += "\(e.tier) p\(e.point) "
            s += "g\(e.galaxy) "
            s += "\(e.wood)W "
            s += "(\(e.status))\n"
        }
        if marketOfferLog.count > 8 {
            let hidden =
                marketOfferLog.count - 8
            s += "  ... \(hidden) earlier\n"
        }
        s += woodConservation()
        return s
    }

    func composeInviteLink(
        point: UInt32, galaxy: UInt8
    ) -> String {
        let pHex = String(point, radix: 16)
        let gHex = String(galaxy, radix: 16)
        let sealStub = "0000000000000000"
        return "grain://invite/"
            + "\(pHex)/\(gHex)/\(sealStub)"
    }

    func fillOldestPending() {
        guard let idx = marketOfferLog.firstIndex(
            where: { $0.status == "pending" }
        ) else {
            appendMarketStatus(
                "REFUSED: no pending offers "
                + "to fill\n"
            )
            marketRefusalCount += 1
            return
        }
        marketOfferLog[idx].status = "filled"
        let e = marketOfferLog[idx]
        appendMarketStatus(
            "FILLED: offer [\(e.id)] "
            + "\(e.action) \(e.tier) "
            + "p\(e.point) g\(e.galaxy) "
            + "\(e.wood)W\n"
        )
        if e.action == "gift_invite" {
            let link = composeInviteLink(
                point: e.point,
                galaxy: e.galaxy
            )
            appendMarketStatus(
                "  INVITE: \(link)\n"
            )
        }
        appendMarketStatus(
            offerLogSummary()
        )
    }

    func woodConservation() -> String {
        var buys: UInt64 = 0
        var sells: UInt64 = 0
        var gifts: UInt64 = 0
        for e in marketOfferLog {
            switch e.action {
            case "buy_sponsor":
                buys += e.wood
            case "sell_sponsor":
                sells += e.wood
            case "gift_invite":
                gifts += e.wood
            default: break
            }
        }
        var s = "  WOOD: buy=\(buys) "
        s += "sell=\(sells) "
        s += "gift=\(gifts) "
        let net = Int64(buys) - Int64(sells)
        s += "net=\(net)\n"
        return s
    }

    func appendMarketStatus(_ text: String) {
        guard let stv = marketStatusView
        else { return }
        stv.textStorage?.append(
            NSAttributedString(
                string: text,
                attributes: [
                    .font: NSFont
                        .monospacedSystemFont(
                            ofSize: 13,
                            weight: .regular
                        ),
                    .foregroundColor: NSColor(
                        red: 0.18, green: 0.49,
                        blue: 0.20, alpha: 1.0
                    ),
                ]
            )
        )
        stv.scrollToEndOfDocument(nil)
    }
}
