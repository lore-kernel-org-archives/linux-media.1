Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636254;
	b=XFVNj2HltquM2zUFUbOB4ZmoPXiC5TQ4vitVWlElA3kPRuMO2sq8JkZyz8mnIAYDg6fd
	 AFv1/RtdVO6Odw6taXdFWBANfIOnL8AYntZYKDrYy12zHUK+k8gYDYtrtkxPn/ohv7EBv
	 fPZCeOKtt3xZt3i85wfcW0jPjlf5L8sT5TM4x1iZpaFSaPTLoRkiJZxQjy4DMdXr9OJd+
	 is/k09hkrcgJP/6a2JOHWQolU3UPczrJ7CucB/gGbbzbJeh1n086R70ln7h2ZR98k6+HC
	 +gOI1PGc2Be0owMgZYsKtv+CW0gesTSyE6m9EDiQoBVx22KlwfuwvHO8mAjbbdnma0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
	b=nt1GVdVdOGGWbn60ZJBwhb5TH/bOSHym2BGQzBJrZ8k1Qcxnp17GG6nebFwy3GI4c3bz
	 FnNFwEWmbPa6y/CCQTatDQKAMYNaCp4COcYwCBC6/AJXfnc+6K6WYGPWezhns3jE4CGCd
	 bJbgT6OHX7GxqBH6wn9xKqX41Ggqz9C75QmZ9GBQHsL0x47ee1+yJ5xWNHNI5y73DkUGX
	 foWm2K6cldHhwSvDaNbZ4nh/dDr2j3kTsK0wj+HLdh9PivnciWuneJOnDpBvLIc/OOPLP
	 2PZPb0iZz7xM63nXd5GsgZeOh9f+QPN1s+Wbt6SChK9LghJHJVq0YkI8mUnJAkStpeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q049bUN8;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4377B606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4377B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q049bUN8
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53ec92375d2so3761994b6e.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636253; x=1796241053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=Q049bUN8nj8oNdzlXd0gXC7uw3IDXMZErYyqE2Z+bzNGf0NXUTZsQpY2WDv1wxDPBv
         YO3L8ru3Yyu7HjYZl5NeN5nQFkpncAltnqsHHmidt2aim96uLGU4ar+b9OXBpo4bfLGi
         kek1k9xMli2PfEq0rIJCVVhyrmjCHaF3MKFMxt/FgYJqLpp4+gf5SO/u7MvTRFcwZGxK
         PA6krLQ77SG/0k0ESZFje64oh4yLOvptrVnTqhV1JtJXiMptupPTCHdtAf4aprUy5hET
         QbVnIi/2Dn+sUCaCnB7QuUXRUFlBf6BvsbDq8CntrvwDO0swwBXcRS9MbwvpxIG1/qgP
         pldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636253; x=1796241053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=ySyluKAFJV6asCIeVJ3EY0dck3xZDeXmNBO/iXTAKJgI0ZanS8pRoWHCxUmGScks2e
         jXfXpyovhBfdshaTmmGaj87pDmd3xNEQiccrVJ1d5tXBLN5yYm/KEZG100xZ5GTjMIh5
         RGULR8/5SjLlMe3smnkQkqu+ATfg4rvPlqcgljmufpbsteBa0zLIPwxdlOaIyLvTC3sV
         IyMEBA4Shi6aaU5EU20DYa4I2bXBacE8dPbj6zaZjgRnGMaMG6kuBgmtbVku5cPuOO3H
         WE0tCRlalMrxL7TaL8+Jg9NWC0ow9VR+U+2RoY9W60SHRSSATeOSSM8MlZtE1Tfw+6m+
         f7wg==
X-Forwarded-Encrypted: i=1; AL+hErGE+Oh3hM2uQ+vdsm/O3Qm1hHXRIbL3idXY97qLxDdzLlh0jaGDdKEoUoXC5B3O7RRKnxZFYczZGsUROg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+whdEPk7Ltp/+ZhN4u4Kdw9rkfEFTYswUnZNh5kKMS++8TfORM
	asjDtmseSqEkFQ+l7YbcXUyYDFKZAzYOy0QQq0K0ppu00IWYhNVXrsg=
X-Gm-Gg: AZFdTZcZwjJfWxwxbWNtQbBSvMPehCGHyQWlyU8N8aqL0uMeOJsmcn0OZwOigk5Ylpi
	NAG6M2bMjhra+wRZWjkiZXFsAD+abAhCgSVxKg6G3yekWFCdHi7uqSUPw1rjVfamXpxtHEKNgKr
	VrSRUzfGWaNlBT/4T/NXyU/Jnice+O3a0tQl5ufgIq5JZpgopA+U/87I2cI7qWV3QCv2eGWiEXN
	9f5mrJl9sYY4f/IfMo3Rti3sxdLyWngvJf6m5W3ZdMEje/qQDB87/jBafoNMHSQwYT6IRL56Nxf
	pPRko+YDXPgiNoIRzjjWmYhrlOPyYqyGIp8Rv4LMQGTN3+wwqdBHjhR1Ilw2dxPBUrdbEgeorQs
	s0Al3Apby78DxVta99HHg+7z/UgpU9+h+tbS2LFi+PeaVdkm08uyE1WiVxOwqlkaoUUosk3T2l4
	9X0wgDLjCdDqfcw8f1sKn4U6JuEAfIGO+haLycZ/aF0Bco73E86R6iUer15/yFZ7WO7pGQDOAE5
	Cy0j5oT3BQUDwmst+d+XpzFwUnyf1PZDkxlhru2TqnnnrlO/imBKI4d+YDSM2C7TRCRK+USt3xG
	H3Wq0PhhQkpebvEnfSzs2Ou9uNbECtAE6tWBIpF6m806UGdi20d1TxDA
X-Received: by 2002:a05:6808:3088:b0:567:c44d:c1fa with SMTP id 5614622812f47-57a0a60d7f3mr22430239b6e.16.1795636253124;
        Wed, 25 Nov 2026 11:50:53 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:52 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 04/12] media: tw9900: add saturation, hue and sharpness controls
Date: Wed, 25 Nov 2026 13:49:43 -0600
Message-ID: <20261125194951.19072-5-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add additional V4L2 controls for the tw9900 that modify the appropriate
registers for saturation, hue, and sharpness, sourced from the datasheet.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index df8c7b1f3450..42fc2afbbc77 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -41,6 +41,11 @@
 #define TW9900_REG_CNTRL1			0x0C
 #define TW9900_REG_BRIGHT_CTL			0x10
 #define TW9900_REG_CONTRAST_CTL			0x11
+#define TW9900_REG_SHARPNESS			0x12
+#define TW9900_REG_SHARPNESS_MASK		GENMASK(3, 0)
+#define TW9900_REG_SAT_U			0x13
+#define TW9900_REG_SAT_V			0x14
+#define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
 #define TW9900_REG_OUT_CTRL_II			0x1B
@@ -252,6 +257,26 @@ static int tw9900_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = tw9900_write_reg(tw9900->client, TW9900_REG_CONTRAST_CTL,
 				       (u8)ctrl->val);
 		break;
+	case V4L2_CID_SATURATION:
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SAT_U,
+				       (u8)ctrl->val);
+		if (ret)
+			break;
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SAT_V,
+				       (u8)ctrl->val);
+		break;
+	case V4L2_CID_HUE:
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_HUE,
+				       (u8)ctrl->val);
+		break;
+	case V4L2_CID_SHARPNESS:
+		ret = tw9900_read_reg(tw9900->client, TW9900_REG_SHARPNESS);
+		if (ret < 0)
+			break;
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SHARPNESS,
+				       (ret & ~TW9900_REG_SHARPNESS_MASK) |
+				       ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -701,7 +726,7 @@ static int tw9900_probe(struct i2c_client *client)
 
 	hdl = &tw9900->hdl;
 
-	ret = v4l2_ctrl_handler_init(hdl, 2);
+	ret = v4l2_ctrl_handler_init(hdl, 5);
 	if (ret)
 		goto err_destory_mutex;
 
@@ -711,6 +736,12 @@ static int tw9900_probe(struct i2c_client *client)
 			  -128, 127, 1, 0);
 	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_CONTRAST,
 			  0, 255, 1, 0x60);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_SATURATION,
+			  0, 255, 1, 0x80);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_HUE,
+			  -128, 127, 1, 0);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_SHARPNESS,
+			  0, 15, 1, 1);
 
 	tw9900->subdev.ctrl_handler = hdl;
 	if (hdl->error) {
-- 
2.47.3

