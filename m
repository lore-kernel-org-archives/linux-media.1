Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289849;
	b=TrdeEMh174sAoIkUSvJOxe8qxXCOH6eOLyyPGok0z3za2ZBvKg55KZL082h+T76MYker
	 nwoVdkxmeHTQKtIGNtkhZNv16EBUFU13veFiayigpmjsQz3W9WDnOpEumjP38dEGkxhC8
	 nVU1YqIDn4kYZZ5HOBkwjR5orT475wFGamJwEGKxnef+V9rwr5GBu0nc5+PD65RNxpZNz
	 6GcHnAdPV/X53Wh2pShrDEjo+8V/fwd6eES4osBuqOr0hHqYfhANqbTE0IfrHWzB9Ujn5
	 fmIsPDTT5XMxBJeWKdYrXrRAuoWK1knlLRs1ENtpqbJ4/u4Njjhq5/tNDy7DpTr5piQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289849;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=BT20worzG0ZlnN862p660bfUbOpsK47mpVvJf+3XDvo=;
	b=U3dTqJf9RVclLdw6hPwy7a+6QBzKcrvz/dMZVMxmDzkxtyP59kgZe/PRAAbr8jTJ/CLd
	 vdAtp4LeQhnxu4P7eOTBrIS+5rOmmkp4JKpKR93i1E/wkeR4/JWGGRjHHRYm7FXaw7wub
	 8IaM9MdeJrqDD35jBPd2Rh/r290209PVOcKYDyoGm4/KNIVd3fjWkMeBZTDfj5HD0WqbU
	 zMBCkdydNftbfVNCU2g2hfqDOT4NHJ6wfaJigjSGAnSzX6pWsk4+79EhTORNR6ZMOSDa7
	 3SCQbx8foqx8mOB4EFrMz7B7PqhMxFnIitZPG0biwQejBh9ZODTZjOnLTrdkO0C0PFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5D606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 05:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED5D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5641cd2cc13so1941775b6e.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 21:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289848; x=1794894648;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BT20worzG0ZlnN862p660bfUbOpsK47mpVvJf+3XDvo=;
        b=DlRlyQwANL9HG2bh75OOWibWfTS/NVDXO22+V2Jdm0eby3WG7b/oGZPFWLYHgNA0f8
         M8dCDe43QeO8lpk4QYMOOh0p7jmy3uPUX2M4E5KdGqV1bR7m0PhmGMXtjIyf/klCQ8W/
         fcymxFuZKDviNwqQIEhYESMakRYqAG0m1CiY9KaILjkpyVo+8zCG/yQIE8A+3zHwM6AV
         lpG92vVE+anHNITkXYyr6HvrksxiJwofuLATJ+CJKIo3a2WpNnv2g9BtctBm3OocDGp9
         eHxVjCqiEiKdo3MiC2GMHBc3yvrfFamQuqaCqGmtpYTm8Z7fGEdg/U16HqP4Ln3eGO3h
         PqeQ==
X-Forwarded-Encrypted: i=1; AL+hErHg9D6jsC4yllAIDZ6ChtdYq7D5FBRlFyADHp68VeHhvzWxRNUq4ybazSpSnLhmp5YMQsHSJRYlsFwd+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/r6DKpHOuL/dejydNrOEFmnKBHQlUD2I0RwVLhLG1gZ1Y3tFQI
	ewgqawaFXTSYKBEQcQCmt4EWIXA6BxOm2jvkO60jbjcxYOs3B3tewtEB2fRE7HsZcF5QKOE9JI+
	Hhm7vVpru8gpPHRDgKVfdvCSxz9Qg3h9duSghOx1yAKzpHMqRoDDUEQvsM3s=
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c40a:b0:4f7:27ba:9db4 with SMTP id
 5614622812f47-5683cdd6dc7mr1212802b6e.60.1794289847956; Mon, 09 Nov 2026
 21:50:47 -0800 (PST)
Date: Mon, 09 Nov 2026 21:50:47 -0800
In-Reply-To: <6ac94026.70ed5d86.2ac85.0077.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af2b0b7.4dd4714a.f8d02.0021.GAE@google.com>
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_pmt_create_sec_for_each_pat_entry
From: syzbot <syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, matheus.aalmeida@inf.ufrgs.br, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    b3dfbde62cf1 Merge tag 'linux_kselftest-fixes-7.4-rc3' of ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13cfd83d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=3bb39e30be6cca84a865
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16436f35580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3bb39e30be6cca84a865@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881112c8690 (size 8):
  comm "syz.6.49", pid 6988, jiffies 4294945880
  hex dump (first 8 bytes):
    00 00 00 00 00 00 00 00                          ........
  backtrace (crc 0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4733 [inline]
    slab_alloc_node mm/slub.c:5033 [inline]
    __do_kmalloc_node mm/slub.c:5530 [inline]
    __kmalloc_noprof+0x3ce/0x510 mm/slub.c:5556
    _kmalloc_noprof include/linux/slab.h:995 [inline]
    _kzalloc_noprof include/linux/slab.h:1312 [inline]
    vidtv_psi_pmt_create_sec_for_each_pat_entry+0x7d/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1471
    vidtv_channel_si_init+0x544/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:478
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:198 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:243
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1072
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x540 arch/x86/entry/syscall_64.c:89
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
