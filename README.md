# Submodule Web Thing

This is a small experiment in creating resilient web links. Instead of linking to a remote HTTP resource, this project aims to add links to static websites as Git submodules. This has a variety of interesting features that are left as an exercise to the reader.

## Links

- [`jordancrane/blog`](./submodules/jordancrane/blog/index.html)
- [`sircmpwn/drewdevault.com`](./submodules/drewdevault.com/index.html)

## Adding links

- Does it require a build?
  - If so, make a `build` directory (or similar) with the necessary assets.
  - The parent commit should be the latest source commit.
  - `rm -rf public; git add worktree public; hugo` or similar works great.
- Does it require an absolute path?
  - Some websites link to `/style.css` and such, so they need a subdomain.
  - Example: ieploy `submodules/foo` to `foo.example.com`.
- Does it link to itself?
  - If 'foo' has hard links to 'foo.com', replace them -- there's no benefit, it just makes it non-portable.
  - Note: imagine javascript that checks if it's `test.foo.com` or `foo.com` -- maybe that code should be fixed to only check subdomain.
    - Unclear what should happen if it checks for `testfoo.com` or `foo.com`, maybe it should check for testfoo and fall back to prod mode 🤷 I have not encountered this yet
- Does it link to directories as files?
  - Either fix or serve behind application that can figure out index files.
  - I get that `example.com/` looks nicer than `example.com/index.html` but this is semi-obnoxious
  - Kinda wish that directories would redirect (unsure whether temporary or permanent) to `index.html` instead of serving pages at a directory URI.
