Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D239E3FCB11
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431095; cv=pass; b=nlUASqksTyNdUc82H6rDCiirC7add0AF9LxST1t2EmWtBYRu0Tyj93uBTzkdqpgPC+6wNrRscdxjbhQdMdyZ10N4LIGs2RN4kfKpuwBr/Yjhi3mHp/azFHOn35Hr07gON8T+elFAI9ZdewFcx90aoAiUpHdMhBiqhVKrMV80YWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431095; c=relaxed/simple;
	bh=yAOwsf38e7fRvfMY0e+8WfJYuj/4hPSpNt2iSBZZVzc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=a4HmbyyQfZl6/NlgmkKsV3c53yR2tIs84SKeBBuFq+C7W4NXXblQkYfhissw4mXwNWQ6uQmUKB6NPrB3/uED6r74GMRns1R7wyqM3hr5C0rzab4PrKuB0Vb0whO1KdBvsFnz0Ngi1sjRcYAxETwogEt3wZiiRCQcoif/ePGgIeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiGIEd9O; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiGIEd9O"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51bfad59921so15940391cf.0
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 23:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786431093; cv=none;
        d=google.com; s=arc-20260327;
        b=rOX+WU45r7SJTVBh4x9c7YOlJ0DY7+bec3JBRo0vQXv/Un/Q9boS6s9diYIfTCTftx
         arKj3Fjx5EeHS3U+V2AEX/iczURhiTeriFPtJzL0OD4GLyGm1gxDl6EzX7jVdI4P+7KE
         CyOLrirvBC2xLmG9BD4WqKMWN/S5/Th+fzG09lnviqTNkLkywCqsK/0N9zoIXdGc3YjS
         9ojE1V9i0pNvF7EqfYqpW7kUJLw8Y87nGQrWxZAWz0GzPuRBgfNBs2PAAQ3YFOwjH8B0
         FFgDRzFjmAzbDZVJX0cNdIlKarFPGLFSrY6boZRHTnW6C4uUstGCpSR35In5JvtEh3oI
         SxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yAOwsf38e7fRvfMY0e+8WfJYuj/4hPSpNt2iSBZZVzc=;
        fh=zT2uhuKDHUar/JdGiQTXt2Hfk86NMGw771YMhOK/AYU=;
        b=pXpFgzU7pqk5+dC+ZMu8MLcHa8SkqXEHwXWVxf4J/+xOEbFiWqWhWacrbfCQkFusrk
         4YIw76Qag5pBU0z7AIxWKaUTOjqHmeGpTQcm/ARXI6A56FcEyhNc037QygcXs14p2Vxo
         rVCD3MmH8EM/vRAdFIsMlLd5AXbP5ps/sBmw8m2WYJTIdwF0vYv/03u+kr5p41irdguo
         BAOQJI/lGRsGuEGQDvQXB8VBWZ7qAE8MNlIHxdg96d0CsEKHUBRyVTSxFj07ENaBSo8r
         c3jUHGz9lPpUaVeonPJ9NduTu4sEwQ7SG0Wa/+QJooSqsHE7tj4VtdNcvlk9MxLeChe7
         F2TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786431093; x=1787035893; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yAOwsf38e7fRvfMY0e+8WfJYuj/4hPSpNt2iSBZZVzc=;
        b=DiGIEd9O9DqEK/EhHhcyr/JpB0q8mGtxS7MyG9MFrCFjlSt3XRUsRkf/iL62MXhM0m
         8DRN1diLfASoK65V7GwFxAOXKLlbIL2NnSjIkMzs0VjyyvArz/hEDXX0Ia05to5GO6Tl
         F6HFpjh4ZPi4jgWsbkGXm+gmGHi9Zai/4Bp0JOjNqJoij/6By7yWfh5MqMYQjboDOILh
         IIanNOJXuYOFL0DUk5+YO4hv/1mNJ1Ush+JbIH4X2HwYKTeQXwZV9crMUWxKe9DiV2p0
         s3bbnZvuUSkOro1e/emNHApiD3skUDP2BZYlEoBmNEiJNysLLQMX1QbbqnotyQZqrf4g
         bxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431093; x=1787035893;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yAOwsf38e7fRvfMY0e+8WfJYuj/4hPSpNt2iSBZZVzc=;
        b=G2AwHHtDaJ5eL0QpahLEIt9R4+LaCD306nUOmMl0BtBK/NC0FnY5fJ8C0KeW0hWg4W
         cFaeu7cgm4KqW+Qbpd0KtO8uXH1w7IbCd86X8qt1/Ip/2ypxPeZadGBOgEoRb5oFEndT
         71Edji1+15Wq321/uzfgUXuYCBak1+p0Te5u7UgfHPaU2y6Vomou9NNJmozwP+sRypBf
         i+h97v1EXOxSvtqKK/n5aMzv0qugeiNuvCxRuGDOD7B+ikZxfmcFpV7+DgH14KBaybvW
         aOX1nyO9LyTj5Hms+UoUnQHRjOmFbq6Bxr/mn0vwQTJPJZxADewbWijCpmf6QibiE7EF
         +Gkw==
X-Gm-Message-State: AOJu0YwADf3l5efrF5nMrlPYpV6ZdPpibNJ+AEyfT3Cvk3lN3lHIY0FZ
	CybLYCdB3HaepWC72XL48kzEfB+AenbcUWPNwZWq8be1v6NaV6xQn50eVNKFGdvLagny0valO3M
	6gbKN6ahcmFxJEPsdCJ60YrePoHg+TLlsEG8ycSY=
X-Gm-Gg: AR+sD11H2ji9QMZmlMaGrA0MluHESBkR/34qnkVqCo1HDWqoPKaLrDL3uOU5D9+4i8Q
	w8aMU0umBwzYYkcaPD4oASGHvuavS7UUrh6VKUwaa+M+/kKjGF0ZmAZWB/soyr6BaEkXwrNSvPO
	FH1MeOq74q+KNnB8jp3N/qpPonNgMTn0FlSfIOcZovQ/tbhkJjpECDl/tSix7jLIeEirH6B1kOR
	Wo4ou9shVHbGcE6vuKpA+ZRKIlXh3+CfF49OqX0+T4CzdP5sezjwO12cn6sBpckizMj96iwnAcJ
	0M5Kn8F5DBuuFdrv9s8SfY+KzKBJWs5cM0PAR974P2hQx990au6Qr9Q/34l9Bp7fK52gfA3pz8M
	f6qeynghbb/0vKVDKg7eUrbTOs8U=
X-Received: by 2002:ac8:5a12:0:b0:51a:89c1:1eef with SMTP id
 d75a77b69052e-52d58548458mr9710701cf.14.1786431092522; Mon, 10 Aug 2026
 23:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Tue, 11 Aug 2026 14:51:20 +0800
X-Gm-Features: AUfX_myE-yibDJ_OF22vt8eshaQed-dewUCw0qM2oqEOmyzTX7rR1dO4_2ariCc
Message-ID: <CAA2SOT7Hkr8hKnwWwbFpy3DTMXUV6R1aJp94YGf+PwcpdjxJpQ@mail.gmail.com>
Subject: [BUG] media: mxl111sf: general protection fault in
 dvb_usbv2_generic_write via I2C_RDWR
To: Michael Krufky <mkrufky@linuxtv.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a general protection fault triggered by a syzkaller
reproducer on Linux 7.2-rc3.

The crash happens in the DVB-USB-V2 MXL111SF driver path. The reproducer
creates a dummy USB device that is recognized as a Hauppauge 126xxx ATSC+
device, opens the corresponding I2C device, and issues an I2C_RDWR ioctl.
The ioctl reaches mxl111sf_i2c_xfer(), then mxl111sf_ctrl_msg(), and finally
dvb_usbv2_generic_write(), where the kernel crashes while trying to lock a
mutex.

This looks like a race / lifetime issue during DVB-USB-V2 device
initialization or failed probe handling. The I2C adapter appears to be usable
from userspace while the MXL111SF device state is not fully initialized or is
already in an error path. As a result, the I2C transfer path can dereference
invalid DVB-USB-V2 state and crash in mutex_lock().

Reproducer:
syz reproducer:
#{"repeat":true,"procs":5,"slowdown":1,"sandbox":"","sandbox_arg":0,"close_fds":false,"callcomments":true}
syz_usb_connect(0x0, 0x24,
&(0x7f0000000000)=ANY=[@ANYBLOB="1201000034276d20402003c68e0100000001090212000100000000090400"],
0x0)
r0 = syz_open_dev$I2C(&(0x7f00000001c0), 0x78b5, 0x80)
ioctl$I2C_RDWR(r0, 0x707, &(0x7f0000000080)={&(0x7f0000002480)=[{0x5,
0x0, 0x0, 0x0}, {0xf, 0x200, 0x0, 0x0}], 0x2})

console output: https://pastebin.com/raw/egyGjxyf
kernel config: https://pastebin.com/SGRihsun

Kernel:
HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2.0-rc3 #1 PREEMPT(full) (QEMU Ubuntu 24.10)

Crash log:

[ 83.536552][ T30] usb 5-1: dvb_usb_v2: found a 'Hauppauge 126xxx
ATSC+' in warm state
[ 83.596815][ T30] usb 5-1: selecting invalid altsetting 1
[ 83.597825][ T30] set interface failed
[ 83.597840][ T30] usb 5-1: dvb_usb_v2: usb_bulk_msg() failed=-22
[ 83.599709][ T30] error writing reg: 0xff, val: 0x00
[ 83.730873][T12337] Oops: general protection fault, probably for
non-canonical address 0xdffffc0000000018: 0000 [#1] SMP KASAN NOPTI
[ 83.732890][T12337] KASAN: null-ptr-deref in range
[0x00000000000000c0-0x00000000000000c7]
[ 83.734294][T12337] CPU: 1 UID: 0 PID: 12337 Comm: syz.4.21 Not
tainted 7.2.0-rc3 #1 PREEMPT(full)
[ 83.737644][T12337] RIP: 0010:__mutex_lock+0x127/0x2760

Call Trace:
<TASK>
? dvb_usbv2_generic_write+0x25/0x60
? mxl111sf_ctrl_msg+0xc5/0x300
dvb_usbv2_generic_write+0x25/0x60
mxl111sf_ctrl_msg+0x26a/0x300
mxl111sf_write_reg+0x93/0x1a0
mxl111sf_i2c_start+0x72/0x290
mxl111sf_i2c_xfer+0x1e84/0x3640
__i2c_transfer+0x522/0x16b0
i2c_transfer+0x1d4/0x380
i2cdev_ioctl_rdwr.isra.0+0x37e/0x730
i2cdev_ioctl+0x2a9/0x860
__x64_sys_ioctl+0x199/0x220
do_syscall_64+0xc4/0x7a0
entry_SYSCALL_64_after_hwframe+0x76/0x7e
</TASK>

Best Regards
