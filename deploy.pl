#!/usr/bin/perl

# chmod +x ket dhe hudhe te /usr/bin/ ose me nej bin tjeter
# check status
# pull test ne server
# pull live ne server
# merge test to master

# i'm letting this here for a bit 
# git checkout turi
# git add -A .
# git commit -a -m "$1"
# git push
# git checkout master
# git pull
# git fetch
# git merge turi
# git push
# git checkout turi
# git pull -u origin master
# git status


my $test_site_path = "/home/tarak/Dropbox/monx/monx/";
my $live_site_path = "/home/tarak/Dropbox/monx/monx-live/";
my $test_branch = 'turi';
my $live_branch = 'master';


my $git = `which git`;

if(!$git){
	die "No git on server \n";
}

#if(-e $test_site_path and -e $live_site_path ){
if(-e $test_site_path.'.git/' and -e $live_site_path.'.git/' ){
	print "Found testing and live repos on server on \n Testing : $test_site_path \n Live : $live_site_path \n";
}
else{
	die "No repos on $test_site_path / $live_site_path  ..\n";
}

my $current_test_branch = `git -C $test_site_path status`;
my $current_live_branch = `git -C $live_site_path status`;

if($current_test_branch =~ m/On branch (.*)/){
	if($1 eq $test_branch){
		print "Current testing branch is $1 \n";
		print "Branch config is OK \n";
	}
	else{
		print "Testing branch is different expected config \n";
		print "$test_branch expected and we got $1 \n";
	}
}


if($current_live_branch =~ m/On branch (.*)/){
	if($1 eq $live_branch){
		print "Current testing branch is $1 \n";
		print "Branch config is OK \n";
	}
	else{
		print "Live branch is different from what specified in config \n";
		print "We expected $live_branch and we got $1 \n";
	}
}

my $pull_test = `git -C $test_site_path pull`;
print "Pulling on the test repo..";
print $pull_test."\n";

my $pull_live = `git -C $live_site_path pull`;
print "Pulling on the live repo..";
print $pull_live."\n";


