$env.HOME          = $nu.home-path
$env.HOME_BIN      = $env.HOME | (path join bin)
$env.DOT_BUN_BIN   = $env.HOME | (path join .bun bin)
$env.DOT_CARGO_BIN = $env.HOME | (path join .cargo bin)
$env.DOT_GHCUP_BIN = $env.HOME | (path join .ghcup bin)
$env.DOT_LOCAL_BIN = $env.HOME | (path join .local bin)
$env.DOT_RD_BIN    = $env.HOME | (path join .local bin)


$env.PATH = (
  $env.PATH | split row (char esep)
    | append /usr/local/bin
    | append $env.HOME_BIN
    | append $env.DOT_BUN_BIN
    | append $env.DOT_CARGO_BIN
    | append $env.DOT_GHCUP_BIN
    | append $env.DOT_LOCAL_BIN
    | append $env.DOT_RD_BIN
    | uniq
  )

$env.EDITOR = nvim

alias ll = ls -l

def --env yy [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != "" and $cwd != $env.PWD {
        cd $cwd
    }
    rm -fp $tmp
}
