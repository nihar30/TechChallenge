function get-output {

    param (
        $object,
        $key
    )

#echo $object
foreach($item in $object.GetEnumerator()){
    if ($item.key -eq $key){
      echo "key: "$item.key ", Value: " $item.value
    }
}

}

$testObject = @{"x" = @{"z" = ("a","b","c")}; y = ("d","e","f")}
#$testObject = @{"x" = @{"y" = @{"z" = ("a")}}}
$testKey = "x"
get-output $testObject $testKey
