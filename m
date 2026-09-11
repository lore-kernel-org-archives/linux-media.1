Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49E3A1690
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140562; cv=pass; b=qr8v6EZwrJbwhrkKYzuJPWIreSgkcASyapIk+VThSwuvR/+YyFkw2YTz795btxPakxI9L31nt4m3MCy3kNEV1RW1GUGkNTJL7Glk0kOeHUhGQTLkEwPesdJUxRXh8eq6V+2uvgb4oqMxTqNh6wsFCWTWJBwwQuE+/YgaH3cvTnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140562; c=relaxed/simple;
	bh=Yo3LsyXbzrzgpLC9p8ROobtWdv3jPatzXfcyrvuoA20=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fZxqKA1Tev9E8UCEYpwuUyJNm+D7Ucdf6HdVnTZanoIEn3t35fDucQtdV+W2N/DToyYzlH+N73H82aj63fYrfhDPksLGgk1MQOup6ZsR48S/HLnp/KGmWf33kAFTlXHPYFINqeHJw5JBhnDp6Lc14CLvFrJ+iugJnEj1d7dLPCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=T7JC2J/f; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="T7JC2J/f"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1258042a12.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 08:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140559; cv=none;
        d=google.com; s=arc-20260327;
        b=QYwEIcYlaBuUU3YnRapLToUxPA6nT9eDKE5/Km6tFP+nuyXUBZV0zGozBBTjVOngud
         bcNC37jEV8A7m/WlduV/1Bj+xlseyTwlthqV4f1dzCUNxqtnAd4JXT8rDAWPwxsva7Vu
         RdHE3KLyvdCVWsXVr2AOkRpWOE2fvzXgPzgcwHQvxPo8VRUWd8pZtGhbRE6GVFxkCPOm
         1Ju4Str9PjXHRm1dj79UsKv7vSYXM4ZOOmqqY1B/Prvd3gFtH/KJvb4DlgLjFc8F5opP
         gb+NNbFKaoK0vZaSTszvMRDUByEGFaiy83Ra48hn5WKTrxXMekOPkHJuRK7NN13vHREa
         bLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fJ9+ANnjRTIx2CV3p9MLBFo0sbeZK4PLECWYEuqNeIQ=;
        fh=fgTisXD8ZJB0x27jYEnSrzbn0V6/lVeEHePGZ9MiPkY=;
        b=HdirUoefCoxlJPgQH4obYq0nEnWl1cb8ZcfxHfNU1GradkFfBuHIVJ4Ih/PbTrNl9Z
         Z7GbOwqZuOY5YkLQR6jtY0MmSzrgfY/uEGeXxNRcYKudS+3tgTGahiYFqYn3xrP26EWH
         tDObeRyL8yEJFOiQMJG9E3ZpZBsaLgoWmkyHeMuzdeUTdloxjMG5geWIIJu2KEVwY9uD
         hSvqOPCWY1rVShW5gc6c4alLNCpzfdWq6LPUHq0ow/2QluWX40yu6gtPvP1avpcCh6IJ
         VjPSPgPm0c3DHfoZQylTa5CA23XmeH+jmXwWf3cqrveG8wOWJuRC4wnaXvxTvMe/ErQK
         S1Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789140559; x=1789745359; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ9+ANnjRTIx2CV3p9MLBFo0sbeZK4PLECWYEuqNeIQ=;
        b=T7JC2J/f9PbO3Tw8WBbOE53vmtF8t6RAWBdnmS6A7LTKE0T3ZgM9/GwI/vP7wNH0lX
         XP4ky+vk9X3wgDvelz/8YXAdsBidjoZMutAJR3/JJAnGrQfh6COx/PRUpdSyORYpzc/+
         ZUOe3sjCJy9oxss2lCv7iteqNZOJQiu8Kr4rn9WiU5es4R47pdHcda0VJ1efaJAPdG0V
         1TBMGw0RrXG+MquYa+woju06T9rkEI2W3cYbPwfg0OZj1gfUuH3aY5gYbKY70/83JEkc
         dR5y8kd3iYX6aJOs1YBkTV84VqnmlGT/SUVSOnoMuyaCRzZOv0Ym164XKu2c2DIbyH1w
         dqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140559; x=1789745359;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fJ9+ANnjRTIx2CV3p9MLBFo0sbeZK4PLECWYEuqNeIQ=;
        b=SlcEvPc1gavSjgrAU0UY83pAA7q8uM4AIeYj+xxURqjTZhcBoxg2RSubBNYiqgI5QR
         2KZNehmUDKhFnrgLXNs8bhg812vhQspYYJ1vaePexkb1v1Ttkf3akTOis5f7hEciMzDa
         w5xJn2R65Ab2oGOS7Gf2frK3/+nlmkMUqCAEUKyMfXOwaBgTHB0wLtLSVXbxG/s8zHPn
         DxMJt5z2p9l8WrrK/IKjTglwzpRB3b/WceeZZ67giwhHHrmjUlfA8lbzto6HyKswPX7j
         Og2aI3y0S4TtBDrjolUL6QO62sNLqCKAyI2AHrO4Lf+mfm+15551re5PfoH0VVg92wU8
         AYrQ==
X-Gm-Message-State: AFuF++lxdsgulYipPye3kzbVqe0WEoj145bUNiMYphiLAODKkdOgV5Ty
	0P68jvp38dIUZmBvZWZlP+kxcDQer9c2BlRptVv2B1+VrN4VmDD0s3S8BPYcI1LG/mIkmnjcLHv
	WmJ0ovYEnOvcprKBr0/QwGXIkWUUJXmNsiCU9i6J1
X-Gm-Gg: AYBFou19nEU/cmiByTz3jNCcw65HPzbs8xPAhRElkNY6KC6DqvHa8REvOGJ+SMUjEDg
	f6ydpJEMgE2epTH5RLSTIOhWlBp+pmaGP0OQ8/Ps52FKsPemtCmAiSIB5CNKrGooJAxZVXGL2xJ
	fO7OLS8x+mP8VAg26+xQYmbGh1ipMgt5gh54DijWMJ5HHBIQ36rp01+XzlfKSBrT2+agzTLHwpQ
	EYM43Cm8GJq3XAcdBXG7FC/RbNMf2nuy7fncYQI5kDZq2TdRoHCTdaIoioLEtW/PimwtgiWkiCl
	SKRyELBNg94sX0q0lczeJNdXwaJzh08UYq8N/2Bf40JVZ0wo+RTM8wSjpuVQ0mUDdd81bkeD9Cc
	dlgf54GgGY072EC//acPMmAx8xSLXSrJbF6sSCvFwh8Q0S3Wcaed/+pclFTDmBL08J46X56IAqN
	g=
X-Received: by 2002:a05:6a20:6f8f:b0:3d3:aed2:6f22 with SMTP id
 adf61e73a8af0-3dad28fb2b4mr13269108637.22.1789140558334; Fri, 11 Sep 2026
 08:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:29:07 -0700
X-Gm-Features: AcwNN1WRrLsSh215-lD0dJBCk1aIvNTlPiN8shrxRDmqsDZx-teefWbnoHSkEZw
Message-ID: <CA+0ovCg9xV6rwkFf3vj0bCCZkqhcbvPJQZHmZOR1JXzj1jVeow@mail.gmail.com>
Subject: [BUG] general protection fault in stk1160_write_reg
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Reporting the following crash:
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   44.431638][   T10] usb 3-1: New USB device found, idVendor=05e1,
idProduct=0408, bcdDevice= 1.00
[   44.434878][   T10] usb 3-1: New USB device strings: Mfr=0,
Product=0, SerialNumber=0
[   44.459246][   T10] usb 3-1: New device   @ 480 Mbps (05e1:0408,
interface 0, class 0)
[   44.459259][   T10] usb 3-1: video interface 0 found
[   44.618625][   T10] stk1160 3-1:1.0: V4L2 device registered as video103
[   45.168629][ T9487] stk1160: write failed on reg 0x203 (-71)
[   45.182926][ T7049] usb 3-1: USB disconnect, device number 2
[   45.191412][ T9487] stk1160: write failed on reg 0x203 (-19)
[   45.212129][ T9487] Oops: general protection fault, probably for
non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
[   45.213308][ T9487] KASAN: null-ptr-deref in range
[0x0000000000000000-0x0000000000000007]
[   45.214088][ T9487] CPU: 0 UID: 0 PID: 9487 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   45.215044][ T9487] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   45.216017][ T9487] RIP: 0010:stk1160_write_reg+0x47/0xe0
[   45.216544][ T9487] Code: 10 75 f9 49 81 c6 98 08 00 00 4c 89 f0 48
c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 c3 09 e5 f9 49 8b 3e 48 89
f8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 75 71 8b 37 c1 e6 08 81 ce 00 00
00 80 44 0f
[   45.218286][ T9487] RSP: 0018:ffffc90020a6f898 EFLAGS: 00010246
[   45.218863][ T9487] RAX: 0000000000000000 RBX: 0000000000000203
RCX: ffff888110320000
[   45.219584][ T9487] RDX: 0000000000000000 RSI: 0000000000000203
RDI: 0000000000000000
[   45.220372][ T9487] RBP: 000000000000004a R08: ffff88803091d3c7
R09: 1ffff11006123a78
[   45.221098][ T9487] R10: dffffc0000000000 R11: ffffffff88530370
R12: 000000000000004a
[   45.221821][ T9487] R13: ffff88803091c000 R14: ffff88803091c898
R15: dffffc0000000000
[   45.222557][ T9487] FS:  000000003bfcb400(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   45.223406][ T9487] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   45.224035][ T9487] CR2: 0000559fc2d50980 CR3: 0000000025d4b000
CR4: 0000000000752ef0
[   45.224824][ T9487] PKRU: 55555554
[   45.225216][ T9487] Call Trace:
[   45.225573][ T9487]  <TASK>
[   45.225896][ T9487]  stk1160_i2c_xfer+0x446/0xe40
[   45.226438][ T9487]  ? stack_depot_save_flags+0x33/0x7f0
[   45.227016][ T9487]  ? __pfx_stk1160_i2c_xfer+0x10/0x10
[   45.227595][ T9487]  ? kasan_save_track+0x4f/0x80
[   45.228103][ T9487]  ? kasan_save_track+0x3e/0x80
[   45.228573][ T9487]  ? kasan_save_free_info+0x46/0x50
[   45.229055][ T9487]  ? __kasan_slab_free+0x5c/0x80
[   45.229511][ T9487]  ? kfree+0x1c5/0x650
[   45.229958][ T9487]  ? tomoyo_path_number_perm+0x501/0x630
[   45.230475][ T9487]  ? security_file_ioctl+0xc3/0x2a0
[   45.230962][ T9487]  ? do_syscall_64+0x155/0x510
[   45.231408][ T9487]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.231967][ T9487]  __i2c_transfer+0x7a3/0x1f80
[   45.232427][ T9487]  ? __lock_acquire+0x74c/0x2db0
[   45.232894][ T9487]  __i2c_smbus_xfer+0x105c/0x1f70
[   45.233362][ T9487]  ? __pfx___i2c_smbus_xfer+0x10/0x10
[   45.233863][ T9487]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   45.234401][ T9487]  ? rt_mutex_lock_nested+0x15c/0x1d0
[   45.234899][ T9487]  i2c_smbus_xfer+0x1f5/0x310
[   45.235336][ T9487]  i2cdev_ioctl_smbus+0x434/0x730
[   45.235816][ T9487]  ? __pfx_i2cdev_ioctl_smbus+0x10/0x10
[   45.236329][ T9487]  i2cdev_ioctl+0x615/0x880
[   45.236755][ T9487]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   45.237225][ T9487]  ? rcu_is_watching+0x16/0xb0
[   45.237678][ T9487]  ? bpf_lsm_file_ioctl+0x9/0x20
[   45.238138][ T9487]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   45.238605][ T9487]  __se_sys_ioctl+0xfc/0x170
[   45.239037][ T9487]  do_syscall_64+0x155/0x510
[   45.239469][ T9487]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.240092][ T9487]  ? clear_bhb_loop+0x30/0x80
[   45.240529][ T9487]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.241076][ T9487] RIP: 0033:0x41f86d
[   45.241446][ T9487] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   45.243267][ T9487] RSP: 002b:00007ffe8df119c0 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   45.244048][ T9487] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000041f86d
[   45.244767][ T9487] RDX: 00007ffe8df11a40 RSI: 0000000000000720
RDI: 0000000000000005
[   45.245485][ T9487] RBP: 00007ffe8df11a10 R08: 0000000000000000
R09: 0000000000000000
[   45.246206][ T9487] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffe8df11e48
[   45.246927][ T9487] R13: 00007ffe8df11e58 R14: 0000000000000002
R15: 00000000004caa00
[   45.247657][ T9487]  </TASK>
[   45.247947][ T9487] Modules linked in:
[   45.248442][ T9487] ---[ end trace 0000000000000000 ]---
[   45.249950][ T9487] RIP: 0010:stk1160_write_reg+0x47/0xe0
[   45.249965][ T9487] Code: 10 75 f9 49 81 c6 98 08 00 00 4c 89 f0 48
c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 c3 09 e5 f9 49 8b 3e 48 89
f8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 75 71 8b 37 c1 e6 08 81 ce 00 00
00 80 44 0f
[   45.249971][ T9487] RSP: 0018:ffffc90020a6f898 EFLAGS: 00010246
[   45.249978][ T9487] RAX: 0000000000000000 RBX: 0000000000000203
RCX: ffff888110320000
[   45.249983][ T9487] RDX: 0000000000000000 RSI: 0000000000000203
RDI: 0000000000000000
[   45.249987][ T9487] RBP: 000000000000004a R08: ffff88803091d3c7
R09: 1ffff11006123a78
[   45.249992][ T9487] R10: dffffc0000000000 R11: ffffffff88530370
R12: 000000000000004a
[   45.249996][ T9487] R13: ffff88803091c000 R14: ffff88803091c898
R15: dffffc0000000000
[   45.250001][ T9487] FS:  000000003bfcb400(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   45.250007][ T9487] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   45.250011][ T9487] CR2: 0000559fc2cf9198 CR3: 0000000025d4b000
CR4: 0000000000752ef0
[   45.250018][ T9487] PKRU: 55555554
[   45.250024][ T9487] Kernel panic - not syncing: Fatal exception
[   45.259703][ T9487] Kernel Offset: disabled
[   45.260313][ T9487] Rebooting in 86400 seconds..

Regards,
