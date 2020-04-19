### 一、收集服务器信息

***

```shell
echo "****Host information ******"
hostname
echo

lsb_release -a|grep Description
dmidecode -s system-product-name

physicalNumber=0
coreNumber=0
logicalNumber=0
HTNumber=0
 
logicalNumber=$(grep "processor" /proc/cpuinfo|sort -u|wc -l)
physicalNumber=$(grep "physical id" /proc/cpuinfo|sort -u|wc -l)
coreNumber=$(grep "cpu cores" /proc/cpuinfo|uniq|awk -F':' '{print $2}'|xargs)
HTNumber=$((logicalNumber / (physicalNumber * coreNumber)))
 
echo "****** CPU Information ******"
echo "Logical CPU Number  : ${logicalNumber}"
echo "Physical CPU Number : ${physicalNumber}"
echo "CPU Core Number     : ${coreNumber}"
echo "HT Number           : ${HTNumber}"
 
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c 
free -g
```

