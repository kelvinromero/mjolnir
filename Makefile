mjolnir-come-back:
	dependencies
	rubymine

dependencies:
	./lib/install_dependencies_apt.sh
	./lib/install_dependencies_dnf.sh

rubymine: 
	./lib/install_rubymine.sh

ohmyzsh:
	./lib/install_ohmyzsh.sh

executable:
	chmod +x lib/*.sh