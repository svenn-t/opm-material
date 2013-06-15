# -*- mode: cmake; tab-width: 2; indent-tabs-mode: t; truncate-lines: t; compile-command: "cmake -Wdev" -*-
# vim: set filetype=cmake autoindent tabstop=2 shiftwidth=2 noexpandtab softtabstop=2 nowrap:

# emulate the with-xxx feature of autotools to not give warnings
# if we specify the directories of packages that are known to the
# family but not necessarily used

# pick package names from these; opm-xxx, dune-xxx
set (KNOWN_FAMILIES
	opm
	dune
	)

# variables to test; xxx_DIR, xxx_ROOT
set (KNOWN_VARS
	DIR
	ROOT
	)

set (KNOWN_opm_PKGS
	autodiff
	core
	material
	parser
	polymer
	porsol
	upscaling
	verteq
	)

set (KNOWN_dune_PKGS
	common
	cornerpoint
	geometry
	grid
	istl
	localfunctions
	)

foreach (family IN ITEMS ${KNOWN_FAMILIES})
	foreach (package IN ITEMS ${KNOWN_${family}_PKGS})
		foreach (var IN ITEMS ${KNOWN_VARS})
			# just "use" the variable, so we don't get warnings
			set (_dummy ${${family}-${package}_${var}})
		endforeach (var)
	endforeach (package)
endforeach (family)
