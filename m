Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3C43231C
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 03:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234898; cv=pass; b=J3wVOkXuKmq8FtF2kXxcyVfcnZ1+r6rM6QLkcx6K6fatNvmkbNIkbbR6QTSa3wpIcRza2BPvdNhCzHLrehrmhaKkhMILzPYblQawQaTKZIv4efSEVkLTBS28R5kMktO4OxOFlqQXXmZw+SJPx8hIiipQeLGlf4u0qIYCEmM4xIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234898; c=relaxed/simple;
	bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NJ6jkOtJcHi4AFKBfiHreCDHf9JkYop8vopGIFbJl04Mcks63Ev1XFr/9w/w4z5zCHjKtT/RcD2OSguIcLFaOm69nQSp5LciEXFYZuXjahS3OW3R6TAHbov4QoxaY4/Kl8NQRZyUpiyZF0SHBGu+9oa8owJSvEoHsEVL+Mx3zwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym3TBudC; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym3TBudC"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52fa6005224so32760911cf.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 20:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788234895; cv=none;
        d=google.com; s=arc-20260327;
        b=sy80yPd7RL6W8bHBqliXFPmVX6f8QMDOY6vBq2uMUAbuvvDzfuup2XRhpqGKo74Q+W
         kVyj9yu91yHjQaVLJrJxlvNLJWRsnjr2rZn8qR5c+T+ty+d8asp3beu+ZPEL0JTjw6jk
         7Fo72rFitgsCCsi5Sb25f8UaHIhsNZK++qPp2PaeSrI86FWaOTpbhQENT9muf3lLsdVo
         jdlcwsokusyI6xRlmoxWOtAZ03C3iG1xkrWZ1qOwH5OCbWh5A7rItaKc1FYzW6HTQh/o
         G8/m3ImdBuFxT83CdWXTMxeYXBevS4D1kt+Kgu6l7NOKV/zphEvvkDHWY6smWN9OO6oz
         M0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
        fh=Rk42CvFLpZ+9vHK28jS/eHM+HYvfONsQFtBRk6HDTZM=;
        b=X2p9Hba5HwCM4mhkmVu6hXHE+BnAKASGu2eU3SlShZv5vk4xkUMOYHpIuPAA5gfifi
         Blo8b4rh0f0g+1rRpkssYE5bWBUMKQJIvE5UzQXcXjv+Ruixqw8exVCEfCVF8m8plm8a
         VIyUhufCtEUssQlInFmW/U4zXgzccSG8QSEmC774kbGb6lk71I1KixsC1bOAKawvIay0
         37TtHxzCjdM0iiK6ACdo2phCc/iPahcWWYp11MV92hJjBS2cUzC0/Stq0jbrHsqtGaMm
         2TCw7uc4LtvSVENXwa1FhZzu7hHsBtcko+x2iNgFGTRYzaVuD50YXjspScz0sPFyD4Mk
         dhVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788234895; x=1788839695; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
        b=Ym3TBudCzV1a0rmBm4BiXjDTQsJIbNIMUioObI49+JpMCAvd1RWFooBMttVCFj6AQH
         8v0wOAz5bNZozcEit6oOpNVKZpGg/RopAtTLvbPdP6Rf5ubqyb+PCcepnkj2/pzPDAnY
         YHWKiRsRP3vV0Rwb7Peq+GINdzauF2+IYCBVNZZKVu7XDlilgWotAMhIyz1x79zbvnef
         WU/9s8Z1Gq7JylvQj0SayO18Hk1ljuWTZyRZ5eEbYObbDVhNzHVr2XrMQJ63kRYLVkPH
         QhQT3aX25qXr7FK/DeJi0uke+T9EigCbUqQZcd9Qrqfh/++KB+1RbqVbY9hFY8ngMro0
         Ptzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234895; x=1788839695;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p6Car4wLfCC9KNNoQ5FLbdWyWeAcQj3hc5NEF2Q1ifU=;
        b=EzUzzUe2FttHOSGNkTdQmvTsJ64+NoeREbt1pUCOKQaoeNB0XSwPo6QwKB6sPKTCC2
         3jeHJiI5cebKpiM5MieqTQfvA/1P9NOEmLVyX3yJK3y8ZPYNlEBtcvM3c77IQLfjBRvH
         pGEnjKzMf76npwFzzki7Rr/XkGANhS/UAbc2CzAPnsLPbb/1QTew13vrZ+zmllbvxM4W
         GJV2IIh2Ixq6YiiQjDiIdo7XVgYqc+uqoSewU75JW9eUvWJCcfCn2eyhG7DFxQgIq0oS
         m5KMuOlVuPvEVOw0lVs8uK1uJUYBeFaXzP1cS5xvQE5fCDljX6FFD4pDByVAIYWZy3PU
         eKTQ==
X-Gm-Message-State: AFuF++lrCzTD8W6xrkpaDGu35mJHpfjvs9yf6LCITEV6ijJnUdFciULm
	ArYecRqxfkXbHi689TNQ0z9UeSfhMYOvHfkdlB2zu391qRaNS6DIj0putTKQsjHyDwgy8EA+GaF
	94XEMcEC8GtmmtQwmcE+PS9kaCidbEm8=
X-Gm-Gg: AR+sD13vP0jlenGRbfoG/+SELDjSma3NuoXweZDrIuGJLk0BmwBomIrNlxknP+Wxm4m
	qVcPzSgZI94h+PZatCLjhBKdtKbNIN0XZSvIWIaNQ7a+CVCr2f+hz15MXxijigez5zf96hakkad
	SvGRTVI4eUFiy1QYMz5MQa/5jNyiHIXDu6xS6Z63Y6K7AU/LJi1HDvgwG3jN7RuxMMEM/F+Hhvw
	pN+OZYv1qi6+xV2FT/+s4syQ6krrRNNm0aTMeliIcgDt4/LIlqPW9Qxdr4minjRO9UTt1KtFwi2
	35F/AymALgSssXXgTPGh2xuNt8C8bftGr0T2621bn8R6bi2WHWJCxX0lRG9Z5bGkAFARNI1/9hH
	E+7TNgaJBzJyJ6SeeO85g8itvuBxQ
X-Received: by 2002:a05:622a:551:b0:52f:b0f9:e4f2 with SMTP id
 d75a77b69052e-52fb93d5108mr371246021cf.1.1788234895329; Mon, 31 Aug 2026
 20:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Tue, 1 Sep 2026 11:54:43 +0800
X-Gm-Features: AcwNN1U_A0RRNxrNZ7TVVkm0IgIj8V4painWMfBL2quCl7WNYWN1-87P4mqd3Hg
Message-ID: <CAA2SOT5LP5kNmw5qG6OCDijBYQNZoxCiKGRM8zcbApN62UKnTA@mail.gmail.com>
Subject: [BUG] media: usb: siano: WARNING in free_large_kmalloc from smsusb
 cleanup path
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a warning triggered by a syzkaller USB reproducer on
Linux 7.2. The issue is reproducible with HEAD commit
45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229.

The reproducer connects a crafted USB device that is bound to the Siano
SMS USB media driver. During probe, the device repeatedly returns URB
errors. The driver then fails to start the device and enters the cleanup
path.

The relevant failure path is:

smsusb_probe()
smscore_start_device()
smsusb_term_device()
usb_free_urb()
free_large_kmalloc()

The warning is reported by mm/slub.c, but the root cause appears to be in
the Siano USB driver cleanup path. The page owner information shows that
the buffer was allocated through smscore_register_device() and later freed
through smscore_unregister_device(). After that, the cleanup path continues
to release URBs through usb_free_urb(), which reaches free_large_kmalloc()
and triggers the warning.

This looks like a URB/buffer lifetime or ownership mismatch in the smsusb
error path. A partially initialized Siano USB device can fail during probe,
and the cleanup path may free a buffer through an URB after the common
Siano device buffer has already been released or is no longer a valid
kmalloc allocation. The driver should make sure that URB transfer buffers
are not freed twice or freed through the wrong owner during failed probe
cleanup.

Reproducer:

syz reproducer: https://pastebin.com/raw/F41UFB6g
console output: https://pastebin.com/raw/riuUBdGs
kernel config: https://pastebin.com/raw/1ADB4Xp8

Kernel:

HEAD commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
git tree: torvalds/linux
kernel version: 7.2.0-14827-g45c13f3f9e3b #1 PREEMPT(full)

Relevant log:

smsusb:smsusb_onresponse: error, urb status -71, 0 bytes
smsmdtv:smscore_sendrequest_and_wait: sendrequest returned error -22
smsmdtv:smscore_set_device_mode: mode detect failed -22
smsmdtv:smscore_start_device: set device mode failed , rc -22
smsusb:smsusb_init_device: smscore_start_device(...) failed

------------[ cut here ]------------
WARNING: mm/slub.c:6724 at free_large_kmalloc+0x9a/0x110, CPU#1: kworker/1:1/30

CPU: 1 UID: 0 PID: 30 Comm: kworker/1:1 Tainted: G W
7.2.0-14827-g45c13f3f9e3b #1 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
Workqueue: usb_hub_wq hub_event

RIP: 0010+0x9a/0x110

Call Trace:
<TASK>
usb_free_urb+0xd0/0x120
smsusb_term_device+0x1d7/0x3e0
smsusb_probe+0x1aa3/0x2200
usb_probe_interface+0x71e/0xe00
really_probe+0x267/0xb20
__driver_probe_device+0x1f9/0x420
driver_probe_device+0x4f/0x240
__device_attach_driver+0x286/0x430
bus_for_each_drv+0x251/0x2e0
__device_attach+0x2b3/0x440
device_initial_probe+0xa1/0xd0
bus_probe_device+0x12a/0x220
device_add+0x7ec/0xb90
usb_set_configuration+0x19dc/0x2050
usb_generic_driver_probe+0x8d/0x150
usb_probe_device+0x1d3/0x3c0
usb_new_device+0xbc6/0x1ae0
hub_event+0x2c04/0x4ef0
process_scheduled_works+0xc97/0x1920
worker_thread+0xa59/0xfe0
kthread+0x38c/0x480
ret_from_fork+0x508/0xb90
ret_from_fork_asm+0x1a/0x30
</TASK>

page dumped because: Not a kmalloc allocation
page_owner tracks the page as freed

page last allocated via:
___kmalloc_large_node
__kmalloc_noprof
smscore_register_device
smsusb_probe
usb_probe_interface

page last free stack trace:
__free_pages_ok
smscore_unregister_device
smsusb_term_device
smsusb_probe
usb_probe_interface
