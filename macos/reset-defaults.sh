# Reset global OS X settings
defaults delete -g NSAutomaticWindowAnimationsEnabled
defaults delete -g NSWindowResizeTime
defaults delete -g AppleEdgeResizeExteriorSize
defaults -currentHost delete -g AppleFontSmoothing
defaults delete -g ApplePressAndHoldEnabled
defaults delete -g KeyRepeat
defaults delete -g InitialKeyRepeat
defaults delete -g NSNavPanelExpandedStateForSaveMode
defaults delete -g PMPrintingExpandedStateForPrint
defaults delete -g AppleKeyboardUIMode
defaults delete -g NSScrollViewRubberbanding
defaults delete -g NSDocumentSaveNewDocumentsToCloud


# Reset screencapture to default settings
defaults write com.apple.screencapture type -string PNG
defaults delete com.apple.screencapture disable-shadow
defaults write com.apple.screencapture location ~/Desktop

# Reset the Finder
rm ~/Library/Preferences/com.apple.finder.plist

# Reset the Dock
rm ~/Library/Preferences/com.apple.dock.plist

# Reset the dashboard
rm ~/Library/Preferences/com.apple.dashboard.plist

# Reset Desktop and Launch services
rm ~/Library/Preferences/com.apple.desktopservices.plist
rm ~/Library/Preferences/com.apple.launchservices.plist
