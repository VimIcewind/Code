base64Table=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 + /);

function str2binary() {
    idx=0;
    for((i=0; i<${#str}; i++)); do
        dividend=$(printf "%d" "'${str:i:1}");
        for((j=0;j<8;j++)); do
            let idx=8*i+7-j;
            let bin[$idx]=$dividend%2;
            dividend=$dividend/2;
        done;
    done;
    let idx=${#str}*8;
    for((i=0; i<appendEqualCnt*2; i++)); do
        let bin[$idx]=0;
        let idx++;
    done;
}
function calcBase64() {
    for((i=0; i<${#bin[*]}/6; i++)); do
        sum=0;
        for((j=0; j<6; j++)); do
            let idx=i*6+j;
            let n=6-1-j;
            let sum=sum+${bin[$idx]}*2**n;
        done;
        echo -n ${base64Table[$sum]};
    done
}

declare -a bin
function base64Encode() {
    read -p "please enter ASCII string:" str;
    let appendZero=${#str}*8%6;
    let bits=${#str}*8;
    appendEqualCnt=0;
    if [[ $appendZero -ne 0 ]]; then
        let appendEqualCnt=(6-$appendZero)/2;
    fi
    str2binary;
    calcBase64;
    if [[ $appendEqualCnt -eq 2 ]]; then
        echo -n "==";
    elif [[ $appendEqualCnt -eq 1 ]]; then
        echo -n "=";
    fi
    echo;

}

