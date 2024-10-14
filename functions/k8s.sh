foc() {
    # https://en.wikipedia.org/wiki/Flag_of_convenience
    namespace=$1
    if [ -z $namespace ]; then
        echo "Please provide the namespace name: 'change-ns mywebapp'"
        return 1
    fi
    kubectl config set-context $(kubectl config current-context) --namespace $namespace
}

sail () {
	kubectl config use-context $1
}
 
kxi () {
	local pod=$(kubectl get pods | fzf | awk '{print $1}')
	local containers=$(kubectl get pods "${pod}" -o jsonpath='{.spec.containers[*].name}')
	local container=${containers}
	if [[ $containers =~ ' ' ]]; then
		container=$(echo "${containers}" | tr ' ' '\n' | fzf)
	fi
	echo "${pod}" - "${container}"
	kubectl exec -it "${pod}" -c "${container}" -- "${@}"
}

kli () {
	local pod=$(kubectl get pods | fzf | awk '{print $1}')
	local containers=$(kubectl get pods "${pod}" -o jsonpath='{.spec.containers[*].name}')
	local container=${containers}
	if [[ $containers =~ ' ' ]]; then
		container=$(echo "${containers}" | tr ' ' '\n' | fzf)
	fi
	echo "${pod}" - "${container}"
	kubectl logs "${@}" "${pod}" -c "${container}"
}

klfi () {
	kli -f --tail=10
}

foci () {
	local ns=$(kubectl get namespace | fzf | awk '{print $1}')
	foc $ns
}

