
user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	7119                	addi	sp,sp,-128
   2:	fc86                	sd	ra,120(sp)
   4:	f8a2                	sd	s0,112(sp)
   6:	f4a6                	sd	s1,104(sp)
   8:	f0ca                	sd	s2,96(sp)
   a:	ecce                	sd	s3,88(sp)
   c:	e8d2                	sd	s4,80(sp)
   e:	e4d6                	sd	s5,72(sp)
  10:	e0da                	sd	s6,64(sp)
  12:	fc5e                	sd	s7,56(sp)
  14:	f862                	sd	s8,48(sp)
  16:	f466                	sd	s9,40(sp)
  18:	f06a                	sd	s10,32(sp)
  1a:	ec6e                	sd	s11,24(sp)
  1c:	0100                	addi	s0,sp,128
  1e:	f8a43423          	sd	a0,-120(s0)
  22:	f8b43023          	sd	a1,-128(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  26:	4981                	li	s3,0
  l = w = c = 0;
  28:	4c81                	li	s9,0
  2a:	4c01                	li	s8,0
  2c:	4b81                	li	s7,0
  2e:	00001d97          	auipc	s11,0x1
  32:	8ebd8d93          	addi	s11,s11,-1813 # 919 <buf+0x1>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
  36:	4aa9                	li	s5,10
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  38:	00001a17          	auipc	s4,0x1
  3c:	870a0a13          	addi	s4,s4,-1936 # 8a8 <malloc+0xe6>
        inword = 0;
  40:	4b01                	li	s6,0
  while((n = read(fd, buf, sizeof(buf))) > 0){
  42:	a805                	j	72 <wc+0x72>
      if(strchr(" \r\t\n\v", buf[i]))
  44:	8552                	mv	a0,s4
  46:	00000097          	auipc	ra,0x0
  4a:	1e8080e7          	jalr	488(ra) # 22e <strchr>
  4e:	c919                	beqz	a0,64 <wc+0x64>
        inword = 0;
  50:	89da                	mv	s3,s6
    for(i=0; i<n; i++){
  52:	0485                	addi	s1,s1,1
  54:	01248d63          	beq	s1,s2,6e <wc+0x6e>
      if(buf[i] == '\n')
  58:	0004c583          	lbu	a1,0(s1)
  5c:	ff5594e3          	bne	a1,s5,44 <wc+0x44>
        l++;
  60:	2b85                	addiw	s7,s7,1
  62:	b7cd                	j	44 <wc+0x44>
      else if(!inword){
  64:	fe0997e3          	bnez	s3,52 <wc+0x52>
        w++;
  68:	2c05                	addiw	s8,s8,1
        inword = 1;
  6a:	4985                	li	s3,1
  6c:	b7dd                	j	52 <wc+0x52>
  6e:	01ac8cbb          	addw	s9,s9,s10
  while((n = read(fd, buf, sizeof(buf))) > 0){
  72:	20000613          	li	a2,512
  76:	00001597          	auipc	a1,0x1
  7a:	8a258593          	addi	a1,a1,-1886 # 918 <buf>
  7e:	f8843503          	ld	a0,-120(s0)
  82:	00000097          	auipc	ra,0x0
  86:	322080e7          	jalr	802(ra) # 3a4 <read>
  8a:	00a05f63          	blez	a0,a8 <wc+0xa8>
    for(i=0; i<n; i++){
  8e:	00001497          	auipc	s1,0x1
  92:	88a48493          	addi	s1,s1,-1910 # 918 <buf>
  96:	00050d1b          	sext.w	s10,a0
  9a:	fff5091b          	addiw	s2,a0,-1
  9e:	1902                	slli	s2,s2,0x20
  a0:	02095913          	srli	s2,s2,0x20
  a4:	996e                	add	s2,s2,s11
  a6:	bf4d                	j	58 <wc+0x58>
      }
    }
  }
  if(n < 0){
  a8:	02054e63          	bltz	a0,e4 <wc+0xe4>
    printf("wc: read error\n");
    exit(1);
  }
  printf("%d %d %d %s\n", l, w, c, name);
  ac:	f8043703          	ld	a4,-128(s0)
  b0:	86e6                	mv	a3,s9
  b2:	8662                	mv	a2,s8
  b4:	85de                	mv	a1,s7
  b6:	00001517          	auipc	a0,0x1
  ba:	80a50513          	addi	a0,a0,-2038 # 8c0 <malloc+0xfe>
  be:	00000097          	auipc	ra,0x0
  c2:	646080e7          	jalr	1606(ra) # 704 <printf>
}
  c6:	70e6                	ld	ra,120(sp)
  c8:	7446                	ld	s0,112(sp)
  ca:	74a6                	ld	s1,104(sp)
  cc:	7906                	ld	s2,96(sp)
  ce:	69e6                	ld	s3,88(sp)
  d0:	6a46                	ld	s4,80(sp)
  d2:	6aa6                	ld	s5,72(sp)
  d4:	6b06                	ld	s6,64(sp)
  d6:	7be2                	ld	s7,56(sp)
  d8:	7c42                	ld	s8,48(sp)
  da:	7ca2                	ld	s9,40(sp)
  dc:	7d02                	ld	s10,32(sp)
  de:	6de2                	ld	s11,24(sp)
  e0:	6109                	addi	sp,sp,128
  e2:	8082                	ret
    printf("wc: read error\n");
  e4:	00000517          	auipc	a0,0x0
  e8:	7cc50513          	addi	a0,a0,1996 # 8b0 <malloc+0xee>
  ec:	00000097          	auipc	ra,0x0
  f0:	618080e7          	jalr	1560(ra) # 704 <printf>
    exit(1);
  f4:	4505                	li	a0,1
  f6:	00000097          	auipc	ra,0x0
  fa:	296080e7          	jalr	662(ra) # 38c <exit>

00000000000000fe <main>:

int
main(int argc, char *argv[])
{
  fe:	7179                	addi	sp,sp,-48
 100:	f406                	sd	ra,40(sp)
 102:	f022                	sd	s0,32(sp)
 104:	ec26                	sd	s1,24(sp)
 106:	e84a                	sd	s2,16(sp)
 108:	e44e                	sd	s3,8(sp)
 10a:	e052                	sd	s4,0(sp)
 10c:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
 10e:	4785                	li	a5,1
 110:	04a7d763          	bge	a5,a0,15e <main+0x60>
 114:	00858493          	addi	s1,a1,8
 118:	ffe5099b          	addiw	s3,a0,-2
 11c:	1982                	slli	s3,s3,0x20
 11e:	0209d993          	srli	s3,s3,0x20
 122:	098e                	slli	s3,s3,0x3
 124:	05c1                	addi	a1,a1,16
 126:	99ae                	add	s3,s3,a1
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 128:	4581                	li	a1,0
 12a:	6088                	ld	a0,0(s1)
 12c:	00000097          	auipc	ra,0x0
 130:	2a0080e7          	jalr	672(ra) # 3cc <open>
 134:	892a                	mv	s2,a0
 136:	04054263          	bltz	a0,17a <main+0x7c>
      printf("wc: cannot open %s\n", argv[i]);
      exit(1);
    }
    wc(fd, argv[i]);
 13a:	608c                	ld	a1,0(s1)
 13c:	00000097          	auipc	ra,0x0
 140:	ec4080e7          	jalr	-316(ra) # 0 <wc>
    close(fd);
 144:	854a                	mv	a0,s2
 146:	00000097          	auipc	ra,0x0
 14a:	26e080e7          	jalr	622(ra) # 3b4 <close>
  for(i = 1; i < argc; i++){
 14e:	04a1                	addi	s1,s1,8
 150:	fd349ce3          	bne	s1,s3,128 <main+0x2a>
  }
  exit(0);
 154:	4501                	li	a0,0
 156:	00000097          	auipc	ra,0x0
 15a:	236080e7          	jalr	566(ra) # 38c <exit>
    wc(0, "");
 15e:	00000597          	auipc	a1,0x0
 162:	77258593          	addi	a1,a1,1906 # 8d0 <malloc+0x10e>
 166:	4501                	li	a0,0
 168:	00000097          	auipc	ra,0x0
 16c:	e98080e7          	jalr	-360(ra) # 0 <wc>
    exit(0);
 170:	4501                	li	a0,0
 172:	00000097          	auipc	ra,0x0
 176:	21a080e7          	jalr	538(ra) # 38c <exit>
      printf("wc: cannot open %s\n", argv[i]);
 17a:	608c                	ld	a1,0(s1)
 17c:	00000517          	auipc	a0,0x0
 180:	75c50513          	addi	a0,a0,1884 # 8d8 <malloc+0x116>
 184:	00000097          	auipc	ra,0x0
 188:	580080e7          	jalr	1408(ra) # 704 <printf>
      exit(1);
 18c:	4505                	li	a0,1
 18e:	00000097          	auipc	ra,0x0
 192:	1fe080e7          	jalr	510(ra) # 38c <exit>

0000000000000196 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 196:	1141                	addi	sp,sp,-16
 198:	e422                	sd	s0,8(sp)
 19a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 19c:	87aa                	mv	a5,a0
 19e:	0585                	addi	a1,a1,1
 1a0:	0785                	addi	a5,a5,1
 1a2:	fff5c703          	lbu	a4,-1(a1)
 1a6:	fee78fa3          	sb	a4,-1(a5)
 1aa:	fb75                	bnez	a4,19e <strcpy+0x8>
    ;
  return os;
}
 1ac:	6422                	ld	s0,8(sp)
 1ae:	0141                	addi	sp,sp,16
 1b0:	8082                	ret

00000000000001b2 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b2:	1141                	addi	sp,sp,-16
 1b4:	e422                	sd	s0,8(sp)
 1b6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1b8:	00054783          	lbu	a5,0(a0)
 1bc:	cb91                	beqz	a5,1d0 <strcmp+0x1e>
 1be:	0005c703          	lbu	a4,0(a1)
 1c2:	00f71763          	bne	a4,a5,1d0 <strcmp+0x1e>
    p++, q++;
 1c6:	0505                	addi	a0,a0,1
 1c8:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1ca:	00054783          	lbu	a5,0(a0)
 1ce:	fbe5                	bnez	a5,1be <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1d0:	0005c503          	lbu	a0,0(a1)
}
 1d4:	40a7853b          	subw	a0,a5,a0
 1d8:	6422                	ld	s0,8(sp)
 1da:	0141                	addi	sp,sp,16
 1dc:	8082                	ret

00000000000001de <strlen>:

uint
strlen(const char *s)
{
 1de:	1141                	addi	sp,sp,-16
 1e0:	e422                	sd	s0,8(sp)
 1e2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1e4:	00054783          	lbu	a5,0(a0)
 1e8:	cf91                	beqz	a5,204 <strlen+0x26>
 1ea:	0505                	addi	a0,a0,1
 1ec:	87aa                	mv	a5,a0
 1ee:	4685                	li	a3,1
 1f0:	9e89                	subw	a3,a3,a0
 1f2:	00f6853b          	addw	a0,a3,a5
 1f6:	0785                	addi	a5,a5,1
 1f8:	fff7c703          	lbu	a4,-1(a5)
 1fc:	fb7d                	bnez	a4,1f2 <strlen+0x14>
    ;
  return n;
}
 1fe:	6422                	ld	s0,8(sp)
 200:	0141                	addi	sp,sp,16
 202:	8082                	ret
  for(n = 0; s[n]; n++)
 204:	4501                	li	a0,0
 206:	bfe5                	j	1fe <strlen+0x20>

0000000000000208 <memset>:

void*
memset(void *dst, int c, uint n)
{
 208:	1141                	addi	sp,sp,-16
 20a:	e422                	sd	s0,8(sp)
 20c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 20e:	ce09                	beqz	a2,228 <memset+0x20>
 210:	87aa                	mv	a5,a0
 212:	fff6071b          	addiw	a4,a2,-1
 216:	1702                	slli	a4,a4,0x20
 218:	9301                	srli	a4,a4,0x20
 21a:	0705                	addi	a4,a4,1
 21c:	972a                	add	a4,a4,a0
    cdst[i] = c;
 21e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 222:	0785                	addi	a5,a5,1
 224:	fee79de3          	bne	a5,a4,21e <memset+0x16>
  }
  return dst;
}
 228:	6422                	ld	s0,8(sp)
 22a:	0141                	addi	sp,sp,16
 22c:	8082                	ret

000000000000022e <strchr>:

char*
strchr(const char *s, char c)
{
 22e:	1141                	addi	sp,sp,-16
 230:	e422                	sd	s0,8(sp)
 232:	0800                	addi	s0,sp,16
  for(; *s; s++)
 234:	00054783          	lbu	a5,0(a0)
 238:	cb99                	beqz	a5,24e <strchr+0x20>
    if(*s == c)
 23a:	00f58763          	beq	a1,a5,248 <strchr+0x1a>
  for(; *s; s++)
 23e:	0505                	addi	a0,a0,1
 240:	00054783          	lbu	a5,0(a0)
 244:	fbfd                	bnez	a5,23a <strchr+0xc>
      return (char*)s;
  return 0;
 246:	4501                	li	a0,0
}
 248:	6422                	ld	s0,8(sp)
 24a:	0141                	addi	sp,sp,16
 24c:	8082                	ret
  return 0;
 24e:	4501                	li	a0,0
 250:	bfe5                	j	248 <strchr+0x1a>

0000000000000252 <gets>:

char*
gets(char *buf, int max)
{
 252:	711d                	addi	sp,sp,-96
 254:	ec86                	sd	ra,88(sp)
 256:	e8a2                	sd	s0,80(sp)
 258:	e4a6                	sd	s1,72(sp)
 25a:	e0ca                	sd	s2,64(sp)
 25c:	fc4e                	sd	s3,56(sp)
 25e:	f852                	sd	s4,48(sp)
 260:	f456                	sd	s5,40(sp)
 262:	f05a                	sd	s6,32(sp)
 264:	ec5e                	sd	s7,24(sp)
 266:	1080                	addi	s0,sp,96
 268:	8baa                	mv	s7,a0
 26a:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26c:	892a                	mv	s2,a0
 26e:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 270:	4aa9                	li	s5,10
 272:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 274:	89a6                	mv	s3,s1
 276:	2485                	addiw	s1,s1,1
 278:	0344d863          	bge	s1,s4,2a8 <gets+0x56>
    cc = read(0, &c, 1);
 27c:	4605                	li	a2,1
 27e:	faf40593          	addi	a1,s0,-81
 282:	4501                	li	a0,0
 284:	00000097          	auipc	ra,0x0
 288:	120080e7          	jalr	288(ra) # 3a4 <read>
    if(cc < 1)
 28c:	00a05e63          	blez	a0,2a8 <gets+0x56>
    buf[i++] = c;
 290:	faf44783          	lbu	a5,-81(s0)
 294:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 298:	01578763          	beq	a5,s5,2a6 <gets+0x54>
 29c:	0905                	addi	s2,s2,1
 29e:	fd679be3          	bne	a5,s6,274 <gets+0x22>
  for(i=0; i+1 < max; ){
 2a2:	89a6                	mv	s3,s1
 2a4:	a011                	j	2a8 <gets+0x56>
 2a6:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2a8:	99de                	add	s3,s3,s7
 2aa:	00098023          	sb	zero,0(s3)
  return buf;
}
 2ae:	855e                	mv	a0,s7
 2b0:	60e6                	ld	ra,88(sp)
 2b2:	6446                	ld	s0,80(sp)
 2b4:	64a6                	ld	s1,72(sp)
 2b6:	6906                	ld	s2,64(sp)
 2b8:	79e2                	ld	s3,56(sp)
 2ba:	7a42                	ld	s4,48(sp)
 2bc:	7aa2                	ld	s5,40(sp)
 2be:	7b02                	ld	s6,32(sp)
 2c0:	6be2                	ld	s7,24(sp)
 2c2:	6125                	addi	sp,sp,96
 2c4:	8082                	ret

00000000000002c6 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c6:	1101                	addi	sp,sp,-32
 2c8:	ec06                	sd	ra,24(sp)
 2ca:	e822                	sd	s0,16(sp)
 2cc:	e426                	sd	s1,8(sp)
 2ce:	e04a                	sd	s2,0(sp)
 2d0:	1000                	addi	s0,sp,32
 2d2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d4:	4581                	li	a1,0
 2d6:	00000097          	auipc	ra,0x0
 2da:	0f6080e7          	jalr	246(ra) # 3cc <open>
  if(fd < 0)
 2de:	02054563          	bltz	a0,308 <stat+0x42>
 2e2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2e4:	85ca                	mv	a1,s2
 2e6:	00000097          	auipc	ra,0x0
 2ea:	0fe080e7          	jalr	254(ra) # 3e4 <fstat>
 2ee:	892a                	mv	s2,a0
  close(fd);
 2f0:	8526                	mv	a0,s1
 2f2:	00000097          	auipc	ra,0x0
 2f6:	0c2080e7          	jalr	194(ra) # 3b4 <close>
  return r;
}
 2fa:	854a                	mv	a0,s2
 2fc:	60e2                	ld	ra,24(sp)
 2fe:	6442                	ld	s0,16(sp)
 300:	64a2                	ld	s1,8(sp)
 302:	6902                	ld	s2,0(sp)
 304:	6105                	addi	sp,sp,32
 306:	8082                	ret
    return -1;
 308:	597d                	li	s2,-1
 30a:	bfc5                	j	2fa <stat+0x34>

000000000000030c <atoi>:

int
atoi(const char *s)
{
 30c:	1141                	addi	sp,sp,-16
 30e:	e422                	sd	s0,8(sp)
 310:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 312:	00054603          	lbu	a2,0(a0)
 316:	fd06079b          	addiw	a5,a2,-48
 31a:	0ff7f793          	andi	a5,a5,255
 31e:	4725                	li	a4,9
 320:	02f76963          	bltu	a4,a5,352 <atoi+0x46>
 324:	86aa                	mv	a3,a0
  n = 0;
 326:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 328:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 32a:	0685                	addi	a3,a3,1
 32c:	0025179b          	slliw	a5,a0,0x2
 330:	9fa9                	addw	a5,a5,a0
 332:	0017979b          	slliw	a5,a5,0x1
 336:	9fb1                	addw	a5,a5,a2
 338:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 33c:	0006c603          	lbu	a2,0(a3)
 340:	fd06071b          	addiw	a4,a2,-48
 344:	0ff77713          	andi	a4,a4,255
 348:	fee5f1e3          	bgeu	a1,a4,32a <atoi+0x1e>
  return n;
}
 34c:	6422                	ld	s0,8(sp)
 34e:	0141                	addi	sp,sp,16
 350:	8082                	ret
  n = 0;
 352:	4501                	li	a0,0
 354:	bfe5                	j	34c <atoi+0x40>

0000000000000356 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 356:	1141                	addi	sp,sp,-16
 358:	e422                	sd	s0,8(sp)
 35a:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35c:	02c05163          	blez	a2,37e <memmove+0x28>
 360:	fff6071b          	addiw	a4,a2,-1
 364:	1702                	slli	a4,a4,0x20
 366:	9301                	srli	a4,a4,0x20
 368:	0705                	addi	a4,a4,1
 36a:	972a                	add	a4,a4,a0
  dst = vdst;
 36c:	87aa                	mv	a5,a0
    *dst++ = *src++;
 36e:	0585                	addi	a1,a1,1
 370:	0785                	addi	a5,a5,1
 372:	fff5c683          	lbu	a3,-1(a1)
 376:	fed78fa3          	sb	a3,-1(a5)
  while(n-- > 0)
 37a:	fee79ae3          	bne	a5,a4,36e <memmove+0x18>
  return vdst;
}
 37e:	6422                	ld	s0,8(sp)
 380:	0141                	addi	sp,sp,16
 382:	8082                	ret

0000000000000384 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 384:	4885                	li	a7,1
 ecall
 386:	00000073          	ecall
 ret
 38a:	8082                	ret

000000000000038c <exit>:
.global exit
exit:
 li a7, SYS_exit
 38c:	4889                	li	a7,2
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <wait>:
.global wait
wait:
 li a7, SYS_wait
 394:	488d                	li	a7,3
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 39c:	4891                	li	a7,4
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <read>:
.global read
read:
 li a7, SYS_read
 3a4:	4895                	li	a7,5
 ecall
 3a6:	00000073          	ecall
 ret
 3aa:	8082                	ret

00000000000003ac <write>:
.global write
write:
 li a7, SYS_write
 3ac:	48c1                	li	a7,16
 ecall
 3ae:	00000073          	ecall
 ret
 3b2:	8082                	ret

00000000000003b4 <close>:
.global close
close:
 li a7, SYS_close
 3b4:	48d5                	li	a7,21
 ecall
 3b6:	00000073          	ecall
 ret
 3ba:	8082                	ret

00000000000003bc <kill>:
.global kill
kill:
 li a7, SYS_kill
 3bc:	4899                	li	a7,6
 ecall
 3be:	00000073          	ecall
 ret
 3c2:	8082                	ret

00000000000003c4 <exec>:
.global exec
exec:
 li a7, SYS_exec
 3c4:	489d                	li	a7,7
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <open>:
.global open
open:
 li a7, SYS_open
 3cc:	48bd                	li	a7,15
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 3d4:	48c5                	li	a7,17
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 3dc:	48c9                	li	a7,18
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3e4:	48a1                	li	a7,8
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <link>:
.global link
link:
 li a7, SYS_link
 3ec:	48cd                	li	a7,19
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3f4:	48d1                	li	a7,20
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3fc:	48a5                	li	a7,9
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <dup>:
.global dup
dup:
 li a7, SYS_dup
 404:	48a9                	li	a7,10
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 40c:	48ad                	li	a7,11
 ecall
 40e:	00000073          	ecall
 ret
 412:	8082                	ret

0000000000000414 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 414:	48b1                	li	a7,12
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 41c:	48b5                	li	a7,13
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 424:	48b9                	li	a7,14
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 42c:	1101                	addi	sp,sp,-32
 42e:	ec06                	sd	ra,24(sp)
 430:	e822                	sd	s0,16(sp)
 432:	1000                	addi	s0,sp,32
 434:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 438:	4605                	li	a2,1
 43a:	fef40593          	addi	a1,s0,-17
 43e:	00000097          	auipc	ra,0x0
 442:	f6e080e7          	jalr	-146(ra) # 3ac <write>
}
 446:	60e2                	ld	ra,24(sp)
 448:	6442                	ld	s0,16(sp)
 44a:	6105                	addi	sp,sp,32
 44c:	8082                	ret

000000000000044e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 44e:	7139                	addi	sp,sp,-64
 450:	fc06                	sd	ra,56(sp)
 452:	f822                	sd	s0,48(sp)
 454:	f426                	sd	s1,40(sp)
 456:	f04a                	sd	s2,32(sp)
 458:	ec4e                	sd	s3,24(sp)
 45a:	0080                	addi	s0,sp,64
 45c:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45e:	c299                	beqz	a3,464 <printint+0x16>
 460:	0805c863          	bltz	a1,4f0 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 464:	2581                	sext.w	a1,a1
  neg = 0;
 466:	4881                	li	a7,0
 468:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 46c:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 46e:	2601                	sext.w	a2,a2
 470:	00000517          	auipc	a0,0x0
 474:	48850513          	addi	a0,a0,1160 # 8f8 <digits>
 478:	883a                	mv	a6,a4
 47a:	2705                	addiw	a4,a4,1
 47c:	02c5f7bb          	remuw	a5,a1,a2
 480:	1782                	slli	a5,a5,0x20
 482:	9381                	srli	a5,a5,0x20
 484:	97aa                	add	a5,a5,a0
 486:	0007c783          	lbu	a5,0(a5)
 48a:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 48e:	0005879b          	sext.w	a5,a1
 492:	02c5d5bb          	divuw	a1,a1,a2
 496:	0685                	addi	a3,a3,1
 498:	fec7f0e3          	bgeu	a5,a2,478 <printint+0x2a>
  if(neg)
 49c:	00088b63          	beqz	a7,4b2 <printint+0x64>
    buf[i++] = '-';
 4a0:	fd040793          	addi	a5,s0,-48
 4a4:	973e                	add	a4,a4,a5
 4a6:	02d00793          	li	a5,45
 4aa:	fef70823          	sb	a5,-16(a4)
 4ae:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4b2:	02e05863          	blez	a4,4e2 <printint+0x94>
 4b6:	fc040793          	addi	a5,s0,-64
 4ba:	00e78933          	add	s2,a5,a4
 4be:	fff78993          	addi	s3,a5,-1
 4c2:	99ba                	add	s3,s3,a4
 4c4:	377d                	addiw	a4,a4,-1
 4c6:	1702                	slli	a4,a4,0x20
 4c8:	9301                	srli	a4,a4,0x20
 4ca:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4ce:	fff94583          	lbu	a1,-1(s2)
 4d2:	8526                	mv	a0,s1
 4d4:	00000097          	auipc	ra,0x0
 4d8:	f58080e7          	jalr	-168(ra) # 42c <putc>
  while(--i >= 0)
 4dc:	197d                	addi	s2,s2,-1
 4de:	ff3918e3          	bne	s2,s3,4ce <printint+0x80>
}
 4e2:	70e2                	ld	ra,56(sp)
 4e4:	7442                	ld	s0,48(sp)
 4e6:	74a2                	ld	s1,40(sp)
 4e8:	7902                	ld	s2,32(sp)
 4ea:	69e2                	ld	s3,24(sp)
 4ec:	6121                	addi	sp,sp,64
 4ee:	8082                	ret
    x = -xx;
 4f0:	40b005bb          	negw	a1,a1
    neg = 1;
 4f4:	4885                	li	a7,1
    x = -xx;
 4f6:	bf8d                	j	468 <printint+0x1a>

00000000000004f8 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4f8:	7119                	addi	sp,sp,-128
 4fa:	fc86                	sd	ra,120(sp)
 4fc:	f8a2                	sd	s0,112(sp)
 4fe:	f4a6                	sd	s1,104(sp)
 500:	f0ca                	sd	s2,96(sp)
 502:	ecce                	sd	s3,88(sp)
 504:	e8d2                	sd	s4,80(sp)
 506:	e4d6                	sd	s5,72(sp)
 508:	e0da                	sd	s6,64(sp)
 50a:	fc5e                	sd	s7,56(sp)
 50c:	f862                	sd	s8,48(sp)
 50e:	f466                	sd	s9,40(sp)
 510:	f06a                	sd	s10,32(sp)
 512:	ec6e                	sd	s11,24(sp)
 514:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 516:	0005c903          	lbu	s2,0(a1)
 51a:	18090f63          	beqz	s2,6b8 <vprintf+0x1c0>
 51e:	8aaa                	mv	s5,a0
 520:	8b32                	mv	s6,a2
 522:	00158493          	addi	s1,a1,1
  state = 0;
 526:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 528:	02500a13          	li	s4,37
      if(c == 'd'){
 52c:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 530:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 534:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 538:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 53c:	00000b97          	auipc	s7,0x0
 540:	3bcb8b93          	addi	s7,s7,956 # 8f8 <digits>
 544:	a839                	j	562 <vprintf+0x6a>
        putc(fd, c);
 546:	85ca                	mv	a1,s2
 548:	8556                	mv	a0,s5
 54a:	00000097          	auipc	ra,0x0
 54e:	ee2080e7          	jalr	-286(ra) # 42c <putc>
 552:	a019                	j	558 <vprintf+0x60>
    } else if(state == '%'){
 554:	01498f63          	beq	s3,s4,572 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 558:	0485                	addi	s1,s1,1
 55a:	fff4c903          	lbu	s2,-1(s1)
 55e:	14090d63          	beqz	s2,6b8 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 562:	0009079b          	sext.w	a5,s2
    if(state == 0){
 566:	fe0997e3          	bnez	s3,554 <vprintf+0x5c>
      if(c == '%'){
 56a:	fd479ee3          	bne	a5,s4,546 <vprintf+0x4e>
        state = '%';
 56e:	89be                	mv	s3,a5
 570:	b7e5                	j	558 <vprintf+0x60>
      if(c == 'd'){
 572:	05878063          	beq	a5,s8,5b2 <vprintf+0xba>
      } else if(c == 'l') {
 576:	05978c63          	beq	a5,s9,5ce <vprintf+0xd6>
      } else if(c == 'x') {
 57a:	07a78863          	beq	a5,s10,5ea <vprintf+0xf2>
      } else if(c == 'p') {
 57e:	09b78463          	beq	a5,s11,606 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 582:	07300713          	li	a4,115
 586:	0ce78663          	beq	a5,a4,652 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58a:	06300713          	li	a4,99
 58e:	0ee78e63          	beq	a5,a4,68a <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 592:	11478863          	beq	a5,s4,6a2 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 596:	85d2                	mv	a1,s4
 598:	8556                	mv	a0,s5
 59a:	00000097          	auipc	ra,0x0
 59e:	e92080e7          	jalr	-366(ra) # 42c <putc>
        putc(fd, c);
 5a2:	85ca                	mv	a1,s2
 5a4:	8556                	mv	a0,s5
 5a6:	00000097          	auipc	ra,0x0
 5aa:	e86080e7          	jalr	-378(ra) # 42c <putc>
      }
      state = 0;
 5ae:	4981                	li	s3,0
 5b0:	b765                	j	558 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5b2:	008b0913          	addi	s2,s6,8
 5b6:	4685                	li	a3,1
 5b8:	4629                	li	a2,10
 5ba:	000b2583          	lw	a1,0(s6)
 5be:	8556                	mv	a0,s5
 5c0:	00000097          	auipc	ra,0x0
 5c4:	e8e080e7          	jalr	-370(ra) # 44e <printint>
 5c8:	8b4a                	mv	s6,s2
      state = 0;
 5ca:	4981                	li	s3,0
 5cc:	b771                	j	558 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5ce:	008b0913          	addi	s2,s6,8
 5d2:	4681                	li	a3,0
 5d4:	4629                	li	a2,10
 5d6:	000b2583          	lw	a1,0(s6)
 5da:	8556                	mv	a0,s5
 5dc:	00000097          	auipc	ra,0x0
 5e0:	e72080e7          	jalr	-398(ra) # 44e <printint>
 5e4:	8b4a                	mv	s6,s2
      state = 0;
 5e6:	4981                	li	s3,0
 5e8:	bf85                	j	558 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5ea:	008b0913          	addi	s2,s6,8
 5ee:	4681                	li	a3,0
 5f0:	4641                	li	a2,16
 5f2:	000b2583          	lw	a1,0(s6)
 5f6:	8556                	mv	a0,s5
 5f8:	00000097          	auipc	ra,0x0
 5fc:	e56080e7          	jalr	-426(ra) # 44e <printint>
 600:	8b4a                	mv	s6,s2
      state = 0;
 602:	4981                	li	s3,0
 604:	bf91                	j	558 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 606:	008b0793          	addi	a5,s6,8
 60a:	f8f43423          	sd	a5,-120(s0)
 60e:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 612:	03000593          	li	a1,48
 616:	8556                	mv	a0,s5
 618:	00000097          	auipc	ra,0x0
 61c:	e14080e7          	jalr	-492(ra) # 42c <putc>
  putc(fd, 'x');
 620:	85ea                	mv	a1,s10
 622:	8556                	mv	a0,s5
 624:	00000097          	auipc	ra,0x0
 628:	e08080e7          	jalr	-504(ra) # 42c <putc>
 62c:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 62e:	03c9d793          	srli	a5,s3,0x3c
 632:	97de                	add	a5,a5,s7
 634:	0007c583          	lbu	a1,0(a5)
 638:	8556                	mv	a0,s5
 63a:	00000097          	auipc	ra,0x0
 63e:	df2080e7          	jalr	-526(ra) # 42c <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 642:	0992                	slli	s3,s3,0x4
 644:	397d                	addiw	s2,s2,-1
 646:	fe0914e3          	bnez	s2,62e <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 64a:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 64e:	4981                	li	s3,0
 650:	b721                	j	558 <vprintf+0x60>
        s = va_arg(ap, char*);
 652:	008b0993          	addi	s3,s6,8
 656:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 65a:	02090163          	beqz	s2,67c <vprintf+0x184>
        while(*s != 0){
 65e:	00094583          	lbu	a1,0(s2)
 662:	c9a1                	beqz	a1,6b2 <vprintf+0x1ba>
          putc(fd, *s);
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	dc6080e7          	jalr	-570(ra) # 42c <putc>
          s++;
 66e:	0905                	addi	s2,s2,1
        while(*s != 0){
 670:	00094583          	lbu	a1,0(s2)
 674:	f9e5                	bnez	a1,664 <vprintf+0x16c>
        s = va_arg(ap, char*);
 676:	8b4e                	mv	s6,s3
      state = 0;
 678:	4981                	li	s3,0
 67a:	bdf9                	j	558 <vprintf+0x60>
          s = "(null)";
 67c:	00000917          	auipc	s2,0x0
 680:	27490913          	addi	s2,s2,628 # 8f0 <malloc+0x12e>
        while(*s != 0){
 684:	02800593          	li	a1,40
 688:	bff1                	j	664 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 68a:	008b0913          	addi	s2,s6,8
 68e:	000b4583          	lbu	a1,0(s6)
 692:	8556                	mv	a0,s5
 694:	00000097          	auipc	ra,0x0
 698:	d98080e7          	jalr	-616(ra) # 42c <putc>
 69c:	8b4a                	mv	s6,s2
      state = 0;
 69e:	4981                	li	s3,0
 6a0:	bd65                	j	558 <vprintf+0x60>
        putc(fd, c);
 6a2:	85d2                	mv	a1,s4
 6a4:	8556                	mv	a0,s5
 6a6:	00000097          	auipc	ra,0x0
 6aa:	d86080e7          	jalr	-634(ra) # 42c <putc>
      state = 0;
 6ae:	4981                	li	s3,0
 6b0:	b565                	j	558 <vprintf+0x60>
        s = va_arg(ap, char*);
 6b2:	8b4e                	mv	s6,s3
      state = 0;
 6b4:	4981                	li	s3,0
 6b6:	b54d                	j	558 <vprintf+0x60>
    }
  }
}
 6b8:	70e6                	ld	ra,120(sp)
 6ba:	7446                	ld	s0,112(sp)
 6bc:	74a6                	ld	s1,104(sp)
 6be:	7906                	ld	s2,96(sp)
 6c0:	69e6                	ld	s3,88(sp)
 6c2:	6a46                	ld	s4,80(sp)
 6c4:	6aa6                	ld	s5,72(sp)
 6c6:	6b06                	ld	s6,64(sp)
 6c8:	7be2                	ld	s7,56(sp)
 6ca:	7c42                	ld	s8,48(sp)
 6cc:	7ca2                	ld	s9,40(sp)
 6ce:	7d02                	ld	s10,32(sp)
 6d0:	6de2                	ld	s11,24(sp)
 6d2:	6109                	addi	sp,sp,128
 6d4:	8082                	ret

00000000000006d6 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6d6:	715d                	addi	sp,sp,-80
 6d8:	ec06                	sd	ra,24(sp)
 6da:	e822                	sd	s0,16(sp)
 6dc:	1000                	addi	s0,sp,32
 6de:	e010                	sd	a2,0(s0)
 6e0:	e414                	sd	a3,8(s0)
 6e2:	e818                	sd	a4,16(s0)
 6e4:	ec1c                	sd	a5,24(s0)
 6e6:	03043023          	sd	a6,32(s0)
 6ea:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6ee:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6f2:	8622                	mv	a2,s0
 6f4:	00000097          	auipc	ra,0x0
 6f8:	e04080e7          	jalr	-508(ra) # 4f8 <vprintf>
}
 6fc:	60e2                	ld	ra,24(sp)
 6fe:	6442                	ld	s0,16(sp)
 700:	6161                	addi	sp,sp,80
 702:	8082                	ret

0000000000000704 <printf>:

void
printf(const char *fmt, ...)
{
 704:	711d                	addi	sp,sp,-96
 706:	ec06                	sd	ra,24(sp)
 708:	e822                	sd	s0,16(sp)
 70a:	1000                	addi	s0,sp,32
 70c:	e40c                	sd	a1,8(s0)
 70e:	e810                	sd	a2,16(s0)
 710:	ec14                	sd	a3,24(s0)
 712:	f018                	sd	a4,32(s0)
 714:	f41c                	sd	a5,40(s0)
 716:	03043823          	sd	a6,48(s0)
 71a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 71e:	00840613          	addi	a2,s0,8
 722:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 726:	85aa                	mv	a1,a0
 728:	4505                	li	a0,1
 72a:	00000097          	auipc	ra,0x0
 72e:	dce080e7          	jalr	-562(ra) # 4f8 <vprintf>
}
 732:	60e2                	ld	ra,24(sp)
 734:	6442                	ld	s0,16(sp)
 736:	6125                	addi	sp,sp,96
 738:	8082                	ret

000000000000073a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 73a:	1141                	addi	sp,sp,-16
 73c:	e422                	sd	s0,8(sp)
 73e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 740:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 744:	00000797          	auipc	a5,0x0
 748:	1cc7b783          	ld	a5,460(a5) # 910 <freep>
 74c:	a805                	j	77c <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 74e:	4618                	lw	a4,8(a2)
 750:	9db9                	addw	a1,a1,a4
 752:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	6398                	ld	a4,0(a5)
 758:	6318                	ld	a4,0(a4)
 75a:	fee53823          	sd	a4,-16(a0)
 75e:	a091                	j	7a2 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 760:	ff852703          	lw	a4,-8(a0)
 764:	9e39                	addw	a2,a2,a4
 766:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 768:	ff053703          	ld	a4,-16(a0)
 76c:	e398                	sd	a4,0(a5)
 76e:	a099                	j	7b4 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 770:	6398                	ld	a4,0(a5)
 772:	00e7e463          	bltu	a5,a4,77a <free+0x40>
 776:	00e6ea63          	bltu	a3,a4,78a <free+0x50>
{
 77a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77c:	fed7fae3          	bgeu	a5,a3,770 <free+0x36>
 780:	6398                	ld	a4,0(a5)
 782:	00e6e463          	bltu	a3,a4,78a <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 786:	fee7eae3          	bltu	a5,a4,77a <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 78a:	ff852583          	lw	a1,-8(a0)
 78e:	6390                	ld	a2,0(a5)
 790:	02059713          	slli	a4,a1,0x20
 794:	9301                	srli	a4,a4,0x20
 796:	0712                	slli	a4,a4,0x4
 798:	9736                	add	a4,a4,a3
 79a:	fae60ae3          	beq	a2,a4,74e <free+0x14>
    bp->s.ptr = p->s.ptr;
 79e:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7a2:	4790                	lw	a2,8(a5)
 7a4:	02061713          	slli	a4,a2,0x20
 7a8:	9301                	srli	a4,a4,0x20
 7aa:	0712                	slli	a4,a4,0x4
 7ac:	973e                	add	a4,a4,a5
 7ae:	fae689e3          	beq	a3,a4,760 <free+0x26>
  } else
    p->s.ptr = bp;
 7b2:	e394                	sd	a3,0(a5)
  freep = p;
 7b4:	00000717          	auipc	a4,0x0
 7b8:	14f73e23          	sd	a5,348(a4) # 910 <freep>
}
 7bc:	6422                	ld	s0,8(sp)
 7be:	0141                	addi	sp,sp,16
 7c0:	8082                	ret

00000000000007c2 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c2:	7139                	addi	sp,sp,-64
 7c4:	fc06                	sd	ra,56(sp)
 7c6:	f822                	sd	s0,48(sp)
 7c8:	f426                	sd	s1,40(sp)
 7ca:	f04a                	sd	s2,32(sp)
 7cc:	ec4e                	sd	s3,24(sp)
 7ce:	e852                	sd	s4,16(sp)
 7d0:	e456                	sd	s5,8(sp)
 7d2:	e05a                	sd	s6,0(sp)
 7d4:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d6:	02051493          	slli	s1,a0,0x20
 7da:	9081                	srli	s1,s1,0x20
 7dc:	04bd                	addi	s1,s1,15
 7de:	8091                	srli	s1,s1,0x4
 7e0:	0014899b          	addiw	s3,s1,1
 7e4:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7e6:	00000517          	auipc	a0,0x0
 7ea:	12a53503          	ld	a0,298(a0) # 910 <freep>
 7ee:	c515                	beqz	a0,81a <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7f2:	4798                	lw	a4,8(a5)
 7f4:	02977f63          	bgeu	a4,s1,832 <malloc+0x70>
 7f8:	8a4e                	mv	s4,s3
 7fa:	0009871b          	sext.w	a4,s3
 7fe:	6685                	lui	a3,0x1
 800:	00d77363          	bgeu	a4,a3,806 <malloc+0x44>
 804:	6a05                	lui	s4,0x1
 806:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 80a:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 80e:	00000917          	auipc	s2,0x0
 812:	10290913          	addi	s2,s2,258 # 910 <freep>
  if(p == (char*)-1)
 816:	5afd                	li	s5,-1
 818:	a88d                	j	88a <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 81a:	00000797          	auipc	a5,0x0
 81e:	2fe78793          	addi	a5,a5,766 # b18 <base>
 822:	00000717          	auipc	a4,0x0
 826:	0ef73723          	sd	a5,238(a4) # 910 <freep>
 82a:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 82c:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 830:	b7e1                	j	7f8 <malloc+0x36>
      if(p->s.size == nunits)
 832:	02e48b63          	beq	s1,a4,868 <malloc+0xa6>
        p->s.size -= nunits;
 836:	4137073b          	subw	a4,a4,s3
 83a:	c798                	sw	a4,8(a5)
        p += p->s.size;
 83c:	1702                	slli	a4,a4,0x20
 83e:	9301                	srli	a4,a4,0x20
 840:	0712                	slli	a4,a4,0x4
 842:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 844:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 848:	00000717          	auipc	a4,0x0
 84c:	0ca73423          	sd	a0,200(a4) # 910 <freep>
      return (void*)(p + 1);
 850:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 854:	70e2                	ld	ra,56(sp)
 856:	7442                	ld	s0,48(sp)
 858:	74a2                	ld	s1,40(sp)
 85a:	7902                	ld	s2,32(sp)
 85c:	69e2                	ld	s3,24(sp)
 85e:	6a42                	ld	s4,16(sp)
 860:	6aa2                	ld	s5,8(sp)
 862:	6b02                	ld	s6,0(sp)
 864:	6121                	addi	sp,sp,64
 866:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 868:	6398                	ld	a4,0(a5)
 86a:	e118                	sd	a4,0(a0)
 86c:	bff1                	j	848 <malloc+0x86>
  hp->s.size = nu;
 86e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 872:	0541                	addi	a0,a0,16
 874:	00000097          	auipc	ra,0x0
 878:	ec6080e7          	jalr	-314(ra) # 73a <free>
  return freep;
 87c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 880:	d971                	beqz	a0,854 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 882:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 884:	4798                	lw	a4,8(a5)
 886:	fa9776e3          	bgeu	a4,s1,832 <malloc+0x70>
    if(p == freep)
 88a:	00093703          	ld	a4,0(s2)
 88e:	853e                	mv	a0,a5
 890:	fef719e3          	bne	a4,a5,882 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 894:	8552                	mv	a0,s4
 896:	00000097          	auipc	ra,0x0
 89a:	b7e080e7          	jalr	-1154(ra) # 414 <sbrk>
  if(p == (char*)-1)
 89e:	fd5518e3          	bne	a0,s5,86e <malloc+0xac>
        return 0;
 8a2:	4501                	li	a0,0
 8a4:	bf45                	j	854 <malloc+0x92>