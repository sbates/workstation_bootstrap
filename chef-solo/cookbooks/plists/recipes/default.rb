%w{com.adiumX.adiumX.plist com.apple.itunes.connect.ApplicationLoader.plist com.apple.iTunes.eq.plist com.apple.iTunes.plist com.apple.iTunesHelper.plist com.apple.keychainaccess.plist com.apple.mobile.iTunes.store.plist com.bittorrent.BitTorrent.plist com.googlecode.iterm2.plist com.skype.skype.plist fm.last.Last.fm.plist}.each do |plist|
  cookbook_file "~/Library/Preferences/#{plist}" do
    source plist
  end
end
