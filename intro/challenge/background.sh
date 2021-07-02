echo "Started"

# Create the file
cat << 'EOF' > /root/text.txt
HELLO
EOF

cat << 'EOF' > /opt/1_test.sh

FILECONT=$(cat /root/text.txt)

if [ "$FILECONT" = "WORLD" ]; then
  exit 0;
fi
exit 1;

EOF


cat << 'EOF' > /opt/2_test.sh

FILECONT=$(cat /root/text.txt)

if [ "$FILECONT" = "Done?" ]; then
  exit 0;
fi
exit 1;

EOF


cat << 'EOF' > /opt/3_test.sh

FILECONT=$(cat /root/text.txt)

if [ "$FILECONT" = "Done" ]; then
  exit 0;
fi
exit 1;

EOF

echo 'done' > /opt/katacoda-background-finished