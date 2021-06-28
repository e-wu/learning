echo "Started"

# Create the file
cat << 'EOF' > /root/forloop.js
function validateLoop(start, end) {
  # Code goes here.
}
EOF

cat << 'EOF' > /opt/test.js
# Trap console.
var log = [];
console.log = function(d) {
    log.push(d);
    process.stdout.write(d + '\n');
};

# Run loop
validateLoop(0, 100);

# Do we have a log length of 100?
if (log.length !== 100) {
  console.log("Error", x);
  process.exit(1);
}

# Number should be from 0 - 100
for (let i = 0; i < log.length; i++) {
  if (log[i] !== "" + i) {
    console.log("Error", x);
    process.exit(1);
  }
}

process.exit(0);

EOF

echo 'done' > /opt/katacoda-background-finished