# Steamgifts Bot

A proof of concept which automatically enters in giveaways at [steamgifts.com](https://www.steamgifts.com). Keep in mind that this has not been updated or even tested for years, so it may not be functional.

# Installing and Running

You need Ruby installed. For Mac, it's preinstalled but if you're on Windows or Linux you need to download it.

Next, in Google Chrome, sign in to steamgifts.com. Then, go to 

`Settings -> Show advanced settings -> Privacy -> Content settings -> All cookies and site data -> steamgifts.com (use search) -> PHPSESSID`

Copy 'content', and go into the 'cookies' file and paste it into the 'value' field. Finally, run using `ruby steamgifts.rb` and enjoy.
