NGROK_TUNNEL_URL=$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')
echo "NGROK tunnel public url is $NGROK_TUNNEL_URL"
