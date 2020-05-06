#   ____              __  _             
#  / __/_ _____  ____/ /_(_)__  ___  ___
# / _// // / _ \/ __/ __/ / _ \/ _ \(_-<
#/_/  \_,_/_//_/\__/\__/_/\___/_//_/___/
                                       
  # TOP 10 COMMANDS 
    # copyright 2007 - 2010 Christopher Bratusek
    top10() { history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head; }
  # ARCHIVE EXTRACTOR
    extract() {
      clrstart="\033[1;34m"  #color codes
      clrend="\033[0m"

      if [[ "$#" -lt 1 ]]; then
        echo -e "${clrstart}Pass a filename. Optionally a destination folder. You can also append a v for verbose output.${clrend}"
        exit 1 #not enough args
      fi

      if [[ ! -e "$1" ]]; then
        echo -e "${clrstart}File does not exist!${clrend}"
        exit 2 #file not found
      fi

      if [[ -z "$2" ]]; then
        DESTDIR="." #set destdir to current dir
      elif [[ ! -d "$2" ]]; then
        echo -e -n "${clrstart}Destination folder doesn't exist or isnt a directory. Create? (y/n): ${clrend}"
        read response
        #echo -e "\n"
        if [[ $response == y || $response == Y ]]; then
          mkdir -p "$2"
          if [ $? -eq 0 ]; then
            DESTDIR="$2"
          else
            exit 6 #Write perms error
          fi
        else
          echo -e "${clrstart}Closing.${clrend}"; exit 3 # n/wrong response
        fi
      else
        DESTDIR="$2"
      fi

      if [[ ! -z "$3" ]]; then
        if [[ "$3" != "v" ]]; then
          echo -e "${clrstart}Wrong argument $3 !${clrend}"
          exit 4 #wrong arg 3
        fi
      fi

      filename=`basename "$1"`

      #echo "${filename##*.}" debug

      case "${filename##*.}" in
        tar)
          echo -e "${clrstart}Extracting $1 to $DESTDIR: (uncompressed tar)${clrend}"
          tar x${3}f "$1" -C "$DESTDIR"
          ;;
        gz)
          echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
          tar x${3}fz "$1" -C "$DESTDIR"
          ;;
        tgz)
          echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
          tar x${3}fz "$1" -C "$DESTDIR"
          ;;
        xz)
          echo -e "${clrstart}Extracting  $1 to $DESTDIR: (gip compressed tar)${clrend}"
          tar x${3}f -J "$1" -C "$DESTDIR"
          ;;
        bz2)
          echo -e "${clrstart}Extracting $1 to $DESTDIR: (bzip compressed tar)${clrend}"
          tar x${3}fj "$1" -C "$DESTDIR"
          ;;
        zip)
          echo -e "${clrstart}Extracting $1 to $DESTDIR: (zipp compressed file)${clrend}"
          unzip "$1" -d "$DESTDIR"
          ;;
        rar)
          echo -e "${clrstart}Extracting $1 to $DESTDIR: (rar compressed file)${clrend}"
          unrar x "$1" "$DESTDIR"
          ;;
        7z)
          echo -e  "${clrstart}Extracting $1 to $DESTDIR: (7zip compressed file)${clrend}"
          7za e "$1" -o"$DESTDIR"
          ;;
        *)
          echo -e "${clrstart}Unknown archieve format!"
          exit 5
          ;;
      esac
    }
  # ARCHIVE COMPRESS
    compress() {
      if [[ -n "$1" ]]; then
        FILE=$1
        case $FILE in
        *.tar ) shift && tar cf $FILE $* ;;
    *.tar.bz2 ) shift && tar cjf $FILE $* ;;
     *.tar.gz ) shift && tar czf $FILE $* ;;
        *.tgz ) shift && tar czf $FILE $* ;;
        *.zip ) shift && zip $FILE $* ;;
        *.rar ) shift && rar $FILE $* ;;
        esac
      else
        echo "usage: compress <foo.tar.gz> ./foo ./bar"
      fi
    }
  #}}}
  # REMIND ME, ITS IMPORTANT! {{{
    # usage: remindme <time> <text>
    # e.g.: remindme 10m "omg, the pizza"
    remindme() { sleep $1 && zenity --info --text "$2" & }
  #}}}
  # SIMPLE CALCULATOR
    # usage: calc <equation>
    calc() {
      if which bc &>/dev/null; then
        echo "scale=3; $*" | bc -l
      else
        awk "BEGIN { print $* }"
      fi
    }
  # FILE & STRINGS RELATED FUNCTIONS
    ## FIND A FILE WITH A PATTERN IN NAME
      ff() { find . -type f -iname '*'$*'*' -ls ; }
    ## FIND A FILE WITH PATTERN $1 IN NAME AND EXECUTE $2 ON IT
      fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }
    ## SWAP 2 FILENAMES AROUND, IF THEY EXIST
      #(from Uzi's bashrc).
      swap() {
        local TMPFILE=tmp.$$

        [[ $# -ne 2 ]] && echo "swap: 2 arguments needed" && return 1
        [[ ! -e $1 ]] && echo "swap: $1 does not exist" && return 1
        [[ ! -e $2 ]] && echo "swap: $2 does not exist" && return 1

        mv "$1" $TMPFILE
        mv "$2" "$1"
        mv $TMPFILE "$2"
      }
    ## FINDS DIRECTORY SIZES AND LISTS THEM FOR THE CURRENT DIRECTORY
      dirsize () {
        du -shx * .[a-zA-Z0-9_]* 2> /dev/null | egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
        egrep '^ *[0-9.]*M' /tmp/list
        egrep '^ *[0-9.]*G' /tmp/list
        rm -rf /tmp/list
      }
  # SYSTEMD SUPPORT
    if which systemctl &>/dev/null; then
      start() {
        sudo systemctl start $1.service
      }
      restart() {
        sudo systemctl restart $1.service
      }
      stop() {
        sudo systemctl stop $1.service
      }
      enable() {
        sudo systemctl enable $1.service
      }
      status() {
        sudo systemctl status $1.service
      }
      disable() {
        sudo systemctl disable $1.service
      }
    fi