Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F289233F59A
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106814; cv=pass; b=gXIAUmmjBqbDAoLrKFGSFxBWmGL8R25T1T3nf3cJfgYBv58m58do+lc+rb1irZ8FqGiPz22C0MZrivateVLLLNguxJUZqDis+OufQzglJEZNaDUie/I8sBIvxzv/2Cntlo4RG9TFdVo2H8Fun/d7DRElaJrgCmVkaujWzAwb3Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106814; c=relaxed/simple;
	bh=65rAF/Cs6IL3Le7/iV3QARBikGe+f5E8zHG0rnav/UY=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=kxBoTwIfBDl06r03rcy/x9kSyWeILSckAy6Idjzde+waFeINM8gHGh8bG23w0+Z2UaJBubpDwtybRNCHALI0UgFwwAOWNFKL5v3MVcUtz0L4Jdt4LHK2d2YfkPXatEiaQnTNKKrQVG26fDgAQu/jYwH9/N7AL8AeBKs6OF3V3WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=qRd1qajx; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="qRd1qajx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so376711b3a.3
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 23:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789106812; cv=none;
        d=google.com; s=arc-20260327;
        b=m/xcWu2STzHSETkkvK610gk09A5w1AfM535UbB7yGmM0vXiguKRhbHme+vRxwUnlDZ
         UjbNLBiPqJRUgG5H0bQZRdZok2/VIO+6Vbi6FqUUurQtbGazSco+oi5KBzE239MQuTiG
         uj8/evJYJcl93de8BVVfpqFzTOReuG1LYtU0FjcC3fp6nRcP9Q4aKhxXHvLzqdpeKqIq
         W+QBThMBPn2XBrNt20P8wsSnuTzX5Yw7RXoReE9etURlBltMnl9rkiPxSNx/NXhg6Dkx
         v535njUEKF9e72mKLlys4eAk1/cXm0ECrU8Q8Inlol0706GvbNf4aNgH+z5cQ7iyUaZW
         +VMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=+7UczWskDtXOSeWlE0iacB1dXldD1z1mt2uISkpPTKw=;
        fh=R0HybkZI5JNB1f8G5AHrAOJ5xXCkGXwORWMMg55iCbA=;
        b=jOxGz8yMKiylmm54hdRZVRSO8TFEvRj2qdl61cTQihbRZdg2fuhvbnjWbZ6R6Ey86a
         Ox6ZahWbW4W4pbzx8dRqO33Owu2uPHc1NQDKYl0dinq03Qyqh3FHslVHfBEUXC0SaAAx
         4bTXcaQ2ftk5iO+FGqtLfxHOurcvtVR/f+RSHX8T8+gGaCvXTIPD3gaKEr1ne91XZSYX
         r0BF1NG7VWHHovigX6QSnMMn85UpN9okFl4zL2gcHSa8ytyOVF8xkIM5l0L3IuoBFRGm
         VrSOyhGvkcj+rP1SLnEeVP3nRtpl28+nxStFWquieCacxH05GA83xX5GnQK+vMA1CeTD
         1Krg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789106812; x=1789711612; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7UczWskDtXOSeWlE0iacB1dXldD1z1mt2uISkpPTKw=;
        b=qRd1qajxaplbRAM2uxvDoOqa0buEe2GAMYO5t80kdNSIkUyOO1BZYv+8z/mVEGrOo7
         cQxZV86320TkKwpZzuWUZ3Ri88VCC8HldrgV1Md57RighO9IJZfbTTk+oRcwvinRUdhd
         LD7Uf1iM2EfXdkOPYR7dmbyDm/Inbp5X1v+fknrpc1IAtRPfBqwUetawMNx2sKyNzWrz
         HP7JvjJxYIzE3Mq/dkBBmIuxbIx2IUimoPm0ykUSVvMpZJ/up5eDHCEZoBUl4RE0N9If
         0mAUbq1eOa3/2HEm6+GQ64UMKB5isbDjta3oQDyfS1r1tm83bJpem9vjm6bxXBDpUBxT
         viiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106812; x=1789711612;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+7UczWskDtXOSeWlE0iacB1dXldD1z1mt2uISkpPTKw=;
        b=B4/mZ6veC89nxXBLJXsFDF+o02kL41Y0/2eCCzUiAnrN1VV/FBAdjMzLasYWGfdPw4
         YPJ6GRSdMyKLY7BKZQ4YNFfevqMwXLMCXgOFFB1WS8/XbOKj7Gphnx98RWXe9iYGioPZ
         CvLrzzjMGT/ysuueaH5lNTtw8laaky57obC6zsC+V7yjjkCcmG2oLTMRjQ3ePRJkPmEm
         hw0n0EYDt/yFlPeHVJoyNP91WEh9RhBfjbLhigIJ8v0wl3OHv+brmEjNP21jcGiWrMzo
         QuymVlw62oBE8/779E+woKRIBaYKSqhJh3kW8yEEQZX/4vh5MSMfbfjdKg+9dXx2jPVh
         QrMA==
X-Forwarded-Encrypted: i=1; AKwUvBxtV6yRtkHZK/ArV+AEHRrlcwuZ74fOPVgRRGe2Zvat2rQwTqX5Ca0tmN5uOcWwGfiSR/8V0ta3GcGPmw==@vger.kernel.org
X-Gm-Message-State: AFuF++lGUK8z4+eJ1nDUFlM6Ynh6iUBMK7cFQh4qVVl7sTT3Kbf6Xsxu
	nItrWaNCjAix6hwhIiDfqc39tqXeBbSMCsXgecp3WJBb/vx0cNaykKxPY2m5Kq81TPbNfwSlseR
	9hZu6X/nRf9meOSk4UJuVCxxoOq/XfsaPLzPA6kCn
X-Gm-Gg: AYBFou2/9lj1sezbTuRgVclGOE4NEmta3joflNwKDcltso90rJcS7H+AjbSD8Wen+vi
	uAM6YZfBfJp0ndRSXrRgIGcRrntMkz39En4Xj8gydMBB3mTEixCRmsmTSzoTi+1ohxMpA2vbsfn
	HPCk4yLW/HwnXPlhOPBe+1Y0y+bq7D3eSc5o+sSK8wbziPrDM2DzQcH5bk5TQ0DUGn3bzm/2JvK
	Q0TMV7Hx6UqlUbafPolzJfEF1BhVCrhbGMdx9JoY7hRWAT0JqWIVm90tccnRhVRoK1+Vu+UDLM+
	vf+9Ln1MuOdRrH0jGw8MkJ4k2Zm+amPwa3k16lkNX4MI3HgDjTY1avsxkKeZIkirTa0BbFm/RT1
	PCu+rK+z2IwQOgALHBr8VcoP7wc+FNQFOJlAegDYlLX0=
X-Received: by 2002:a05:6a00:1945:b0:857:727c:a1f1 with SMTP id
 d2e1a72fcca58-86b30c14d7fmr4073357b3a.19.1789106811232; Thu, 10 Sep 2026
 23:06:51 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 23:06:50 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 23:06:50 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 23:06:50 -0700
X-Gm-Features: AcwNN1UxDJNIhsIiFRtzYHtfxZL11pXEbbhGOJAfBff3mJZz27JbVBiSHzKb7xo
Message-ID: <CA+0ovCh3hR2O8tfg_62B6AGhGzxB9bVpRGASYuDaG8oNt6LXhQ@mail.gmail.com>
Subject: [PATCH] media: gspca: m5602: fix NULL sensor deref on disconnect
To: Erik Andren <erik.andren@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The m5602 sensor ->disconnect handlers store NULL into sd->sensor, and
m5602_disconnect() runs them before gspca_disconnect() stops streaming,
so two paths then fault on that pointer: m5602_stop_transfer() reads
sd->sensor->stop when gspca_stream_off() runs the stopN callback at
release, and m5602_write_sensor() reads sd->sensor->i2c_regW when a
read() already inside gspca_init_transfer() reaches it through the
->start dispatch. The six sensor descriptors are static const and are
never freed, so the store guards nothing: drop it from every handler,
and remove the three handlers, their prototypes and their .disconnect
initializers that are then left with nothing to do.
m5602_stop_transfer() also runs arbitrarily later than disconnect, by
which time gspca_dev->dev is freed because gspca takes no reference on
the usb_device, so return early there when gspca_dev->present is clear.

Closes: https://lore.kernel.org/all/CA+0ovCh63ei3SWria1JexWc0r9ckhj=XVNhXSzgHQFMUEj+ypA@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/media/usb/gspca/m5602/m5602_core.c
+++ b/drivers/media/usb/gspca/m5602/m5602_core.c
@@ -356,6 +356,12 @@ static void m5602_stop_transfer(struct gspca_dev
*gspca_dev)
 {
 	struct sd *sd = (struct sd *) gspca_dev;

+	/* gspca_stream_off() runs this even after disconnect, when the USB
+	 * device every sensor register access goes through is already freed.
+	 */
+	if (!gspca_dev->present)
+		return;
+
 	/* Run the sensor specific end transfer sequence */
 	if (sd->sensor->stop)
 		sd->sensor->stop(sd);
--- a/drivers/media/usb/gspca/m5602/m5602_mt9m111.c
+++ b/drivers/media/usb/gspca/m5602/m5602_mt9m111.c
@@ -383,11 +383,6 @@ int mt9m111_start(struct sd *sd)
 	return err;
 }

-void mt9m111_disconnect(struct sd *sd)
-{
-	sd->sensor = NULL;
-}
-
 static int mt9m111_set_hvflip(struct gspca_dev *gspca_dev)
 {
 	int err;
--- a/drivers/media/usb/gspca/m5602/m5602_mt9m111.h
+++ b/drivers/media/usb/gspca/m5602/m5602_mt9m111.h
@@ -108,7 +108,6 @@ int mt9m111_probe(struct sd *sd);
 int mt9m111_init(struct sd *sd);
 int mt9m111_init_controls(struct sd *sd);
 int mt9m111_start(struct sd *sd);
-void mt9m111_disconnect(struct sd *sd);

 static const struct m5602_sensor mt9m111 = {
 	.name = "MT9M111",
@@ -119,7 +118,6 @@ static const struct m5602_sensor mt9m111 = {
 	.probe = mt9m111_probe,
 	.init = mt9m111_init,
 	.init_controls = mt9m111_init_controls,
-	.disconnect = mt9m111_disconnect,
 	.start = mt9m111_start,
 };
 #endif
--- a/drivers/media/usb/gspca/m5602/m5602_ov7660.c
+++ b/drivers/media/usb/gspca/m5602/m5602_ov7660.c
@@ -316,8 +316,6 @@ int ov7660_stop(struct sd *sd)
 void ov7660_disconnect(struct sd *sd)
 {
 	ov7660_stop(sd);
-
-	sd->sensor = NULL;
 }

 static int ov7660_set_gain(struct gspca_dev *gspca_dev, __s32 val)
--- a/drivers/media/usb/gspca/m5602/m5602_ov9650.c
+++ b/drivers/media/usb/gspca/m5602/m5602_ov9650.c
@@ -544,8 +544,6 @@ int ov9650_stop(struct sd *sd)
 void ov9650_disconnect(struct sd *sd)
 {
 	ov9650_stop(sd);
-
-	sd->sensor = NULL;
 }

 static int ov9650_set_exposure(struct gspca_dev *gspca_dev, __s32 val)
--- a/drivers/media/usb/gspca/m5602/m5602_po1030.c
+++ b/drivers/media/usb/gspca/m5602/m5602_po1030.c
@@ -543,11 +543,6 @@ static int po1030_set_auto_exposure(struct
gspca_dev *gspca_dev,
 	return m5602_write_sensor(sd, PO1030_AUTOCTRL1, &i2c_data, 1);
 }

-void po1030_disconnect(struct sd *sd)
-{
-	sd->sensor = NULL;
-}
-
 static int po1030_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct gspca_dev *gspca_dev =
--- a/drivers/media/usb/gspca/m5602/m5602_po1030.h
+++ b/drivers/media/usb/gspca/m5602/m5602_po1030.h
@@ -149,7 +149,6 @@ int po1030_probe(struct sd *sd);
 int po1030_init(struct sd *sd);
 int po1030_init_controls(struct sd *sd);
 int po1030_start(struct sd *sd);
-void po1030_disconnect(struct sd *sd);

 static const struct m5602_sensor po1030 = {
 	.name = "PO1030",
@@ -161,6 +160,5 @@ static const struct m5602_sensor po1030 = {
 	.init = po1030_init,
 	.init_controls = po1030_init_controls,
 	.start = po1030_start,
-	.disconnect = po1030_disconnect,
 };
 #endif
--- a/drivers/media/usb/gspca/m5602/m5602_s5k4aa.c
+++ b/drivers/media/usb/gspca/m5602/m5602_s5k4aa.c
@@ -709,11 +709,6 @@ static int s5k4aa_s_ctrl(struct v4l2_ctrl *ctrl)
 	return err;
 }

-void s5k4aa_disconnect(struct sd *sd)
-{
-	sd->sensor = NULL;
-}
-
 static void s5k4aa_dump_registers(struct sd *sd)
 {
 	int address;
--- a/drivers/media/usb/gspca/m5602/m5602_s5k4aa.h
+++ b/drivers/media/usb/gspca/m5602/m5602_s5k4aa.h
@@ -67,7 +67,6 @@ int s5k4aa_probe(struct sd *sd);
 int s5k4aa_init(struct sd *sd);
 int s5k4aa_init_controls(struct sd *sd);
 int s5k4aa_start(struct sd *sd);
-void s5k4aa_disconnect(struct sd *sd);

 static const struct m5602_sensor s5k4aa = {
 	.name = "S5K4AA",
@@ -78,7 +77,6 @@ static const struct m5602_sensor s5k4aa = {
 	.init = s5k4aa_init,
 	.init_controls = s5k4aa_init_controls,
 	.start = s5k4aa_start,
-	.disconnect = s5k4aa_disconnect,
 };

 #endif
--- a/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
+++ b/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
@@ -374,8 +374,6 @@ int s5k83a_stop(struct sd *sd)
 void s5k83a_disconnect(struct sd *sd)
 {
 	s5k83a_stop(sd);
-
-	sd->sensor = NULL;
 }

 static int s5k83a_set_gain(struct gspca_dev *gspca_dev, __s32 val)
