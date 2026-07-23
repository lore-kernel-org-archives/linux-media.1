Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC201C84DC
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840122; cv=none; b=lHL6E83Emqh4BbETy5Itzgo7V/U1NJj787z3PQGLXwiEjkmxeboWNvrUQJ1Ku8pWamvlDebX0QlRBmHQrytDhMSzSiykAVHmZQR+GlH9VDyt9eKSF3qXJv5nNXWvcRBWPoyLpIqiZkY3medKAVzlyQYT7HAw7Ye7RtDG4wtltTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840122; c=relaxed/simple;
	bh=kpNpmXP2zUcfvgI+VUB/mqBaz21ktP2Izhk8EyYE0Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhYikhvvQPagUNwj1CkO2fwQ1TIxy45l8meD5ce1oM70D62oha5ih4E60/WqzrjeYOE4Mie6iYFDjqRZX9e+E6evo7rri0cC33BgAA3y4FhJkRq0F2U0UrkZpOucpRRGcwniIk1HNbXuv+YH2NM/4pZhrzAiNnxK+DgtpkHqiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwP/4SFp; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwP/4SFp"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8efbafa1bacso9426556d6.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 13:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784840120; x=1785444920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLkFGK35XJxgAtHBySSU6z2wsXFjqNEj24rUwtelC/Y=;
        b=dwP/4SFp/Kl/ZP8TH8yvyCAr0AKapl/J/FzcRiUzzYLqRjqZi9/bRKxUYcd082yDPd
         D7LfRtY+W85sBMrzWwR6bvtYht7MQvxvC8Q7PlDqGsrJnz2g06NIPbGbKGcQ8BUKtrTF
         GsHroYrbBby4cnFnRD6aeKQ7TzXMYgST7HDVWAPUjKpucLUe38a9SUEeZl5UBYEwhiGg
         OWafKL1pmt/vynfh5GX37Gu/bc4jK2xfbBnF+SLYqi4xUoxpQUsoN47+bsPs8+ljmIQb
         5o/G9GqGVb4dnm/gHwo61z51tsp7pyXfXdPp/OpxbSu1jCwqzgle7QV0XKxg9U9ptYXZ
         2XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784840120; x=1785444920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLkFGK35XJxgAtHBySSU6z2wsXFjqNEj24rUwtelC/Y=;
        b=db/pqpScwXyj4dO09UnWE3tgqSg+GXGR3Ps4/JOPtWTrvlklSCCjCFxJqb4AoNwmmC
         JKFTtCxVnxV2Gsq34WxqvUHWd05hsXU0CXF/5b89bvvTqwMpbraas9m3P6XHPGx7w7xP
         gi2p7f8+DSqP8hP0fkLeH3MQvzTdDDXNu36bH9Rf+jNJHUKPHuJ3t4+YVAzjGUgDGoYG
         kQHmbJD23G++ktuR+8wYAcw+nkU6yMCmKK8Ze8JLYtXZ4lReXfxIaoWR4m9KuIrt8YP0
         7cNgy3qIGyj+RBhJcmvt9XEuRCE25kenVAcGUNalD3AdCo1MJEY8CKykCOAOH7udW8UQ
         YwDg==
X-Gm-Message-State: AOJu0YwOL5Ga3b1v3w9V9//ufA1ofFXbdlcYBb6wdDFpfH6reMdGaF/8
	JEMKBMrQozrWRf79FzGkC8rzvOsJS5BT7niYQekYaBr+ETT1BQNGG7jI
X-Gm-Gg: AR+sD12yPKF7wm5f9wgV1DnbfB0eaSnyYBRLyKT3BKLoxr8TLDE2xA0nAN1o5p9TrL8
	+3aCzAgHJx7eyZoTONFx8C6pkUINjNFAU+H9sPVkwRqeT9lEPmlekGYG2451wmSyTi9L/eCydGz
	5ftyTIKIkjVehab30j3pJGb/ynFRgxysAjxDdpqTTE/2Ty7wxumoIv9+0+x7byITCRVZwtJcDIU
	sft36z3G+5kNvsOjw/J3sl9rNOunTm1VFn3Lss9cy+vdvuSftjLYSnXlsHhrUmbgMW3oRDm7PSm
	tQriwQ7jH04tXVTmp5y4x2eB8Q7WqbBaB2OKyaSEAId/pHhgQvDbnmEm1asluLjBZfVG9xhYgT/
	Md3Q8qSW13e1v3ywTi8qHSUgs2EVwZzfhUi6Xvvhwlk0GQc38CRyDBtkJf+23i4gXp8tewIIX9O
	cTiHDZFMXLeSQn8XxXVg5PLGdzZcj7FsTIl/XsmKrOii/DgVeH42/PRL0QZGN+sqxFQY0W6NSxy
	Q==
X-Received: by 2002:a05:620a:3945:b0:92e:c116:bf11 with SMTP id af79cd13be357-93103aa2d39mr458620285a.90.1784840119399;
        Thu, 23 Jul 2026 13:55:19 -0700 (PDT)
Received: from Ai-Server.tail94eb8c.ts.net (131-193-45-111.cs.uic.edu. [131.193.45.111])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f687a6aasm501134585a.9.2026.07.23.13.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:55:19 -0700 (PDT)
From: Luyao Bai <bailuyao1997@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Henri A <contact@henrialfonso.com>
Cc: linux-media@vger.kernel.org,
	Patrick Boettcher <pb@linuxtv.org>,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+0cd0fb4cf3f4722d6663@syzkaller.appspotmail.com
Subject: [PATCH] media: dib0700: reject zero-length I2C reads in both transfer paths
Date: Thu, 23 Jul 2026 20:55:10 +0000
Message-ID: <20260723205510.662761-1-bailuyao1997@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621192222.337738-1-contact@henrialfonso.com>
References: <20260621192222.337738-1-contact@henrialfonso.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A zero-length I2C read (I2C_M_RD with len == 0), issued from user space
through /dev/i2c-N with the I2C_RDWR ioctl, is translated by the dib0700
bridge into a control-IN usb_control_msg() whose wLength is the I2C
message length, i.e. 0. usb_submit_urb() treats a zero-length control
transfer as OUT, so the pipe direction (IN) and the setup-packet
direction (bRequestType = 0xc0, IN) disagree and trip the WARN() in
usb_submit_urb():

  usb 4-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
  WARNING: drivers/usb/core/urb.c:411 at usb_submit_urb+0x1573/0x1910
   usb_submit_urb
   usb_start_wait_urb
   usb_control_msg
   dib0700_ctrl_rd drivers/media/usb/dvb-usb/dib0700_core.c:95
   dib0700_i2c_xfer_legacy drivers/media/usb/dvb-usb/dib0700_core.c:315
   dib0700_i2c_xfer drivers/media/usb/dvb-usb/dib0700_core.c:361
   __i2c_transfer
   i2c_transfer
   i2cdev_ioctl_rdwr drivers/i2c/i2c-dev.c:306

The .master_xfer entry point dib0700_i2c_xfer() dispatches to one of two
transfer routines depending on the device firmware: dib0700_i2c_xfer_new()
(firmware >= 1.20) and dib0700_i2c_xfer_legacy(). Both build a control-IN
usb_control_msg() from the I2C read length, so both can submit the bogus
zero-length transfer; the syzbot reproducer happens to take the legacy
path. Guarding a single path therefore leaves the other exposed.

Reject zero-length reads in the shared dispatcher, before the firmware
split, so neither path can submit such a transfer. -EOPNOTSUPP is
returned because the adapter cannot express a zero-length read, matching
the error the i2c core returns for the I2C_AQ_NO_ZERO_LEN_READ quirk.

The i2c core can enforce this centrally via the I2C_AQ_NO_ZERO_LEN_READ
adapter quirk, but the dib0700 bridge reuses the i2c adapter registered
by the dvb-usb core (dvb-usb-i2c.c), and the dvb-usb framework provides
no hook for an individual driver to set adapter quirks; using the quirk
would require a dvb-usb framework change. Rejecting the read in the
driver's own .master_xfer keeps the fix local and minimal.

Reported-by: syzbot+0cd0fb4cf3f4722d6663@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0cd0fb4cf3f4722d6663
Fixes: b7f54910ce01 ("V4L/DVB (4647): Added module for DiB0700 based devices")
Signed-off-by: Luyao Bai <bailuyao1997@gmail.com>
---
This is an alternative to Henri A's patch for the same syzbot report [1],
which places the guard inside dib0700_i2c_xfer_legacy(). That fix is
correct for the reproducer, but dib0700_i2c_xfer_new() builds its
control-IN transfer from the read length in the same way, so a device
running firmware >= 1.20 can still submit the bogus zero-length transfer.
Checking in the shared .master_xfer entry point covers both paths with a
single guard.

Henri: happy for you to fold the second path into a v2 of yours instead if
you prefer, whichever lands the complete fix.

Tested with the syzbot reproducer under QEMU: the "BOGUS control dir"
WARNING at drivers/usb/core/urb.c fires on a clean mainline build and no
longer fires with this patch applied.

[1] https://lore.kernel.org/linux-media/20260621192222.337738-1-contact@henrialfonso.com/

 drivers/media/usb/dvb-usb/dib0700_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea47..084c56e734e6 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -352,6 +352,20 @@ static int dib0700_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msg,
 {
 	struct dvb_usb_device *d = i2c_get_adapdata(adap);
 	struct dib0700_state *st = d->priv;
+	int i;
+
+	/*
+	 * Both transfer paths translate an I2C read into a control-IN
+	 * usb_control_msg() whose wLength is the message length. A
+	 * zero-length read produces a control URB whose pipe direction
+	 * (IN) disagrees with a zero-length setup packet (which
+	 * usb_submit_urb() treats as OUT), tripping its "BOGUS control
+	 * dir" WARN(). Reject such reads up front so neither path can
+	 * submit one.
+	 */
+	for (i = 0; i < num; i++)
+		if ((msg[i].flags & I2C_M_RD) && msg[i].len == 0)
+			return -EOPNOTSUPP;

 	if (st->fw_use_new_i2c_api == 1) {
 		/* User running at least fw 1.20 */
--
2.43.0
