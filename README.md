# Subjective Web Directory

This is a small experiment to steward a resilient of archive of **my perspective** of the web, explicitly embedding content in my site rather than giving you a URL and hoping it's still around (and the same) when you click it. I'm also hoping that it might change how linking feels, as I'm now **syndicating content** and actively providing a platform for folks I'm paying attention to.

## Links

- [`jordancrane/blog`](./submodules/jordancrane/blog/index.html) 🔧
- [`sircmpwn/drewdevault.com`](./submodules/sircmpwn/drewdevault.com/index.html)
- [`zim/coolguy-www`](./submodules/zim/coolguy-www/index.html)
  - [The Map is the Territory](https://christianbundy.github.io/subjective-web/submodules/zim/coolguy-www/map-is-the-territory/introduction.html)

## Requirements

- **Git** -- I'm using Git submodules, which depend on Git repositories.
- **Static sites** -- The Git repository must have a branch with static HTML.

## Nice to have

- 🔧 **Already built** -- Static site exported in `build` branch (or similar).
- 👪 **Relative paths** -- Link to `../foo.html`, not `/foo.html`.
- 🌐 **Protocol-less paths** -- Link to `./foo.html`, not `https://example.com/xyz/foo.html`. 
- 📇 **No implicit indexes** -- Link to `./foo/index.html`, not `./foo`.


## Notes

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
