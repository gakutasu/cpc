# cpc - Copy Last N Commands to Clipboard

A simple bash function to copy the last N commands and their outputs to the clipboard.

## Installation

To install `cpc`, run the following commands:

```sh
sudo apt update
sudo apt install xclip
git clone https://github.com/gakutasu/cpc.git
echo 'source $(pwd)/cpc/cpc.sh' >> ~/.bashrc
source ~/.bashrc
```

## Usage
To copy the last N commands and their outputs to the clipboard:

```sh
cpc N
```
Replace N with the number of commands you wish to copy.

Example:
```sh
cpc 3
```
After running the command, the commands and their outputs are already copied to the clipboard!

## Note
Note that the `cpc` command itself is not included in the copied content.
