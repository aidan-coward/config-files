at time of writing - msmtp and msmtp-mta packages

msmtprc goes in ~/.msmtprc
msmtprc was also placed into /root/ for systemd service uses
username is full gmail username

to send mail from terminal:
echo "text" | msmtp -a default person@place.com
can also cat a file
cat file.txt | msmtp -a default person@place.com
