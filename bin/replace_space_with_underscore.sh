#/bin/sh

original_file = $1

# using sed
mv -i "${original_file}" "$(echo "${original_file}" | sed 's/ /_/g')"

# with tr
#mv -i "${original_file}" "$(echo "${original_file}" | tr ' ' _)"

# with bash substring replacement
#mv -i "${original_file}" "${original_file// /_}"

# with rename command
#rename "s/ /_/g" "${original_file}"
