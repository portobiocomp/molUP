package provide loadMoleculeVMD 1.0 

proc gaussianVMD::loadMolecule {fileName timeWhenWasSaved} {
	 ##Load the Molecule
	  mol new .temporary/[subst $timeWhenWasSaved]/[subst $fileName].pdb type pdb first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor 1

	##Show a successful messgae
	#set alert [tk_messageBox -message "The file was sucessfully loaded." -type ok -icon info]

	gaussianVMD::addSelectionRep
}