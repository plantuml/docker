#!/usr/bin/env bash

set -euxo pipefail

#mkdir /app
#cd /app

cat << EOF > Example.java
public class Example {

    public static void main(String[] args) {
        String str = "Native Image is awesome";
        String reversed = reverseString(str);
        System.out.println("The reversed string is: " + reversed);
    }

    public static String reverseString(String str) {
        if (str.isEmpty())
            return str;
        return reverseString(str.substring(1)) + str.charAt(0);
    }
}
EOF

javac Example.java

native-image Example

./example

