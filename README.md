# Linux-Server-hardening
Short Script for Linux-Server Security hardening
# Application Intrusion Detection And Prevention With Fail2Ban
# Why

UFW tells your server what doors to board up so nobody can see them, and what doors to allow authorized users through. PSAD monitors network activity to detect and prevent potential intrusions -- repeated attempts to get in.

But what about the applications/services your server is running, like SSH and Apache, where your firewall is configured to allow access in. Even though access may be allowed that doesn't mean all access attempts are valid and harmless. What if someone tries to brute-force their way in to a web-app you're running on your server? This is where Fail2ban comes in.
# How It Works

Fail2ban monitors the logs of your applications (like SSH and Apache) to detect and prevent potential intrusions. It will monitor network traffic/logs and prevent intrusions by blocking suspicious activity (e.g. multiple successive failed connections in a short time-span).
Goals

    network monitoring for suspicious activity with automatic banning of offending IPs

# Notes

    As of right now, the only thing running on this server is SSH so we'll want Fail2ban to monitor SSH and ban as necessary.
    As you install other programs, you'll need to create/configure the appropriate jails and enable them.
    
    
    
## Anti-Virus Scanning With ClamAV (WIP)
# Why

WIP
# How It Works

    ClamAV is a virus scanner
    ClamAV-Freshclam is a service that keeps the virus definitions updated
    ClamAV-Daemon keeps the clamd process running to make scanning faster

# Goals

WIP
Notes

    These instructions do not tell you how to enable the ClamAV daemon service to ensure clamd is running all the time. clamd is only if you're running a mail server and does not provide real-time monitoring of files. Instead, you'd want to scan files manually or on a schedule.
    
    Details mentioned in attached script for installation.
    
    
# Lynis - Linux Security Auditing
# Why

From https://cisofy.com/lynis/:

    Lynis is a battle-tested security tool for systems running Linux, macOS, or Unix-based operating system. It performs an extensive health scan of your systems to support system hardening and compliance testing.

# Goals

    Lynis installed

Notes

    CISOFY offers packages for many distributions. Check https://packages.cisofy.com/ for distribution specific installation instructions.

# References

    https://cisofy.com/documentation/lynis/get-started/
    https://packages.cisofy.com/community/#debian-ubuntu
    https://thelinuxcode.com/audit-lynis-ubuntu-server/
    https://www.vultr.com/docs/install-lynis-on-debian-8

# Steps

    Install lynis. https://cisofy.com/lynis/#installation has detailed instructions on how to install it for your distribution.

# On Debian based systems, using CISOFY's community software repository:

    sudo apt install apt-transport-https ca-certificates host
    sudo wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add -
    sudo echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list
    sudo apt update
    sudo apt install lynis host

    # Update it:

    sudo lynis update info

    # Run a security audit:

    sudo lynis audit system

    This will scan your server, report its audit findings, and at the end it will give you suggestions. Spend some time going through the output and address gaps as necessary.


    
    
