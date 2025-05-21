module code.gitea.io/gitea

go 1.24.2

// rfc5280 said: "The serial number is an integer assigned by the CA to each certificate."
// But some CAs use negative serial number, just relax the check. related:
// Default TLS cert uses negative serial number #895 https://github.com/microsoft/mssql-docker/issues/895
godebug x509negativeserial=1

require (
	github.com/pkg/errors v0.9.1 // indirect
	github.com/stretchr/testify v1.10.0 // indirect
	golang.org/x/crypto v0.38.0 // indirect
	golang.org/x/net v0.40.0 // indirect
	golang.org/x/sys v0.33.0 // indirect
	golang.org/x/text v0.25.0 // indirect
)

require (
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/sirupsen/logrus v1.9.3 // indirect
	golang.org/x/time v0.11.0 // indirect
)

replace github.com/hashicorp/go-version => github.com/6543/go-version v1.3.1

replace github.com/shurcooL/vfsgen => github.com/lunny/vfsgen v0.0.0-20220105142115-2c99e1ffdfa0

replace github.com/nektos/act => gitea.com/gitea/act v0.261.6

// TODO: the only difference is in `PutObject`: the fork doesn't use `NewVerifyingReader(r, sha256.New(), oid, expectedSize)`, need to figure out why
replace github.com/charmbracelet/git-lfs-transfer => gitea.com/gitea/git-lfs-transfer v0.2.0

// TODO: This could be removed after https://github.com/mholt/archiver/pull/396 merged
replace github.com/mholt/archiver/v3 => github.com/anchore/archiver/v3 v3.5.2

replace git.sr.ht/~mariusor/go-xsd-duration => gitea.com/gitea/go-xsd-duration v0.0.0-20220703122237-02e73435a078

exclude github.com/gofrs/uuid v3.2.0+incompatible

exclude github.com/gofrs/uuid v4.0.0+incompatible

exclude github.com/goccy/go-json v0.4.11

exclude github.com/satori/go.uuid v1.2.0

require (
	github.com/go-i2p/go-limit v0.0.0-20250203203118-210616857c15
	github.com/go-i2p/go-meta-dialer v0.0.0-20250501024057-715e91be3cfe
	github.com/go-i2p/go-meta-listener v0.0.5-0.20250521170131-2058a4309616
)

require (
	github.com/cretz/bine v0.2.0 // indirect
	github.com/go-i2p/i2pkeys v0.33.92 // indirect
	github.com/go-i2p/onramp v0.33.92 // indirect
	github.com/go-i2p/sam3 v0.33.92 // indirect
	github.com/opd-ai/wileedot v0.0.0-20241217172720-521d4175e624 // indirect
)
