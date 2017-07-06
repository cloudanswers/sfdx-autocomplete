set -e
git clone git@github.com:cloudanswers/sfdx-autocomplete.git ~/.sfdx-autocomplete
echo "\n\n[ -s ~/.sfdx-autocomplete/sfdx-autocomplete.sh ] && . ~/.sfdx-autocomplete/sfdx-autocomplete.sh" >> ~/.bashrc
