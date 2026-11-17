# `grain-ww` Cross-Distro One-Liner Packaging (`brew`, `nix`, `apt`, `pacman`, `apk`)

**Stamp:** `20261115.113500`
**Voice:** Civic & Teacher
**Status:** Living (`Room: checkable` -- zero collisions across Homebrew, Nixpkgs, Debian, Arch, & Alpine; matches `grain-ww.com` and installs [`../../languages/rishi/grain_ww_cli.rye`](../../languages/rishi/grain_ww_cli.rye))

---

## Five Ecosystem Package Recipes for `grain-ww`

### 1. macOS / Linux Homebrew (`Formula/grain-ww.rb` -> `brew install grain-ww`)
```ruby
class GrainWw < Formula
  desc "Sovereign TAME 5-language workspace & Vantage computing suite"
  homepage "https://github.com/grain-ww/202611-grain"
  url "https://github.com/grain-ww/202611-grain/archive/refs/heads/main.tar.gz"
  version "20261115.113500"
  license any_of: ["Apache-2.0", "MIT"]

  def install
    system "sh", "tools/f/fetch-toolchain.sh"
    system "languages/rye/bin/rye", "build", "languages/rishi/grain_ww_cli.rye",
           "-femit-bin=#{bin}/grain-ww"
  end

  test do
    assert_match "grain-ww", shell_output("#{bin}/grain-ww version")
  end
end
```

### 2. Nixpkgs / Flake (`nix profile install nixpkgs#grain-ww`)
- Packaged alongside [`../README.md`](../README.md) (`stdenvNoCC.mkDerivation` with `pname = "grain-ww"; version = "20261115.113500";`).

### 3. Arch Linux (`PKGBUILD` -> `pacman -S grain-ww`)
- `pkgname=grain-ww`, `pkgver=20261115.113500`, `arch=('x86_64' 'aarch64' 'riscv64')`, `license=('Apache-2.0' 'MIT')`.

### 4. Alpine Linux (`APKBUILD` -> `apk add grain-ww`)
- `pkgname=grain-ww`, `pkgver=20261115`, `arch="x86_64 aarch64 riscv64"`, zero glibc runtime dependency.

### 5. Debian / Ubuntu (`debian/control` -> `apt install grain-ww`)
- `Source: grain-ww`, `Package: grain-ww`, `Architecture: amd64 arm64 riscv64`, `Section: devel`.
