#====================================================
# custom bindings / functions
#====================================================

alias title="setGnomeTerminalTitle";
alias mkcd="makeThenChangeDir";

alias runas='runCommandAsUser'

#====================================================
# Sudo and admin related commands
#====================================================
alias sudol='sudo l'
alias s='sudo l'
alias sl='sudo l'
alias audol='sudo l'
alias audok='sudo l'
alias sudok='sudo l'
alias sudp='sudo'
alias sudi='sudo'
alias audo='sudo'
alias audp='sudo'
alias fucking='sudo'
alias fuck='sudo $(history -p \!\!)'
alias su!='sudo -i'
alias root='sudo -i'

__users_alias_col_offsets__=(5 25 30 35);
__users_alias_printf_patt__="%-${__users_alias_col_offsets__[0]}s  %-${__users_alias_col_offsets__[1]}s %-${__users_alias_col_offsets__[2]}s %-${__users_alias_col_offsets__[3]}s\n";
__users_alias_awk_patt__="%-${__users_alias_col_offsets__[0]}s  %-${__users_alias_col_offsets__[1]}s %-${__users_alias_col_offsets__[2]}s %-${__users_alias_col_offsets__[3]}s\n";
__users_alias_sep0__=$(eval printf "=%.0s" {1..$(( ${__users_alias_col_offsets__[0]} - 0))});
__users_alias_sep1__=$(eval printf "=%.0s" {1..$(( ${__users_alias_col_offsets__[1]} - 1))});
__users_alias_sep2__=$(eval printf "=%.0s" {1..$(( ${__users_alias_col_offsets__[2]} - 1))});
__users_alias_sep3__=$(eval printf "=%.0s" {1..$(( ${__users_alias_col_offsets__[3]} - 1))});

alias lsusers='printf "${__users_alias_printf_patt__}" "uid" "user name" "home folder" "shell";printf "${__users_alias_printf_patt__}" "${__users_alias_sep0__}" "${__users_alias_sep1__}" "${__users_alias_sep2__}" "${__users_alias_sep3__}";getent passwd {1000..60000}|awk -F: "{printf \"${__users_alias_awk_patt__}\", \$3, \$1, \$6, \$7}"|sort -n'
alias listusers='printf "${__users_alias_printf_patt__}" "uid " "user name" "home folder" "shell";printf "${__users_alias_printf_patt__}" "${__users_alias_sep0__}" "${__users_alias_sep1__}" "${__users_alias_sep2__}" "${__users_alias_sep3__}";getent passwd {1000..60000}|awk -F: "{printf \"${__users_alias_awk_patt__}\", \$3, \$1, \$6, \$7}"|sort -n'
alias lsallusers='printf "${__users_alias_printf_patt__}" "uid " "user name" "home folder" "shell";printf "${__users_alias_printf_patt__}" "${__users_alias_sep0__}" "${__users_alias_sep1__}" "${__users_alias_sep2__}" "${__users_alias_sep3__}";getent passwd|awk -F: "{printf \"${__users_alias_awk_patt__}\", \$3, \$1, \$6, \$7}"|sort -n'
alias listallusers='printf "${__users_alias_printf_patt__}" "uid " "user name" "home folder" "shell";printf "${__users_alias_printf_patt__}" "${__users_alias_sep0__}" "${__users_alias_sep1__}" "${__users_alias_sep2__}" "${__users_alias_sep3__}";getent passwd|awk -F: "{printf \"${__users_alias_awk_patt__}\", \$3, \$1, \$6, \$7}"|sort -n'

__groups_alias_col_offsets__=(5 25 50);
__groups_alias_printf_patt__="%-${__groups_alias_col_offsets__[0]}s  %-${__groups_alias_col_offsets__[1]}s %-${__groups_alias_col_offsets__[2]}s\n";
__groups_alias_awk_patt__="%-${__groups_alias_col_offsets__[0]}s  %-${__groups_alias_col_offsets__[1]}s %-${__groups_alias_col_offsets__[2]}s\\n";
__groups_alias_sep0__=$(eval printf "=%.0s" {1..$(( ${__groups_alias_col_offsets__[0]} - 0))});
__groups_alias_sep1__=$(eval printf "=%.0s" {1..$(( ${__groups_alias_col_offsets__[1]} - 1))});
__groups_alias_sep2__=$(eval printf "=%.0s" {1..$(( ${__groups_alias_col_offsets__[2]} - 1))});

alias lsgroups='printf "${__groups_alias_printf_patt__}" "gid" "group name" "members";printf "${__groups_alias_printf_patt__}" "${__groups_alias_sep0__}" "${__groups_alias_sep1__}" "${__groups_alias_sep2__}";getent group {1000..60000}|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groups_alias_awk_patt__}\", \$3, \$1, out;close(cmd);}"|sort -n'
alias listgroups='printf "${__groups_alias_printf_patt__}" "gid" "group name" "members";printf "${__groups_alias_printf_patt__}" "${__groups_alias_sep0__}" "${__groups_alias_sep1__}" "${__groups_alias_sep2__}";getent group {1000..60000}|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groups_alias_awk_patt__}\", \$3, \$1, out;close(cmd);}"|sort -n'
alias lsallgroups='printf "${__groups_alias_printf_patt__}" "gid" "group name" "members";printf "${__groups_alias_printf_patt__}" "${__groups_alias_sep0__}" "${__groups_alias_sep1__}" "${__groups_alias_sep2__}";getent group|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groups_alias_awk_patt__}\", \$3, \$1, out;close(cmd);}"|sort -n'
alias listallgroups='printf "${__groups_alias_printf_patt__}" "gid" "group name" "members";printf "${__groups_alias_printf_patt__}" "${__groups_alias_sep0__}" "${__groups_alias_sep1__}" "${__groups_alias_sep2__}";getent group|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groups_alias_awk_patt__}\", \$3, \$1, out;close(cmd);}"|sort -n'

__username_alias_col_offsets__=(25 5 30 35);
__username_alias_printf_patt__="%-${__username_alias_col_offsets__[0]}s  %-${__username_alias_col_offsets__[1]}s %-${__username_alias_col_offsets__[2]}s %-${__username_alias_col_offsets__[3]}s\n";
__username_alias_awk_patt__="%-${__username_alias_col_offsets__[0]}s  %-${__username_alias_col_offsets__[1]}s %-${__username_alias_col_offsets__[2]}s %-${__username_alias_col_offsets__[3]}s\n";
__username_alias_sep0__=$(eval printf "=%.0s" {1..$(( ${__username_alias_col_offsets__[0]} - 0))});
__username_alias_sep1__=$(eval printf "=%.0s" {1..$(( ${__username_alias_col_offsets__[1]} - 1))});
__username_alias_sep2__=$(eval printf "=%.0s" {1..$(( ${__username_alias_col_offsets__[2]} - 1))});
__username_alias_sep3__=$(eval printf "=%.0s" {1..$(( ${__username_alias_col_offsets__[3]} - 1))});

alias lsallusernames='printf "${__username_alias_printf_patt__}" "uid " "user name" "home folder" "shell";printf "${__username_alias_printf_patt__}" "${__username_alias_sep0__}" "${__username_alias_sep1__}" "${__username_alias_sep2__}" "${__username_alias_sep3__}";getent passwd|awk -F: "{printf \"${__username_alias_awk_patt__}\", \$1, \$3, \$6, \$7}"|sort -n'
alias lsallusersbyname='printf "${__username_alias_printf_patt__}" "uid " "user name" "home folder" "shell";printf "${__username_alias_printf_patt__}" "${__username_alias_sep0__}" "${__username_alias_sep1__}" "${__username_alias_sep2__}" "${__username_alias_sep3__}";getent passwd|awk -F: "{printf \"${__username_alias_awk_patt__}\", \$1, \$3, \$6, \$7}"|sort -n'
alias listallusernames='printf "${__username_alias_printf_patt__}" "uid " "user name" "home folder" "shell";printf "${__username_alias_printf_patt__}" "${__username_alias_sep0__}" "${__username_alias_sep1__}" "${__username_alias_sep2__}" "${__username_alias_sep3__}";getent passwd|awk -F: "{printf \"${__username_alias_awk_patt__}\", \$1, \$3, \$6, \$7}"|sort -n'
alias listallusersbyname='printf "${__username_alias_printf_patt__}" "uid " "user name" "home folder" "shell";printf "${__username_alias_printf_patt__}" "${__username_alias_sep0__}" "${__username_alias_sep1__}" "${__username_alias_sep2__}" "${__username_alias_sep3__}";getent passwd|awk -F: "{printf \"${__username_alias_awk_patt__}\", \$1, \$3, \$6, \$7}"|sort -n'

__groupname_alias_col_offsets__=(25 5 50);
__groupname_alias_printf_patt__="%-${__groupname_alias_col_offsets__[0]}s  %-${__groupname_alias_col_offsets__[1]}s %-${__groupname_alias_col_offsets__[2]}s\n";
__groupname_alias_awk_patt__="%-${__groupname_alias_col_offsets__[0]}s  %-${__groupname_alias_col_offsets__[1]}s %-${__groupname_alias_col_offsets__[2]}s\\n";
__groupname_alias_sep0__=$(eval printf "=%.0s" {1..$(( ${__groupname_alias_col_offsets__[0]} - 0))});
__groupname_alias_sep1__=$(eval printf "=%.0s" {1..$(( ${__groupname_alias_col_offsets__[1]} - 1))});
__groupname_alias_sep2__=$(eval printf "=%.0s" {1..$(( ${__groupname_alias_col_offsets__[2]} - 1))});

alias lsallgroupnames='printf "${__groupname_alias_printf_patt__}" "group name" "gid" "members";printf "${__groupname_alias_printf_patt__}" "${__groupname_alias_sep0__}" "${__groupname_alias_sep1__}" "${__groupname_alias_sep2__}";getent group|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groupname_alias_awk_patt__}\", \$1, \$3, out;close(cmd);}"|sort -n'
alias lsallgroupsbyname='printf "${__groupname_alias_printf_patt__}" "group name" "gid" "members";printf "${__groupname_alias_printf_patt__}" "${__groupname_alias_sep0__}" "${__groupname_alias_sep1__}" "${__groupname_alias_sep2__}";getent group|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groupname_alias_awk_patt__}\", \$1, \$3, out;close(cmd);}"|sort -n'
alias listallgroupnames='printf "${__groupname_alias_printf_patt__}" "group name" "gid" "members";printf "${__groupname_alias_printf_patt__}" "${__groupname_alias_sep0__}" "${__groupname_alias_sep1__}" "${__groupname_alias_sep2__}";getent group|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groupname_alias_awk_patt__}\", \$1, \$3, out;close(cmd);}"|sort -n'
alias listallgroupsbyname='printf "${__groupname_alias_printf_patt__}" "group name" "gid" "members";printf "${__groupname_alias_printf_patt__}" "${__groupname_alias_sep0__}" "${__groupname_alias_sep1__}" "${__groupname_alias_sep2__}";getent group|awk -F: "{out=\$4;cmd=\"/usr/bin/members \" \$1;if(\$4==\"\"){out=\"<no members>\";cmd | getline out;};printf \"${__groupname_alias_awk_patt__}\", \$1, \$3, out;close(cmd);}"|sort -n'

alias docuser='referenceUserCommands'
alias docusers='referenceUserCommands'
alias docgroup='referenceGroupCommands'
alias docgroups='referenceGroupCommands'

alias helpgroup='referenceGroupCommands'
alias helpgroups='referenceGroupCommands'
alias helpuser='referenceUserCommands'
alias helpusers='referenceUserCommands'

alias refuser='referenceUserCommands'
alias refusers='referenceUserCommands'
alias refgroup='referenceGroupCommands'
alias refgroups='referenceGroupCommands'

alias userdoc='referenceUserCommands'
alias usersdoc='referenceUserCommands'
alias groupdoc='referenceGroupCommands'
alias groupsdoc='referenceGroupCommands'

alias userhelp='referenceUserCommands'
alias usershelp='referenceUserCommands'
alias grouphelp='referenceGroupCommands'
alias groupshelp='referenceGroupCommands'

alias userref='referenceUserCommands'
alias usersref='referenceUserCommands'
alias groupref='referenceGroupCommands'
alias groupsref='referenceGroupCommands'

alias permref='referencePermissions'
alias permsref='referencePermissions'
alias refperm='referencePermissions'
alias refperms='referencePermissions'
alias octal='referenceOctalPermissions'
alias octalref='referenceOctalPermissions'

alias dfusb='displayNonFstabDiskMountpoints'
alias showusb='displayNonFstabDiskMountpoints'

alias isuefi='checkBIOSType'
alias isbios='checkBIOSType'
alias biostype='checkBIOSType'

# quick backups
alias bak='makeBackupWithDateOnly'
alias bakhh='makeBackupWithFullTimestamp'
alias backup='makeBackupWithDateOnly'
alias backuphh='makeBackupWithFullTimestamp'
alias mkbak='makeBackupWithDateOnly'
alias mkbakhh='makeBackupWithFullTimestamp'
alias mkbackup='makeBackupWithDateOnly'
alias mkbackuphh='makeBackupWithFullTimestamp'

alias hist='history'
alias histoff="setGnomeTerminalTitle 'Incognito Window' && set +o history"
alias histon="setGnomeTerminalTitle \"$USER@$HOSTNAME:\${PWD//\${HOME//\\//\\\\\\/}/\\~}\" && set -o history"
alias nohist="setGnomeTerminalTitle 'Incognito Window' && set +o history"
alias vihist='vi ~/.bash_history'

# remount any unmounted fstab entries such as drives with noauto
alias mfstab='mountAllFstabEntries'
alias mstab='mountAllFstabEntries'
alias restoremounts='mountAllFstabEntries'
alias restoremnts='mountAllFstabEntries'

alias blkid='sudo blkid'
alias parted='sudo parted --list'
alias fdisk='sudo fdisk --list'

alias diskinfo='printDriveAndPartitionInfo';
alias disks='printDriveAndPartitionInfo';
alias driveinfo='printDriveAndPartitionInfo';
alias drives='printDriveAndPartitionInfo';
alias partitions='printDriveAndPartitionInfo';

alias lsdisk='printDriveAndPartitionInfo';
alias lsdisks='printDriveAndPartitionInfo';
alias lsdrive='printDriveAndPartitionInfo';
alias lsdrives='printDriveAndPartitionInfo';

alias chkwinnames='checkFileNamesValidForWindows';
alias fixwinnames='removeInvalidCharactersFromFileNames';
#====================================================
# Search related commands
#====================================================
#grep aliases
alias grepa='alias|grep -Pi'
alias agrep='alias|grep -Pi'

CUSTOM_BASH_USER_FUNCTIONS="$HOME/.bash_functions $HOME/.bash_private $HOME/GAME_VARS";

alias grepfn="for f in $CUSTOM_BASH_USER_FUNCTIONS; do grep -P '^\\s*function\\s' "\$f" 2>/dev/null|sed -E 's/^\\s*function\\s+(\\w+)\\W.*\$/\1/g'; done|sort|grep -Pi"
alias fngrep="for f in $CUSTOM_BASH_USER_FUNCTIONS; do grep -P '^\\s*function\\s' "\$f" 2>/dev/null|sed -E 's/^\\s*function\\s+(\\w+)\\W.*\$/\1/g'; done|sort|grep -Pi"
alias listfunctions="for f in $CUSTOM_BASH_USER_FUNCTIONS; do grep -P '^\\s*function\\s' "\$f" 2>/dev/null|sed -E 's/^\\s*function\\s+(\\w+)\\W.*\$/\1/g'; done|sort|grep -Pi"
alias listfunc="for f in $CUSTOM_BASH_USER_FUNCTIONS; do grep -P '^\\s*function\\s' "\$f" 2>/dev/null|sed -E 's/^\\s*function\\s+(\\w+)\\W.*\$/\1/g'; done|sort|grep -Pi"

alias displayfunction='declare -f'
alias displayfn='declare -f'
alias functionsource='declare -f'
alias fnsource='declare -f'
alias fnsrc='declare -f'
alias showfunction='declare -f'
alias showfn='declare -f'

#grep dirs
alias grepd='LC_ALL=c ls -qAhclp1 --group-directories-first | grep -P -i -e '
alias dgrep='LC_ALL=c ls -qAhclp1 --group-directories-first | grep -P -i -e '

alias f='find . -not -iwholename "*.git/*" '

#The -L follows symlinks
alias ff='findLinkedFilesIgnoringStdErr'
alias fd='findLinkedDirsIgnoringStdErr'
alias ff.='findUnlinkedFilesIgnoringStdErr'
alias fd.='findUnlinkedDirsIgnoringStdErr'

# empty stuff
alias fe='find . -type d -empty'

# find by file type
alias fmp4="find . -type f -iname '*.mp4' ";
alias fmkv="find . -type f -iname '*.mkv' ";
alias ftxt="find . -type f -iname '*.txt' ";
alias fexe="find . -type f -iname '*.exe' ";
alias fvid="find . -type f \( -iname '*.avi' -o  -iname '*.flv' -o  -iname '*.m[4kpo][4gv]' -o -iname '*.mpeg' -o -iname '*.ogm' -o -iname '*.wmv' \) ";
alias faud="find . -type f \( -iname '*.flac' -o  -iname '*.m[4p][3ab]' -o -iname '*.ogg' -o -iname '*.wav' -o -iname '*.wma' \) ";

#The -L follows symlinks
alias findf='findLinkedFilesIgnoringStdErr'
alias findd='findLinkedDirsIgnoringStdErr'

alias findfile='findLinkedFilesIgnoringStdErr'
alias finddir='findLinkedDirsIgnoringStdErr'

alias findf.='findUnlinkedFilesIgnoringStdErr'
alias findd.='findUnlinkedDirsIgnoringStdErr'

alias findfilenolink='findUnlinkedFilesIgnoringStdErr'
alias finddirnolink='findUnlinkedDirsIgnoringStdErr'

alias dupesinfile='findDuplicateLinesInFile'

# find and remove
alias rmemp="find . -type d -empty -delete";
alias rmempty="find . -type d -empty -delete";
alias rmtxt="find . -type f -iname '*.txt' -delete";
alias rmexe="find . -type f -iname '*.exe' -delete";


#====================================================
# Config related commands
#====================================================
alias cgrep='gsettings list-recursively | grep -i ';
alias fconf='gsettings list-recursively | grep -i ';
alias grepc='gsettings list-recursively | grep -i ';
alias grepconf='gsettings list-recursively | grep -i ';
alias fsetting='gsettings list-recursively | grep -i ';
alias fsettings='gsettings list-recursively | grep -i ';
alias lsconf='gsettings list-recursively';
alias lssettings='gsettings list-recursively';
alias printdconf='dconf dump /';
alias printgsettings='gsettings list-recursively';
alias printsettings='gsettings list-recursively';

alias before='gsettings list-recursively | tee /tmp/gsettings-snapshot-before.txt'
alias after='gsettings list-recursively | tee /tmp/gsettings-snapshot-after.txt'
alias snapshot='APPEND_TIMESTAMP=$(/bin/date +"%Y.%m.%d_%H.%M.%S");gsettings list-recursively | tee "/tmp/gsettings-snapshot-${APPEND_TIMESTAMP}".txt'
alias diffsettings='diff /tmp/gsettings-snapshot-before.txt /tmp/gsettings-snapshot-after.txt'

#====================================================
# System Info related commands
#====================================================
# os info + sys specs
alias pcinfo='echo -e "Mint Info:\n=====================";cat /etc/linuxmint/info;echo -e "\nUpstream Ubuntu Info:\n=====================";cat /etc/upstream-release/lsb-release;echo -e "\nUpstream Debian Info:\n=====================";cat /etc/debian_version;echo -e "\nDetailed System Info:\n=====================";inxi -F;';
alias sysinfo='echo -e "Mint Info:\n=====================";cat /etc/linuxmint/info;echo -e "\nUpstream Ubuntu Info:\n=====================";cat /etc/upstream-release/lsb-release;echo -e "\nUpstream Debian Info:\n=====================";cat /etc/debian_version;echo -e "\nDetailed System Info:\n=====================";inxi -F;';

#specs only
alias pcspecs='inxi -F;';
alias specs='inxi -F;';

#os info only
alias osinfo='echo -e "Mint Info:\n=====================";cat /etc/linuxmint/info;echo -e "\nUpstream Ubuntu Info:\n=====================";cat /etc/upstream-release/lsb-release;echo -e "\nUpstream Debian Info:\n=====================";cat /etc/debian_version;';
alias osversion='echo -e "Mint Info:\n=====================";cat /etc/linuxmint/info;echo -e "\nUpstream Ubuntu Info:\n=====================";cat /etc/upstream-release/lsb-release;echo -e "\nUpstream Debian Info:\n=====================";cat /etc/debian_version;';
alias version='echo -e "Mint Info:\n=====================";cat /etc/linuxmint/info;echo -e "\nUpstream Ubuntu Info:\n=====================";cat /etc/upstream-release/lsb-release;echo -e "\nUpstream Debian Info:\n=====================";cat /etc/debian_version;';

alias mintinfo='cat /etc/linuxmint/info;';
alias mintversion='cat /etc/linuxmint/info;';
alias whichmint='cat /etc/linuxmint/info;';

alias ubuntuinfo='cat /etc/upstream-release/lsb-release'
alias ubuntuversion='cat /etc/upstream-release/lsb-release'
alias whichubuntu='cat /etc/upstream-release/lsb-release'

alias debianinfo='cat /etc/debian_version'
alias debianversion='cat /etc/debian_version'
alias whichdebian='cat /etc/debian_version'

alias batt='printBatteryPercentages'
alias battery='printBatteryPercentages'

#====================================================
# Permission/ACL related commands
#====================================================
alias gimme="makeDirMineRecursively"
alias mine="makeDirMineRecursively"
alias mkmine="makeDirMineRecursively"
alias mineonly="makeDirOnlyMineRecursively"
alias onlymine="makeDirOnlyMineRecursively"

alias 400="sudo chmod -R 400"
alias 440="sudo chmod -R 440"
alias 500="sudo chmod -R 500"
alias 550="sudo chmod -R 550"
alias 600="sudo chmod -R 600"
alias 660="sudo chmod -R 660"
alias 700="sudo chmod -R 700"
alias 750="sudo chmod -R 750"
alias 760="sudo chmod -R 760"
alias 770="sudo chmod -R 770"
alias 777="sudo chmod -R 777"

alias u+r="sudo chmod -R u+r"
alias u+w="sudo chmod -R u+w"
alias u+x="sudo chmod -R u+x"
alias u+rw="sudo chmod -R u+rw"
alias u+rx="sudo chmod -R u+rx"
alias u+wr="sudo chmod -R u+wr"
alias u+wx="sudo chmod -R u+wx"
alias u+xr="sudo chmod -R u+xr"
alias u+xw="sudo chmod -R u+xw"

alias g+r="sudo chmod -R g+r"
alias g+w="sudo chmod -R g+w"
alias g+x="sudo chmod -R g+x"
alias g+rw="sudo chmod -R g+rw"
alias g+rx="sudo chmod -R g+rx"
alias g+wr="sudo chmod -R g+wr"
alias g+wx="sudo chmod -R g+wx"
alias g+xr="sudo chmod -R g+xr"
alias g+xw="sudo chmod -R g+xw"

#====================================================
# Hex/Binary/Octal commands
#====================================================
alias blobstring="getStringBlobFromBinary"
alias stringblob="getStringBlobFromBinary"
alias hexstr="getHexBlobWithSingleByteSpacing"
alias hexstring="getHexBlobWithSingleByteSpacing"
alias rawhex="getHexBlobWithNoSpacing"
alias hexblob="getHexBlobWithNoSpacing"
alias lshex='echo "cli: hexdump od xxd; gui: bless"'

#====================================================
# Package related commands
#====================================================
alias asearch='apt search'
alias apt-search='apt search'

#Unfortunately, bash complains about alias names starting with hyphens so no '--' for sudo apt remove ...
alias ++='sudo apt install'
alias ++y='sudo apt install -y'
alias +++='sudo apt install --install-recommends '
alias +++y='sudo apt install --install-recommends -y'
alias ++++='sudo apt install --install-recommends --install-suggests '

# techically the alias 'install' blocks '/usr/bin/install' but i dont really care
alias install='sudo apt install'
alias remove='sudo apt remove'
alias uninstall='sudo apt remove'
alias purge='sudo apt purge'
alias destroyitwithfire='sudo apt purge'

alias update='sudo apt update'
alias stfupdate='sudo apt-get update 2>&1 >/dev/null'
alias dist-upgrade='sudo apt dist-upgrade'
alias distro-update='sudo apt dist-upgrade'
alias upgrade='sudo apt dist-upgrade'

alias viewoptpkgs='apt-cache depends --no-pre-depends --no-depends --no-conflicts --no-breaks --no-replaces --no-enhances'
alias viewrecommends='apt-cache depends --no-pre-depends --no-depends --no-conflicts --no-breaks --no-replaces --no-enhances --no-suggests'
alias viewsuggests='apt-cache depends --no-pre-depends --no-depends --no-conflicts --no-breaks --no-replaces --no-enhances --no-recommends'

alias appsize="previewPackageDownloadSize"
alias pkgsize="previewPackageDownloadSize"

alias upgradepreview="previewUpgradablePackagesDownloadSize";
alias previewupgrade="previewUpgradablePackagesDownloadSize";
alias upgradesize="previewUpgradablePackagesDownloadSize";

alias upgradelist="sudo apt list --upgradable 2>&1|grep -Pv '^(Listing|WARNING|$)'|sed -E 's/^([^\/]+)\/.*$/\1/g'|tr '\n' ' '|sed -E 's/^\s+|\s+$//g'&&echo ''"
alias listupgrade="sudo apt list --upgradable 2>&1|grep -Pv '^(Listing|WARNING|$)'|sed -E 's/^([^\/]+)\/.*$/\1/g'|tr '\n' ' '|sed -E 's/^\s+|\s+$//g'&&echo ''"
alias listupgradable="sudo apt list --upgradable 2>&1|grep -Pv '^(Listing|WARNING|$)'|sed -E 's/^([^\/]+)\/.*$/\1/g'|tr '\n' ' '|sed -E 's/^\s+|\s+$//g'&&echo ''"
alias upgradable="sudo apt list --upgradable 2>&1|grep -Pv '^(Listing|WARNING|$)'|sed -E 's/^([^\/]+)\/.*$/\1/g'|tr '\n' ' '|sed -E 's/^\s+|\s+$//g'&&echo ''"

alias listppa='list_installed_ppa_repos'
alias listppas='list_installed_ppa_repos'

#alias isinstalled='dpkg -l'
alias isinstall='apt list package'
alias isappinstalled='apt list package'

#alias ispackageinstalled='dpkg -l'
alias ispackageinstalled='apt list package'
#alias doihave='dpkg -l'
alias doihave='apt list package'

# find what package a binary is from (e.g. /usr/bin/7z => p7zip-full)
alias whichpkg='whichPackage'

# similar to $(realpath $(which NAME)) but with better error handling
alias realbin='whichRealBinary'
alias whichbin='whichRealBinary'
alias whichreal='whichRealBinary'

# find out which binaries are in a package (e.g. p7zip-full => /usr/bin/7z)
alias listbin='whichBinariesInPackage'
alias listbins='whichBinariesInPackage'
alias listcmds='whichBinariesInPackage'
alias listutils='whichBinariesInPackage'

# display the glibc version
alias glibc="echo -e 'alias glibc=\"ldd --version|grep GLIBC\"\n' && ldd --version|grep --color=never GLIBC"

#====================================================
# Process and Service related commands
#====================================================
alias plist='echo "use ps aux" or "pgrep" or alias "pg"'
alias tasklist='echo "use ps aux or ps -ef or pgrep" or alias "pg"'
alias taskkill='echo "use kill -9 processname*" or "pkill -9 processname" or alias "pk"'
alias taskill='echo "use kill -9 processname*" or "pkill -9 processname" or alias "pk"'

alias killspot='killall -9 spotify';

alias pskill='pkill --signal 9 --full --ignore-case'
alias pslist='pgrep --list-full --full --ignore-case'
alias psgrep='pgrep --list-full --full --ignore-case'

alias pk='pkill --signal 9 --full --ignore-case'
alias p9='pkill --signal 9 --full --ignore-case'
alias pg='pgrep --list-full --full --ignore-case'

#override pgrep to automatically list all without having to specify args
alias pgrep='pgrep --list-full'

alias stop='stopSystemdServices'
alias stopsvc='stopSystemdServices'
alias stopservice='stopSystemdServices'

alias disable='stopAndDisableSystemdServices'
alias disablesvc='stopAndDisableSystemdServices'
alias disableservice='stopAndDisableSystemdServices'

alias enable='enableSystemdServices'
alias enablesvc='enableSystemdServices'
alias enableservic='enableSystemdServices'

alias restart='restartSystemdServices'
alias restartd='restartSystemdServices'
alias restartsvc='restartSystemdServices'
alias restartservice='restartSystemdServices'

alias restore='enableAndRestartSystemdServices'
alias restoresvc='enableAndRestartSystemdServices'
alias restoreservice='enableAndRestartSystemdServices'

# note: this overrides default atq and uses the function instead (use full path of /usr/bin/atq for non-function call)
alias atq='printAtQueue'
alias lsat='printAtQueue'
alias atmv='rescheduleAtJob'
alias atadd='addMinutesToAtJob'

#====================================================
# X-Window related commands
#====================================================
#interactive (changes cursor and waits for user to click)
alias ifind='ps -o pid,comm,start,etime,pcpu,pmem,size,args -p $(echo $(PIDSTR=$(xprop _NET_WM_PID); echo "$PIDSTR" | sed "s/^.*[^0-9]\([0-9][0-9]*\)[^0-9]*$/\1/g"))'
alias ikill='xkill'
alias findx='ps -o pid,comm,start,etime,pcpu,pmem,size,args -p $(echo $(PIDSTR=$(xprop _NET_WM_PID); echo "$PIDSTR" | sed "s/^.*[^0-9]\([0-9][0-9]*\)[^0-9]*$/\1/g"))'
alias killx='xkill'
alias pofwindow='ps -o pid,comm,start,etime,pcpu,pmem,size,args -p $(echo $(PIDSTR=$(xprop _NET_WM_PID); echo "$PIDSTR" | sed "s/^.*[^0-9]\([0-9][0-9]*\)[^0-9]*$/\1/g"))'
alias pofx='ps -o pid,comm,start,etime,pcpu,pmem,size,args -p $(echo $(PIDSTR=$(xprop _NET_WM_PID); echo "$PIDSTR" | sed "s/^.*[^0-9]\([0-9][0-9]*\)[^0-9]*$/\1/g"))'
alias xfind='ps -o pid,comm,start,etime,pcpu,pmem,size,args -p $(echo $(PIDSTR=$(xprop _NET_WM_PID); echo "$PIDSTR" | sed "s/^.*[^0-9]\([0-9][0-9]*\)[^0-9]*$/\1/g"))'

#other options/tools for getting x windows info:
#	xwininfo
#	xprop
#	xdotool selectwindow getwindowpid
#	xdotool getactivewindow
#	xdotool getwindowpid <the-window-id>

#by name
alias getwindowpid='getProcessIdByWindowName'
alias getwindowproc='getProcessInfoByWindowName'
alias pofw='getProcessInfoByWindowName'
alias pofwinname='getProcessInfoByWindowName'
#also see /bin/pidof
alias pidofwinname='getProcessIdByWindowName'

alias getkeycode='xev -event keyboard 2>&1 | grep -i -P "keycode [a-f0-9]+ \([^\)]+\)" -B 2 -A 3'
alias keycode='xev -event keyboard 2>&1 | grep -i -P "keycode [a-f0-9]+ \([^\)]+\)" -B 2 -A 3'

# xrandr
alias xleft='xrandr --orientation left'
alias xright='xrandr --orientation right'
alias xnormal='xrandr --orientation normal'
alias xreset='xrandr --orientation normal'
alias xtop='xrandr --orientation normal'
alias xbottom='xrandr --orientation inverted'
alias xinvert='xrandr --orientation inverted'
alias xupsidedown='xrandr --orientation inverted'

#====================================================
# Audio/Sound related commands
#====================================================
alias aslamixer='echo -e "\nCorrecting to ALSAmixer...\n";alsamixer'
alias pavcontrol='echo -e "\nCorrecting to pavUcontrol...\n";pavucontrol'

alias am='alsamixer'
alias pav='pavucontrol'

alias fixsound='unmuteAllAlsaAudioControls';
alias fixvol='unmuteAllAlsaAudioControls';
alias fixvolume='unmuteAllAlsaAudioControls';

#====================================================
# Wine related commands
#====================================================
alias mkwine32='createNewWine32Prefix'
alias mkwine32pfx='createNewWine32Prefix'
alias mkwinepfx32='createNewWine32Prefix'
alias mkwine64='createNewWine32Prefix'
alias mkwine64pfx='createNewWine32Prefix'
alias mkwinepfx64='createNewWine32Prefix'

alias winebase='goToWinePrefix'
alias winetop='goToWinePrefix'
alias winepfx='goToWinePrefix'
alias pfx='goToWinePrefix'
alias cdpfx='goToWinePrefix'
alias uppfx='goToWinePrefix'
alias pfxbase='goToWinePrefix'
alias pfxtop='goToWinePrefix'

alias wineconf='wineConfigHere'
alias wineconfig='wineConfigHere'
alias winecmd='wineCmdHere'
alias winereg='wineRegeditHere'

alias cmd='wineCmdHere'
alias wcmd='wineCmdHere'
alias reg='wineRegeditHere'
alias wreg='wineRegeditHere'
alias wconf='wineConfigHere'

alias wt='winetricksHere'

alias printpfx='printWinePrefix'
alias whichpfx='printWinePrefix'
alias lspfx='printWinePrefix'
alias pwdpfx='printWinePrefix'
alias pfxpwd='printWinePrefix'
alias ppfx='printWinePrefix'

alias listprotongames="protontricks -s '*'|grep -P '[()]'"
alias protongames="protontricks -s '*'|grep -P '[()]'"

#====================================================
# Display related commands
#====================================================
alias resetgamma='xgamma -gamma 1.0';
alias gam0='xgamma -gamma 1.0';
alias fixgam='xgamma -gamma 1.0';
alias gam++="xgamma -gamma \$(xgamma 2>& 1 | perl -pe 's/^\\D*(\\d+\\.\\d+)\\D.*\$/\"\" . (\$1 + 0.1)/ge')";
alias gam--="xgamma -gamma \$(xgamma 2>& 1 | perl -pe 's/^\\D*(\\d+\\.\\d+)\\D.*\$/\"\" . (\$1 - 0.1)/ge')";
alias lighten="xgamma -gamma \$(xgamma 2>& 1 | perl -pe 's/^\\D*(\\d+\\.\\d+)\\D.*\$/\"\" . (\$1 + 0.1)/ge')";
alias lighter="xgamma -gamma \$(xgamma 2>& 1 | perl -pe 's/^\\D*(\\d+\\.\\d+)\\D.*\$/\"\" . (\$1 + 0.1)/ge')";
alias darken="xgamma -gamma \$(xgamma 2>& 1 | perl -pe 's/^\\D*(\\d+\\.\\d+)\\D.*\$/\"\" . (\$1 - 0.1)/ge')";
alias darker="xgamma -gamma \$(xgamma 2>& 1 | perl -pe 's/^\\D*(\\d+\\.\\d+)\\D.*\$/\"\" . (\$1 - 0.1)/ge')";
alias toodark='xgamma -gamma 1.2';
alias toodark2='xgamma -gamma 1.4';
alias toolight='xgamma -gamma 0.8';
alias toolight2='xgamma -gamma 0.6';
alias gam09='xgamma -gamma 0.9';
alias gam08='xgamma -gamma 0.8';
alias gam07='xgamma -gamma 0.7';
alias gam06='xgamma -gamma 0.6';
alias gam05='xgamma -gamma 0.5';
alias gam04='xgamma -gamma 0.4';
alias gam03='xgamma -gamma 0.3';
alias gam02='xgamma -gamma 0.2';
alias gam01='xgamma -gamma 0.1';
alias gam10='xgamma -gamma 1.0';
alias gam11='xgamma -gamma 1.1';
alias gam12='xgamma -gamma 1.2';
alias gam13='xgamma -gamma 1.3';
alias gam14='xgamma -gamma 1.4';
alias gam15='xgamma -gamma 1.5';
alias gam16='xgamma -gamma 1.6';
alias gam17='xgamma -gamma 1.7';
alias gam18='xgamma -gamma 1.8';
alias gam19='xgamma -gamma 1.9';
alias gam20='xgamma -gamma 2.0';
alias gam21='xgamma -gamma 2.1';
alias gam22='xgamma -gamma 2.2';
alias gam23='xgamma -gamma 2.3';
alias gam24='xgamma -gamma 2.4';
alias gam25='xgamma -gamma 2.5';
alias gam26='xgamma -gamma 2.6';
alias gam27='xgamma -gamma 2.7';
alias gam28='xgamma -gamma 2.8';
alias gam29='xgamma -gamma 2.9';

#====================================================
# Archive related commands
#====================================================
alias 7zdir="create7zArchive";
alias zipdir="createTarXzArchive";
alias xzdir="createTarXzArchive";
alias tardir='echo "dirname=\"foo\";";echo "tar -czf \"\${dirname}.tar.gz\" \"\${dirname}\";";'

#====================================================
# Network related commands
#====================================================
alias ipaddr='ifconfig -a | grep -v "127.0.0.1" | egrep "\.[0-9]+\." | perl -p -n -e "s/^.*inet addr:([\d\.]+).*$/\$1/g"'
alias showip='ifconfig -a | grep -v "127.0.0.1" | egrep "\.[0-9]+\." | perl -p -n -e "s/^.*inet addr:([\d\.]+).*$/\$1/g"'
alias myip='ifconfig -a | grep -v "127.0.0.1" | egrep "\.[0-9]+\." | perl -p -n -e "s/^.*inet addr:([\d\.]+).*$/\$1/g"'
alias wanip='curl https://ipinfo.io/ip'
alias whatsmyip='curl https://ipinfo.io/ip'
alias publicip='curl https://ipinfo.io/ip'
alias pubip='curl https://ipinfo.io/ip'

alias mac='ifconfig -a|grep "HWaddr"| perl -p -n -e "s/^.*HWaddr ([a-f\d:]+).*$/\$1/g"'
alias macaddr='ifconfig -a|grep "HWaddr"| perl -p -n -e "s/^.*HWaddr ([a-f\d:]+).*$/\$1/g"'
alias showmac='ifconfig -a|grep "HWaddr"| perl -p -n -e "s/^.*HWaddr ([a-f\d:]+).*$/\$1/g"'
alias mymac='ifconfig -a|grep "HWaddr"| perl -p -n -e "s/^.*HWaddr ([a-f\d:]+).*$/\$1/g"'

alias netscan="sudo ls >/dev/null;echo -e '\nip addr\t\tmac addr\t\thostname\n=================================================';ETH0=\$(ifconfig | grep -P '^e\\w+0:' | sed 's/^\\(e[A-Za-z0-9]*0\\):.*\$/\\1/g');sudo arp-scan --localnet --interface=\"\$ETH0\" | grep -P '\\d\\.\\d\\.\\d' | sort";

alias netview='displayNetworkHostnames'

alias stopsmb='sudo systemctl stop smbd; sudo systemctl stop nmbd;'
alias startsmb='sudo systemctl start smbd; sudo systemctl start nmbd;'
alias restartsmb='sudo systemctl restart smbd; sudo systemctl restart nmbd;'

alias stopsamba='sudo systemctl stop smbd; sudo systemctl stop nmbd;'
alias startsamba='sudo systemctl start smbd; sudo systemctl start nmbd;'
alias restartsamba='sudo systemctl restart smbd; sudo systemctl restart nmbd;'

alias ufwoff='sudo ufw disable'
alias ufwon='sudo ufw enable'
alias ufwstat='sudo ufw status numbered'

alias nettype="internetType='ETHERNET';isVpnUp=\$(ifconfig -a|grep -P '^tun\d+: .*<.*\bUP\b'|wc -l); [[ '1' == \"\$isVpnUp\" ]] && internetType='VPN';echo \"Connected to internet via: \$internetType\""
alias connection="internetType='ETHERNET';isVpnUp=\$(ifconfig -a|grep -P '^tun\d+: .*<.*\bUP\b'|wc -l); [[ '1' == \"\$isVpnUp\" ]] && internetType='VPN';echo \"Connected to internet via: \$internetType\""
alias onvpn="internetType='ETHERNET';isVpnUp=\$(ifconfig -a|grep -P '^tun\d+: .*<.*\bUP\b'|wc -l); [[ '1' == \"\$isVpnUp\" ]] && internetType='VPN';echo \"Connected to internet via: \$internetType\""
alias vpn="internetType='ETHERNET';isVpnUp=\$(ifconfig -a|grep -P '^tun\d+: .*<.*\bUP\b'|wc -l); [[ '1' == \"\$isVpnUp\" ]] && internetType='VPN';echo \"Connected to internet via: \$internetType\""

#====================================================
# Text editor related commands
#====================================================
alias edit="openFileInTextEditor";
alias nemo="openNemo";

alias via="vi ${HOME}/.bash_aliases"
alias avi="vi ${HOME}/.bash_aliases"
alias vialias="vi ${HOME}/.bash_aliases"
alias editalias="openFileInTextEditor ${HOME}/.bash_aliases"

alias vif="vi ${HOME}/.bash_functions"
alias fvi="vi ${HOME}/.bash_functions"
alias vifunc="vi ${HOME}/.bash_functions"
alias editfunc="openFileInTextEditor ${HOME}/.bash_functions"

alias viref='referenceVim'
alias vihelp='referenceVim'

#====================================================
# Multimedia related commands
#====================================================
alias getmkvsubs="getMkvSubtitleTrackInfo";
alias mkvsubs="getMkvSubtitleTrackInfo";
alias rmmkvsubs="removeMkvSubtitleTracksById";

alias logmkvsubs="batchLogMkvSubtitleTrackInfo";
alias logallmkvsubs="batchLogMkvSubtitleTrackInfo";
alias lsmkvsubs="batchLogMkvSubtitleTrackInfo";
alias rmdirmkvsubs="batchRemoveMkvSubtitleTracksById";
alias rmallmkvsubs="batchRemoveMkvSubtitleTracksById";

alias setdirmkvdefaultsubs="batchSetMkvDefaultTrackId";
alias setmkvdefaultsubs="setMkvDefaultTrackId";

alias extractmkvsubs="extractMkvSubtitleTextById";
alias extractdirmkvsubs="batchExtractMkvSubtitleTextById";
alias extractallmkvsubs="batchExtractMkvSubtitleTextById";

alias popmkvsubs="extractMkvSubtitleTextById";
alias popdirmkvsubs="batchExtractMkvSubtitleTextById";
alias popallmkvsubs="batchExtractMkvSubtitleTextById";

alias addmkvsubs="addMkvSubtitleText";
alias adddirmkvsubs="batchAddMkvSubtitleText";
alias addallmkvsubs="batchAddMkvSubtitleText";

alias pushmkvsubs="addMkvSubtitleText";
alias pushdirmkvsubs="batchAddMkvSubtitleText";
alias pushallmkvsubs="batchAddMkvSubtitleText";

alias getmkvaudio="getMkvAudioTrackInfo";
alias mkvaudio="getMkvAudioTrackInfo";

alias 2mp3='extractMp3AudioFromVideoFile'
alias tomp3='extractMp3AudioFromVideoFile'
alias flv2mp3='extractMp3AudioFromVideoFile'
alias flvtomp3='extractMp3AudioFromVideoFile'
alias mp42mp3='extractMp3AudioFromVideoFile'
alias mp4tomp3='extractMp3AudioFromVideoFile'
alias vid2mp3='extractMp3AudioFromVideoFile'
alias vidtomp3='extractMp3AudioFromVideoFile'
alias extractaudio='extractMp3AudioFromVideoFile'
alias extractmp3='extractMp3AudioFromVideoFile'

alias allflvtomp3='extractMp3AudioFromAllFlvInCurrentDir'
alias allmp4tomp3='extractMp3AudioFromAllMp4InCurrentDir'
alias allvidstomp3='extractMp3AudioFromAllVideosInCurrentDir'

alias 2ogg='extractOggAudioFromVideoFile'
alias toogg='extractOggAudioFromVideoFile'
alias mp42ogg='extractOggAudioFromVideoFile'
alias mp4toogg='extractOggAudioFromVideoFile'
alias allmp4toogg='extractOggAudioFromAllMp4InCurrentDir'

alias levelmp3='normalizeAllMp3InCurrentDir'
alias normalmp3='normalizeAllMp3InCurrentDir'
alias normalizemp3='normalizeAllMp3InCurrentDir'

alias levelogg='normalizeAllOggInCurrentDir'
alias normalogg='normalizeAllOggInCurrentDir'
alias normalizeogg='normalizeAllOggInCurrentDir'

alias compdf='compressPdf'
alias p2t='convertPdfToText'
alias p2md='convertPdfToMarkdown'

alias ytdl="youtube-dl -f 'bestvideo[ext=mkv][height <=? 480]+bestaudio/bestvideo[ext=mp4][height <=? 480]+bestaudio/bestvideo+bestaudio/best' -o '%(title)s.%(ext)s' --restrict-filenames --quiet --no-warnings --ignore-errors --prefer-free-formats "
alias ytv="youtube-dl -f 'bestvideo[ext=mkv][height <=? 480]+bestaudio/bestvideo[ext=mp4][height <=? 480]+bestaudio/bestvideo+bestaudio/best' -o '%(title)s.%(ext)s' --restrict-filenames --quiet --no-warnings --ignore-errors --prefer-free-formats "
alias yt="youtube-dl -f 'bestvideo[ext=mkv][height <=? 480]+bestaudio/bestvideo[ext=mp4][height <=? 480]+bestaudio/bestvideo+bestaudio/best' -o '%(title)s.%(ext)s' --restrict-filenames --quiet --no-warnings --ignore-errors --prefer-free-formats "
alias yta="youtube-dl -f 'bestaudio[ext=mp3]/bestaudio[ext=m4a]/bestaudio[ext=ogg]/bestaudio' -o '%(title)s.%(ext)s' --restrict-filenames --quiet --no-warnings --ignore-errors --prefer-free-formats "
alias ytupdate="sudo youtube-dl -U";

alias ytvl="youtube-dl -f 'worst' -o '%(title)s.%(ext)s' --restrict-filenames --quiet --no-warnings --ignore-errors --prefer-free-formats "

# Note having an 'ss' is too short to be very userful and blocks
# the network-/socket-related command '/bin/ss'
alias ss2='scrot --delay 2 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss3='scrot --delay 3 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss4='scrot --delay 4 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss5='scrot --delay 5 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss6='scrot --delay 6 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss7='scrot --delay 7 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss8='scrot --delay 8 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss9='scrot --delay 9 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss10='scrot --delay 10 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss15='scrot --delay 15 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss20='scrot --delay 20 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss25='scrot --delay 25 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss30='scrot --delay 30 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss35='scrot --delay 35 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss40='scrot --delay 40 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss45='scrot --delay 45 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss50='scrot --delay 50 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss55='scrot --delay 55 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias ss60='scrot --delay 60 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';

alias scrot2='scrot --delay 2 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot3='scrot --delay 3 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot4='scrot --delay 4 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot5='scrot --delay 5 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot6='scrot --delay 6 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot7='scrot --delay 7 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot8='scrot --delay 8 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot9='scrot --delay 9 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot10='scrot --delay 10 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot15='scrot --delay 15 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot20='scrot --delay 20 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot25='scrot --delay 25 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot30='scrot --delay 30 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot35='scrot --delay 35 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot40='scrot --delay 40 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot45='scrot --delay 45 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot50='scrot --delay 50 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot55='scrot --delay 55 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';
alias scrot60='scrot --delay 60 --silent --count ~/Pictures/Screenshots/$(date +'%Y-%m-%d--%H%M%S').png && echo "Saved to ~/Pictures/Screenshots/"';

#====================================================
# Misc commands
#====================================================
# note: 'cl' blocks something from the package 'cl-launch'. From apt search: "uniform frontend to running Common Lisp code from the shell"
alias cl='reset'
alias cls="reset;echo 'Note: You can use Ctrl+L to clear the terminal screen quickly.';";
alias nocaps="SYM_GROUP_NAME='none';setxkbmap -layout us -option;setxkbmap -layout us -option caps:\${SYM_GROUP_NAME};gsettings set org.gnome.desktop.input-sources xkb-options \"['caps:\${SYM_GROUP_NAME}']\";"

alias scriptcheck='echo "Note: Actual command is shellcheck"; shellcheck'
alias checkscript='echo "Note: Actual command is shellcheck"; shellcheck'

alias c='clear'
alias l='LC_ALL=c ls -qAhclp1 --group-directories-first'

alias mkdir='mkdir -p'

#list directory
alias lsd='LC_ALL=c ls -qAhclp1 --group-directories-first';

# recreate windows dir /b (bare) command:
alias dir="LC_ALL=c ls -1qNAp --group-directories-first|grep -Pv '^\.{1,2}/?$'"

#list directory with headers
alias lsh="LC_ALL=c ls -qAhclp1 | sed '2iPerms         Ownr    Grp     Size Mod_Time     Name'";

#list verbose
alias lsv="LC_ALL=c ls -qAhclp1 --author --time-style=+'%Y-%m-%d %H:%M:%S' | sed '2iPerms         Auth    Ownr    Grp     Size Mod_Date   Mod_Time Name'";

#show drive space
alias drivespace='printAndSortByMountPoint'
alias space='printAndSortByMountPoint'
alias mostspace='printAndSortByAvailableDriveSpace'
alias spaceleft='printAndSortByAvailableDriveSpace'
alias spaceremaining='printAndSortByAvailableDriveSpace'
alias remainingspace='printAndSortByAvailableDriveSpace'

#python
alias py2='python2'
alias py3='python3'

alias restartcinnamon="echo -e \"Option 1. Press 'Ctrl+Alt+Esc\\nOption 2. Alt+F2, followed by R\\nOption 3. Try alias 'rcinn'\""
alias rcinn="cinnamon --replace --clutter-display=:0 2> /dev/null &"

alias subdirstolower="find . -mindepth 1 -depth -type d -not -iwholename '*.git/*' -regex '^.*/[^/]*[A-Z][^/]*\$' -exec rename 's/(.*)\\/([^\\/]*)/\$1\\/\\L\$2/' {} \\;"
alias tolower="find . -mindepth 1 -depth -type d -not -iwholename '*.git/*' -regex '^.*/[^/]*[A-Z][^/]*\$' -exec rename 's/(.*)\\/([^\\/]*)/\$1\\/\\L\$2/' {} \\;"
alias checksubdircase="find . -mindepth 1 -depth -type d -not -iwholename '*.git/*' -regex '^.*/[^/]*[A-Z][^/]*\$'"
alias subdircase="find . -mindepth 1 -depth -type d -not -iwholename '*.git/*' -regex '^.*/[^/]*[A-Z][^/]*\$'"
alias checkemptyfiles="find . -mindepth 1 -type f -not -iwholename '*.git/*' -size 0"
alias hasemptyfiles="find . -mindepth 1 -type f -not -iwholename '*.git/*' -size 0"
alias emptyfiles="find . -mindepth 1 -type f -not -iwholename '*.git/*' -size 0"

#====================================================
# GIT
#====================================================
#git CLI commands without 'git' prefix
alias add='git add'
alias branch='git branch'
alias checkout='git checkout';
alias clone='git clone'
alias clonef='gitCloneWithFormattedDir'
alias cloneflist='gitCloneWithFormattedDir'
alias clonefd='gitCloneWithFormattedDir "%o_%n"'
alias clonefdlist='gitCloneListWithFormattedDir "%o_%n"'
alias clonefdef='gitCloneWithFormattedDir "%o_%n"'
alias clonefork='gitCloneWithFormattedDir "%o_%n_FORK"'
alias commit='git commit -m'
alias commita='git add -A; git commit -a -m'
alias commitall='git add -A; git commit -a -m'
#this would block /usr/bin/diff which is used for comparing files
#alias diff='git diff'
alias log='GIT_PAGER=cat git log --format="%H  %cn  %cd  %s" --date=format:"%Y-%m-%d %H:%M:%S"';
alias prune='git remote prune origin'
alias pull='git pull --all'
alias origin='git config --get remote.origin.url'
alias reflog='git reflog'
alias remote='git config --get remote.origin.url'
alias remotes='git remote -v'
#Note using alias 'stat' will block /usr/bin/stat which is used for determining filesizes
#alias stat='git status'
alias unstage='git reset HEAD'
#Note using alias 'reset' will block /usr/bin/reset which is used for resetting terminal output

# e.g. revert filename OR git checkout -- filename
alias revert='git checkout HEAD -- '
alias revertSingleFile='git checkout HEAD -- '
alias resetSingleFile='git checkout HEAD -- '

# list files in last x commits
alias lslast='git diff --name-status HEAD~1..HEAD'
alias lslast2='git diff --name-status HEAD~2..HEAD~1'
alias lslast3='git diff --name-status HEAD~3..HEAD~2'
alias lslast4='git diff --name-status HEAD~4..HEAD~3'
alias lslast5='git diff --name-status HEAD~5..HEAD~4'
alias lslast6='git diff --name-status HEAD~6..HEAD~5'
alias lslast7='git diff --name-status HEAD~7..HEAD~6'
alias lslast8='git diff --name-status HEAD~8..HEAD~7'
alias lslast9='git diff --name-status HEAD~9..HEAD~8'

# list remotes for all repos under dir
alias lsremotes='gitListRemotesForAllReposUnderDir'

# diff files in last x commits
alias difflast='git diff HEAD~1..HEAD'
alias difflast2='git diff HEAD~2..HEAD~1'
alias difflast3='git diff HEAD~3..HEAD~2'
alias difflast4='git diff HEAD~4..HEAD~3'
alias difflast5='git diff HEAD~5..HEAD~4'
alias difflast6='git diff HEAD~6..HEAD~5'
alias difflast7='git diff HEAD~7..HEAD~6'
alias difflast8='git diff HEAD~8..HEAD~7'
alias difflast9='git diff HEAD~9..HEAD~8'

#git CLI abbreviated commands
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gadd='git add'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gdiff='git diff'
alias gi='git init'
alias gl='GIT_PAGER=cat git log --format="%H  %cn  %cd  %s" --date=format:"%Y-%m-%d %H:%M:%S"';
alias glg='GIT_PAGER=cat git log --graph --oneline --decorate --all'
alias gld='GIT_PAGER=cat git log --pretty=format:"%h %ad %s" --date=short --all'
alias glog='GIT_PAGER=cat git log --format="%H  %cn  %cd  %s" --date=format:"%Y-%m-%d %H:%M:%S"';
alias gp='git pull --all'
alias gprune='git remote prune origin'
alias gpull='git pull --all'
alias greset='git reset --hard'
alias gss='git status --short'
alias gst='git status'
alias gstat='git status'

#git CLI commands without space
alias gitadd='git add'
alias gitclone='git clone'
alias gitcommit='git commit -m'
alias gitcommitall='git add -A; git commit -a -m'
alias gitdiff='git diff'
alias gitlog='GIT_PAGER=cat git log --format="%H  %cn  %cd  %s" --date=format:"%Y-%m-%d %H:%M:%S"';
alias gitprune='git remote prune origin'
alias gitpull='git pull --all'
alias gitreset='git reset --hard'
alias gitstat='git status'

#gitext (GUI) commands
alias browse='gitext';
alias ge='gitext';
alias gebrowse='gitext';
alias gecheckout='gitext checkoutbranch';
alias geclone='gitext clone';
alias gecommit='gitext commit';
alias gepull='gitext pull --all';
alias gestash='gitext stash';

#custom git commands
alias gstgdel="__num__git__deletions__=\$(git ls-files --deleted -- .|wc -l);if [[ \$__num__git__deletions__ -gt 0 ]]; then \$(git ls-files --deleted -- .|sed -E 's/^(.*)$/\"\\1\"/'|xargs git add); else echo 'no deletions found'; fi"
alias stgdel="__num__git__deletions__=\$(git ls-files --deleted -- .|wc -l);if [[ \$__num__git__deletions__ -gt 0 ]]; then \$(git ls-files --deleted -- .|sed -E 's/^(.*)$/\"\\1\"/'|xargs git add); else echo 'no deletions found'; fi"
alias stagedel="__num__git__deletions__=\$(git ls-files --deleted -- .|wc -l);if [[ \$__num__git__deletions__ -gt 0 ]]; then \$(git ls-files --deleted -- .|sed -E 's/^(.*)$/\"\\1\"/'|xargs git add); else echo 'no deletions found'; fi"
alias stagedeletions="__num__git__deletions__=\$(git ls-files --deleted -- .|wc -l);if [[ \$__num__git__deletions__ -gt 0 ]]; then \$(git ls-files --deleted -- .|sed -E 's/^(.*)$/\"\\1\"/'|xargs git add); else echo 'no deletions found'; fi"
alias pullall='gitUpdateAllReposUnderDir'

#====================================================
# navigation
#====================================================
alias back='cd -'

alias h='cd ~/'
alias r='cd /'

alias @='nemo .'
alias explorer='nemo'

alias ~='cd ~'

alias u='cd ..'
alias up='cd ..'
alias up1='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias up7='cd ../../../../../../..'
alias up8='cd ../../../../../../../..'
alias up9='cd ../../../../../../../../..'

alias cdnew="makeThenChangeDir";

alias tmp='cd /tmp'
alias home='cd /home'
alias etc='cd /etc'
alias sources='cd /etc/apt/sources.list.d/'
alias ppas='cd /etc/apt/sources.list.d/'
alias smbconfig='cd /etc/samba'
alias nemodir='cd /usr/share/nemo'
alias nemoactions='cd /usr/share/nemo/actions'
alias apps='cd /usr/share/applications'


#====================================================
# Handle my common typos / bad spelling
#====================================================
alias dc='cd'
alias ls-acl='LC_ALL=c ls -qAhclp1 --group-directories-first'

alias ecgo='echo'
alias echp='echo'
alias eco='echo'

# when I hit lowercase 'K' instead of lowercase 'L'
alias k='LC_ALL=c ls -qAhclp1 --group-directories-first'

alias qhich='which'
alias mna='man'
alias mzn='man'
alias mnt='mount'
alias umnt='umount'

alias fepw='grep'
alias grpe='grep'
alias greo='grep'
alias greio='grep'
alias rgep='grep'
alias gre\[='grep'
alias up\[='cd ..'
