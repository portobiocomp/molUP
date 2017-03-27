# PKG Index - Gaussian for VMD

package ifneeded molUP        	                            1.0 [list source [file join $dir/molUP.tcl]]

#GUI
package ifneeded gui        	                            1.0 [list source [file join $dir/gui/gui.tcl]]
package ifneeded guiBondModif  	                            1.0 [list source [file join $dir/gui/guiBondModif.tcl]]
package ifneeded guiAngleModif  	                        1.0 [list source [file join $dir/gui/guiAngleModif.tcl]]
package ifneeded guiDihedModif  	                        1.0 [list source [file join $dir/gui/guiDihedModif.tcl]]
package ifneeded guiOpenFile      	                        1.0 [list source [file join $dir/gui/guiOpenFile.tcl]]
package ifneeded guiSaveFile      	                        1.0 [list source [file join $dir/gui/guiSaveFile.tcl]]
package ifneeded guiError         	                        1.0 [list source [file join $dir/gui/guiError.tcl]]
package ifneeded guiChargeMulti    	                        1.0 [list source [file join $dir/gui/guiChargeMulti.tcl]]
package ifneeded guiCalcSetup    	                        1.0 [list source [file join $dir/gui/guiCalcSetup.tcl]]
package ifneeded guiCredits     	                        1.0 [list source [file join $dir/gui/guiCredits.tcl]]
package ifneeded guiChangelog     	                        1.0 [list source [file join $dir/gui/guiChangelog.tcl]]


#lib
package ifneeded inputFile   	                            1.0 [list source [file join $dir/lib/inputFile.tcl]]
package ifneeded quit		  	                            1.0 [list source [file join $dir/lib/quit.tcl]]
package ifneeded timeControl     	                        1.0 [list source [file join $dir/lib/timeControl.tcl]]
package ifneeded loadGaussianInputFile     	                1.0 [list source [file join $dir/lib/loadGaussianInputFile.tcl]]
package ifneeded loadGaussianInputFile     	                2.0 [list source [file join $dir/lib/loadGaussianInputFile.1.tcl]]
package ifneeded loadGaussianOutputFile     	            1.0 [list source [file join $dir/lib/loadGaussianOutputFile.tcl]]
package ifneeded loadGaussianOutputFile     	            2.0 [list source [file join $dir/lib/loadGaussianOutputFile.1.tcl]]
package ifneeded editStructure                          	1.0 [list source [file join $dir/lib/editStructure.tcl]]
package ifneeded modify                                   	1.0 [list source [file join $dir/lib/modify.tcl]]
package ifneeded saveFiles                                 	1.0 [list source [file join $dir/lib/saveFiles.tcl]]
package ifneeded readFreq                                 	1.0 [list source [file join $dir/lib/readFreq.tcl]]
package ifneeded energy                                 	1.0 [list source [file join $dir/lib/energy.tcl]]
package ifneeded plot                                    	1.0 [list source [file join $dir/lib/plot.tcl]]
package ifneeded balloon                                    1.0 [list source [file join $dir/lib/balloon.tcl]]
package ifneeded addAtom                                    1.0 [list source [file join $dir/lib/addAtom.tcl]]
package ifneeded publication                                1.0 [list source [file join $dir/lib/publication.tcl]]
package ifneeded loadPrmtop                                 1.0 [list source [file join $dir/lib/loadPrmtopParameters.tcl]]


#Theme
package ifneeded gaussianTheme                              1.0 [list source [file join $dir/lib/theme/theme.tcl]]