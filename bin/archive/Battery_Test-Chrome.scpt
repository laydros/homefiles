on run
    set imessage_id to "" -- leave blank to skip sending periodic iMessage progress updates, put your iMessage ID here to get updates as the script runs
    set delay_seconds to 5 -- Don't set to 0, it runs too fast. 0.75 is a good setting for "go fast".
    
    set computer_name to do shell script "scutil --get ComputerName"
    set os_version to do shell script "sw_vers -productVersion"
    set os_build to do shell script "sw_vers -buildVersion"
    set _uptime to do shell script "uptime"
    
    set url_list to {"http://techmeme.com", "http://www.consumerreports.org/laptops/macbook-pros-fail-to-earn-consumer-reports-recommendation/", "https://twitter.com/panzer/status/812367550734401536", "http://www.politico.com/story/2016/12/foreign-travelers-social-media-232930", "http://www.macworld.com/article/3153384/gaming/nintendo-plans-to-release-2-or-3-mobile-games-a-year-after-super-mario-runs-success.html", "http://www.wsj.com/articles/cyber-experts-cite-link-between-dnc-hacks-and-aggression-against-ukraine-1482385672", "http://www.theverge.com/2016/12/22/14057656/google-smartwatch-android-wear-2-0-launch", "http://vator.tv/news/2016-12-22-glu-acquires-plain-vanilla-the-studio-behind-quizup", "http://www.wsj.com/articles/alibaba-enlists-brands-to-help-snuff-out-knockoffs-1482477161", "http://adage.com/article/digital/mrc-talks-facebook-metrics-audits/307280/", "http://www.businessinsider.com/twitter-app-bug-inflated-video-ad-metrics-by-as-much-as-35-2016-12?op=1", "http://venturebeat.com/2016/12/22/ubers-self-driving-cars-flee-to-arizona-after-california-shutdown/", "https://techcrunch.com/2016/12/22/clusterhq-hits-the-deadpool/", "http://www.macrumors.com/2016/12/23/apple-pulls-all-withings-accessories-nokia-lawsuit/", "http://www.smh.com.au/business/media-and-marketing/video-games-website-steam-fined-3-million-for-refusing-refunds-20161223-gthdux.html", "https://www.bloomberg.com/news/articles/2016-12-23/megafon-to-buy-mail-ru-stake-for-740-million-from-usmanov", "http://variety.com/2016/digital/news/snapchat-abc-the-bachelor-aftershow-1201946670/", "https://www.bloomberg.com/news/articles/2016-12-23/silver-lake-said-to-join-1-2-billion-round-in-key-alibaba-arm", "http://www.nytimes.com/2016/12/22/arts/music/apple-music-platform-promoter-both.html", "http://www.theverge.com/2016/12/22/14059678/bittorrent-live-video-streaming-app-available-ios", "https://techcrunch.com/2016/12/22/pokemon-go-arrives-on-the-apple-watch/", "http://www.theverge.com/2016/12/21/14030820/djay-pro-iphone-announced", "http://business.financialpost.com/fp-tech-desk/crtc-declares-high-speed-internet-a-basic-service-creates-750-million-fund?__lsa=5138-faf6", "https://www.fastcompany.com/3066733/fast-cities/new-york-citys-tech-community-is-getting-a-250-million-home-base-at-union-square", "http://www.wsj.com/articles/baidu-plans-1-billion-ipo-for-video-streaming-site-iqiyi-com-1482398700", "https://9to5mac.com/2016/12/21/apple-delays-requirement-for-https/"}
    
    -- Short list of URLs for testing, comment out for real testing:
    #set url_list to {"http://daringfireball.net/", "http://www.consumerreports.org/laptops/macbook-pros-fail-to-earn-consumer-reports-recommendation/", "https://twitter.com/panzer/status/812367550734401536"}
    
    if not IsRunningOnBattery() then
        display alert "Not running on battery power" message "This test is meant to measure battery life. Unplug from AC Power and double-check display brightness level before proceeding." as critical buttons {"Cancel", "Proceed"} default button "Proceed"
        if button returned of the result is not "Proceed" then return -- stop script
    end if
    
    -- Logging Preamble
    WriteToLog("") -- blank line to separate log entries
    WriteToLog("Starting Chrome battery test on " & computer_name & linefeed & (current date))
    WriteToLog("OS version: " & os_version & " (" & os_build & ")")
    WriteToLog("Battery: " & my GetBatteryPercentage())
    WriteToLog("Display brightness: " & my GetDisplayBrightness())
    WriteToLog("Uptime: " & _uptime)
    WriteToLog("Running apps: " & my GetRunningApps())
    
    tell application "Google Chrome"
        activate
        set _cycles to 0
        set start_time to current date
        
        repeat
            close every window -- start each cycle by closing any open windows
            set _cycles to _cycles + 1
            repeat with _url in url_list
                open location _url
                delay delay_seconds
                repeat 3 times
                    my PageDown()
                    delay delay_seconds
                end repeat
            end repeat
            
            set elapsed_seconds to (current date) - start_time
            set elapsed_str to my SecondsToHoursMinutes(elapsed_seconds)
            set log_msg to (elapsed_str & ": " & "(" & _cycles & " cycles): " & my GetBatteryPercentage()) as string
            my WriteToLog(log_msg)
            -- Send text message update only every Nth cycle:
            if (_cycles mod 3 is 0) and (imessage_id is not "") then my SendiMessage(computer_name & ": " & log_msg, imessage_id)
            
            delay 0 -- How long to wait before starting all over again.
        end repeat
    end tell
end run


on PageDown()
    tell application "System Events"
        key code 121
        -- 121: page down
        -- 116: page up
    end tell
end PageDown

on GetBatteryPercentage()
    -- Returns battery percentage with the % symbol: "100%"
    try
        set _battery to do shell script "pmset -g batt | egrep -o '\\d+%'"
    on error
        set _battery to "(No battery)"
    end try
    return _battery
end GetBatteryPercentage

on GetDisplayBrightness()
    set brightness_info to do shell script "ioreg -c AppleBacklightDisplay -r -w 0 | egrep -o '\"brightness\"={.+?}'"
    
    try
        -- Example for words of brightness_info:
        -- `{"brightness", "=", "max", "=", "1024", "min", "=", "0", "value", "=", "704"}`
        if word 3 of brightness_info is "max" then set b_max to word 5 of brightness_info
        if word 9 of brightness_info is "value" then set b_val to word 11 of brightness_info
        set current_brightness to (b_val as real) / b_max as real
    on error
        set current_brightness to "(indeterminate)"
    end try
    return current_brightness
end GetDisplayBrightness

on GetRunningApps()
    tell application "System Events" to set running_apps to name of every application process whose background only is false
    set old_TID to text item delimiters
    set text item delimiters to ", "
    set running_apps to running_apps as string
    set text item delimiters to old_TID
    return running_apps
end GetRunningApps

on IsRunningOnBattery()
    try
        set _result to do shell script "pmset -g batt | egrep 'Now drawing from'"
    on error
        display alert "Error determining if running on battery."
    end try
    
    if _result contains "Battery Power" then
        return true
    else
        return false
    end if
end IsRunningOnBattery

on WriteToLog(_msg as string)
    do shell script "echo " & quoted form of _msg & " >> ~/Desktop/ChromeBatteryTest.log"
end WriteToLog

on SendiMessage(msg_text as string, msg_recipient as string)
    tell application "Messages"
        send msg_text to buddy msg_recipient of (service 1 whose service type is iMessage)
    end tell
end SendiMessage

on SecondsToHoursMinutes(_secs)
    -- Convert seconds to "h:mm" string
    set _hours to _secs div (60 * 60)
    set _minutes to (_secs div 60) mod 60
    return (_hours & "h:" & AddLeadingZeros(_minutes, 1) & "m") as string
end SecondsToHoursMinutes

on AddLeadingZeros(this_number, maxleading_zeros)
    -- Source: https://www.macosxautomation.com/applescript/sbrt/sbrt-02.html
    set the threshold_number to (10 ^ maxleading_zeros) as integer
    if this_number is less than the threshold_number then
        set the leading_zeros to ""
        set the digit_count to the length of ((this_number div 1) as string)
        set the character_count to (maxleading_zeros + 1) - digit_count
        repeat character_count times
            set the leading_zeros to (the leading_zeros & "0") as string
        end repeat
        return (leading_zeros & (this_number as text)) as string
    else
        return this_number as text
    end if
end AddLeadingZeros

