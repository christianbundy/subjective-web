# submodule web thing

integrating sites can be either easy or painful

- does it require a build?
  - if so, make a `build` directory (or similar) with the necessary assets
  - the parent commit should be the latest source commit
  - `rm -rf public; git add worktree public; hugo` or similar works great
- does it require an absolute path?
  - some websites link to `/style.css` and such, so they need a subdomain
  - e.g. deploy `submodules/foo` to `foo.example.com`
- does it link to itself?
  - if 'foo' has hard links to 'foo.com', replace them -- there's no benefit, it just makes it non-portable
  - note: imagine javascript that checks if it's `test.foo.com` or `foo.com` -- maybe that code should be fixed to only check subdomain
    - unclear what should happen if it checks for `testfoo.com` or `foo.com`, maybe it should check for testfoo and fall back to prod mode 🤷 I have not encountered this yet
- does it link to directories as files?
  - either fix or serve behind application that can figure out index files
  - I get that `example.com/` looks nicer than `example.com/index.html` but this is semi-obnoxious
  - kinda wish that directories would redirect (unsure whether temporary or permanent) to `index.html` instead of serving pages at a directory URI



