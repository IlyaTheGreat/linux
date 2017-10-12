#!/bin/bash
# пользовательский инструмент для гит
main_menu()
{
	echo "what you want deal with?"
	echo " 1) repository,"
	echo " 2) branch,"
	echo " 3) file,"
	echo " 4) commit,"
	echo " 5) remote repository," 
	echo " *) exit."
	read key
	if [ $key -ne 5 ]; then
		echo "Enter setting:"
		echo "1) add,"
		echo "2) edit,"
		echo "3) remove,"
		echo "*) cancel."
	fi
}

control_repository()
{
	read key1
	case $key1 in
		1) echo "enter repository path: "
			read repository_path
			cd $repository_path
			git init # init repo in <repository_path>
			;;
		2) echo "nothing to edit";;
		3) echo "enter repository path: "
			read repository_path
			rm -Rf $repository_path/.git/
			;;
		*) exit 0 ;;
	esac
}

control_branch()
{
	read key1
	case $key1 in
		1) echo "Enter new branch name: "
			read branch_name
			git branch $branch_name
			;;
		2) echo "Enter branch name: "
			git branch
			read branch_name
			git checkout $branch_name
			;;
		3) echo "Write branch name to delete: "
			read branch_name
			git branch -d $branch_name
			;;
		*) exit 0 ;;
	esac
}

control_file()
{
	read key1
	case $key1 in
		1) echo "enter file name: "
			read file_name
			git add $file_name # add <file_name> in repsitory
			echo "enter branch: "
			read branch_name
			git push origin $branch_name
			git commit -m "added $filename"
			;;
		2) echo "enter file name: "
			read file_name
			vim $file_name # edit <file_name> in VIM
			git add $file_name # save changes in <file_name> to repository
			echo "enter branch"
			read branch_name
			git push origin $branch_name
			git commit -m "changed $filename"
			;;
		3) echo "enter file name: "
			read file_name
			git rm --cached --ignore-unmatch $file_name # remove <file_name> from repo but ignore on physical disk
			;;
		*) exit 0 ;;			
	esac
}

control_commit()
{
	read key1
	case $key1 in
		1) echo "enter message: "
			read message
			git commit -m "$message"
			;;
		2) git commit --amend
			;;
		3) echo "enter file name: "
			read file_name	
			git checkout -- $file_name
			;;
		*) exit 0 ;;
	esac
}

control_remote_repo()
{
	echo "Enter setting:"
	echo " 1) add remote repository,"
	echo " 2) push to repo,"
	echo " 3) delete remote repo"
	echo " 4) change remote repository,"
	echo " *) cancel." 
	read key1
	case $key1 in
		1) echo "write tag"
			read tag
			echo "write url"
			read url
			git remote add $tag $url
			;;
		2) ;;
		3) echo "enter repository to delete"
			git remote -v
			read repo_name
			git remote rm $repo_name
			;;
		4) echo "enter remote server an branch: "
			git remote -v
			read remote_server
			read branch_name
			git push $remote_server $branch_name
			;;
		*) exit 0 ;;
	esac
}

	main_menu
	case $key in
		1) control_repository
			main_menu;;
		2) control_branch
			main_menu;;
		3) control_file
			main_menu;;
		4) control_commit
			main_menu;;
		5) control_remote_repo
			main_menu;;
		*) exit 0 ;;
	esac



