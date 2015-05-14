# GNU Pricing

**Announcement: https://diafygi.github.io/gnu-pricing/website/**

GNU programs are used billions of time every day all over the world. However,
the [<s>intellectual property</s>](https://www.gnu.org/philosophy/not-ipr.xhtml) copyright owners, the Free Software Foundation, don't make a
cent from it. What a raw deal! This project aims to fix that by monetizing many
popular command line tools that GNU maintains.

## What this project does

This project adds pricing to many popular GNU command line tools.

## How to install

To install, simply add the bin directory to your path.

```sh
export PATH="/path/to/gnu-pricing/bin:$PATH"
```

## How to use

Once the `gnu-pricing/bin` directory is in your path, simply use GNU tools as
normal. To see the pricing breakdown from the command line, add the `--pricing`
to see the cost breakdown for using that command. A record of how much you owe
for using GNU commands will also be printed. You can pay this usage fee at 
[https://donate.fsf.org/](https://donate.fsf.org/).

```sh
user@host:~$ gcc --pricing
=======================
Welcome to GNU Pricing!
=======================

Using many GNU tools now cost $0.01 per use.

This command (gcc) has been used 2 times so far.

Overall GNU command usage
command	usage	cost
-------	-----	----
gcc     2       $.02
ls      41      $.41
md5sum  1       $.01
uname   2       $.02
-------	-----	----
Total   46      $.46

Please pay the total cost at https://donate.fsf.org/
```

## How to uninstall

If you're a cheap bastard and don't want to pay for these excellent GNU commands
that the FSF worked so very hard to make, you can remove the pricing options by
removing the `gnu-pricing/bin` directory from your path and deleting the
`~/.gnu-pricing/` directory.

```sh
PATH=`echo $PATH | sed "s@/path/to/gnu-pricing/bin:@@"`
rm -r ~/.gnu-pricing
```

## What commands have pricing

The following commands now cost money to use:

* base64
* basename
* cat
* cp
* cut
* date
* dd
* df
* du
* emacs
* gcc
* gnupg
* grep
* gzip
* head
* ln
* ls
* make
* md5sum
* mkdir
* mv
* nano
* rm
* rmdir
* sha1sum
* sha224sum
* sha256sum
* sha384sum
* sha512sum
* sort
* tail
* tar
* time
* touch
* uname
* uniq
* uptime
* wc
* wget
* who
* whoami

## Disclaimer

This project is satire and was made during the
[2015 Stupid Shit No One Needs & Terrible Ideas Hackathon](https://stupidhackathon.github.io/).
