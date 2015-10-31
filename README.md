# whlin's vim setting

## Preface

本設定包含了 rc, vimfilers, zshrc 等相關環境的設定
請根據以下順序, 將相關的環境設定安裝:
    
 - [rc] 
 - [zshrc]
 - [vimfilers]

## Pre-install

Mac OSX

1. 安裝 command line tools

```sh
$ xcode-select --install
```

2. 安裝 [homebrew] or 執行下 command 安裝

```sh
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

3. 安裝會用到的軟體

```sh
$ brew install lua ctags cscope
$ sudo rm -f /usr/bin/ctags
$ sudo ln -s /usr/local/bin/ctags /usr/bin/ctags
```

4. (Optional) 安裝 python 所需的套件 (需先用 homebrew 安裝 python)

```sh
$ pip install pyflakes

```

5. (Optional) 安裝 haskell 所需的套件 (需先用 homebrew 安裝 haskell-platform)
```sh
$ cabal install hasktags
$ cabal install hlint
```

6. 安裝 Vim
```sh
$ brew install vim --with-lua --with-python
```

## Installation

習慣上, 我會在 ~/Document/ 資料夾中進行安裝,
進入家目錄的 Document 資料夾, git clone the vumfilers.git from github
再進入 vimfilers 資料夾中, 執行 ./install_unix.sh 來進行 vimrc 檔案的設定和安裝即可.

```sh
$ cd ~/Document
$ git clone https://github.com/whlin/vimfilers.git
$ cd vimfiles
$ ./install_unix.sh
```

## reference

 - [yen3 vimfilers]

## other problem

 - golang go to defind 無法使用

[rc]: <https://github.com/whlin/rc>
[zshrc]: <https://github.com/whlin/zshrc>
[vimfilers]: <https://github.com/whlin/vimfilers>
[yen3 vimfilers]: <https://github.com/yen3/vimfiles>
