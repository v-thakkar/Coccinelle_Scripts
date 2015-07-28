/*Byte order semanic patch for little endian 16 byte case*/
@a@
typedef u16, __le16, uint64_t;
u16 eu16;
__le16 e_le16;
identifier tmp; 
expression ptr;
expression y,e; 
type T;
position p;
@@

- tmp = cpu_to_le16(y);

  <+... when != tmp
(
- memcpy(ptr, (T)&tmp, \(2\|sizeof(u16)\|sizeof(__le16)\|sizeof(eu16)\|sizeof(e_le16)\));
+ put_unaligned_le16(y,ptr);
|
- memcpy@p(ptr, (T)&tmp, ...);
+ put_unaligned_le16(y,ptr);
)
  ...+>
? tmp = e

@script:python@
p << a.p;
@@

print "dangerous second argument in %s:%s" % (p[0].file,p[0].line)

@@ type T; identifier a.tmp; @@

- T tmp;
...when != tmp

/*Byte order semanic patch for little endian 32 byte case*/

@b@
typedef u32, __le32;
u32 eu32;
__le32 e_le32;
identifier tmp; 
expression ptr;
expression y,e; 
type T;
position p;
@@

- tmp = cpu_to_le32(y);

  <+... when != tmp
(
- memcpy(ptr, (T)&tmp, \(4\|sizeof(u32)\|sizeof(__le32)\|sizeof(eu32)\|sizeof(e_le32)\));
+ put_unaligned_le32(y,ptr);
|
- memcpy@p(ptr, (T)&tmp, ...);
+ put_unaligned_le32(y,ptr);
)
  ...+>
? tmp = e

@script:python@
p << b.p;
@@

print "dangerous second argument in %s:%s" % (p[0].file,p[0].line)

@@ type T; identifier b.tmp; @@

- T tmp;
...when != tmp

/*Byte order semanic patch for little endian 64 byte case*/

@c@
typedef u64, __le64;
u64 eu64;
__le64 e_le64;
identifier tmp; 
expression ptr;
expression y,e; 
type T;
position p;
@@

- tmp = cpu_to_le64(y);

  <+... when != tmp
(
- memcpy(ptr, (T)&tmp, \(8\|sizeof(u64)\|sizeof(__le64)\|sizeof(eu64)\|sizeof(e_le64)\));
+ put_unaligned_le64(y,ptr);
|
- memcpy@p(ptr, (T)&tmp, ...);
+ put_unaligned_le64(y,ptr);
)
  ...+>
? tmp = e

@script:python@
p << c.p;
@@

print "dangerous second argument in %s:%s" % (p[0].file,p[0].line)

@@ type T; identifier c.tmp; @@

- T tmp;
...when != tmp

/*Byte order semanic patch for big endian 16 byte case*/

@m@
typedef __be16;
u16 eu16;
__be16 e_be16;
identifier tmp; 
expression ptr;
expression y,e; 
type T;
position p;
@@

- tmp = cpu_to_be16(y);

  <+... when != tmp
(
- memcpy(ptr, (T)&tmp, \(2\|sizeof(u16)\|sizeof(__be16)\|sizeof(eu16)\|sizeof(e_be16)\));
+ put_unaligned_be16(y,ptr);
|
- memcpy@p(ptr, (T)&tmp, ...);
+ put_unaligned_be16(y,ptr);
)
  ...+>
? tmp = e

@script:python@
p << m.p;
@@

print "dangerous second argument in %s:%s" % (p[0].file,p[0].line)

@@ type T; identifier m.tmp; @@

- T tmp;
...when != tmp

/*Byte order semanic patch for big endian 32 byte case*/

@n@
typedef __be32;
u16 eu32;
__be32 e_be32;
identifier tmp; 
expression ptr;
expression y,e; 
type T;
position p;
@@

- tmp = cpu_to_be32(y);

  <+... when != tmp
(
- memcpy(ptr, (T)&tmp, \(4\|sizeof(u32)\|sizeof(__be32)\|sizeof(eu32)\|sizeof(e_be32)\));
+ put_unaligned_be32(y,ptr);
|
- memcpy@p(ptr, (T)&tmp, ...);
+ put_unaligned_be32(y,ptr);
)
  ...+>
? tmp = e

@script:python@
p << n.p;
@@

print "dangerous second argument in %s:%s" % (p[0].file,p[0].line)

@@ type T; identifier n.tmp; @@

- T tmp;
...when != tmp

/*Byte order semanic patch for big endian 64 byte case*/

@o@
typedef __be64;
u64 eu64;
__be64 e_be64;
identifier tmp; 
expression ptr;
expression y,e; 
type T;
position p;
@@

- tmp = cpu_to_be64(y);

  <+... when != tmp
(
- memcpy(ptr, (T)&tmp, \(8\|sizeof(u64)\|sizeof(__be64)\|sizeof(eu64)\|sizeof(e_be64)\));
+ put_unaligned_be64(y,ptr);
|
- memcpy@p(ptr, (T)&tmp, ...);
+ put_unaligned_be64(y,ptr);
)
  ...+>
? tmp = e

@script:python@
p << o.p;
@@

print "dangerous second argument in %s:%s" % (p[0].file,p[0].line)

@@ type T; identifier o.tmp; @@

- T tmp;
...when != tmp


