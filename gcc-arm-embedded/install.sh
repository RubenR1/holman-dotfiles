# if gcc-arm-embedded is not yet installed then install
if ! brew list --cask gcc-arm-embedded > /dev/null 2>&1; then
  echo "Installing gcc-arm-embedded"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/homebrew-cask/65c0e0b6ad83530a56f3fa4197738f4e0087e3dc/Casks/gcc-arm-embedded.rb -o /tmp/gcc-arm-embedded.rb
  brew install --cask /tmp/gcc-arm-embedded.rb
  rm /tmp/gcc-arm-embedded.rb
fi