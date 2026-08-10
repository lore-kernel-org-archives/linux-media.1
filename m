Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E83A3E95
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350093; cv=pass; b=T28CGA4eFR2c2veBnO7xCgV13HkrLBdKi2L58dno/+1ekuVPUg8Ret+QdEU3JCXkNvHilNf1yJmESglTU5d8I+N69/bgH9XHc4ZyHe4nhHWK+z+eCJ3YiPO/iMWARpRE54FgfiwBvoL1OhgQLapwD7HceNym5DGhJFhyeHLLS3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350093; c=relaxed/simple;
	bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GDeGdbr8Qbya9L7BxHuI/eQadx6xc/xLAEkBqzF867XwyEqiEcjO3OLo6jj7NYmIFZN0lDgozrLdZmXLg2k2q7dXhIrR0zYgcfU0ubPs5QyAppvT35AxSKDGm3vLg7mrAtSkHTtbqcZD4E4otdKj3uLxZ9Z8CfhfirMvsm7WYLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rG1/yWpS; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rG1/yWpS"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-529a1ee0e62so10754751cf.2
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 01:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786350091; cv=none;
        d=google.com; s=arc-20260327;
        b=ML4FKLRZpC8+YiseVYCd4V5AAegPMwxQXdPeP1kif8e/F/nhgxAZpwYRPvSPd3TKsT
         dMUfyP7ET+dTB7VdIBwYaGV+4WL8/QlOVmkAXKUrFhJZNQMc+hkUuudxD9VMLz49Iwjs
         G6c48a1iPrFB4Qm4RVz0/OL2ENQXf+YbO0KRGzvjKt16VlCozB6v/Q7MQrKkJrLsAEya
         Xgb3FQNuZrAyDdJlYicam9mNQX1mRhHSz1PK0PF6ffMAUxOFHL2FjtJUQonFeKzTbLwR
         cRCYA9cMYhgRPvWGOVAvtcKXuMXuEZEp1gFWcK5S3axMb2zKmypRwkZva51YMTLcnLPC
         vO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
        fh=bgLx2NkkqWBFMdqzvWro82r+HD7mc8rw6mKv8tYKx+4=;
        b=WqO7wHSs5qy441X32PUK881ra9pbKWYfSav7DeXTBgo+Pdfba2JSHg+aWikrLvI1zd
         9VSDLUP+7f/gbfmIf5OEJAdhAH5CeC9WpyoqPKi4VsIr+LOsF59ZyABOMa9NCVZ4LPDV
         6No1HokbSMbvNuvgp50izE8bL88cxqNl5MUxFzJLU+fEDs/4FT10AVRXVfJT+MdV5sxV
         UfbvOLZZC2wSm01DV6SLzwPueOIYlHVpmEkcHQkFW2Sg2YMvK2P0PCyXgVrCyEvnotHr
         jh1xcW8x+JzCknEpKpjrddg93M/ZSXIImlc64ilxkSAsX1Egmg3kCeBQbG7wZ0WCC3qx
         KyRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786350091; x=1786954891; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
        b=rG1/yWpSe3FrDw9dLGh40DhMM9JA2kUb9G9TT6FRm8CaxB5hRvXYdOUUj1EfkjWJwA
         bH9cCFai8BPV+5GVtRl1zCXhSrYfmLkuyA/mVmucsAQROQ9PHfu40wf4hfqcjMEMLJwr
         lgF0QkMt3lVyAT+2NLyZRAgFbcEQtUwE6HTAgPan4Fdjxm16lVTt6qfmSG345aitcKXf
         Tl45njv8ZpRhXR8jEwL9yYeqjryQSX21YVYqdAAyUhl4tTHxeu+TB7trhesG+DVwRLyr
         g0JweBjew3EbqzDW1P8pT/qm8UtbEk0u2HCrhR24rV77lASILVinErjpXN2uHWTCoF6Q
         l3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786350091; x=1786954891;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ISQrs++lQPkCSS8q83bACLgi7FD9qqn6A8PUSQjE9bI=;
        b=LL/h+X3CCnt1Xb4OuZr+PaJcyLvQKK3WJKfD7yREzfyzDNFF69GvHfMrgZ2uTLALIG
         pANnvjE3KBs79sjM4mZHphD65ltVIqx/CErCnAZLCrwyP5mpnZb/8jFPvqq2LnjEkd5F
         7tdmbdXP7WJ84GtP27pPVRewSRiVq7UvT+vlxK3M3AzoPPGBit9X9yogKwCH7btSEaqj
         OgaPhRvLrnfYIGxSeUiE2di2ApuqUFPwsq6w6TGirJY0isHU3CPoP49RLVccRSAS/58y
         PpdgSFUgp8I19iReRNOs9lFdh/EOWe8KlFyiDbnZ6GFaeTGxCIQMU0K4z6dAcga8fG1r
         ZdhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPOoddcKQQ7QmlzLxstvNxRc5UHeNtgfHcq5EiWLPMnhQT+BFrRyuA1wS07hrUXTN3p6ynCl4InH4xNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2TVfxvy+oC7T9Ag1LA9g8uie4GIIGD241d7o6JmDM7NjpcEeX
	RoWGCdUnpwR29D6bh/MHYz0i15Lq0XjQyYE3VIQ9SkcozE998dgL7+6xTirT3tuQaBp7VXn/flN
	lvINpUi5ugBQ+bNAfqC1WC4P48Nb7bJk=
X-Gm-Gg: AR+sD11biyP/vMSsjTowloXcXVVM63JfVDeTWRGHUxDaW5ektC/Lm8HquorX2VXbm9K
	kpfmBW5/lTG3wVPTqAqDnV/WAFrv+b44N5SMc9YGnDFzDgP1E4bvS5wQPTmV6aDHfgW7vu+10ll
	BlXJp+zrXkoWEzGMJaSoo/20YouHYTcEeYIlacGY1P8JchAEHOliRvSX7ImcMzW7aQHyW+YJb7j
	Qr2Jf14ALyzjAbtoMaj8EZc8XibU+Ei5ODDCrvEwdihey08cuktXcDhc6ozHM5uFg7cYy6NxY7M
	xNCRau8msEZdm+NNxcwIbS5Wufa89BqBOVUISbQFve3N9w==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id
 d75a77b69052e-52ce5f44c7dmr409965021cf.5.1786350091277; Mon, 10 Aug 2026
 01:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ZW Tang <tangzw515@gmail.com>
Date: Mon, 10 Aug 2026 16:21:20 +0800
X-Gm-Features: AUfX_mzKQypVMU99t1ppZCZ2EaFi-qQwwCo0qcg1KtKBkr3ieea5BotyUz7bCIw
Message-ID: <CAA2SOT4pewLwoVkCDsT48QhXTbz_j5MZCuO1QL8dde4NGqtfDQ@mail.gmail.com>
Subject: [BUG] media: dvb-usb-v2: gl861: WARNING in usb_submit_urb due to
 bogus control direction
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a WARNING triggered by a syzkaller reproducer in the
GL861 DVB USB driver.

Although a similar bug has been reported before, I can still trigger
this warning on Linux 7.2-rc3 with the attached syzkaller reproducer.

The warning is emitted from usb_submit_urb() because the USB control
transfer direction appears inconsistent:

usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: CPU: 0 PID: 4359 at drivers/usb/core/urb.c:412
usb_submit_urb+0x117a/0x18d0 drivers/usb/core/urb.c:410

This looks like a driver-side control-message construction or
validation issue in the GL861 DVB USB driver, rather than a USB core
problem. The reproducer creates a dummy GL861 USB device, opens the
corresponding I2C device, and issues an I2C_SMBUS ioctl. The execution
path reaches gl861_i2c_master_xfer(), then gl861_ctrl_msg(), and
finally usb_control_msg()/usb_submit_urb().

In the observed crash, the driver submits a vendor IN control request
with bRequestType 0xc0, but USB core reports that the control pipe
direction does not match the request direction/length. This may be
related to insufficient validation of zero-length or malformed
I2C/SMBus read requests before calling gl861_ctrl_msg().

The system panics afterwards because panic_on_warn is enabled.

Reproducer:
console output: https://pastebin.com/raw/NDGEuRHC
kernel config: https://pastebin.com/raw/ysywjhc0
syz reproducer:

# See https://goo.gl/kgGztJ for information about syzkaller reproducers.
#{"repeat":true,"procs":5,"slowdown":1,"sandbox":"","sandbox_arg":0,"close_fds":false,"callcomments":true}
syz_usb_connect(0x5, 0x24,
&(0x7f0000000000)=ANY=[@ANYBLOB="120100024286bd10b00d815522f90102030109021200019ddb10010904"],
0x0)
r0 = syz_open_dev$I2C(&(0x7f0000000040), 0x1, 0x2603)
ioctl$I2C_SMBUS(r0, 0x720, &(0x7f0000000380)={0x1, 0x10, 0x0, 0x0})

Kernel:
HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809
git tree: torvalds/linux
kernel version: 7.2-rc3


Crash signature:

WARNING: CPU: 0 PID: 4359 at drivers/usb/core/urb.c:412
usb_submit_urb+0x117a/0x18d0
usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0

Call trace:

usb_submit_urb
usb_start_wait_urb
usb_control_msg
gl861_ctrl_msg
gl861_i2c_master_xfer
__i2c_transfer
__i2c_smbus_xfer
i2c_smbus_xfer
i2cdev_ioctl_smbus
i2cdev_ioctl
__se_sys_ioctl
do_syscall_64
entry_SYSCALL_64_after_hwframe



Thanks
