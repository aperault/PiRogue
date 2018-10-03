echo "Redirecting HTTP and HTTPS traffic from wlan1 to mitmproxy listening on port 8080"
iptables -t nat -A PREROUTING -i wlan1 -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -i wlan1 -p tcp --dport 443 -j REDIRECT --to-port 8080
ip6tables -t nat -A PREROUTING -i wlan1 -p tcp --dport 80 -j REDIRECT --to-port 8080
ip6tables -t nat -A PREROUTING -i wlan1 -p tcp --dport 443 -j REDIRECT --to-port 8080
echo "Use mitmproxy in transparent mode:"
echo " * mitmproxy -m transparent --anticomp"
echo " * mitmdump -m transparent --anticomp"
echo " * mitmweb -m transparent --anticomp"
echo ""
echo "To install the mitmproxy certificate, browse http://mitm.it on your target device."
echo "For more details about mitmproxy, visit https://docs.mitmproxy.org"
