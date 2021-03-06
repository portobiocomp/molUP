package provide loadGaussianInputFile 1.6.3

### This procedure load a gaussian input file and converts it to PDB
proc molUP::loadGaussianInputFile {} {
    
    #### Get the title line
	set lineNumberTitle [expr [molUP::getBlankLines $molUP::path 0] + 1]
	set molUP::title [exec $molUP::sed -n "$lineNumberTitle {p; :loop n; q; b loop}" $molUP::path]

	#### Get the Charge and Multiplicity
	set lineNumberCharge [expr [molUP::getBlankLines $molUP::path 1] + 1]
	set molUP::chargesMultip [exec $molUP::sed -n "$lineNumberCharge {p; :loop n; q; b loop}" $molUP::path]

	#### Keywords of the calculations
	set lineNumberKeyword [expr [molUP::getBlankLines $molUP::path 0] - 1]
	if {$lineNumberKeyword != 1} {
		catch {exec $molUP::sed -n "1 {p; :loop n; p; $lineNumberKeyword q; b loop}" $molUP::path} molUP::keywordsCalc
	} else {
		catch {exec $molUP::sed -n "1 {p; :loop n; q; b loop}" $molUP::path} molUP::keywordsCalc
	}

	#### Number of Atoms
	set lineNumberFirst [expr [molUP::getBlankLines $molUP::path 1] + 2]
	set lineNumberLast [expr [molUP::getBlankLines $molUP::path 2] - 1]
	set molUP::numberAtoms [expr $lineNumberLast - $lineNumberFirst + 1]
	
	## Get the Initial Structure
	if {$lineNumberFirst != $lineNumberLast} {
		catch {exec $molUP::sed -n "$lineNumberFirst {p; :loop n; p; $lineNumberLast q; b loop}" $molUP::path} molUP::structureGaussian
	} else {
		catch {exec $molUP::sed -n "$lineNumberFirst {p; :loop n; q; b loop}" $molUP::path} molUP::structureGaussian
	}

	## Get connectivity information about structure
	set lineNumberConnect [expr $lineNumberLast + 2]
	set lineNumberLastConnect [expr [molUP::getBlankLines $molUP::path 3] - 1]
	if {$lineNumberConnect == [expr $lineNumberLastConnect - 1]} {
		set molUP::connectivityInputFile ""
	} else {
		if {$lineNumberConnect != $lineNumberLastConnect} {
			catch {exec $molUP::sed -n "$lineNumberConnect {p; :loop n; p; $lineNumberLastConnect q; b loop}" $molUP::path} molUP::connectivityInputFile
		} else {
			catch {exec $molUP::sed -n "$lineNumberConnect {p; :loop n; q; b loop}" $molUP::path} molUP::connectivityInputFile
		}
	}

	set a [expr $lineNumberLastConnect + 1]
	catch {exec $molUP::sed -n "$a,\$ p" $molUP::path} molUP::parameters

    #### Organize the structure info
    set molUP::structureGaussian [split $molUP::structureGaussian \n]
	set numberColumns [llength [lindex $molUP::structureGaussian 0]]

	if {$numberColumns == 4} {
		molUP::readSmallModelStructure
		variable attributes [list "x" "y" "z" "element" "name" "type" "resname" "resid"]

	} elseif {$numberColumns > 4} {
		molUP::readOniomStructure
		variable attributes [list "x" "y" "z" "element" "name" "type" "resname" "resid" "altloc" "user" "charge"]

	} else {
		molUP::guiError "The file has a strange structure. The file cannot be openned. Please, contact molUp develoeprs to request support for this type of file." "Error"
	}

	#### Load and prepara structure on VMD
	molUP::createMolecule

	### Add connectivity to VMD
	if {$molUP::connectivityInputFile == ""} {
		mol ssrecalc top
		mol bondsrecalc top
		mol reanalyze top
	} else {
		set connectList [molUP::convertGaussianInputConnectToVMD $molUP::connectivityInputFile]
		topo clearbonds
		topo setbondlist $connectList
		set molUP::connectivity $molUP::connectivityInputFile
	}

	display resetview

}

proc molUP::createMolecule {} {
	## Create a new Molecule
	mol new atoms $molUP::numberAtoms
	## Change the name
	mol rename top "[subst $molUP::fileName]"
	## Create a frame
	animate dup top
	## Add the info
	[atomselect top all] set $molUP::attributes $molUP::structureReadyToLoad
	## Create the first representantion
	mol selection all
	mol color Name
	mol addrep top
	## Place connectivity
	mol ssrecalc top
	mol bondsrecalc top
	mol reanalyze top
}
    