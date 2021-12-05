#special variables - special muuttuja
echo "File Name: $0"
echo "First Parameter : $1"
echo "Second Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Number of Parameters : $#"

#console/outputs:::::::
# $ ./main.sh zxcv
# File Name: ./main.sh
# First Parameter : zxcv
# Second Parameter : 
# Quoted Values: zxcv
# Quoted Values: zxcv
# Total Number of Parameters : 1
