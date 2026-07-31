Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8D7357D12
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481104; cv=none; b=ITIsqHisEG2eq61FNe7wgOLPoexOfTFbq1yXtJlcGzi5Mlo+8uG/oKyefqutXJd9WagvAXiOCZGfzxPMp7o/ZTVo7492ucXwOI/EY8m+aSAwmpdFwRiJSu4KgaF2steNRl+UBU+05OMKAva4ebqEkrBwD7bIPeH3fncVQCs7aCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481104; c=relaxed/simple;
	bh=0qzl5WqaARYeHzY2pKQPU1b+VL8lo8r/B7vpkeuud8c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=R2Swa4KOR/mK4JKhNE0YcWksYygz3CiMu2Xr9B7qqDxY2vAuHE32wy92819fT3/s3uOEahf0QJ8smINEzW1HJW2cLOSvo5bFIazsM7OshyPUCxMFbJ6BfeFWFWUUUYrZqf2f8yRbSPqdM+/9IMF4B++NhQoDWoNmrFgBRVq/M9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a43d32fa9fso911612b6e.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481102; x=1786085902;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ME6HdcasMeQeNctS5ajmm4mc1j6iuYgqg2fe6HqqnFI=;
        b=LR92YJi3+01sGvVBvXwX3GgVknlske8sOwH4RlJ6wgDYKGRqNk3UxXPeyt+eneTR78
         CwiH/IfM5LvT1AUFg6C8WtxrA31ll54VMXII4DBA0H/mz8Ahr8PTOSH0m6z00esktn42
         XDYGAq6cJ39FmZkiM+YwLRyEB/mltEx8MYykIeb39A0lRR3RDrudqLs7lauw4HS4v+WG
         gfSvd6toVlPju/lgS8Yo69ORS3NrsQ+kM2JO+oQZnjei13artgvwEIG3eF2X+e1ceL/C
         Ky0Kejll0+01UaIsC98pQWLAo+uepWHFptupvBzeJCO7mQJyNmM3pdR/F5ZmPG/TgexP
         KFvg==
X-Forwarded-Encrypted: i=1; AHgh+RrH6ZZ2N8u1Yh69QRzKLhEcNmWx14deNh7m1H9j5xocW/JoO5euWEytb1v7QZdRUjChywHiLhwdGIEhUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9psaysA8/egmPydhqluAVg9nPYHiOFvqba+Ad/KQhKF99KB/
	yqhcjvt0zLid0EHAuKQWg1736TqXtKQ2MKXk/Wa3Lvg8Tqzb6Dy2EwG0FXNWOsIS0q4cCp/SoK8
	BqiFjXPzwom1F75AFy/Ev0e0HZfgrDk156XYuXA+ozCN9GOqEBKwWSYsDeBU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:2c5:20b0:4ae:f5be:fe30 with SMTP id
 5614622812f47-4aef5bf1d23mr263183b6e.18.1785481102215; Thu, 30 Jul 2026
 23:58:22 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:58:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6c478e.b5e7dbf9.21bf3.0008.GAE@google.com>
Subject: [syzbot] [media?] memory leak in vidtv_psi_sdt_service_init
From: syzbot <syzbot+070afba8f438130eca76@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4235cb24ec1e Merge tag 'vfs-7.2-rc5.fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1199e6b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7c2d1679fb08a2
dashboard link: https://syzkaller.appspot.com/bug?extid=070afba8f438130eca76
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1048c49e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1505c6b9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d2b93a579379/disk-4235cb24.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/907f0d615dfc/vmlinux-4235cb24.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f787f85b05b9/bzImage-4235cb24.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+070afba8f438130eca76@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888114fee2c0 (size 32):
  comm "syz.0.17", pid 5955, jiffies 4294942049
  hex dump (first 32 bytes):
    08 80 fd 80 1b c0 ef fe 14 81 88 ff ff 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc a633fa69):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    vidtv_psi_sdt_service_init+0x32/0xa0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1386
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:229 [inline]
    vidtv_channel_si_init+0x22f/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888114feefc0 (size 32):
  comm "syz.0.17", pid 5955, jiffies 4294942049
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 48 19 02 0c 40 42 f8 11  ........H...@B..
    81 88 ff ff 0a 60 42 f8 11 81 88 ff ff 00 00 00  .....`B.........
  backtrace (crc 9f5e821f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    vidtv_psi_service_desc_init+0x74/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:233
    vidtv_psi_desc_clone+0x137/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:451
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:236 [inline]
    vidtv_channel_si_init+0x1d7/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888114feefe0 (size 32):
  comm "syz.0.17", pid 5955, jiffies 4294942049
  hex dump (first 32 bytes):
    00 01 ef 40 06 00 00 23 59 59 80 8d 80 b5 b5 12  ...@...#YY......
    81 88 ff ff 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 8ccd5b03):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    vidtv_psi_eit_event_init+0x6d/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1928
    vidtv_channel_eit_event_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:182 [inline]
    vidtv_channel_si_init+0x31d/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:443
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888111f842a0 (size 16):
  comm "syz.0.17", pid 5955, jiffies 4294942049
  hex dump (first 16 bytes):
    4c 69 6e 75 78 54 56 2e 6f 72 67 00 00 00 00 00  LinuxTV.org.....
  backtrace (crc 2e58d8e5):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_network_name_desc_init+0xbe/0x110 drivers/media/test-drivers/vidtv/vidtv_psi.c:317
    vidtv_psi_nit_table_init+0xa1/0x130 drivers/media/test-drivers/vidtv/vidtv_psi.c:1593
    vidtv_channel_si_init+0x4bf/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:453
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888111f84220 (size 16):
  comm "syz.0.17", pid 5955, jiffies 4294942049
  hex dump (first 16 bytes):
    08 80 02 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc dcfaab59):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    vidtv_psi_service_list_desc_init+0x7b/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:345
    vidtv_psi_nit_table_init+0xd1/0x130 drivers/media/test-drivers/vidtv/vidtv_psi.c:1601
    vidtv_channel_si_init+0x4bf/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:453
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
