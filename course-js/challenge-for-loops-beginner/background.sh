echo "Started"

# Create the file
cat << 'EOF' > /root/forloop.js
function validateLoop(start, end) {
  // Code goes here.
}
EOF

cat << 'EOF' > /opt/1_test.js
// Trap console.
var log = [];
console.log = function(d) {
    log.push(d);
    process.stdout.write(d + '\n');
};

// Run loop
validateLoop(0, 100);

// Do we have a log length of 100?
if (log.length !== 100) {
  console.log("Error: Loop is invalid length as expected <100> got <" + log.length + ">");
  process.exit(1);
}

// Number should be from 0 - 100
for (let i = 0; i < log.length; i++) {
  if (log[i] !== i) {
    console.log("Error: Index <" + i + "> has value <" + log[i] + "> which is wrong.");
    process.exit(1);
  }
}

process.exit(0);

EOF


cat << 'EOF' > /opt/2_test.js
// Trap console.
var log = [];
console.log = function(d) {
    log.push(d);
    process.stdout.write(d + '\n');
};

// Run loop
validateLoop(0, 100);

// Do we have a log length of 50?
if (log.length !== 50) {
  console.log("Error: Loop is invalid length as expected <50> got <" + log.length + ">");
  process.exit(1);
}

// Number should be from 0 - 100
for (let i = 0; i < log.length; i++) {
  if (log[i] !== (i*2+1)) {
    console.log("Error: Index <" + i + "> has value <" + log[i] + "> which is wrong.");
    process.exit(1);
  }
}

process.exit(0);

EOF

echo 'done' > /opt/katacoda-background-finished