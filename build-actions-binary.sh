NAME="main"
# Build full matrix
oses=("linux darwin")
arches=("amd64 arm64")
for os in ${oses[@]}; do
  for arch in ${arches[@]}; do
    filename=$NAME-$os-$arch
      GOOS=$os GOARCH=$arch go build -o $filename
  done
done
# Remove binaries not needed for either local testing on my
# Macbook M1 or for use with the GitHub Actions Ubuntu runner
rm $NAME-darwin-amd64
rm $NAME-linux-arm64
