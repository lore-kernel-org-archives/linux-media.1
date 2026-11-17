Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896079;
	b=z68EpAyG2fme3DEON4qxgr1eM0EJmFMAwK2wdUs6bkAugXGXdRxm6ocjmHyujevTpUvo
	 m79cJFBf26D+83pZFyoirrEYB2/dpFrJrPv3ONAvE6ybMQzxHvlMDCCFBwtGFPe+EGbcL
	 ELx87fFAB/IPWSURFB1WtAd7MxjLzJlHNnaBCWEFQ38rUYPaaDzC1GqppOxt4nMjWPCMm
	 SGJ1UyEzKwS01WfDncmsFoCO+XdJhYycRCNKCxQ0Uolxh7lhAAryNq1AWnVOZvnqd74Bb
	 RSQXXIWJZ+zG6lqhLeM9tqbhKVJ/vrqM9NIAT+b4dgGHPW89ytoaDsLq6uZgFoLI6vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896079;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=ZRrB4TxEQlny3JmeM90aG4NRE2OHdl2cXY8lAve/lI4=;
	b=m/V1LzU2spX1l1I4K7Fcp9igJlu26qHGpZPJf+jYVSWlOLrcdPB2bc26Gufec4IZKUu4
	 nYxtiM/Inq9Z3TM7D1AkgHozhpScNjanREG7DjaPZDMRvItd4gAb/Dqtu4VoqXc3G+EwH
	 JqQeTCSzQJk3BjfeCk1+PI1FlsoQC2jedd3zzTtluAwtn33s9f2sJLux6ZIJ1N5c/Ttao
	 +F33nb/Jk6X1FF+CpF9uLCIy+llSFvIZOEN2iVYcY5wzgwpZGIhbj5MioM5XUqefwgbCM
	 5YC7zqC1gju14mu5tJ/5pllz4s14jPBXFHRLHFag+9ajyiWxyDCyvQ7RLGry7LvVYxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C1606A32A
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8C1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cc89e86e9eso5348370b6e.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 22:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896078; x=1795500878;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRrB4TxEQlny3JmeM90aG4NRE2OHdl2cXY8lAve/lI4=;
        b=VOtoSJTwWD5Bee3E5ANPR9/jfl1+D9yYg4TMGk5utCneJdXWvPVnZ4ycq4N1bBIBZu
         jD/2b3On1FXWBHNExNY4znKJZIfFQZBY9EIAzD6+VT6k29y2kMnlTJmJTZGvCUZOLUm+
         7d4q/f/YlhqfT78Ia+5CbRtMINndR+tvJ3DObGUTvD1yGbX7nl84TDdphf5XDRS4y9rF
         ZkgnSTMxQGRYBaUc7QjqWWv8kIRczR5RriMpTRgP+YIAk2yDdkq0LdyIap6NDL9ftu/9
         E2eIWSa80vpWJwM+M/c1cwD/xW58uhnUNiMQAkeTHr76fI38BRrSndgrz41ZMGFa+Ss8
         jseQ==
X-Forwarded-Encrypted: i=1; AL+hErG2E5677o21dczO1enOdib8geGi55214NjgM8iH9kCv9IJwNfiY/0alUH7KW8CmZLlk10+XORvfbjWeeQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BZjVegl2PAeMGkc/Lsdxk73pSIewjwKf7OQrBD6h8FjunyW35
	5XUPJkhRLaEM5BJDBpB3d2c5xxDRUoZYzv0+4RlyYp542fBrUHDmjW4Q550qgQ0hFSeB7I5904C
	C6ifhx5yFQvh3QvzEJDZyFO3bbd17VSxaUuqBPoM7l6pz8VwPw8oTY1LCr7w=
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1525:b0:4c3:7695:1177 with SMTP id
 5614622812f47-56e611df7famr11384092b6e.6.1794896077862; Mon, 16 Nov 2026
 22:14:37 -0800 (PST)
Date: Mon, 16 Nov 2026 22:14:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afbf0cd.27ea6653.1a0e84.0004.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in ec168_streaming_ctrl
From: syzbot <syzbot+436c71c257f18c488712@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    141b164bbe18 Merge tag 'char-misc-7.4-rc4' of git://git.ke.=
.
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
console output: https://syzkaller.appspot.com/x/log.txt?x=3D15d3c5be580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1cf189394a856f1=
1
dashboard link: https://syzkaller.appspot.com/bug?extid=3D436c71c257f18c488=
712
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D134f0411580000

AI-generated root cause summary:
In dvb_usb_start_feed(), the driver fails to synchronize against concurrent
frontend sleep (dvb_usb_fe_sleep()) and ignores the error return value from
usb_urb_submitv2(). Because dvb_usb_start_feed() does not hold a lock or ca=
che
adap->active_fe locally, dvb_usb_fe_sleep() can concurrently power down the
hardware and reset adap->active_fe to -1. When dvb_usb_start_feed()=E9=9A=
=8F=E5=90=8E invokes
d->props->streaming_ctrl(adap->fe[adap->active_fe], 1), it evaluates
adap->fe[-1], which indexes out of bounds into the adjacent struct dvb_net
(reading NULL). Passing fe =3D NULL to the driver's streaming_ctrl callback
(ec168_streaming_ctrl) triggers a NULL pointer dereference when fe_to_d(fe)
accesses fe->dvb at offset 0x308.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3D436c71c25=
7f18c488712

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+436c71c257f18c488712@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc=
0000000061: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
CPU: 1 UID: 0 PID: 6028 Comm: syz-executor140 Not tainted syzkaller #0 PREE=
MPT(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 11/06/2026
RIP: 0010:ec168_streaming_ctrl+0x73/0x210 drivers/media/usb/dvb-usb-v2/ec16=
8.c:312
Code: c7 40 04 00 00 f3 f3 65 48 8b 05 70 5b 60 0d 48 89 44 24 58 31 c0 e8 =
3c 74 b3 f9 49 8d bc 24 08 03 00 00 48 89 f8 48 c1 e8 03 <42> 80 3c 28 00 0=
f 85 77 01 00 00 4d 8b a4 24 08 03 00 00 48 b8 00
RSP: 0018:ffffc9000360fac0 EFLAGS: 00010202
RAX: 0000000000000061 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff888032d02580 RSI: ffffffff885b14a4 RDI: 0000000000000308
RBP: 1ffff920006c1f58 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: dffffc0000000000 R14: 1ffff920006c1f6e R15: ffff888059050000
FS:  00007f1d14ff96c0(0000) GS:ffff888122569000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd878908b8 CR3: 000000007eb0f000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 dvb_usb_start_feed+0xa03/0xef0 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c=
:308
 dmx_ts_feed_start_filtering+0xf6/0x220 drivers/media/dvb-core/dvb_demux.c:=
747
 dvb_dmxdev_start_feed+0x273/0x3f0 drivers/media/dvb-core/dmxdev.c:658
 dvb_dmxdev_filter_start+0x1b6/0xdd0 drivers/media/dvb-core/dmxdev.c:769
 dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:985 [inline]
 dvb_demux_do_ioctl+0xe64/0x1200 drivers/media/dvb-core/dmxdev.c:1099
 dvb_usercopy+0x167/0x340 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
 vfs_ioctl fs/ioctl.c:52 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1d1503188b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 =
24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 f=
f ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f1d14ff90f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f1d1503188b
RDX: 00007f1d14ff9150 RSI: 0000000040146f2c RDI: 0000000000000004
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f1d150ce100
R13: 00007f1d150ce140 R14: 00007f1d14ff9150 R15: 00007ffc0aa43958
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ec168_streaming_ctrl+0x73/0x210 drivers/media/usb/dvb-usb-v2/ec16=
8.c:312
Code: c7 40 04 00 00 f3 f3 65 48 8b 05 70 5b 60 0d 48 89 44 24 58 31 c0 e8 =
3c 74 b3 f9 49 8d bc 24 08 03 00 00 48 89 f8 48 c1 e8 03 <42> 80 3c 28 00 0=
f 85 77 01 00 00 4d 8b a4 24 08 03 00 00 48 b8 00
RSP: 0018:ffffc9000360fac0 EFLAGS: 00010202
RAX: 0000000000000061 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff888032d02580 RSI: ffffffff885b14a4 RDI: 0000000000000308
RBP: 1ffff920006c1f58 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: dffffc0000000000 R14: 1ffff920006c1f6e R15: ffff888059050000
FS:  00007f1d14ff96c0(0000) GS:ffff888122569000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd878908b8 CR3: 000000007eb0f000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	c7 40 04 00 00 f3 f3 	movl   $0xf3f30000,0x4(%rax)
   7:	65 48 8b 05 70 5b 60 	mov    %gs:0xd605b70(%rip),%rax        # 0xd605=
b7f
   e:	0d
   f:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  14:	31 c0                	xor    %eax,%eax
  16:	e8 3c 74 b3 f9       	call   0xf9b37457
  1b:	49 8d bc 24 08 03 00 	lea    0x308(%r12),%rdi
  22:	00
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruct=
ion
  2f:	0f 85 77 01 00 00    	jne    0x1ac
  35:	4d 8b a4 24 08 03 00 	mov    0x308(%r12),%r12
  3c:	00
  3d:	48                   	rex.W
  3e:	b8                   	.byte 0xb8


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
