tell application "Mail"
  try
    delay 2
    set theMessages to message 1 of mailbox "INBOX" of account "iCloud" whose subject contains "New sub"
    repeat with aMessage in theMessages
      tell aMessage
        if content contains "John Legend" then
          set theContent to content as rich text
          say "John Legend Spot Available"
          tell application "Google Chrome"
            activate
            open location "https://secure.rotundasoftware.com/l/web-terminal/login/APE?use_username=xxxxx"
            delay 3
            tell active tab of window 1
              execute javascript "document.getElementsByClassName('ui-button')[0].click()"
            end tell
            delay 1
            open location "https://secure.rotundasoftware.com/l/web-terminal/my-schedule"
          end tell
        else
          set theContent to content as rich text
        end if
      end tell
      tell application "Messages"
        set myid to get id of first service
        set targetBuddy to buddy "+1xxxxxxx" of service id myid
        send theContent to targetBuddy
      end tell
    end repeat
    tell application "Mail"
      move theMessages to mailbox "Trash" of account "iCloud"
    end tell
  on error theError
    display dialog theError buttons {"OK"} default button 1
    return
  end try
end tell