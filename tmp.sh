eval "$(clog Crayon)"
n=$(find . -name '*Zone.Identifier'|wc -l)
clog Log -E "Delete $n Zone.Identifier files made by Windows"
while IFS= read -r line; do
   fn="$(echo ${line:2}|cut  -d ":" -f "1")"
   id="$(echo ${line:2}|cut  -d ":" -f "2")"
  clog Log -E "delete$cF $fn$cX:$cW$id"
done < <(find . -name '*Zone.Identifier')