Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828833;
	b=Rl3mPlxOQIA9PCVmpie4QAyaVNJz5aDj3PKYMpQzO+4kvs36MDK61neA6Dys42PN14aP
	 ZxLUMOjbUaMMlbqPVNTCvewYF9UuE0kX4TXDYjoli2FO8H/5VfIoNylASipM556r44QZG
	 2Ms7IlNxxOY/l6m8JGXFNH2ycwU/mlxa2cofEDkde2sMk/asl/KHMqJzLlM1eQZYyOv9E
	 9rDQo4S95vruTsxRNFsxzrAr8LCODKrUlHKlbVRq2J8YflWJcumPd8bxfHvP2No0PUioP
	 C5WhB7ouNeoZvib8D5VVZqkGjmcYJnYRg7XW1FIn4AhW7KJSEHVRy954G3FWGpM2twQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=j8WmM2ZDC4HM11sYU2pJKBTku+9RknFe6Tk44ETTgFE=;
	b=4DdmcCUAZu7hyWa2b1+NcUQeZp8zrFa30ciLM5egpIraZcwp0QbzpOmlylh6uXr4HMDY
	 E0cr7Rx8Ge/FKAHcXWUzjorXtstTQhcmK2t5s9EXHZ7FQRZBDryQP77dkjINAlCu3/cQp
	 AWcMNrPR2KQ7/jaws/h4SSSBiibWFXx3O7eq05rNbrluoJzLKHXgRHYcvrsY/D1M1PmKq
	 7p3QMEEvC1U4/W5FSJyJgU/y6yHQwvJlvjYr4UDiwJs17LT02murKT2Geub6aFs57G1v0
	 XJUo0C7zubHdXOfec/OAJfdWsgNqfGsqT43NB+VpTUe002ouC20vbJS1P7Nab1uprwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bznbirs1;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DC606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 11:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bznbirs1
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso4615730a12.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 03:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828832; x=1795433632; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8WmM2ZDC4HM11sYU2pJKBTku+9RknFe6Tk44ETTgFE=;
        b=bznbirs1W7KeLTcdGuIpmYZRxwnkpH5f/RlkezPsx5Zs2Dhfp3ec/lefIvLuX18cvt
         NoHo1RgNL6dtz3aB/iO9bwSZ2pifRfzNuYCA+txJ7XIF9qmTspFwlHcl0aGGHRSepq1B
         /TOeVLLVz41daiNJlAwZjifgbnod0SJgbT/IroLzExz8JT51sPXXN94sua4KXnRgJIyQ
         CekQtxYPcK8+dRCrhd6uWNrtdVljKk6Xv6ungX6K/1e3VgZnTRko7umi4kFW/5Yt8hQt
         rag4Ksak60RTN/ZX2aveiMw34rvA8uNIIEUFMLcrTryqj47WTpdbCXdDm0aNgjJupPYX
         Hfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828832; x=1795433632;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8WmM2ZDC4HM11sYU2pJKBTku+9RknFe6Tk44ETTgFE=;
        b=dwBKwjX125GihFcZ1FMtg9S+ufxjCscpOEkWvye5xU7j9cRxGX2rXPsYD3tM7Imo+A
         dDnDGJOPVCSvL7aE0yMeECjFxn7j8FuoPza7xlhCYtqw+s8bN5Mmf9mNL2vTWnB7hXNB
         lCfpb5+ZxcbCrNM4TZ6NWFmxxiTKedtKCWZust1jibAI0jmEPVASP0jw8uUdoQfPO09N
         8z2b6GqmQr/G/de3ATJH6akETo0ISdBbswHhWUqi3j8eaM6ee2EkRcjdK+QBAJxcY+Nj
         sK9WLkMrNQGRm6LobwY1Tg3pXm2YXhJ7jOdeRqjzxt2IFUPNeg8JqWxWE7BfwoIDIjwT
         1WDg==
X-Gm-Message-State: APuU4Z+37hEcM2Uy7TdlPXVx2wm2FTw65ZguZRMKeZS2Khqsw1RXZB9D
	zw9pVt7LgcSJ/h8gk7+7r6RiilMBUJzT7gLMfopwDL3hy0PZnkLrGvRoh1dAI1kLksQ=
X-Gm-Gg: AYBFou0u84uOWojgb3cHzUkQUHR806wHbCI1dUerp/+mSUHjimy/wmOJY/qGsXaXQbi
	ACFUwyVKAGaBZKVdZQnHEwNrjkdkeUKzF3fugV5Ej7OZxlvXgFAhJ+gv59oYHZTKz4DR5TVfH6F
	BnQRhux/oiEDiZvw3FIseuso9bWw/qtx+ad/6A+oqK0xGTJ+GRZoXfZxDGRevOpGbIg0xb8dIeL
	NoS6acOAEO+qkG5/bwVv2JarmiM1fhWKxLLshKUir/wyZjIBTfjLWgCpa8vd/1kTJ2lM4kkYqaR
	ZdwNcaA5Pl5fVK1DtPmmy7ex0YJJrI/HqpCaqD79w8rmVG9BCdX95OS4onKr40+Xfsd+QlVRLa0
	tEPitVaQ2uZHkMbuBxWbIKssIzZqlwbruNFPy5x365bc2YgwqyEItt6QpE2+e9RvR/Bhi1inW+L
	Ij6nuWqH0fjAAaBYAEcum3S3xOGiOREVytR0JM219TIkf+E6GYBtC5nClGpEnAm433LZ0iPrHhZ
	ZGSDyN3C2rBiH02uTOF047e5uFFSrzXByoOs/h9W5CEF8DG47DKRyNCjnX43s0+NKJOZbVb7DMf
	xCW0I+8SLWG3ma9TwlMAH1nWjJtQ7nnk55/fazqUJT6MN8gL
X-Received: by 2002:aa7:df02:0:b0:6b1:e4cb:a23e with SMTP id 4fb4d7f45d1cf-6b7c0953c22mr5985412a12.14.1794828831465;
        Mon, 16 Nov 2026 03:33:51 -0800 (PST)
Received: from localhost ([188.146.172.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23db711sm4334432a12.24.2026.11.16.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:33:51 -0800 (PST)
Date: Mon, 16 Nov 2026 12:33:47 +0100
From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
To: linux-media@vger.kernel.org, mchehab@kernel.org, mkrufky@linuxtv.org
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	stable@vger.kernel.org, media-ci@linuxtv.org, patchwork@media-ci.org
Subject: [PATCH v3] media: mxl111sf: initialize state->d and fe_lock in probe
Message-ID: <xbzvgut6eavjeo3q5cpysxdirlvgatcr7qjkyadz4eolcchfeo@rjhvhba7lvdh>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

During device initialization in dvb_usbv2_probe(), the dvb-usb-v2 core
allocates the dvb_usb_device structure and its private state (struct
mxl111sf_state) via kzalloc(), then invokes dvb_usbv2_init(). Within
dvb_usbv2_init(), dvb_usbv2_i2c_init() registers the I2C adapter with
i2c_add_adapter(), which immediately exposes the I2C adapter to
userspace via the /dev/i2c-X character device.

However, state->d was only assigned later during frontend attachment
inside dvb_usbv2_adapter_frontend_init() via
d->props->frontend_attach(). If userspace performs an I2C transaction
before frontend_attach() completes, mxl111sf_i2c_xfer() delegates to
mxl111sf_ctrl_msg(), which reads state->d and passes it to
dvb_usbv2_generic_write() or dvb_usbv2_generic_rw(). Since state->d is
still NULL, dereferencing &d->usb_mutex inside dvb_usbv2_generic_write()
triggers a null-pointer dereference crash. Although the crash report was
captured in compat mode with PTI, the failure is illustrated by the
following x64/NOPTI trace:

Oops: general protection fault, probably for non-canonical address
0xdffffc0000000018: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x00000000000000c0-0x00000000000000c7]
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x149/0x1550 kernel/locking/mutex.c:821
Call Trace:
 <TASK>
 dvb_usbv2_generic_write+0x26/0x60
 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c:77
 mxl111sf_ctrl_msg+0x160/0x2f0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:73
 mxl111sf_write_reg+0xa9/0x1b0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:123
 mxl111sf_i2c_start drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:130
 [inline]
 mxl111sf_i2c_sw_xfer_msg drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:-1
 [inline]
 mxl111sf_i2c_xfer+0x463/0x5060
 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:813
 __i2c_transfer+0x7bf/0x1fe0 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x1cb/0x2d0 drivers/i2c/i2c-core-base.c:2350
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x6a5/0x880 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

Additionally, state->fe_lock was initialized in mxl111sf_init() (called
via d->props->init()), which runs after frontend attachment, leaving the
mutex uninitialized during frontend registration. Although the reported
I2C fault does not demonstrate a frontend lock race, fe_lock should also
be initialized before frontend registration.

Fix this by setting state->d = dev and initializing state->fe_lock in
mxl111sf_probe(), which runs before dvb_usbv2_init() registers the I2C
adapter or attaches frontends. Furthermore, remove the redundant
mutex_init(&state->fe_lock) from mxl111sf_init() and the redundant
assignments of state->d in the frontend attach functions.

The fix originated in the linked syzbot AI patch job, which used
Gemini:gemini-3.8-flash.

Fixes: 4c66c9205c07 ("[media] dvb-usb: add ATSC support for the Hauppauge WinTV-Aero-M")
Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
Link: https://syzkaller.appspot.com/ai_job?id=c5284b5c-3f14-4e95-a4b7-6ee38f0d2e1f
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>

---
Changes since v2:
- Drop the non-standard Assisted-by trailer. Upstream commit
  1e035297ffdadf2184c3c773b8c098e372324aaf
  removed the Assisted-by guidance and checkpatch exception.
- Disclose the syzbot AI origin and model in the commit description.
- Put the stable Cc after Link in the commit trailers.
- The code diff is unchanged.

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 6404eb74d..fc4010b6e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -431,8 +431,6 @@ static int mxl111sf_lgdt3305_frontend_attach(struct dvb_usb_adapter *adap, u8 fe
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -502,8 +500,6 @@ static int mxl111sf_lg2160_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -587,8 +583,6 @@ static int mxl111sf_lg2161_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -674,8 +668,6 @@ static int mxl111sf_lg2161_ep6_frontend_attach(struct dvb_usb_adapter *adap, u8
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -749,8 +741,6 @@ static int mxl111sf_attach_demod(struct dvb_usb_adapter *adap, u8 fe_id)
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 1 : 2;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -935,8 +925,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
 	if (mxl_fail(ret))
 		pr_err("failed to get chip info during probe");
 
-	mutex_init(&state->fe_lock);
-
 	if (state->chip_rev > MXL111SF_V6)
 		mxl111sf_config_pin_mux_modes(state, PIN_MUX_TS_SPI_IN_MODE_1);
 
@@ -1068,7 +1056,9 @@ static int mxl111sf_probe(struct dvb_usb_device *dev)
 {
 	struct mxl111sf_state *state = d_to_priv(dev);
 
+	state->d = dev;
 	mutex_init(&state->msg_lock);
+	mutex_init(&state->fe_lock);
 	return 0;
 }
 


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
