Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029738;
	b=jsMEQT6iqH+HORVJ+qGNOX5tIWXQ57CsLwgruZwlvOi9YnPXzjvnFZ/8GKmPll6P1wcY
	 rKHPnOxEhshm4VpRf4mHZtLV/zqYylbyjHRBowZ9gWrSDBFG2Lk3vSjcjqT0gLDVR9I75
	 ofd8AGub6vN378t7isqi/yyCsyEGSjEmK0MiwL/4zVJEPuXDy57p/eGXI8VqQsEtClTIU
	 3ScWCzP3V7FTysK5vSAfnBy74BX3RglunzZhky1O+FifIF0235eIkojGhFgR4kmULQdh+
	 gjrnXBKqnv1aVZqGRxz87RjFSURD7HltkNsX0WAUO91QK7umyY9U4KFvPpkkHZ9boww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
	b=I7D9qc+L+RlsCeAE4iEg4mZVLcdpkMJ2swJLOOlmAxeLuaFQqt7g7Pi0tK2YgEEqY60t
	 xQO5p+dXBnQZBjtH5I7kiA7/O1V7I1chmlX+LuutyKq5socnoIw0NvWTvykAsecvV0uLp
	 EKxvyXg+bwnUysuu1MFZvKdyDFHbgPQhhEAbu0FvCoscMlCi5PxZGFpcH1QkmBCmCd9f5
	 v9+TIOh/B1TqHxCG+RhyNiyBPjXjN8gS4BHpttRDu+IrBW2yTwCZdjQmGCi9eAW1SvJ54
	 fjDniz48CF93jicHwSNcsFCIFm8BodSSxYyLdipEX8bKEBEpK77Tfq80Ro6w/IDFnQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9FjOSXN;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34C606A332
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD34C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9FjOSXN
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6e560e00a86so883169eaf.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029737; x=1795634537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=U9FjOSXNHp003asYYe7PFiG58xDX7z9VHu6PX4Go8XzZw8sfYyA/1QHeGVexWmY5St
         M6EMobBpex+13eNFNGzMsJCnHS+K8TV8O++buET/NyqwUcCFaJktCf15XzT4QUXtVvtg
         ovM9ioicm5U8PLRyk43OIWZ04Q/DWdzDXWAr4bETdlaBv1FMSvJZNJHZAijlvmxItoGL
         UmPyTar6g+VWte1rntzq1skuv14nDrjDB7wRKbBCoUJSBykB/+IlpaOlAF+1OK1Lgh/o
         wA2EVA4bxfE8IATT4etOlZ6LUXsF81rNEV54nX1L0veueRbt4ZGKH04rkHJfO/+K07Rt
         QFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029737; x=1795634537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=eQ5XH8OXk6runm/JPm3wfgTvA7nYrDzuEQxOQsn0k50UPrfKxWw3++pmD9yMHD+7E9
         XQPq2B+N5EjpMiNKnb8/1ARXg9huqubpSx4+31mNXUKJX1uKt70sIEQn05WLNrm5c1ed
         dfXyb70ejdT6kh7B8JWzc+GQUCkgDXLrHemL1R2JcOgSKEJZUyMTwETXqC4RUv7AOTOl
         5OLJrY75tbFflAxDnPw3NUgAXOHzuLMFWMTpkgT41T9wmj7DkE5+G2r+Xkd7Dle9bFy9
         pRhqgL1jUvRrbWNbyZ9ytIolBLiNJsK9qmWADT5S2rFn/cBp/vWEEnBBytkrdUKp1IMv
         ayIA==
X-Forwarded-Encrypted: i=1; AL+hErFZOSzr29AqBsaR0UyI3xz/8vtYZCiuYIXIcN1wBMPJZ397Klq8eadD789PlOayv0titntOkpydxltobg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cf/madH59PpP2GEkrqyGHBOigybnaq0b6ioWzICkYAZghDNIj
	bY2N5ugMuuTlB5PM1nN23bXrNmRDerzAy08QIuS4dz5lEzPUzLcc0Qs=
X-Gm-Gg: AYBFou3LQpHgzk9XCbLH8bX+saieyrKzGkTTryB5LGBiDgycnPbdwPObZOwKqYIUHoc
	GTy4Xd4T3yZxGdHvqgYYsMxzCQbWJjh5c1CMon7kSPMaAm0wLCh6HesBslU7704maYnVz3guRgz
	UyYIaFWxwZMTtITqtLbTN0F6sAPRFGKmaNG+sgL3O+Oqr4iv1D6iOuQ5qc0xX8mytv9ccNcSeea
	v+eW+f62NsUEg/PcDuJ1xJy2ebLwBAPkSXu5xGxbAeXOZmsQjMgMkgo08fZjpODV83MOJF1lfll
	xIFzENtnYOlq/z4TwRAtp+wSD8lAwWzEUbcReNZF46UVTMClc8qf8LroZX6Mqi2j9ml0BuCg7cE
	9z397pba16vmRXLB89BYQmWaUETUnaD1QPfEqEhEujTo6AvRuwp5h39TsxXY0zP9xA0vn7+o8XV
	UnVLKjSUZA8IQTYpBHt5klrhF3ir1QyT8u0JwXpW+egWuc/xaGpwUWYkK9TxKe20T2Qf5U/h9Ir
	2jxP/AvF7BRmlzBSKjhGBjOmMMRr/N5UNcStKwO+b13rsdArMnnOZVLuSrgOf2BUYs6bZp41k84
	s3m6J4bM6b/FIuxvRMcOO27k9vNrs3/CnurClHzfI8FIwIdjmQCWs9dY
X-Received: by 2002:a05:6820:a504:20b0:70b:8831:8c5e with SMTP id 006d021491bc7-71b1853a165mr2213309eaf.51.1795029736537;
        Wed, 18 Nov 2026 11:22:16 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:16 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 3/8] media: tw9900: add saturation, hue and sharpness controls
Date: Wed, 18 Nov 2026 13:21:19 -0600
Message-ID: <20261118192124.23330-4-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118192124.23330-1-matthew.laux@gmail.com>
References: <20261118192124.23330-1-matthew.laux@gmail.com>
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
index 60d5686716f7..d365432e8f89 100644
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

