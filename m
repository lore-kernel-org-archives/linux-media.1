Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A552758E
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904670; cv=none; b=hbU4RclqdXAak/lRT6GwS3kpFp91fdI65Di5o1v+X6JqWUTmvbchFaNA4HHGAYZ/a5sDDBO/5Rp8FoG5Y4PPlRPOHFJwiKYqS04BZoLMMGo7dTgprramso4e1BJlan2u4juohLGi8eFk5lFXuGManOGUKIOjOtdgouALG5TR/z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904670; c=relaxed/simple;
	bh=RY1WCtr9f/kQLLEeiQXWHIcIdE7FXDNxR49ZFI/S/Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsbPaAgeda0nif3hq+OwlWZx3z30WuAOu8bJmLTgxZyggvpu1DiP/fFjgs2g9W3yBaOINJ7aaKpt15qfsJ77LNPjJy9K5IUQaoESk0m/wJeuPaX1yHebmr0pY0VWe210uauY/SgAUuSPNPmWyRwft2Yxkjc+wGgVN7DLTa7RM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tvD7G4VE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tvD7G4VE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3054736f8f.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904666; x=1792509466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Laec1e1QvQEMFqCIyVMV9FORuIqN9Ff8K+K71ukXvAM=;
        b=tvD7G4VErb3uGRwHhS2XaL1RcytedN5BALSUCe6wVlRzw/5mvF4t+STodhGcwKqKe+
         YHtSXp181Iql5kvXziuuOq9JHzIxLCX098XIjL7g8uZmgDnaPOVwXXqEmBxbWILU0uGb
         OdsWVxkovmp/0F+MBOP0eQxk2br5e+dtDB/nIfcohuHow2d67vxzIrJfmTZWnIpZbXpC
         xj/BWZtoYlzb/f+IxktlKkAG/kDD0+1vBkv9RNQMI7tk+3GQu+tSxLPqJFoZAAtVp/5s
         NprMQcF9EJpl1shbLGl8Zw6zfq76YQJ5zqhTXCLqLLrMepbZCvtYuABYbrYr754HMmwx
         +hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904666; x=1792509466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Laec1e1QvQEMFqCIyVMV9FORuIqN9Ff8K+K71ukXvAM=;
        b=L+uwkLkHbpvVyvY/SqYXlD4lLqqKm4VT5Iooa3hTguhUr61eK1eeBJwDSF9dWl/Wss
         GTjBveRfq+5zSxMtGwPbcOfjU1lk5jYWHDsFxmKWPjT12p0/DT5u48bjCphsJE1OF/hT
         kYLK3LNBzqE2yuHVj4ROxuqayFKFoBR7bZdd9dHySU6YXBrnhFB003DKnCUiTGYJXAJH
         gMfYlrKcONECsULkJBu0VC+mF00n7UnSa/DRerf0dZVzt3DIpnPh/E7uNPqE/uv9i+KO
         1uxzoallqTAJwnuj1ZkSiuZrub7scDxNj1EAKgrAzjYR1IaOC75VWPYPVP3gOD3pBdnZ
         DPnw==
X-Forwarded-Encrypted: i=1; AKwUvBx6uvpBD8mt7aGXgA2Ez6PKsmfTdE5jyYJr/YwY9LsJLC4dYzRNxyMLjJjuohzSYlNAHwol0Ev1cgwi3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvkFoMWxAv+Mcf5IVybPutiIPMOYoqND0OBUVNfFDdUUUApUqR
	mg5UQCP9I2NR4V7L9x/a7UUKG/FrKVijEKADCxFXxODJ+S80UplL5HImvdrXmdhcH2I=
X-Gm-Gg: AYBFou16wJNGdUGbpbggwkhUHfRVX/i2saQbQeNkLrxSv9908cHw9omCkKp3OL35t/F
	qp+OPWum9r3tcelSKWu452k+lgxPd4z9nqVQ1PeVkj0rBlf8z14y6JDCQWA080785h5BpzOE57q
	cfFgnBsKML1WGVFmHL1jItub5SaeuzpkXkex3d5ttRa390YIQQ+3faqu/uFYO2rFH301xQ6nY2N
	FRifXKfQfrxamVq5yB1QcvDcaOAU9b7dBxMC52PE4WPRB4R5kEgI20os3x9NdMf6uWA+fDLJw5e
	UB374NPgIpi96sIHUa5K0piHzHNAaQDQqfwKvx7IU+KmERqTSX/F3sx/PtwWwSefi68/1+Lz4fT
	/wiybuF/90NyuCo7OA2Ukfrvh8rLMD8GL1VUH9Ol20EhblF43Ti4/w6YL8CuZOD5JjJ64qS+K6t
	YYGgzbMNZ7r8WqKXhGrTeNWoqsnJz5TnhDq/6kYdGCFez5i+NYSIK7LMZ2hW8A/XUkIHqp1po7o
	XParG43mTtyUfe02WrXreHBdZ+0CpJEcSQCj0uRMFLqHkdTRQ==
X-Received: by 2002:a05:6000:298e:10b0:48c:7f53:9603 with SMTP id ffacd0b85a97d-48dba77d033mr19245755f8f.7.1791904666196;
        Tue, 13 Oct 2026 08:17:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:05 +0100
Subject: [PATCH v2 06/13] media: sony-starvis2: Allow runtime control of
 link frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-6-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

DT allows configuration of multiple link frequencies.
V4L2_CID_LINK_FREQ allows read write control.

Join these up so that link frequency can be configured at run time,
as long as the sensor isn't streaming.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 62 ++++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 66c77c5957e3..2bb438d22ada 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -724,6 +724,7 @@ struct starvis2 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *link_freq;
 
 	/* Track VMAX for exposure updates */
 	u32 vmax;
@@ -754,6 +755,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
 						       starvis2, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
@@ -777,6 +779,25 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 	}
 
+	if (ctrl->id == V4L2_CID_LINK_FREQ) {
+		u32 hmax = variant->hmax_min_link_freq[ctrl->val];
+		s32 hblank;
+
+		if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+			hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
+		hblank = hmax * variant->pix_per_clk -
+					variant->active_area.width;
+
+		ret = __v4l2_ctrl_modify_range(starvis2->hblank,
+					       hblank,
+					       starvis2->hblank->maximum,
+					       starvis2->hblank->step,
+					       hblank);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Only apply control values when device is powered on (RPM ACTIVE)
 	 * and streaming (usage count != 0)
@@ -823,6 +844,12 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(starvis2->cci, STARVIS2_REG_WINMODEV, ctrl->val,
 			  &ret);
 		break;
+	case V4L2_CID_LINK_FREQ:
+		/* The STARVIS2_LINK_FREQ_ enums match up with the register */
+		cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL, ctrl->val,
+			  &ret);
+		break;
+
 	default:
 		dev_warn(&client->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
@@ -937,9 +964,6 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  __fls(starvis2->link_freq_bitmap),
-		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
@@ -1006,6 +1030,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	__v4l2_ctrl_grab(starvis2->link_freq, true);
 	return 0;
 
 err_rpm_put:
@@ -1030,6 +1055,8 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
+	__v4l2_ctrl_grab(starvis2->link_freq, false);
+
 	pm_runtime_put(&client->dev);
 
 	return ret;
@@ -1194,7 +1221,6 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
 	u32 hmax;
 	int ret;
@@ -1210,25 +1236,23 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->vmax = starvis2->variant->vmax_default;
 
-	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
-	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
-		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
-
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  starvis2->variant->pixel_rate,
 			  starvis2->variant->pixel_rate, 1,
 			  starvis2->variant->pixel_rate);
 
-	/* LINK_FREQ is also read only */
-	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
-					   V4L2_CID_LINK_FREQ,
-					   ARRAY_SIZE(link_freqs) - 1,
-					   __ffs(starvis2->link_freq_bitmap),
-					   link_freqs);
-
-	if (link_freq)
-		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	starvis2->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       __fls(starvis2->link_freq_bitmap),
+				       __ffs(starvis2->link_freq_bitmap),
+				       link_freqs);
+	__v4l2_ctrl_modify_range(starvis2->link_freq,
+				 __ffs(starvis2->link_freq_bitmap),
+				 __fls(starvis2->link_freq_bitmap),
+				 ~(starvis2->link_freq_bitmap),
+				 __ffs(starvis2->link_freq_bitmap));
 
 	vblank = starvis2->vmax - starvis2->variant->active_area.height;
 	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
@@ -1236,6 +1260,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 					     V4L2_CID_VBLANK, vblank, max_vblank,
 					     2, vblank);
 
+	hmax = variant->hmax_min_link_freq[starvis2->link_freq->val];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
 	hblank = hmax * starvis2->variant->pix_per_clk -
 					starvis2->variant->active_area.width;
 	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -

-- 
2.34.1

