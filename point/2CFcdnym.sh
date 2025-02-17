#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '2CFcdnym.sh' encrypted at Fri Jan 19 05:27:39 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY��T�  ���@ ~����O.��������������홎��k�ӽ����I�j{m�M�aG�jl�j43j�F���z���6������ �4� ��=Li=&C�5FCi �@  �   h  ��IOҟ�6���z�4�F���  �@�d  hI0	51�MM h �         �B��OI�!��M=&##@�LM�#!� 	�hb ��d��<%��bv�H(`Ao�U`��,,(�[�pP�A0��Ƴ�sa0af�u\[��b9��[�b}ĦӾ�� /�
_�4w�ш�1y�����D��|TU�W�r����E��&�&�t�Z�̣�$�B��u�(S~;<>_6z�׾xŊ�K]SŵU�D,�����!�8�D�%�vAX�(���L
��pU��$3l���R��qo��5f.c;�0���GD�:�L�+��6��ت\��pl�:��Q���P�2�$IH'a��kTEj�ZCt@<i��C{5^$�=�)�z�ޱ���&HX���ڪ(٤�q�e� BEĭ���*g�n�
�0}L���κ�2��E�PH3�f���Z��puT:�Fq�(��O�� ��&�Y�l#4�'Cax���S�8����k'�"Ġt� =m���c�U�.�$�̶A�TH[�P}(��e���N(����D���*��#���sm0l�B8��B�82@�9�\
�"�@�����`��� ٍ�" H:,�Y�-k�S�1Z	*�6��>�%g1�34e���Q�0<(�R�Y�)+F6�V+�ɩ�SK��i�"\���h�BVBVSDs�[IF.��pc��*�a^5�\:*(#F$�D��0z�>K�nՖY:�S�B�R�b�`��mƊG�+��-pK�bȓf��F0�w7����t°t\�!^/1�k7k���h�R�d.c�qm@�����Y��)�����CE)����1�@5���eǣ2f��%PT����QSZ��$�ov��	XC  .:�Ј�A��a $�.R��W��� I��� �Q��=Y��~x��n �����`_2.����:����Ț��18~D�����y	Ѹ����{��{'���W�FX�x�<!M
��)����^%67u�P��P3/qT�-��6p�Ӷ%M'���kai&;�g�&�<aO;��J��)6�f��A��`��Db�U�7����"�������ES��r2Mn�� ^$����~D�F`�r��y�6���˗��.,�:*�����ڎ�	�l�/��	6���T�\e`�Ui�~.&;��c�871凢���W1��{@QgY�ܣ�}w�^K�T��C�>C4�E,!�PTR�v�)9Ym/�͒����/��f#FЉ�rE8P���T�