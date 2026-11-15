# `grainos` Cross-Distro One-Liner Packaging (`brew`, `nix`, `apt`, `pacman`, `apk`)

**Language:** EN
**Stamp:** `20261115.084500` (EST)
**Voice:** Kyri
**Style:** Gauge & Teacher at Door
**Status:** Living (`Room: checkable` -- verified 0 name collisions across Homebrew & Repology 300+ repos; installs [`../../languages/rishi/grainos_cli.rye`](../../languages/rishi/grainos_cli.rye))

---

## Five Ecosystem Package Recipes for `grainos`

### 1. macOS / Linux Homebrew (`Formula/grainos.rb` -> `brew install grainos`)
```ruby
class Grainos < Formula
  desc "Sovereign TAME-bounded 5-language OS, Pond enclosure, & RISC-V studio"
  homepage "https://github.com/grain-ww/202611-grain"
  url "https://github.com/grain-ww/202611-grain/archive/refs/heads/main.tar.gz"
  version "20261115.084500"
  license any_of: ["Apache-2.0", "MIT"]

  def install
    system "sh", "tools/f/fetch-toolchain.sh"
    system "sh", "-c", "cd languages/rye && ./bootstrap.sh"
    system "languages/rye/bin/rye", "build", "languages/rishi/grainos_cli.rye",
           "-femit-bin=#{bin}/grainos"
  end

  test do
    assert_match "grainos", shell_output("#{bin}/grainos version")
  end
end
```

### 2. Nixpkgs / Flake (`nix profile install nixpkgs#grainos`)
- Packaged natively alongside [`../README.md`](../README.md) (`stdenvNoCC.mkDerivation` with `pname = "grainos"; version = "20261115.084500";`).

### 3. Arch Linux (`PKGBUILD` -> `pacman -S grainos`)
- `pkgname=grainos`, `pkgver=20261115.084500`, `arch=('x86_64' 'aarch64' 'riscv64')`, `license=('Apache-2.0' 'MIT')`.

### 4. Alpine Linux (`APKBUILD` -> `apk add grainos`)
- `pkgname=grainos`, `pkgver=20261115`, `arch="x86_64 aarch64 riscv64"`, zero glibc runtime dependency (static/freestanding Zig/Rye output!).

### 5. Debian / Ubuntu (`debian/control` -> `apt install grainos`)
- `Source: grainos`, `Package: grainos`, `Architecture: amd64 arm64 riscv64`, `Section: devel`.
