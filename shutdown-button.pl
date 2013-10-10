#!/usr/bin/perl
# repat<repat@repat.de>
# October 2013
# Creates a TK Window with just one button to shut down the computer
# Shutdown Button is free artwork
# source: http://openclipart.org/detail/78607/shutdown-button-by-inky2010

use Tk;
my $mw = new MainWindow;

# Create photo object to load into the button
# TODO: enter full path here, e.g. /home/user/shutdown-button.xpm or C:\\folder\\shutdown-button.xpm
$photo = $mw->Photo(-file => "shutdown-button.xpm");

# Load the photo and link to cmd_button function
my $shutdownbutton= $mw->Button(-image=>$photo,-command=>\&cmd_button)->pack(-side=>"left");

# removes all window decoration like maximize/minimize/title etc.
$mw->overrideredirect(1); 

# puts the button in the right down corner
$width = $mw->screenwidth-40;
$height = $mw->screenheight-40;
$mw->geometry("+" . $width . "+" . $height);

sub cmd_button {
	# s(hutdown) t(ime) 0
	system("shutdown /s /t 0");
   exit;
}

# off we go!
MainLoop;
