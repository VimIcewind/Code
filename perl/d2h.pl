#!perl
# Convert list of decimal numbers into hex

for ($i = 0; $i < @ARGV; $i++) {
    printf("%d = 0x%x\n", $ARGV[$i], $ARGV[$i]);
}
