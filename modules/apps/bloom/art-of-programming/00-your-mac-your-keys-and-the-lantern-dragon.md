# 00 -- Your Mac, Your Keyboard, and Your First Green Light

**Language:** EN
**Stamp:** `20261115.052500` (EST)
**Voice:** Kyri
**Style:** Teacher & Radiant (Wing-Beside-You beginner pace)
**Prerequisites:** Curiosity, a Mac, and a macOS keyboard. Zero prior coding needed.

---

## 1. Hello, Friend -- Nothing Here Can Break Your Mac

Welcome! If you have never written a line of computer code before, take a slow, happy breath. A computer looks mysterious from the outside only because most apps hide the switches behind glass. Today we are going to open a small window called **Terminal** where you can talk to your Mac in plain text, one calm sentence at a time.

Think of Grain's safety rules (**TAME Guidance**) like a friendly guardian dragon sitting beside your keyboard: every program we write stays inside its own neat sandbox folder on your Mac, tells the truth about what it is doing, and stops politely if you make a typo.

---

## 2. Meet Four Keys on Your macOS Keyboard

Look down at the bottom and right sides of your Mac keyboard and find four keys we will use often:

1. **`Command` (`cmd`, right next to the Spacebar):** Hold `Command` and tap **`Space`** to summon **Spotlight Search** -- the fastest way to open anything on a Mac.
2. **`Return` (on the right side):** Sends the line you just typed to the computer, like pressing "Send" on a text message.
3. **`Option` (`alt`, next to `Command`):** Helps type special symbols later if you ever want them (though all Grain code uses ordinary keyboard characters!).
4. **`Control` + `C`:** Holding `Control` and tapping `C` inside Terminal politely tells any running command, *"Stop right now, please."*

---

## 3. Open `Terminal.app` Together

1. Hold **`Command`** and tap **`Space`**. A small search bar appears in the middle of your screen.
2. Type the word **`Terminal`** and tap **`Return`**.
3. A clean rectangular window opens showing your Mac's name and a blinking cursor (`%` or `$`). That blinking cursor simply means: *"I am listening."*

Type these three letters and tap **`Return`**:

```sh
pwd
```

`pwd` stands for **Print Working Directory** -- *"Which folder am I standing in right now?"* Your Mac answers with your home folder, such as `/Users/yourname`. Folders in Terminal are the **exact same folders** you see in macOS Finder!

---

## 4. Bring Home the Public Grain Seed (`grain-ww/202611-grain`)

Copy and paste (using **`Command` + `C`** to copy here and **`Command` + `V`** inside Terminal, then **`Return`**) these two lines to download Grain into a brand-new folder called `grain` and step inside it:

```sh
git clone https://github.com/grain-ww/202611-grain.git grain
cd grain
```

*(If macOS pops up a friendly box asking to install "Command Line Developer Tools" the very first time you run `git`, click **Install**, grab a glass of water while Apple finishes, and then run those two lines again!)*

Now ask Terminal to list the rooms inside `grain`:

```sh
ls
```

Look how tidy it is! `languages` holds Grain's five small programming languages, `modules` holds the building blocks (graphics, sound, networking, safety), and `docs-geode` holds reference guides for experienced engineers.

---

## 5. Watch Your Mac Build Grain and Light Up `GREEN`

Paste these four lines one by one (pressing **`Return`** after each) to fetch Grain's verified compiler backend, build **Rye** and **Rishi**, and run your very first hardware-checked proof:

```sh
sh tools/f/fetch-toolchain.sh
cd languages/rye && ./bootstrap.sh && cd ../..
mkdir -p languages/rishi/bin && languages/rye/bin/rye build languages/rishi/src/main.rye -femit-bin=languages/rishi/bin/rishi
languages/rishi/bin/rishi run tools/b/bricks_exist_witness.rish
```

When your Terminal prints:

```text
GREEN: bricks-exist -- all 29 file entries resolve.
```

**celebrate!** You just compiled a systems programming language and a shell from plain human-readable source code on your own Mac, and ran a real automated proof (**witness**).

Next stop in the series: **`01 -- Numbers, Words, and Boxes With Honest Sizes`** ([`README.md`](README.md)).

---

*May your first GREEN light be the start of a lifelong friendship with machines you can understand all the way down.*
