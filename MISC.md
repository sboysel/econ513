# Miscellaneous Stata Notes

## arch linux installation notes

From StataCorp documentation:

    Download Stata17Linux64.tar.gz.
    Become superuser and extract the gzipped tar file into an empty directory.
    Make the installation directory /usr/local/stata17 and cd into it.
    Type /wherever/extracted/files/are/install and follow the instructions.
    For example, assuming you saved the archive in /home/you/Downloads,

```sh
> sudo -s
# cd /tmp/
# mkdir statafiles
# cd statafiles
# tar -zxf /home/you/Downloads/Stata17Linux64.tar.gz
# cd /usr/local
# mkdir stata17
# cd stata17
# /tmp/statafiles/install
```

### of course it doesnt work

```sh
yay -S xorg-xwayland gtk2 ncurses5-compat-libs
fish_add_path /usr/local/stata17
```

### more installation references

* https://www.stata.com/bookstore/getting-started-unix/
* https://acarril.github.io/posts/install-stata-linux

## Running do files in batch mode

* https://www.stata.com/support/faqs/unix/batch-mode/

If logging isn't already set in `filename.do`

```sh
stata < filename.do > filename.log &
```

Otherwise just use batch mode flag `-b` and trust logging to function properly

```sh
stata -b filename.do
```
