# This is a script to make a quick backup of all git repositories
# It will go to all listed directories and will make a git add, commit and push
function rebu
	set directories ~/books ~/vimwiki ~/private ~/.dotfiles
	#Use the date as an identifier of the commit
	set commit_message \' (date) \'
	for i in $directories 
		echo $i
		cd $i
		git add .
		git commit -m "$commit_message"
		git push origin main
	end
	#In case the repository is up to date there will be no commit, git commands produce no errors
	cd ~
end 
