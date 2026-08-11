Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB03624AE
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 06:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431555; cv=pass; b=aQC3N/B8pH7xCZbAVleISHjRfTbDpqwiDmMHQ+mUy/N0Auko2h2WCLM9VMY74aHhjACgtTf2aaaio2J10euem2d/RPzwKMgxz1I2saqhPmD/o3SqiSyNDawZAglsYjlQ9PjjkxXyRRVbmCWtHm44hKLFImasBH3gRLYwufXtm48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431555; c=relaxed/simple;
	bh=ciFt64ZLP26jQ5r884RDJujyPgUyxeHcg7pRQmL9MvM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GacxT1jJsadt8+7++WEqvztd1EdxeT6tlUBF4z91JjkVBJD8Qz+9hjH/ocbBjWWrbwV95pg50KPqT3azIcazvTqZ5VZIIk6KvwljxVWfrR4kdHQKbFkoNExwKADH9zGALFVMSsoTnv1AsQ7LiYqrmRORgIarkbJatnm2F3ZV0Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1nGno2l; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1nGno2l"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e5b048375so111505385a.1
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 23:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786431553; cv=none;
        d=google.com; s=arc-20260327;
        b=qYoCiIW9mV2vinHpvaLxqDROPsoSVSIr2yftYK9JmcMDeSy2S+ZgACf4lp3uc88rNQ
         bwKUqwHlkB9OeYU+K1r2t1TiPD2OMFE7cDqgPfosZNoR2vmQ+g7VZ+n9Shbr6Z+vdqR1
         HFIHAiqrSSnUv1UdlKRb+op5dzb/Tyi7locDD3eqRFQPa9cKW8MJSYatwxw7lvRLryjY
         VThKEMS2pWy0lKu7ebKk8pxqwiV4j++TqE/RFyDsUztqwndiTuGNbNKbXmIhNSjXbNyA
         II49av1ZhK9rzVKyODnQFL2ZLINvLtAXNSSP60JthCy63drk4szbVyuFiOuBMXzOfPf5
         Ri9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ciFt64ZLP26jQ5r884RDJujyPgUyxeHcg7pRQmL9MvM=;
        fh=0VngeLo2dspWVYiEdrGYoVakOXHH9c8U18YNgr62Fkk=;
        b=pkub2X6iq7MgX1+PEojXvH81oYt7xSpSPvDSegMDJntmONkSaNGsXzxXlv6K0/YhLb
         SMjJntFmzfaE/RzYpyfQhz4Xga/EmmnFqYZdF6V3AzPBvcYzAs4wsIPvv3lLOF5IpBVW
         /AgaJdYI63ecu4g8+/k8LCG1zkItlznHyKqnNr9raAaWfd5XCVFkqGReVd1krxPQyVaV
         210F/FtmeCl+2WlJAGVej45Isi9CNiBDbM+T2T8TOD9QYMNxidOWZOsqK6AZAARZooOi
         bowq8HyHP0EPySQBgiAnmVjM08vJI1nhX/tOjvyGBnC19zhhmaxIZ/6sfEx3TdjAlwQX
         DOKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786431553; x=1787036353; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ciFt64ZLP26jQ5r884RDJujyPgUyxeHcg7pRQmL9MvM=;
        b=d1nGno2lWHmd/HUYYX7FmhqbC3kxnZmDp2dxTDttJ07XP/vtPQ15tndk94JSrgwA1L
         eGTDfN8jnibpWw9isOXrVVcyOffDo363Ec+wvfAN5D/1pJobjTT+54Jie6UAxJiXjTpu
         Q+P1BhKXekq5KmLnEZIUbDjcMYWTeQIw0hTCOArA2Pdyj+3C4qSxB7Um3dWTWA8FluUB
         0dZFLdsEvt7GOnJoPechhZ6SAMwHMI7GAeAfeT06z4kZwhv8GBKHy0oW2ICfIwzCmldP
         vnALPyQtcNZaOo0XxpQYLaWPJn+i7bOkoiyhMU3+wjZfnkDqD3U3qbw7gYZ0SdjMcXRW
         E+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431553; x=1787036353;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ciFt64ZLP26jQ5r884RDJujyPgUyxeHcg7pRQmL9MvM=;
        b=PjpPinoc270KT+rI4zCmh9k0RA8guylAd3itLRibEB1PPVLgbEQfgODWBger0h4GpY
         d2nfilatbhG7bdtUpXI0ivGqzJCwF+8fcyOgvYC/XvmDAk1LX/X5JmxGAII/3AGdJP0B
         hJ6xRj8bAX4WrPqlk91OJ2lQRIyCkxhs0n8AieigaGQUc+vAAueIi9vsIdLY5rHUvGoj
         DMl5DAoJCJqKfeFyF1UJyxbL5pgydf0Veoo78nEue+iOJ8fLZuKvF7k0Cp94ItRJ67wT
         Rczyfv2oczD+tqRpkJl82kXLKYKy/MShD/X1cRrFaaW18TZx9McChi7h2tk52nFQhSe1
         0pFw==
X-Forwarded-Encrypted: i=1; AHgh+RrCv438pv7UlTt6PMT+TP/tD65dXqH4ait3XXqiRqEuAt3GBOysPCeMe9r4/kNTdHjI+oSGoz4Cbc0O4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBFhOZ45Wm/J2mH80DAmJwMyYqI8I3ybH1Iy0txXEWmNJZqY+
	cublFUhJq7uLEnbrzXythLtdSP7F2c8pNacRRs+mVs0NR1JVsHYQdkvLTi4QQMFemO9EC79l0kT
	+oKfrOP5E8AvwGA2q3mSy1p9YjndtKNQ=
X-Gm-Gg: AR+sD13aMCqtyY5i8/XlfRczaPeYgZHWhzEvxy8KOcKc5ZCI5MRcrjPHRdCMn4yaLvG
	Q8Bhmxg0Tlkbwk8WpnxqHRofDdtC/3NpF7Ba6abtibXJ7gcS602IwpciyViBtGJz6WfBW5MFsI0
	xjHhV4w8VB46FjZbb7qORQdJp1bgT6pq/TrqJgaLx++KoDmNUJmxr7aVW6TQB6Wix8gLXYEjaPe
	zO58Fbd0mDINTxoeS654sYD0hoUOW5PbDyH9lKNytHKwdiiGBk5cYB8Ko1EUeVtruoMjkUQMZDj
	IaCwwhSbPkEeMnhqXuqyc5EE5fOtRBSdZbvcxm0KlFcPBj2ymOXuzl0kBO8c+gXqsaaQFOVNtoP
	FpXlyXkNhohh0Z4exAa84t6vs+Yk=
X-Received: by 2002:a05:620a:2614:b0:92e:4859:49dd with SMTP id
 af79cd13be357-936a8f3b0ccmr82319285a.26.1786431552909; Mon, 10 Aug 2026
 23:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Tue, 11 Aug 2026 14:59:02 +0800
X-Gm-Features: AUfX_my-_OXSao8aFra3Y6IJ0cfkWyWMJxlk_k3w6J-GO2JqU5pxCi6jd45ulFA
Message-ID: <CAA2SOT7QrPGUc9HDnEdSSMFgVYAXyycSGdPUt+DZtTmKPEr8Mg@mail.gmail.com>
Subject: [BUG] media: em28xx: slab-use-after-free in v4l2_open after failed
 device initialization
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a KASAN slab-use-after-free triggered by a syzkaller
reproducer on Linux 7.2-rc3.

The crash happens when userspace opens a V4L2 device node after an em28xx
USB device initialization failure. The reproducer creates a malformed USB
device that is handled by the em28xx driver. During initialization, the
driver fails to create the media graph and deregisters the V4L2 video
device. Shortly after that, the userspace v4l_id helper opens the video
device node, and v4l2_open() accesses an object that has already been freed
by em28xx_v4l2_init().

This looks like a lifetime / error-path race in the em28xx V4L2
initialization and cleanup path. A video device appears to remain openable
from userspace while the corresponding em28xx V4L2 state has already been
freed after initialization failure.

Reproducer:
syz reproducer: https://pastebin.com/raw/g5jt5J3i
console output: https://pastebin.com/raw/iHCH4sqb
kernel config: https://pastebin.com/raw/Vb7Nyby9

Kernel:
HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Crash log:

[ 132.164220][T10253] usb 4-1: Decoder not found
[ 132.165038][T10253] em28xx 4-1:0.132: failed to create media graph
[ 132.166092][T10253] em28xx 4-1:0.132: V4L2 device video103 deregistered
[ 132.182588][ T24] em28xx 1-1:0.132: Freeing device
[ 132.257480][T10224] em28xx 2-1:0.132: Registering V4L2 extension
[ 132.332783][T10224] em28xx 2-1:0.132: failed to create media graph
[ 132.341200][T10224] em28xx 2-1:0.132: V4L2 device video103 deregistered
[ 132.351592][T15221] BUG: KASAN: slab-use-after-free in v4l2_open+0x462/0x530
[ 132.354158][T15221] Read of size 4 at addr ffff888012fd0860 by task
v4l_id/15221

Call Trace:
<TASK>
dump_stack_lvl+0x116/0x1b0
print_report+0xfb/0x5c0
kasan_report+0x96/0xd0
v4l2_open+0x462/0x530
chrdev_open+0x1f0/0x590
do_dentry_open+0x6f0/0x14e0
vfs_open+0x82/0x3f0
path_openat+0x29a2/0x3e20
do_file_open+0x216/0x310
do_sys_openat2+0x54f/0x7b0
do_sys_open+0xc6/0x150
__x64_sys_openat+0x9d/0x110
do_syscall_64+0xc4/0x7a0
entry_SYSCALL_64_after_hwframe+0x76/0x7e
</TASK>

Allocated by task 10224:
__kasan_kmalloc+0xaa/0xb0
__kmalloc_cache_noprof+0x2dc/0x780
em28xx_v4l2_init+0x12d/0x41e0
em28xx_init_extension+0x139/0x200
request_module_async+0x61/0x70
process_scheduled_works+0x5ed/0x1c90
worker_thread+0x5be/0xd20
kthread+0x404/0x530
ret_from_fork+0x7c5/0xde0
ret_from_fork_asm+0x1a/0x30

Freed by task 10224:
__kasan_slab_free+0x61/0x80
kfree+0x2ac/0x6d0
em28xx_v4l2_init+0xd2d/0x41e0
em28xx_init_extension+0x139/0x200
request_module_async+0x61/0x70
process_scheduled_works+0x5ed/0x1c90
worker_thread+0x5be/0xd20
kthread+0x404/0x530
ret_from_fork+0x7c5/0xde0
ret_from_fork_asm+0x1a/0x30

The buggy address belongs to a freed kmalloc-8k object:
ffff888012fd0000-ffff888012fd2000


Best Regards
