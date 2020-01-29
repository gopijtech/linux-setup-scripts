#!/bin/bash

#echo "DISABLE_STDOUT_IN_FUNCTIONS: $DISABLE_STDOUT_IN_FUNCTIONS"

function addPPAIfNotInSources () {
	local useLogFile="false";
	local logFile="/dev/null";
	if [[ "" != "${INSTALL_LOG}" ]]; then
		useLogFile="true";
		logFile="${INSTALL_LOG}";
	fi

	local ppaUrl="$1";
	local ppaPath="${ppaUrl:4}";

	if [[ "" == "$ppaUrl" ]]; then
		echo " ERROR: addPPAIfNotInSources(): Found empty PPA URL." | tee -a "${logFile}";
		echo " Aborting function call" | tee -a "${logFile}";
		return;
	fi

	if [[ ! $ppaUrl =~ ^ppa:[A-Za-z0-9][\-A-Za-z0-9_\.\+]*/[A-Za-z0-9][\-A-Za-z0-9_\.\+]*$ ]]; then
		echo " ERROR: addPPAIfNotInSources(): Invalid PPA URL format." | tee -a "${logFile}";
		echo "           Found '${ppaUrl}'" | tee -a "${logFile}";
		echo "           Expected 'ppa:[A-Za-z0-9][\-A-Za-z0-9_\.\+]*/[A-Za-z0-9][\-A-Za-z0-9_\.\+]*'" | tee -a "${logFile}";
		echo " Aborting function call" | tee -a "${logFile}";
		return;
	fi
	#echo "Detected '${ppaUrl}' as valid";

	local existingSourceMatches=$(grep -R "${ppaPath}" /etc/apt/sources.list.d/*.list|wc -l);
	#echo "existingSourceMatches: $existingSourceMatches";
	if [[ "0" != "${existingSourceMatches}" ]]; then
		echo "addPPAIfNotInSources(): Found '${ppaPath}' in existing source(s); skipping..." | tee -a "${logFile}";
		echo " Aborting function call" | tee -a "${logFile}";
		return;
	fi

	#PPA doesn't exist in sources, so add it...
	sudo add-apt-repository -y $* > /dev/null;
}

function addCustomSource() {
	local useLogFile="false";
	local logFile="/dev/null";
	if [[ "" != "${INSTALL_LOG}" ]]; then
		useLogFile="true";
		logFile="${INSTALL_LOG}";
	fi

	local errorMessage="";
	local showUsageInfo="false";
	local hasMissingOrInvalidInfo="false";

	if [[ "-h" == "$1" || "--help" == "$1" ]]; then
		showUsageInfo="true";
	fi

	local repoName="$1";
	local repoDetails="$2";
	if [[ "true" != "$showUsageInfo" ]]; then
		#if not just displaying help info, then check passed args
		if [[ "" == "${repoName}" ]]; then
			hasMissingOrInvalidInfo="true";
			errorMessage="no arguments";

		elif [[ "" == "${repoDetails}" ]]; then
			hasMissingOrInvalidInfo="true";
			errorMessage="missing arguments - must have REPO_NAME and REPO_DETAILS";

		elif [[ "official-package-repositories" == "$repoName" || "additional-repositories" == "$repoName" ]]; then
			hasMissingOrInvalidInfo="true";
			errorMessage="invalid REPO_NAME '${repoName}'; this name is reserved for system usage";

		elif [[ ! $repoName =~ ^[A-Za-z0-9][-A-Za-z0-9.]*[A-Za-z0-9]$ ]]; then
			hasMissingOrInvalidInfo="true";
			errorMessage="invalid REPO_NAME '${repoName}' - only alphanum/hyphen/period allowed, must start/end with alphanum";
		fi

		if [[ 'true' != "${hasMissingOrInvalidInfo}" ]]; then
			#check if more than 2 args
			arg3="$3";
			arg4="$4";
			if [[ 'deb' == "${repoDetails}" ]]; then
				if [[ "" == "${arg3}" || "" == "${arg4}" ]]; then
					hasMissingOrInvalidInfo="true";
					errorMessage="missing/invalid repo details (only 'deb' but not server/path)";

				elif [[ ! $arg3 =~ ^https?:\/\/[A-Za-z0-9][-A-Za-z0-9.]*.*$ ]]; then
					hasMissingOrInvalidInfo="true";
					errorMessage="missing/invalid repo details (repo server) for '${arg3}'";

				else
					repoDetails="deb $arg3 $arg4";
				fi

			elif [[ $repoDetails =~ ^https?:\/\/[A-Za-z0-9][-A-Za-z0-9.]*[^\ ]*\ [^\ ]*$ ]]; then
				repoDetails="deb $repoDetails";

			elif [[ ! $repoDetails =~ ^deb\ https?:\/\/[A-Za-z0-9][-A-Za-z0-9.]*[^\ ]*\ [^\ ]*$ ]]; then
				hasMissingOrInvalidInfo="true";
				errorMessage="invalid/unsupported repo details format for '${repoDetails}'";
			fi
		fi
	fi

	if [[ "true" == "$showUsageInfo" || "true" == "$hasMissingOrInvalidInfo" ]]; then
		if [[ "true" == "$hasMissingOrInvalidInfo" ]]; then
			echo "ERROR: addCustomSource(): ${errorMessage}." | tee -a "${logFile}";
		fi
		echo "" | tee -a "${logFile}";
		echo "usage:" | tee -a "${logFile}";
		echo "   addCustomSource REPO_NAME REPO_DETAILS" | tee -a "${logFile}";
		echo "" | tee -a "${logFile}";
		echo "   Adds the specified source under /etc/apt/sources.list.d/" | tee -a "${logFile}";
		echo "   if it does not already exist. Both the repo name and the" | tee -a "${logFile}";
		echo "   details will be considered when checking for existing sources." | tee -a "${logFile}";
		echo "" | tee -a "${logFile}";
		echo "   REPO_NAME:    user-defined name; only used for the" | tee -a "${logFile}";
		echo "                 naming the apt source list file." | tee -a "${logFile}";
		echo "                 Names must start/end with alphanumeric characters." | tee -a "${logFile}";
		echo "                 Hyphens/periods are allowed for intervening characters." | tee -a "${logFile}";
		echo "" | tee -a "${logFile}";
		echo "   REPO_DETAILS: Info that goes in the apt source list file." | tee -a "${logFile}";
		echo "                 Generally is in the format of:" | tee -a "${logFile}";
		echo "                 deb REPO_BASE_URL REPO_RELATIVE_PATH" | tee -a "${logFile}";
		echo "" | tee -a "${logFile}";
		echo "examples:" | tee -a "${logFile}";
		echo "   addCustomSource sublimetext 'deb https://download.sublimetext.com/ apt/stable/' " | tee -a "${logFile}";
		echo "   addCustomSource sublimetext deb https://download.sublimetext.com/ apt/stable/ " | tee -a "${logFile}";
		echo "" | tee -a "${logFile}";
		return;
	fi

	#check if it already exists...
	echo "Checking if repo source file already exists..." | tee -a "${logFile}";
	if [[ -f "/etc/apt/sources.list.d/${repoName}.list" ]]; then
		echo "addCustomSource(): Source ${repoName} already defined; skipping..." | tee -a "${logFile}";
		return;
	fi

	#check if details already exist...
	echo "Checking if repo details not already defined..." | tee -a "${logFile}";
	local existingRepoDetsCount=$(grep -R "${repoDetails}"|wc -l);
	if [[ "0" != "${existingRepoDetsCount}" ]]; then
		echo "addCustomSource(): Repo details already defined for '${repoDetails}'; skipping..." | tee -a "${logFile}";
		return;
	fi

	# add new source
	echo "${repoDetails}" | sudo tee "/etc/apt/sources.list.d/${repoName}.list" >/dev/null;

	# safety
	sudo chown root:root "/etc/apt/sources.list.d/${repoName}.list";
	sudo chmod 644 "/etc/apt/sources.list.d/${repoName}.list";
}