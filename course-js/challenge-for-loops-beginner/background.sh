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

log = [];
validateLoop(55, 57);
if (log.length !== 2) {
  console.log("Error: Loop is invalid length as expected <2> got <" + log.length + ">");
  process.exit(1);
}

if (log[0] !== 55 || log[1] !== 56) {
  console.log("Error: Not using start and end variable, so failing.");
  process.exit(1);
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

// Make sure they didn't cheat :)
log = [];
validateLoop(55, 57);
if (log.length !== 1) {
  console.log("Error: Loop is invalid length as expected <1> got <" + log.length + ">");
  process.exit(1);
}

process.exit(0);

EOF

cat << 'EOF' > /opt/3_test.js
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
  if (log[i] !== (i%4)) {
    console.log("Error: Index <" + i + "> has value <" + log[i] + "> which is wrong.");
    process.exit(1);
  }
}

// Make sure they didn't cheat :)
log = [];
validateLoop(55, 57);
if (log.length !== 2) {
  console.log("Error: Loop is invalid length as expected <2> got <" + log.length + ">");
  process.exit(1);
}

if (log[0] !== 3 || log[1] !== 0) {
  console.log("Error: Not using start and end variable, so failing.");
  process.exit(1);
}

process.exit(0);

EOF

cat << 'EOF' > /opt/checkfor.sh
#!/bin/bash

cat /root/forloop.js $1 > /opt/.run.js; node /opt/.run.js;

EXIT_CODE=$?

if [ "$EXIT_CODE" = "0" ]; then
    CHECKING=$(tr --delete '\n' < /root/forloop.js | tr --delete '   ' | grep -e 'for(.*){console.log(.*);}' | wc -l)

    if [ "$CHECKING" = "1" ]; then
        exit 0;
    fi
fi

exit 1;

EOF

chmod +x /opt/checkfor.sh

echo 'done' > /opt/katacoda-background-finished