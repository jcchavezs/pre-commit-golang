
# pre-commit-golang


golang hooks for [http://pre-commit.com/](http://pre-commit.com/)

## Using these hooks

Add this to your `.pre-commit-config.yaml`

```
    - repo: git://github.com/jcchavezs/pre-commit-golang
      sha: HEAD
      hooks:
        - id: go-fmt
        - id: go-vet
        - id: govendor-status
        - id: golangci-lint
          args:
          - --config .golangci.yml
```

## Available hooks

- `go-fmt`: Runs `gofmt`, requires golang.
- `go-vet`: Runs `go vet`, requires golang.
- `go-lint`: Runs `golint`, requires https://github.com/golang/lint
- `validate-toml`: Runs `tomlv`, requires
   [https://github.com/BurntSushi/toml/tree/master/cmd/tomlv](https://github.com/BurntSushi/toml/tree/master/cmd/tomlv).
- `no-go-testing`: Checks that no files are using `testing.T`, if you want
  developers to use a different testing framework.
- `gometalinter`: Runs `gometalinter [--arg1=value1 ...] ./...`. Use the arguments for setting a [configuration file](https://github.com/alecthomas/gometalinter#configuration-file). **It is highly recommended to include `--vendor` for exclude `vendor` folder and `--errors` flags to avoid warnings**
- `govendor-status`: Runs `govendor status` to verify the status of the vendoring, requires golang.
- `golangci-lint`: Runs `golangci-lint run`, requires golang. 5x faster than gometalinter.
