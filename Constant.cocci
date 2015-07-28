// This semantic patch is for constant_<foo> function.
// More can be found at https://goo.gl/K6aOE4
@@expression x;@@

(
- __constant_htons(x)
+ htons(x)
|
- __constant_htonl(x)
+ htonl(x)
|
- __constant_ntohs(x)
+ htons(x)
|
- __constant_ntohl(x)
+ htonl(x)
|
- __constant_cpu_to_le64(x)
+ cpu_to_le64(x)
|
- __constant_le64_to_cpu(x)
+ le64_to_cpu(x)
|
- __constant_cpu_to_le32(x)
+ cpu_to_le32(x)
|
- __constant_le32_to_cpu(x)
+ le32_to_cpu(x)
|
- __constant_cpu_to_le16(x)
+ cpu_to_le16(x)
|
- __constant_le16_to_cpu(x)
+ le16_to_cpu(x)
|
- __constant_cpu_to_be64(x)
+ cpu_to_be64(x)
|
- __constant_be64_to_cpu(x)
+ be64_to_cpu(x)
|
- __constant_cpu_to_be32(x)
+ cpu_to_be32(x)
|
- __constant_be32_to_cpu(x)
+ be32_to_cpu(x)
|
- __constant_cpu_to_be16(x)
+ cpu_to_be16(x)
|
- __constant_be16_to_cpu(x)
+ be16_to_cpu(x)
)
