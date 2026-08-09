Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C72777F3
	for <linux-media@vger.kernel.org>; Sun,  9 Aug 2026 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786298478; cv=none; b=MLTsOo3gC4j8671IEaVPVQVR7gTrSI3CHOZWz1BKTgD3k4D0UbXszaLb8BTQAV+63Of+rwtaZPrstdplsMgwanpFA0u2AHbbqdxqmE4bTYiZsI59ktqoGeqObamGGCJE062bshIfRZTAJqAANfZV7wiJmJMpC5OkPAZTiOMkWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786298478; c=relaxed/simple;
	bh=gzifpgE9ICFIAAZYvC8/pUI2qeWn+jZ0r69/l67bSCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2N6TH81SEBa9ZRHtmAF6ncFpET0gG1pR+7mIcWxVn9sX/7rYQLBaQoRLpFNs60G2DIz/0MfkAGv+sNhdIaKo1q168xyw20PlrFCfCiHnchBCYwNBsGs/LWsJYeAHKctfG5CCviIZ3jrPHy9E0Js01lCg3uSETZh8jxzqCf/AEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/QNOwaP; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/QNOwaP"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1150418a91.1
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786298476; x=1786903276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SufUvnVfKIwI4mamqZ79S0mhPSYgYY811KsbCw73B2k=;
        b=N/QNOwaPnquDk7kj4QhBvxWPo/B91DMhpS1Fv40BnePt/bJqfB/uJo9rNGl4Q1KeKi
         Df13IURqv1+GupxIiyJz90udIH5FxjCVuxoTs6rws9gEkmV+Xmk1ftw/V9TTxoxCHAFa
         C6GyBJtzWkxRtOZ1VnUUd9WRlHmUmXQH9Lc0j34YPMrnlZy0AE27y4znSb8inVm7bzzV
         P4hevld60FbwPoKvYpcHVIikFL4I8f5Eip6quJ2lesbSA9qDUtkYrAWBc0Rg2JVyCuFP
         iPyZaojj6/IJZIEh+EdHmztT4slhW+Cd5GtYJ+KpSPNnym9DIJVyQhpCZdEBTocVNSHz
         fxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786298476; x=1786903276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SufUvnVfKIwI4mamqZ79S0mhPSYgYY811KsbCw73B2k=;
        b=iGT58K7HLse3MhNuuxdwD7SQDkKO7/AauOok76OSe+Oc7mkbUzoKAV3CYkR+DS9OzE
         x3O4VsjlfPVm7+2HhqpCCgKqN7Q0/MKhKo7kXEdIOAfRLzZS7myg8WeRIvbX0y4fJQSc
         21ScO+ozvOCoyHEPIPyVlOwTtFDSicEomb1ZdTr3S6C1zQwMFjtmG6PvQgoGy0QnVxHk
         YRnMXKcMaaaZ9k386btSN+NBe7AaYvMxh8/F+q4xaylj2DWBxvDl2cIwSPbYu4GSf4YP
         gDO/1g1Muzv8WI0kzj4z5DEbP3Y8k+wrFB5z6FF2mnXAYazGdOi8z11b7S41v3tGvbab
         ujfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpK9wUcWyxfEeqU/bgtGWKDc3rD0H3tlXTJbGLOSxRDQ8JuVn7lYFt3hBR5Pqijll4i3oq/Eo67Y09tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4g9Tc943FEALAapbcteYp7jd7eOBPDIZO06DzoYzGgFXOWgsR
	yNOOClWjCbU/7041JCTblqnQdObGDGq7WTg6PSrDnmiNVcb+bS/jpSyV
X-Gm-Gg: AR+sD13p1gpURawLpwnX6EXwefLphtwCXw9Fx0mozo+ylKWyolUdYVJRcJ+0rmr1Lz8
	lyFcpg+EwQwNEJ9ABZdLJmtA9tNiU5rNqfDGoFUWOmzhC04vhLhMPij7srSNB7h2hMSicMUJtqB
	FXKpB8jZZnEp+p8gwbh9twnD6Ltvl0ceAGQN7Kcmnbs5CPCK4EH57CLaCidjYOqKLxyr3Xm83Si
	DXYgBZle4rRb39Hk7nuDcSV0X7aWauvooW17laUFkY1lbY5bWc4VJrqCmeOXMomkUs5FjoOYF8Q
	naK20nJQUa9kJQrR5EBp0kuAsVNNzwU4qkxk4+F/v3+h+6TR2AvnkVoJUw8jQvVxUg2uprRgQd6
	ZuQxJ4m4GpqzAXleaAynid38x2+ptDhwpe2vEX/5FyfN3TecbTGRHQS5mznwbPgo21if5hmWL9e
	tj3VRXY3DgQqffUWhdCE8uK2pnG94EIRRmD2NEkiWPdTlm7FohIPbF4jB61qY=
X-Received: by 2002:a17:90b:540f:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-3903c5b7247mr40709313a91.15.1786298476026;
        Sun, 09 Aug 2026 11:01:16 -0700 (PDT)
Received: from PC.. ([103.172.209.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm37111527eec.23.2026.08.09.11.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 11:01:15 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mohit Mishra <mishraloopmohit@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [RFC PATCH] staging: media: atomisp: remove redundant ov2722_startup() helper
Date: Sun,  9 Aug 2026 23:31:05 +0530
Message-ID: <20260809180105.58428-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In atomisp-ov2722.c, ov2722_startup() was invoked inside
ov2722_set_fmt() to program sensor hardware registers during format
negotiation, accompanied by a "TODO: remove it" comment.

Standard V4L2 subdevice drivers do not program hardware registers during
.set_fmt(), but defer hardware register configuration to stream start
(.s_stream(1)).

This patch:
1. Removes the ov2722_startup() helper function and its TODO comment.
2. Refactors register initialization into a static
   ov2722_startup_registers() helper.
3. Moves sensor software reset and resolution register array configuration
   into ov2722_s_stream() when enable == 1.
4. Preserves the PMIC power-cycle retry loop on startup failure inside
   ov2722_s_stream(1) to maintain hardware fault-tolerance for AtomISP
   tablets.
5. Updates ov2722_set_fmt() to purely update internal software state.

BEHAVIORAL RISK & UNTESTED NOTICE:
This is a functional timing change. Deferring hardware register writes to
.s_stream(1) has not been tested on physical Intel AtomISP hardware.
Submitted as RFC for review by AtomISP maintainers (Hans de Goede,
Mauro Carvalho Chehab).

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 109 +++++++++---------
 1 file changed, 53 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..5cbfbe5217a4 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -599,39 +599,14 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* TODO: remove it. */
-static int ov2722_startup(struct v4l2_subdev *sd)
-{
-	struct ov2722_device *dev = to_ov2722_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	ret = ov2722_write_reg(client, OV2722_8BIT,
-			       OV2722_SW_RESET, 0x01);
-	if (ret) {
-		dev_err(&client->dev, "ov2722 reset err.\n");
-		return ret;
-	}
-
-	ret = ov2722_write_reg_array(client, dev->res->regs);
-	if (ret) {
-		dev_err(&client->dev, "ov2722 write register err.\n");
-		return ret;
-	}
-
-	return ret;
-}
-
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov2722_resolution *res;
 	struct camera_mipi_info *ov2722_info = NULL;
-	int ret = 0;
 
 	if (format->pad)
 		return -EINVAL;
@@ -662,38 +637,8 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 	dev->pixels_per_line = dev->res->pixels_per_line;
 	dev->lines_per_frame = dev->res->lines_per_frame;
 
-	ret = ov2722_startup(sd);
-	if (ret) {
-		int i = 0;
-
-		dev_err(&client->dev, "ov2722 startup err, retry to power up\n");
-		for (i = 0; i < OV2722_POWER_UP_RETRY_NUM; i++) {
-			dev_err(&client->dev,
-				"ov2722 retry to power up %d/%d times, result: ",
-				i + 1, OV2722_POWER_UP_RETRY_NUM);
-			power_down(sd);
-			ret = power_up(sd);
-			if (ret) {
-				dev_err(&client->dev, "power up failed, continue\n");
-				continue;
-			}
-			ret = ov2722_startup(sd);
-			if (ret) {
-				dev_err(&client->dev, " startup FAILED!\n");
-			} else {
-				dev_err(&client->dev, " startup SUCCESS!\n");
-				break;
-			}
-		}
-		if (ret) {
-			dev_err(&client->dev, "ov2722 startup err\n");
-			goto err;
-		}
-	}
-
-err:
 	mutex_unlock(&dev->input_lock);
-	return ret;
+	return 0;
 }
 
 static int ov2722_get_fmt(struct v4l2_subdev *sd,
@@ -746,6 +691,26 @@ static int ov2722_detect(struct i2c_client *client)
 	return 0;
 }
 
+static int ov2722_startup_registers(struct v4l2_subdev *sd)
+{
+	struct ov2722_device *dev = to_ov2722_sensor(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
+
+	ret = ov2722_write_reg(client, OV2722_8BIT,
+			       OV2722_SW_RESET, 0x01);
+	if (ret) {
+		dev_err(&client->dev, "ov2722 reset err.\n");
+		return ret;
+	}
+
+	ret = ov2722_write_reg_array(client, dev->res->regs);
+	if (ret)
+		dev_err(&client->dev, "ov2722 write register err.\n");
+
+	return ret;
+}
+
 static int ov2722_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
@@ -754,10 +719,42 @@ static int ov2722_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&dev->input_lock);
 
+	if (enable) {
+		ret = ov2722_startup_registers(sd);
+		if (ret) {
+			int i;
+
+			dev_err(&client->dev, "ov2722 startup err, retry to power up\n");
+			for (i = 0; i < OV2722_POWER_UP_RETRY_NUM; i++) {
+				dev_err(&client->dev,
+					"ov2722 retry to power up %d/%d times, result: ",
+					i + 1, OV2722_POWER_UP_RETRY_NUM);
+				power_down(sd);
+				ret = power_up(sd);
+				if (ret) {
+					dev_err(&client->dev, "power up failed, continue\n");
+					continue;
+				}
+				ret = ov2722_startup_registers(sd);
+				if (ret) {
+					dev_err(&client->dev, " startup FAILED!\n");
+				} else {
+					dev_err(&client->dev, " startup SUCCESS!\n");
+					break;
+				}
+			}
+			if (ret) {
+				dev_err(&client->dev, "ov2722 startup err\n");
+				goto unlock;
+			}
+		}
+	}
+
 	ret = ov2722_write_reg(client, OV2722_8BIT, OV2722_SW_STREAM,
 			       enable ? OV2722_START_STREAMING :
 			       OV2722_STOP_STREAMING);
 
+unlock:
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
-- 
2.43.0

