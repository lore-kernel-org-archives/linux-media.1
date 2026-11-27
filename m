Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811417;
	b=uhl/IxSpK8bvKOmvg3jmyA19Gg71V8DSoLUyOjNgtS3QsP3457P+LDK4K+EEZg1zREp5
	 vyefAAaIGx/itYY2Tsr5yl1We1CxJ5aF6Cra1MXgDXuEhKmgxzJKVy24T1Xw3LC8amlS2
	 ldFNe/ycnsdgkO8JcZCU9UdLd93k5swUf4XlPn07kBDFCNM2oFepmNU2no2erV86Ekqrm
	 oqLE3GR3qUXq8/snGitWZ6bz/XWSiCUPuqb/zkI/KSzhlOBUg+NKtuym9IOYMJtV5Fi6x
	 P+Ptp6x4W8QbA4ADFFzgwUdVWvH778L2+EovRj5YJ59tIWshOBcnRRdxI+xFrIdZaNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811417;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sxHo/yeH59aOAbR5R8qCQWfdz0YGLqcxxJv3PtOxwRY=;
	b=HNv1IyODu+5ji6ohmWYILU06GjUNuzqqwnukcVZfcFCE1oJttpXL5YMwvJYNprfEcdMH
	 o4oglFM8JYgH1gPHuhR+pICDKS49bMSaKwpmCpIFv8SOBApdSrMS8Yn6gLF6nCFe6vaGD
	 BsskoeBmvzhrQ1pm5y+j9DWrpYa8S8HGtPFjd4gm5G9V55RQ5aOfk/qOzMooTEorA16TL
	 eqFyPuMnCL/yJ/W6l7P3w2e8Q30bgsh2g9q/uSXsCwHljMTcPDZs1bkVgwSjZpXTxvtQ/
	 2mRw1hgDzP01WWc9JihKyX43J0mZMLBdlGfVhTyAIedoc4MEqbIt/WvaABbvnzWvfNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2kwwQMD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273A606A321;
	Fri, 27 Nov 2026 20:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2kwwQMD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795811416;
	b=O56AygUQrSrnFM9pRUEtA6LKlXQwIkEnfVGv+lSeQGaiWTq6UAu/xt2LqyIF4uqMGIgB
	 mS98uFp3bwKgOiVVT9OLRf0y6dgksJnj++Kh6Q8Bk1Lqkqh87vR71IgMc3zI+/44Z1Lu5
	 4zDCyaX+8hx+NjJ7JKZN2qRDCyqFmg4UPxMB+BMm1vzA+DGZD7XAqgfhe/utFKUvMd0RN
	 qu8RrkP+TFc46mzKcz9xQnh7BCLgneky6bLrGTziIAqkAc6UStKFNamsB/VR/UbaXY/YZ
	 5w5k96rHG3EwiT9VJINOXIHZerriHE2Ekn2PfHqAgixrB1bVyRiRq7Qd3PTl5ZSY/aA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795811416;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sxHo/yeH59aOAbR5R8qCQWfdz0YGLqcxxJv3PtOxwRY=;
	b=vmRT5nW1+jG/vdyVfarnfkso/NZsQCnnRnlDDQufZwvd8pcdodA4rlAi44ceEWJFRKKw
	 RIRDUdy+YjC/HZHvwlMkJr1ORptRbm6wc/9d1cfjPT+jnlguSWjgK9jj3c91JOyS+yZhp
	 htVood0Lq0SRDKNlbFfX9HlIGiaNCaJiwbtYMMpeM1wZWA60uW3BTBX1m/lF9rwRW2KBZ
	 qjbFTgt09TZzoZAnjm04za7pZ/9p6WjHbRFlHHA1xyi6u/v5EUv5ncFv2Nzfe+CX5gdxJ
	 yYozhJZsT3MTzqU38az8IRmE8rCSSmDpZahEiQazmeWgX1R+84SW/JaTZ8t/EhmWDgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0626D1F0089A;
	Fri, 27 Nov 2026 20:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811416;
	bh=sxHo/yeH59aOAbR5R8qCQWfdz0YGLqcxxJv3PtOxwRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=C2kwwQMDk2KRJgj0uQ/uKmNvmDnnDUT3ywMGlsKOXWBqGmQTFFieH10wKSgdqbHWf
	 bKjLzh1+6AXhdILBfK47xXBGsYZ0YmEWBwP553U3dk7aV7AN+lV2vs1sli8sLLdu0L
	 hH6BOpWs9EC+dBtTC3udUNHCcy4EsgwVbb7vf+6vWWVJGMqNDB9Qni4aqKgWuTAliw
	 eVtoYotjbfa8K1qIO6S456l91Y76Z67DtJfOmH+UvoBS1p3Ad+dkmI93I0gUh8FifP
	 XrM8K1JaTL3BjigT84liZlwH5zrlXXdrFRnJDbDkNbqFWVP+0dp0x1zC7bC/hnhzb+
	 RjLPmZoeScI6g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 84EB04DDC3;
	Fri, 27 Nov 2026 20:30:13 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 21:30:15 +0100
Subject: [PATCH 3/4] media: i2c: ov7251: support non-continuous MIPI clock
 mode
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
Message-Id: <20261127-ov7251-strobe-ncont-v1-3-cefa8c6c020b@gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
In-Reply-To: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795811412; l=2072;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=/eNpqimi84SQ1mCr/1eGNfNixnHzZSLMq/OYFI2mSeo=;
 b=mAtXQ1inRaKpW4tcvKE4rFpASX3cjipF+Ada8ChKBu+XDhkW0TFhuWHApCuZ3BR9ZmdQ6YkT8
 quD/BqE5rjVDVrXDLhFaltWtyGN/26zqXrXodiBE/8e5nQHSzsAmYUT
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Check V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK from the parsed CSI-2 endpoint
in ov7251_check_hwcfg() and set BIT(5) (CLOCK_LANE_GATE) in
OV7251_MIPI_CTRL00 (0x4800) when starting streaming in non-continuous
clock mode, allowing the sensor to gate the MIPI clock lane in LP-11
idle periods.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/i2c/ov7251.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 5a50a5100c1e995714201fb509fb207fa03c5f39..13fcc4cdb31a5e7350bcc0b15d186f4912b074be 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -64,6 +64,8 @@
 #define OV7251_TIMING_VTS_REG		0x380e
 #define OV7251_TIMING_MIN_VTS		1
 #define OV7251_TIMING_MAX_VTS		0xffff
+#define OV7251_MIPI_CTRL00		0x4800
+#define OV7251_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
 #define OV7251_INTEGRATION_MARGIN	20
 
 struct reg_value {
@@ -156,6 +158,7 @@ struct ov7251 {
 
 	struct mutex lock; /* lock to protect power state, ctrls and mode */
 	bool power_on;
+	bool clock_ncont;
 
 	struct gpio_desc *enable_gpio;
 };
@@ -1372,6 +1375,20 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 			dev_err(ov7251->dev, "could not sync v4l2 controls\n");
 			goto err_power_down;
 		}
+
+		if (ov7251->clock_ncont) {
+			u8 val;
+
+			ret = ov7251_read_reg(ov7251, OV7251_MIPI_CTRL00, &val);
+			if (ret)
+				goto err_power_down;
+
+			ret = ov7251_write_reg(ov7251, OV7251_MIPI_CTRL00,
+					       val | OV7251_MIPI_CTRL00_CLOCK_LANE_GATE);
+			if (ret)
+				goto err_power_down;
+		}
+
 		ret = ov7251_write_reg(ov7251, OV7251_SC_MODE_SELECT,
 				       OV7251_SC_MODE_SELECT_STREAMING);
 		if (ret)
@@ -1529,6 +1546,8 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 	}
 
 	ov7251->link_freq_idx = i;
+	ov7251->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
+			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);

-- 
2.47.3


