# Blaze Store

**Language:** EN - **Style:** Teacher at the Door setting, with Radiant warmth (see `../../context/TEACHER_STYLE.md`)
**Written:** `20261111.120000` - **Status:** Living

---

Blaze is a content-addressed blob store. You hand it bytes and it gives you
back a digest -- a fixed-length fingerprint computed from the content itself.
Ask for that digest later and you get the same bytes, guaranteed, because the
address is the content. A catalog sits on top: a table mapping human-readable
paths to digests, so you can find a blob by name as well as by hash.

## What you see in Terrarium

Open the **Blaze** tab. Three things appear:

1. **Store path** -- the directory on disk where blobs and the catalog live,
   shown in a monospace label. By default this is `~/.grain/blaze/`.

2. **Entry count** -- how many entries the catalog holds.

3. **Catalog table** -- a scrollable list with three columns: **Path** (the
   human-readable name), **Digest** (the content hash, truncated for display),
   and **Size** (the blob size in bytes). Each row represents one piece of
   stored content.

The tab loads the catalog from `~/.grain/blaze/catalog.kyri` on open. Blobs
live as flat files under `~/.grain/blaze/blobs/`, each named by its digest.

## How content addressing works

When you add content to Blaze, the module computes a cryptographic digest of
the bytes. That digest becomes the blob's address. To verify a blob later, you
recompute the digest and compare -- if the bytes have changed, the digest will
not match. This is the same principle behind Git objects and content-addressed
storage systems everywhere: the address proves the content.

`blaze_verify` does exactly this check: it takes a digest and the bytes, and
returns whether they match.

## The C-ABI surface

The Rye module exports through `vantage/include/vantage_blaze.h`:

| Function | What it does |
|---|---|
| `blaze_init` | initialize the Blaze runtime |
| `blaze_digest` | compute a digest from a byte buffer |
| `blaze_verify` | check whether bytes match a digest |
| `blaze_catalog_add` | add a path-to-digest mapping |
| `blaze_catalog_count` | return the number of catalog entries |
| `blaze_catalog_list` | list catalog entries into a caller-owned buffer |
| `blaze_catalog_get_digest` | look up a digest by path |
| `blaze_catalog_save` | persist the catalog to disk |
| `blaze_catalog_load` | restore the catalog from disk |
| `blaze_selftest` | prove the module's own invariants |

## Where it lives on disk

```
~/.grain/blaze/
    catalog.kyri      the path-to-digest table
    blobs/            one file per blob, named by digest
```

Both the catalog and the blob directory are created automatically when
`blaze_init` runs for the first time.

## What to read next

- [Terrarium Quick Start](../tutorials/terrarium-quick-start.md) -- build
  Blaze as part of the full stack
- The Vantage bridge source at `blaze/blaze_vantage.rye`
