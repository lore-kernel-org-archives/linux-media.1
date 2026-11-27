Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821109;
	b=yPl4tE+XDX0QqedqafhESKQDAuFCI1A/f4/gm6avaJ/T0IQfjo9utHefI/BdQlr/8Wo0
	 DnWMBcsc3cdZV5I9gfRvtRFUfU/De6T59sis7AzwC7BmbXrlUGCjcRMlNJKlhr5liKv49
	 ORV2PXSvb0yWudbzBq1haX4jF+QO58a8NvKh6yIIsmc71wq+yFfDTPTNl1ZXsMMb470Sq
	 L1XE7xjZJFsvOAIVXJkP8b+Hlg5xxSRPhpZO+HMmWLQEP3dBdNON1Qmc33HVA0alU1NbK
	 KdggaODWvMkktEaWavCBX9+XiokLigYDfz38mF8DBXVfu2CJS/EM5tKzSIpqBF820Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LUWmniYlZDaP94X7INk1CV8JRgN4A8pJTXvzIqburrA=;
	b=aiejWwKv6dpGRs24/b+39qAh3PNF+n7r73RvLbgGYoQfPF2Ac7UmSQF6RfT6YEmd9jCz
	 1LxybN8p/1o8+Nkn9/0SOBgMjOWEyvucbIeKqH/sG4WDmTqqd6YR5Gte8bM8cAsG0TwLs
	 v7J3VzU2pkh+1Zwpz7U0X9K2IGYFmAy5c4OuvQMXhxEuCBGwj8pQuzBViNEutZDvqhvuQ
	 fd9oIvJF2cosT7JN5/ORfb+ZcG6KRRv5tofrXEccGyL2EnfqTJSeouWjEAmGNJetugFW4
	 1QgCqno/bBVlc+fOIlAlvVH8vbUko3BWj4g/YFnKgoeoA8z3y0eh94aABRw76qcvBKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrNCeTDL;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CFA606A33F
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 23:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CFA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrNCeTDL
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so67324195e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821107; x=1796425907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUWmniYlZDaP94X7INk1CV8JRgN4A8pJTXvzIqburrA=;
        b=hrNCeTDLno4XAB1aTm4lSDv+1R4XyF9RlnderEX1Tagu3t4hokYLROZewUxBPvC+Dt
         /gbzc+dF8Za36a/AogoVP7/aPmTNngNFH+oDlBRJRTA+z2FRNKdhNP0mUX++5VNgv02f
         xf2K2Rx2rq9m2TJURe/LkDz4Kj1vPGblXPm1CnOhbUogM1dIAKPuUj4zkwNObQqMyHmR
         5+fIz4kX55ZaYynppeq3Oi8Moh1uoFbwgE/2yaiuJ4l/Gc+1fF5vCssv3SPaKAm1rVbl
         0GOBigv6QvYfsqW7fLa/o0szut9tIO6vz3Cds5j35+l0wlYYZ6Vcpf728CPn2JLD+gPY
         te1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821107; x=1796425907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUWmniYlZDaP94X7INk1CV8JRgN4A8pJTXvzIqburrA=;
        b=Sz5PVuV2hf8axxSFP7zuAvGR7Td7n3H+VUcY+dPPAVqqbioUOuY5SFar6dzK/iaYNY
         SHQY9BV3h+pyNvc3Zas8yDJXZRHv5awpOBIa0YkPOfhwPeFb4XJvaqpd8ROZtru5UONj
         HRUe+2/er+C7UoMnNux2vYXez7fjmx66XAQLLb2yEwgR9rGmBqtcFBr1p7qS1IaPLUeM
         lgTIaDLpV97tyzeN+Zzd+IR6usEZzQlDQr2lSHa1rIAS5ExCOG+95XC5Bwn9AG+FwX+n
         vlHWFGYCiLS5HZL4uyySdETttzOBXbsxZ/sgeYpUC9a0eDYo2Sen6S54fbll7nT4hfgh
         XeXg==
X-Gm-Message-State: APuU4Z80eTYQWC8HUgdSIlSf1BuxsQehWoXVjaDwpI47b9gy55mulYn9
	Daa/sxF+7T38eebjBhSntHzzgHtfb8suiKWgljB41sqWoGYRlltaa80O
X-Gm-Gg: AZFdTZeyiN8/7Jzv3C9Q3X2fcqvGNwNar8Bc8432/L2cyZ17q/1UOIc2FLrkOiHMBQf
	+HU2NL23f26DjQG1GUD1c+c0Vtr71Wgx8rK/Qz8Kht9dn5yNL1kbkAmsi1U9Nh2qi0ZLNclOPSj
	hHP8dfZbL1ldgz9Atlik+3mSI7Mr3hsOvDY3u4DtMlupv+2STScwgzWbH19inPYbuI/dE5SRXLU
	Dqv3dSn/n+hniSs7UxVFottAwO1aUqTZkY8Hky/jUXLqegAfkslUBsK0iIHrg/+2JFp83INQ/dF
	m6rIOesh5+z1uHPVU0gvGtAPVEVtx2AwsmVPF4N+NJsSuceBlFJHtlrg4udKX/YxaiczZeslW2u
	6bTw0wgO/6/sNfxL7yZPNKcg1yiWXBJTWSw5OJsafSLyF3tDyPN3ITpvOKYnmnP3mJd6JD6SvzV
	SYR9jC9Z68+aKj3/WpLDwI2iMbgOkQlvumgNyzkt1ieKWpfyezpw2lgmDitAu3lRDnr6A7yRm1O
	RdDf0BWtLgw4LVJMOMX8RTg5cWxw2nSVEWKonxDlVFZNd/Cl/FAHwDFEWsdRv4PryqizIQY70A3
	5NQtHPaIxymDJ200NeiADJ3pxakweANArRU8M+Bh/ktZpJj/u3v1KU4D08Dazd04U985q2mH/j9
	INN4hDs5wSvc6TJ4tAWETb7Ll/vH4OIa6jRIOq0kBHK5SBHAz8ivS8PWBQrtMdIWgow==
X-Received: by 2002:a05:600c:a086:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb88817ef1mr545964755e9.24.1795821106791;
        Fri, 27 Nov 2026 15:11:46 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:46 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Date: Sat, 28 Nov 2026 00:11:34 +0100
Subject: [PATCH v3 2/4] media: i2c: ov5693: Write format and crop changes
 to a powered sensor
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ov5693-fixes-v3-2-bcdd169958b6@gmail.com>
References: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
In-Reply-To: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=4352;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=GQzxuTlGBx39QbJpsp8CzmHudg6Se0jD65Ot2ih8Aw0=;
 b=svXNGhHnU4I2+UFuJHyFvpGDw50K8qVZ15pHuca6IIwjyb+IT9FpTakQGQkGSsNior39BKSSm
 ryHeazNDyHUDOHc20gbfrdk2a2v01mGkFl9nUIGDYEMLfnr8ho4G2vS
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

ov5693_mode_configure() is only called on power-on, from
ov5693_sensor_init(). If the sensor stays powered between two streams
with different formats, for instance during the runtime PM autosuspend
delay or with runtime PM disabled, the registers for the second format
are never written and the sensor keeps streaming the first one.

Keep writing the mode registers on power-on, and also write them from
set_fmt() and set_selection() on the active state when the sensor is
powered. pm_runtime_get_if_active() is used rather than
pm_runtime_get_if_in_use() so that a change made during the autosuspend
delay is written too.

Writing them while streaming would change the readout under the
receiver, so refuse format and crop changes on the active state with
-EBUSY while the sensor streams. set_fmt() and set_selection() now take
the driver lock for the whole operation.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Link: https://github.com/linux-surface/kernel/pull/181
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 46 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d221f7951..3cab73b89 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -168,6 +168,9 @@ struct ov5693_device {
 		unsigned int vts;
 	} mode;
 
+	/* Protected by lock */
+	bool streaming;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -832,6 +835,27 @@ static int ov5693_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+/*
+ * Program a new format or crop rectangle on a powered sensor. A sensor that is
+ * powered off gets it at the next power-on, from ov5693_sensor_init().
+ */
+static int ov5693_mode_update(struct ov5693_device *ov5693)
+{
+	int pm, ret;
+
+	pm = pm_runtime_get_if_active(ov5693->dev);
+	if (!pm)
+		return 0;
+
+	ret = ov5693_mode_configure(ov5693);
+
+	/* A negative value means runtime PM is disabled, with the sensor on */
+	if (pm > 0)
+		pm_runtime_put(ov5693->dev);
+
+	return ret;
+}
+
 static int ov5693_set_fmt(struct v4l2_subdev *sd,
 			  const struct v4l2_subdev_client_info *ci,
 			  struct v4l2_subdev_state *state,
@@ -845,6 +869,11 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 	unsigned int hblank;
 	int exposure_max;
 
+	guard(mutex)(&ov5693->lock);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && ov5693->streaming)
+		return -EBUSY;
+
 	crop = __ov5693_get_pad_crop(ov5693, state, format->pad, format->which);
 
 	/*
@@ -877,8 +906,6 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
-	mutex_lock(&ov5693->lock);
-
 	ov5693->mode.binning_x = hratio > 1;
 	ov5693->mode.inc_x_odd = hratio > 1 ? 3 : 1;
 	ov5693->mode.binning_y = vratio > 1;
@@ -904,8 +931,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 				 min(ov5693->ctrls.exposure->val,
 				     exposure_max));
 
-	mutex_unlock(&ov5693->lock);
-	return 0;
+	return ov5693_mode_update(ov5693);
 }
 
 static int ov5693_get_selection(struct v4l2_subdev *sd,
@@ -955,6 +981,11 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
+	guard(mutex)(&ov5693->lock);
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE && ov5693->streaming)
+		return -EBUSY;
+
 	/*
 	 * Clamp the boundaries of the crop rectangle to the size of the sensor
 	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
@@ -991,7 +1022,10 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
 	*__crop = rect;
 	sel->r = rect;
 
-	return 0;
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	return ov5693_mode_update(ov5693);
 }
 
 static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
@@ -1012,10 +1046,12 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		}
 
 		ret = ov5693_enable_streaming(ov5693, true);
+		ov5693->streaming = !ret;
 		mutex_unlock(&ov5693->lock);
 	} else {
 		mutex_lock(&ov5693->lock);
 		ret = ov5693_enable_streaming(ov5693, false);
+		ov5693->streaming = false;
 		mutex_unlock(&ov5693->lock);
 	}
 	if (ret)

-- 
2.56.1

