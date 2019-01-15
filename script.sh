
# ====FUNCTION====Run Ansible Playbook

function runAnsiblePlaybook(){
	ansible-playbook playbook.yml -i hosts.ini
}





# ====FUNCTION====Complete

function bishBashBosh(){
	hub_ip=$(cat hub.txt | cut -d- -f1)

	clear
	cat <<-"PIPBOY"
	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓██▓▓▓▓▓▓█▒░░░▒▒▒░░░░░░▒▒▒▒▒▒▒░▓█▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓█▒▒█▓▓▓▓██░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▓█▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓█▓░░░▒████▒░░░░░░░░░░░▒▒▒░▒▒▒▒▒▒▒▒▒░▒██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓█▒░░░░░░░░░░░▓▓▒▒▒▓▓░░░░░▓▒▒▒▒▒▒▒▒▒▒▒▒░▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
	▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓█▓░░░░░░░░░▓▒░░░░░░░░░░░░░▒▓▒▒▓▓▒▒▓▓▒▒▒▒▒█▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒
	▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▓▓▒░░░░▒▓▒░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▒▒▒░▓▓▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒
	▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓░▒▒▓█▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒█▒▒▒▒▒█▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▒░░▓▒░░▓▓░░░░░░░░░░░░░░▒▓█░░░░░░░░░▒▓▒▒▒▒▒▒▓▓▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒░░░░░░░░░░░░░░░░░░░░░░▓▒░░░░░░▒▓▒▒▒▒▒▒▒▒█▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒░▒▓▒▒▒▒▒▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▓█░░░░▒██░░░░░▒▓░░░░░▓███▒░░░░░░░░░▒█▓▓▒▒▒▒█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒█▒░░░░▒██░░░░▓▓░░░░░░░░░░▓░░░░░░░░░▓▒▒▓▓▒▒▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▓▓▓▓▓▓▓▒▒▒▒▒▒▒▓███▓██▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▓█░░░░░░░░░░░▒▓░░░░░░░░░░░░░░░░░░░░▒▒▒▓▒▓▒▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▓▓▓▓▓▓▓▓▓▓▓▓▓█▓░░░░░░█▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▓█░░░░░░░░░▒█▓░░░░░░░░░░░░░░░░░░░░▒▓▒▒▒░▒██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓█▓░░░░░░░█▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓█░░░░░░░░░░░▓░░░░░░░░░░░░░░░░░░░░░░▒░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓█▒░░░░░░██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓█░░░░░░░░░░░░░░░░░░░░▓░░░░░░░░░░░░░░░░░░█▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓██▒░░░░░░█▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓█░░░░▓░░░░░░░░░░░░░░▓███▒░░░░░░░░░░░░░░░▒█▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓█▓░░░░░░█▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒▓▓▓▓▓▓▓▓█▓░░▒▓░░░░▒▒▒▒▒▒▒░░░░░▒██░░░░░░░░░░░░░░░█▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓██▓░░░░░▒█▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▓▓▓▓▓██▒░░▒▒▓▓▒░░░░░░░░▒▓▓▒░░▒░░░░░░░░░░▒▒▒██▓▓▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓████████▓▒▒░░▒▓██▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒░░░░░░▒▒▒▓▓▓██░░░░░░░▒▒▒▒▓▓▒░░░░░░░░░░░░░░░░░▓█▓▓▓▓▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓█▒▒░░░░░░░░░░░▒█▓░░▒▒█▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░░░░░░░░▒▒▓▓▓█▓░░░░░░░▒▓▒░░░░░░░░░░░░░░░░░▒█▓▓▒▒░░░░░░░░░░░▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓█░░░░░░░░░░░░░░░▒█▒░░▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒░░░░░░░░▒▓▓██░░░░░░░░░░░░░░░░░░░░░░░░▒██▓▓▒░░░░░░░░░▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓█▒░░░░░░░░░░░░░░░█▒░░▒▓█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒░▒▒▒▒▒▒▓███▒░░░░░░░░░░░░░░░░░░░▓▓█▓░░░░▒▓▓▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓█████▓▓▓▓▓▓▓▒▒▓▓░░░░▒▓▓▓█▒▒▒▒▓▓▓▓███████████████▓▓▓▓▓▓█▒▒▓██▓▒▒░░░░░░░░░░░░░▓▓░░░░░░░█▓▓██▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▒▒▒▒▒▓▓░░░░░░░░░░░░░▓█▓░░░▒█▓▒▓█▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█░░░░▒██▒░░░░░░░░░░▒██▒░░░░░░░▒█▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▒▒▒▒▓▓▒░░░░░░░░░░░░░░░▓▓░░█▓▒▒▒█▓▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█░░░░░░░▒▓████████▓░░░░░░░░░░▒█▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▓▓█▒░░░░░░░░░░░░░░▓▓░▒▒█▓▒▒▓█▓▓▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▒░░░░░░░░░░░░░░░░░░░░░░░░░░▒█▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▓██▓▓▒▒▒▒▒▓▓███▓▒░░░▒█▓▒▒▓█▓▓▓▓▓▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▓█▒░░░░░░░░░░░░▓▒░░░▓█▒▒▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▒░░░░░░░░░░░░░░░▒▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▓▓█▒░░░░░░░░░░░█▒░░▒▓▒▒▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓█▒░░░░░░░░░▒███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▒▒▒▒▓▓▓██▓▓█████▓▒▒▓█▓▒▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓▓▓▓█▓░░░░░░░░░░█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▒▒▒▓▓▓▓▓▓▓▓▓██████████▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓█▒░░░░░░░░░░█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓█▒░░░░░░░░░▒█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▓▒▒▒▒▓█▓▓▓▓▓▓▓▓▓▓▓█░░░░░░░░░░▒█▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒░░░▒▒▓█▓▓▓▓▓▓▓▓▓▓▓█░░░░░░░░░░▒█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░░░░░░▒▒▓█▓▓▓▓▓▓▓▓▓▓▓█░░░░░░░░░░░█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒░░░░░░░░░░▒▓██▓▒▓▓▓▓▓▓▓▓▓█▒░░░░░░░░░░█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▒▓▓████▓▓▓▓▓▓▓▒▓▒▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒░░░░░▒▒▓▓▓▓█▓▒▓▓▓▓▓▓▓▓▓█▒░░░░░░░░░░█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▒▒▒▒▓██▓▓▓▓▓▓▒▒▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
	PIPBOY

	echo ""
	echo ""
	echo ""
	echo "Bish, Bash, Bosh...job's a gud'"
	echo "Grid console can be found here: ==== http://"$hub_ip":4444/grid/console ===="
	echo ""
	echo "Direct your tests here: ==== http://"$hub_ip":4444/wd/hub ===="
}


# ====FUNCTION====runTest

function runTest(){

	function createTestEnv(){
		rm -rf test_the_grid
		mkdir test_the_grid && cd $_
	        npm init -y
		npm install --save selenium-webdriver
	}

	function createTest(){
		hub_ip=$(cat ../hub.txt | cut -d- -f1)
		cat > sample_test.js <<-DOIT
		const {Builder, By, Key, until} = require('selenium-webdriver');
		const fs = require('fs');
		const hubIP = 'http://$hub_ip:4444/wd/hub';

		console.log("=======================================================================================================================");
		console.log("              This is a small sample test, designed to prove that Selenium Grid is up and running.");
		console.log("=======================================================================================================================");
		console.log("");
		console.log("+ There is only one test - go to google.com, input a search query, get page title on results page");
		console.log("+ The test is performed on both FIREFOX and CHROME using Xvfb (not headlessly) so there should be an output from both");
		console.log("+ For further proof the test has been run, a screenshot is captured and saved to the folder from where the test was ran");
		console.log("");

		(async function exampleChrome() {
		let driver = await new Builder().forBrowser('chrome').usingServer(hubIP).build();

		try {
		    await driver.get('https://www.google.com/');
		    await driver.wait(until.elementLocated(By.name('q')));
		    await driver.findElement(By.name('q')).sendKeys('thumbs up pip boy', Key.RETURN);
		    await driver.wait(until.titleIs('thumbs up pip boy - Google Search'), 1000);
		    console.log('CHROME PROOF OF LIFE ----- The page title is: ', await driver.getTitle(), '(type> open chrome.png)\n\n');
		    await driver.takeScreenshot().then(function(data){
			var base64Data = data.replace(/^data:image\/png;base64,/,"")
			fs.writeFile("chrome.png", base64Data, 'base64', function(err) {
				if(err) console.log(err);
			});
		    });
		} finally {
		    await driver.quit();
		}
		})();

		(async function exampleFirefox() {
		let driver = await new Builder().forBrowser('firefox').usingServer(hubIP).build();

		try {
		    await driver.get('https://www.google.com/');
		    await driver.wait(until.elementLocated(By.name('q')));
		    await driver.findElement(By.name('q')).sendKeys('thumbs up', Key.RETURN);
		    await driver.wait(until.titleIs('thumbs up - Google Search'), 1000);
		    console.log('FIREFOX PROOF OF LIFE ---- The page title is: ', await driver.getTitle(), '(type> open firefox.png)\n\n');
		    await driver.takeScreenshot().then(function(data){
			var base64Data = data.replace(/^data:image\/png;base64,/,"")
			fs.writeFile("firefox.png", base64Data, 'base64', function(err) {
				if(err) console.log(err);
			});
		    });
		} finally {
		    await driver.quit();
		}
		})();
		DOIT
	}

	createTestEnv
	createTest
	clear
	node sample_test.js
	echo ""
	echo ""
	echo ""
	echo ""
}





# ====FUNCTION==== Remove all traces of previous build from working directory

function resetFolder(){
	set +e
	rm -f hosts.ini
	rm -f hub.txt
	rm -f nodes.txt
	rm -f playbook.yml
	rm -f playbook.retry
	rm -f encrypted_bertha.pem
	rm -f encrypted_bertha.pem.pub
	rm -f pingOutput.txt
	rm -f chrome-install.sh
	rm -f chrome-install.sh-n
	rm -f share-libraries.sh
	rm -f post-chrome-install.sh
	rm -f create-node-config.sh
	rm -f firefox-install.sh
	rm -f seleniumHub.sh
	rm -rf test_the_grid
	rm -rf .terraform
	set -e
}





# ====FUNCTION==== Remove previous build's temporary files from working directory

function postInstallCleanUp(){
	set +e
	rm -f pingOutput.txt
	rm -f chrome-install.sh
	rm -f chrome-install.sh-n
	rm -f share-libraries.sh
	rm -f post-chrome-install.sh
	rm -f create-node-config.sh
	rm -f firefox-install.sh
	rm -f seleniumHub.sh
	set -e
}





#====FUNCTION==== Creates new key pair

function createKey(){
	ssh-keygen -t rsa -C "encrypted_bertha" -f encrypted_bertha.pem -N ''
}





#====FUNCTION==== Initializes and runs Terraform script

function runTerraformApply(){
	clear
	echo "How many nodes do you require?"
	read nodesRequired
	echo ""
	echo ""
	echo ""
	echo "Initializing and running Terraform..."
	terraform init
	terraform apply -auto-approve -var no_of_nodes="$nodesRequired"

	# Declare variables
	hub_public_ip=$(cat hub.txt | cut -d- -f1)
	hub_private_ip=$(cat hub.txt | cut -d- -f2)
	node_count=$(grep -c "[^ \\n\\t]" nodes.txt)
}





# ====FUNCTION==== Terraform Destroy and removal of keys

function runTerraformDestroy(){
	if [ -f ./nodes.txt ]
	then
		nodes=$(grep -c "[^ \\n\\t]" nodes.txt)
	else
		echo "nodes.txt isn't there. If you know there are N nodes to delete then create a nodes.txt file with N number of lines containing a few random letters per line and run this script again." 
		exit 1
	fi

	terraform destroy -var no_of_nodes="$nodes"
	rm -f terraform.tfstate
	rm -f terraform.tfstate.backup
}





# ====FUNCTION==== Creates Ansible hosts file from Terraform output

function createAnsibleHosts(){
	echo "[all:vars]" > hosts.ini
	echo "ansible_ssh_private_key_file=./encrypted_bertha.pem" >> hosts.ini
	echo "ansible_user=ec2-user" >> hosts.ini
	echo "ansible_ssh_extra_args='-o StrictHostKeyChecking=no'" >> hosts.ini
	echo "" >> hosts.ini
	echo "[hub]" >> hosts.ini
	echo "$(cat hub.txt | cut -d- -f1)" >> hosts.ini
	for ((a=1; a <= $node_count ; a++))
	do
		echo "" >> hosts.ini
		echo "[node"$a"]" >> hosts.ini
		echo "$(cat nodes.txt | cut -d- -f1| sed -n "$a"p)" >> hosts.ini
	done
	echo "Ansible hosts file created\n\n"
}





# ====FUNCTION==== Ping IP addresses in hosts.ini file

function ansiblePing(){
	clear
	echo "PING-ing all IP address in Ansible hosts file\n\n"

	ping_success () {
		ansible all -m ping -i hosts.ini > pingOutput.txt
		
		if grep -Fq "UNREACHABLE" pingOutput.txt
		then
			return 1
		else
			return 0
		fi
	}

	set +e

	counter=1
	limit=300

	while [ $counter -le $limit ]
	do
		ping_success
		if [ $? = 0 ]
		then
			echo "All IP's pinged successfully\n\n"
			rm -f pingOutput.txt
	    		break
		else
			clear
			echo "Waiting for EC2s to spin-up...\n"
		fi
		((counter++))
		echo "This may take a few minutes. Use ctr+c to exit"
	done

	set -e

	if [ $counter == $(let limit++) ]
	then
		clear
		echo "There was a problem pinging the IP's in your Ansible hosts file. Here is the output:\n\n"
		cat pingOutput.txt
		rm -f ./pingOutput.txt
		exit 1
	fi
}





# ====FUNCTION==== Construct Firefox installation script
function constructFirefoxScript(){
	echo "# Install Xvfb" > firefox-install.sh
	echo "sudo yum -y install xorg-x11-server-Xvfb xorg-x11-fonts" >> firefox-install.sh
	echo "" >> firefox-install.sh
	echo "# Install firefox" >> firefox-install.sh
	echo 'sudo wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-esr-latest-ssl&os=linux64&lang=en-GB"' >> firefox-install.sh
	echo "sudo bzcat firefox.tar.bz2 | tar xvf -" >> firefox-install.sh
	echo "" >> firefox-install.sh
	echo "# Install firfox dependancy not included in chrome" >> firefox-install.sh
	echo 'sudo yum -y install dbus-glib.x86_64' >> firefox-install.sh
	echo "" >> firefox-install.sh
	echo "# Make Firefox accessible from anywhere in the system" >> firefox-install.sh
	echo "cd /usr/local" >> firefox-install.sh
	echo "sudo ln -s ~/firefox/firefox /usr/bin/firefox" >> firefox-install.sh
	echo "" >> firefox-install.sh
	echo "# Install Geckodriver" >> firefox-install.sh
	echo "cd ~/" >> firefox-install.sh
	echo "wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz" >> firefox-install.sh
	echo "tar -xvf geckodriver-v0.23.0-linux64.tar.gz" >> firefox-install.sh
	echo "sudo mv geckodriver /usr/bin/" >> firefox-install.sh
	echo "" >> firefox-install.sh
	echo "# Leave a mark" >> firefox-install.sh
	echo "touch ~/1-Firefox-installed.txt" >> firefox-install.sh
}





# ====FUNCTION==== Construct Chrome installation script

function constructChromeScript(){
	curl https://intoli.com/install-google-chrome.sh > chrome-install.sh

	# Add in lines that will leave a mark once script runs successfully
	sed -i -n '/Successfully/a\
	pushd /home/ec2-user \
	touch 2-Chrome-installed.txt \
	pushd +1 \
	' chrome-install.sh
}





# ====FUNCTION==== Construct Post-Chrome installation script

function constructPostChromeScript(){
	echo "# Install Chromedriver" > post-chrome-install.sh
	echo "wget https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip" >> post-chrome-install.sh
	echo "unzip chromedriver_linux64.zip" >> post-chrome-install.sh
	echo "sudo mv chromedriver /usr/bin/chromedriver" >> post-chrome-install.sh
	echo "" >> post-chrome-install.sh
	echo "# Rename google-chrome-stable to google-chrome for easier identification by selenium" >> post-chrome-install.sh
	echo "sudo mv /usr/bin/google-chrome-stable /usr/bin/google-chrome" >> post-chrome-install.sh
	echo "" >> post-chrome-install.sh
	echo "# Leave a mark" >> post-chrome-install.sh
	echo "touch ~/3-Post-chrome-installed.txt" >> post-chrome-install.sh
}





# ====FUNCTION==== Make the required libraries for Firefox shared with this script

function constructShareLibrariesScript(){
	echo "# " > share-libraries.sh
	echo 'echo export LD_LIBRARY_PATH="/opt/google/chrome/lib:$LD_LIBRARY_PATH" >> /home/ec2-user/.bashrc' >> share-libraries.sh
	echo 'source /home/ec2-user/.bashrc' >> share-libraries.sh
	echo "touch ~/5-Libraries-shared.txt" >> share-libraries.sh
}





function constructSeleniumHubScript(){
	echo '# download selenium standalone server if not there already' > seleniumHub.sh
	echo 'cd /home/ec2-user' >> seleniumHub.sh
	echo 'if [ ! -f selenium.jar ]' >> seleniumHub.sh
	echo 'then' >> seleniumHub.sh
	echo '	wget -O selenium.jar "http://selenium-release.storage.googleapis.com/3.9/selenium-server-standalone-3.9.1.jar"' >> seleniumHub.sh
	echo 'fi' >> seleniumHub.sh
	echo '' >> seleniumHub.sh
	echo '# install Java 8 if needed' >> seleniumHub.sh
	echo 'sudo yum -y install java-1.8.0-openjdk-devel' >> seleniumHub.sh
	echo '' >> seleniumHub.sh
	echo '# run selenium' >> seleniumHub.sh
	echo 'nohup java -jar selenium.jar -role hub -host' $(cat hub.txt | cut -d- -f2) '> ~/nohup.out &' >> seleniumHub.sh
}





# ====FUNCTION==== Construct Node config.json file constructor!

function constructNodeConfigConstructorSript(){
	hub_private_ip=$(cat hub.txt | cut -d- -f2)
	cat > create-node-config.sh <<-EOL
	# Construct Node json config file
	echo '{' >> config.json
	echo '  "capabilities":' >> config.json
	echo '  [' >> config.json
	echo '    {' >> config.json
	echo '      "browserName": "firefox",' >> config.json
	echo '      "marionette": true,' >> config.json
	echo '      "maxInstances": 5,' >> config.json
	echo '      "seleniumProtocol": "WebDriver"' >> config.json
	echo '    },' >> config.json
	echo '    {' >> config.json
	echo '      "browserName": "chrome",' >> config.json
	echo '      "maxInstances": 5,' >> config.json
	echo '      "seleniumProtocol": "WebDriver"' >> config.json
	echo '    }' >> config.json
	echo '  ],' >> config.json
	echo '  "proxy": "org.openqa.grid.selenium.proxy.DefaultRemoteProxy",' >> config.json
	echo '  "maxSession": 5,' >> config.json
	echo '  "port": 5555,' >> config.json
	echo '  "register": true,' >> config.json
	echo '  "registerCycle": 5000,' >> config.json
	echo '  "hub": "http://'$hub_private_ip':4444",' >> config.json
	echo '  "nodeStatusCheckTimeout": 5000,' >> config.json
	echo '  "nodePolling": 5000,' >> config.json
	echo '  "role": "node",' >> config.json
	echo '  "unregisterIfStillDownAfter": 60000,' >> config.json
	echo '  "downPollingLimit": 2,' >> config.json
	echo '  "debug": false,' >> config.json
	echo '  "servlets" : [],' >> config.json
	echo '  "withoutServlets": [],' >> config.json
	echo '  "custom": {}' >> config.json
	echo '}' >> config.json
	touch ~/4-Config-file-created.txt
	EOL
}





# ====FUNCTION==== Construct Ansible Playbook

function constructAnsiblePlaybook(){
	echo "---" > playbook.yml
	echo "- hosts: hub" >> playbook.yml
	echo "  tasks:" >> playbook.yml
	echo "    - name: Run selenium server as 'HUB'" >> playbook.yml
	echo "      script: ./seleniumHub.sh" >> playbook.yml
	echo "" >> playbook.yml
	node_count=$(grep -c "[^ \\n\\t]" nodes.txt)
	for ((i=1; i <= node_count ; i++))
	do
		echo "- hosts: node"$i >> playbook.yml
		echo "  tasks:" >> playbook.yml
		echo "" >> playbook.yml
		echo "   - name: Run Firefox installation script" >> playbook.yml
		echo "     script: ./firefox-install.sh" >> playbook.yml
		echo "     args:" >> playbook.yml
		echo "       creates: ~/1-Firefox-installed.txt" >> playbook.yml
		echo "" >> playbook.yml
		echo "   - name: Run Chrome installation script" >> playbook.yml
		echo "     script: ./chrome-install.sh" >> playbook.yml
		echo "     args:" >> playbook.yml
		echo "       creates: ~/2-Chrome-installed.txt" >> playbook.yml
		echo "" >> playbook.yml
		echo "   - name: Run POST-Chrome installation script" >> playbook.yml
		echo "     script: ./post-chrome-install.sh" >> playbook.yml
		echo "     args:" >> playbook.yml
		echo "       creates: ~/3-Post-chrome-installed.txt" >> playbook.yml
		echo "" >> playbook.yml
		echo "   - name: Run Node config creation script" >> playbook.yml
		echo "     script: ./create-node-config.sh" >> playbook.yml
		echo "     args:" >> playbook.yml
		echo "       creates: ~/4-Config-file-created.txt" >> playbook.yml
		echo "" >> playbook.yml
		echo "   - name: Copy Chrome libraries to shared location so Firefox can use them too" >> playbook.yml
		echo "     script: ./share-libraries.sh" >> playbook.yml
		echo "     args:" >> playbook.yml
		echo "       creates: ~/5-Libraries-shared.txt" >> playbook.yml
		echo "" >> playbook.yml
		echo "   - name: Run selenium server as 'NODE'" >> playbook.yml
		echo "     shell: |" >> playbook.yml
		echo "       cd /home/ec2-user" >> playbook.yml
		echo '       while [ ! -f selenium.jar ]; do wget -O selenium.jar "http://selenium-release.storage.googleapis.com/3.9/selenium-server-standalone-3.9.1.jar"; done' >> playbook.yml
		echo "       sudo yum -y install java-1.8.0-openjdk-devel" >> playbook.yml
		echo "       nohup xvfb-run --server-args='-screen 0 1400x1024x24' java -jar selenium.jar -role node -host" $(cat nodes.txt | cut -d- -f2 | sed -n "$i"p)  "-nodeConfig config.json >> ~/nohup.out &" >> playbook.yml
		echo "" >> playbook.yml
	done
}





# ====FUNCTION==== create all scripts and files

function createAllScripts(){
	constructFirefoxScript
	constructChromeScript
	constructPostChromeScript
	constructShareLibrariesScript
	constructNodeConfigConstructorSript
	constructSeleniumHubScript
	constructAnsiblePlaybook
}





# ====FUNCTION==== Menu selection

function menu(){
	clear
	while [ true ]
	do
		echo "Do you want to (c)reate, (d)estroy, run (p)laybook, run (t)est, (q)uit?"
		read question

		if [ $question == 'c' ]
		then
			resetFolder	
			createKey
			runTerraformApply
			createAnsibleHosts
			ansiblePing
			createAllScripts
			runAnsiblePlaybook
			postInstallCleanUp
			bishBashBosh

		elif [ $question == 'd' ]
		then
			runTerraformDestroy
			resetFolder

		elif [ $question == 'p' ]
		then
			createAllScripts
			runAnsiblePlaybook
			postInstallCleanUp
			bishBashBosh

		elif [ $question == 't' ]
		then
			runTest

		elif [ $question == 'q' ]
		then
			clear
			exit 0
		fi
	done
}





# Exit on error
set -e

# Give some sort of feedback if error forces exit
if [ $? == 1 ]
then
	trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
	trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
fi

# Run menu
menu
