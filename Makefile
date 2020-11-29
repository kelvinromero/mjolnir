mjolnir-come-back:
	flatpak
	dependencies
	rubymine

dependencies:
	./lib/install_dependencies_apt.sh
	./lib/install_dependencies_dnf.sh

rubymine: 
	./lib/install_rubymine.sh

ohmyzsh:
	./lib/install_ohmyzsh.sh

flatpak:
	./lib/install_flathub.sh

executable:
	chmod +x lib/*.sh