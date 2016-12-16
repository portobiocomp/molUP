# Tcl package index file, version 1.1
# This file is generated by the "pkg_mkIndex" command
# and sourced either when an application starts up or
# by a "package unknown" script.  It invokes the
# "package ifneeded" command to set up package-related
# information so that packages will be loaded automatically
# in response to "package require" commands.  When this
# script is sourced, the variable $dir must contain the
# full path name of this file's directory.

set dir [exec pwd]

#GUI
package ifneeded gui        	                            1.0 [list source [file join $dir/routines/gui.tcl]]
package ifneeded guiBondModif  	                            1.0 [list source [file join $dir/routines/guiBondModif.tcl]]

#lib
package ifneeded inputFile   	                            1.0 [list source [file join $dir/lib/inputFile.tcl]]
package ifneeded getStructure  	                            1.0 [list source [file join $dir/lib/getStructure.tcl]]
package ifneeded convertToPDB  	                            1.0 [list source [file join $dir/lib/convertToPDB.tcl]]
package ifneeded quit		  	                            1.0 [list source [file join $dir/lib/quit.tcl]]
package ifneeded loadMoleculeVMD 	                        1.0 [list source [file join $dir/lib/loadMoleculeVMD.tcl]]
package ifneeded timeControl     	                        1.0 [list source [file join $dir/lib/timeControl.tcl]]
package ifneeded loadGaussianInputFile     	                1.0 [list source [file join $dir/lib/loadGaussianInputFile.tcl]]
package ifneeded loadGaussianOutputFile     	            1.0 [list source [file join $dir/lib/loadGaussianOutputFile.tcl]]
package ifneeded loadGaussianOutputFileFirstStructure     	1.0 [list source [file join $dir/lib/loadGaussianOutputFileFirstStructure.tcl]]
package ifneeded loadGaussianOutputFileLastStructure     	1.0 [list source [file join $dir/lib/loadGaussianOutputFileLastStructure.tcl]]
package ifneeded applyToStructure                        	1.0 [list source [file join $dir/lib/applyToStructure.tcl]]
package ifneeded editStructure                          	1.0 [list source [file join $dir/lib/editStructure.tcl]]
package ifneeded modify                                   	1.0 [list source [file join $dir/lib/modify.tcl]]