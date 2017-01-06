# personal flavour of git flow

# url is without the key/id
export HOTFIX_ISSUE_URL="https://github.com/lad1337/dotfiles/issues/"

hotfix-done(){
	local new_tag_name hotfix_branch issue_key
	
	git branch --list hotfix/'*' || return 1
	hotfix_branch=$(git branch | sed -n '/\* /s///p' | grep hotfix)
	vared -p "Which hotfix is done?: " -c hotfix_branch
	if [[ -z "$hotfix_branch" ]]; then
		echo "No hotfix branch selected, exit."
		return 1	
	fi

	git fetch --tags --prune --progress
	git checkout master
	git pull --progress
	git merge --quiet --no-edit --no-ff "$hotfix_branch" || return 1
	echo "################################"
	echo "Last five tags:"
	git tag | grep '^[0-9\.]*$' | gsort -V | tail -n 5
	vared -p 'What is the new version?: ' -c new_tag_name
	vared -p 'What is issue is this fixing(only key)? (enter for nothing): ' -c issue_key
	if [[ -n "$issue_key" ]]; then
	    tag_msg="Fix for issue: $HOTFIX_ISSUE_URL$issue_key"
	else
		tag_msg="no ticket available"
	fi
	git tag --sign -m "$tag_msg" "$new_tag_name"
	git checkout develop
	git pull --progress || return 1
	git merge "$new_tag_name" || return 1
	echo "################################"
	echo "now: check stuff, and push, i guess..."
}
