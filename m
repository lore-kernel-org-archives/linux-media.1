Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B467262A
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785974492; cv=none; b=Y7Ac0++bBo0S/VMdtqwnDIPYley+siGMq1DBZPGob2Xf0GwxCezJidFGK6wBeT+lxDtR0/ioSVaJJNQq3Z21Vzeq/dF1yTo2w4rp1EbCl6UoM6iv/xNZjcT4thL0lIPYzDUaV0H4nXnN/oVHMJBtffn1cxsFbxLYBtp0JPntUoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785974492; c=relaxed/simple;
	bh=p/IoeRRIOIzwSXi1I1NCd+Y0Ikp1A9En37b50pUpMU0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bRSOm5JQSvdOkpTlg0U66v/Y8nrkKDHi+TrcPAztqlc455MyexKp6McTBODrbZB/44UOwIApvna8PzeVoJEOTqt2/FBtVUbD2ZD/vEdf48ge9s0Un64db0ApH+qVj4nahqRpR6jMmY5XYxUAzBFSIGG8E/QgpX+RaYTpMmMaVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7e9dc0f5900so701189a34.0
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 17:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785974490; x=1786579290;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vC11jzeBf6ckEVxKByBrHYnsIlId2H3g9XWIPuYbZ0s=;
        b=aW9mWDCI3bmvmVSySz4dkI+9YsCP8XPneJbLGSFPTLDpMohKxkbIcMrhAHbZ3qJTxh
         QgeWTUjx+91e/nZsofYH/nQo8MPut0sNWoDJeQP0bpvkt3gowHBHlTU+rFyR917M6Ik+
         LoPmY+amckeSDTF/j/VMwt1pKNZHb/1hwNYYmj/IXUo0UalFvictOlBCJHeCeyONF4tR
         vo9L6f2CicIHjjHAObLQCK7aPSJfD2WbxUD4t33bbuT1K67EkTYylDesQflOO91Gy22q
         FUome0gqEzg1cDTY3a98Hq2c6Ju4h96qfC1XQhrR08sQFMePDl/dzzey5wtKYfqccPpr
         CgLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDXdwSXm29MT9M4DOebiNIs1oX/2s3rviLImOZm4YycqC3TFs8Kz2sgZw2VUW+oTUWNs57EIJL+ndI4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxchev3IKxYMJcUn+Krmi5bUvxu0DxEf+3LyMd/SzNEMi8iPg8T
	dMRyh356tHzVBm6bggoJfo2pKwQ0dF90XYAfY0Zz2/ZRzBLLomVmOZi0vYFLggXlIPuEgHDozX2
	oRhBQFir51dK8OOeFI/PLGRXAdaSfJEODLC5R7xDp/nSCkbkvb1dRVIPq5gs=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d0c:b0:6aa:1bc8:ae0d with SMTP id
 006d021491bc7-6aeaba25683mr1898200eaf.4.1785974490090; Wed, 05 Aug 2026
 17:01:30 -0700 (PDT)
Date: Wed, 05 Aug 2026 17:01:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73ceda.5aeeccc9.207e63.0007.GAE@google.com>
Subject: [syzbot] [media?] WARNING in __media_pipeline_start
From: syzbot <syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7235a3e71949 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10c0dbb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf4bea59f67007
dashboard link: https://syzkaller.appspot.com/bug?extid=68e901d044baaea1f60c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=163b7649580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13926cc6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fd45635beaae/disk-7235a3e7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d7d2e6507223/vmlinux-7235a3e7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b5b5d8de4cea/Image-7235a3e7.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com

vimc link validate: Sensor A:src:640x480 (0x42474752, 0, 0, 0, 0) Raw Capture 0:snk:640x480 (0x42474752, 8, 0, 0, 0)
vimc link validate: Scaler:src:640x480 (0x33424752, 8, 0, 0, 0) RGB/YUV Capture:snk:640x480 (0x33424752, 8, 0, 0, 0)
------------[ cut here ]------------
WARNING: drivers/media/mc/mc-entity.c:785 at __media_pipeline_start+0x13c4/0x17fc drivers/media/mc/mc-entity.c:785, CPU#0: syz.0.17/4920
Modules linked in:
CPU: 0 UID: 0 PID: 4920 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __media_pipeline_start+0x13c4/0x17fc drivers/media/mc/mc-entity.c:785
lr : __media_pipeline_start+0x13c4/0x17fc drivers/media/mc/mc-entity.c:785
sp : ffff800093407710
x29: ffff800093407790 x28: ffff0000cbe68a20 x27: 1fffe000197cd0e6
x26: ffff0000cbe68760 x25: 1fffe000197cd15b x24: ffff0000cbe68ad8
x23: dfff800000000000 x22: ffff0000cbabf010 x21: 0000000000000001
x20: ffff0000cbe68b10 x19: dfff800000000000 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000020007200
x14: 00000000ffff8000 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000003 x9 : 0000000000000000
x8 : 0000000000000000 x7 : ffff8000839d6934 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff8000839d4f70
x2 : 0000000000000001 x1 : ffff0000c4551d40 x0 : 0000000000000000
Call trace:
 __media_pipeline_start+0x13c4/0x17fc drivers/media/mc/mc-entity.c:785 (P)
 media_pipeline_start+0x58/0x7c drivers/media/mc/mc-entity.c:924
 video_device_pipeline_start+0x88/0xb4 drivers/media/v4l2-core/v4l2-dev.c:1159
 vimc_capture_start_streaming+0x6c/0xec drivers/media/test-drivers/vimc/vimc-capture.c:248
 vb2_start_streaming+0x114/0x4ac drivers/media/common/videobuf2/videobuf2-core.c:1783
 vb2_core_streamon+0x288/0x44c drivers/media/common/videobuf2/videobuf2-core.c:2336
 vb2_streamon+0x80/0xb4 drivers/media/common/videobuf2/videobuf2-v4l2.c:875
 vb2_ioctl_streamon+0xb8/0xd0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1118
 v4l_streamon+0x64/0x94 drivers/media/v4l2-core/v4l2-ioctl.c:1965
 __video_do_ioctl+0x768/0xaa8 drivers/media/v4l2-core/v4l2-ioctl.c:3133
 video_usercopy+0x74c/0xe88 drivers/media/v4l2-core/v4l2-ioctl.c:3475
 video_ioctl2+0x3c/0x50 drivers/media/v4l2-core/v4l2-ioctl.c:3532
 v4l2_ioctl+0x148/0x18c drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __arm64_sys_ioctl+0x154/0x1cc fs/ioctl.c:583
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
irq event stamp: 1910
hardirqs last  enabled at (1909): [<ffff800080b9e27c>] kasan_quarantine_put+0xb4/0x1c4 mm/kasan/quarantine.c:234
hardirqs last disabled at (1910): [<ffff8000868e6198>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:425
softirqs last  enabled at (1722): [<ffff800080139980>] local_bh_enable include/linux/bottom_half.h:33 [inline]
softirqs last  enabled at (1722): [<ffff800080139980>] put_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:251 [inline]
softirqs last  enabled at (1722): [<ffff800080139980>] do_sve_acc+0x32c/0x4b8 arch/arm64/kernel/fpsimd.c:1349
softirqs last disabled at (1720): [<ffff800080139760>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (1720): [<ffff800080139760>] get_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:234 [inline]
softirqs last disabled at (1720): [<ffff800080139760>] do_sve_acc+0x10c/0x4b8 arch/arm64/kernel/fpsimd.c:1325
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
