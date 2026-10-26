Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986658;
	b=s6iGsmG+5MLpQvlMKglZVk3OyYjkFqxvPVrycSP3qVkzZx9Si2JExkCuTjO01F+WhIoU
	 FH3LeQD7O4Ks38aun1Hu39fouIpjfKRac4pbYWyJmLfIzoCnBTDwbhO4WliHn5+LY0PGm
	 8yVl7WCrZ+3HGPWiGPVpX2skOucuc3C2Q1nnaUx9n2B4qYz4Md/WX0mTjm2S7U2RtXO3g
	 0gqkS1w+3oZ5JQ+cOx2DjBmgkM7F2TIPLqArG/1lKnb8MccXS0bebOvhQxmugL/HzdZ5Y
	 j3wpv10rk86SHADn6BITDouwm/bhWkP8IheM8jGyYPKsswJEwapu+J7VSSwzRZZCJVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yevYxKqoMpJZwCLQClSsJi+dFUwCf030YPfXIGC6jzg=;
	b=WDEq2uU3o1SB5Z3dkRlvI4mgat2njEyHzCmwYgATMF8/R/VUEaa82DtmvTTWZlHQVzLO
	 j5bSDgO9zkVHuSciDFO6b//x8zWN4sQuNKliAbo+S3isDXnfExxGu7fm7S45eaUdWI4br
	 I9HYMElq4wuB/qD2brgjeU1Zk1gl0AdGVfBBwyZuhxUNYHvBm/HHyGJyd1ZlzPr8R411E
	 j+h4Xat4RXNocRw4PhFVVUDRWFuu7YUN1+C0lKajmSoMh97KesPxGtENcfKbC7Z0BKRua
	 xN/QOAA/xSA39+B5QXNh7yoAhojGsFrkN2tNpbfo9OBMJeBfhCQ30kykhKofFH1fX4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FEFdGw5u;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CCE606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CCE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FEFdGw5u
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c03744ef27so743940137.1
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 20:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986657; x=1793591457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yevYxKqoMpJZwCLQClSsJi+dFUwCf030YPfXIGC6jzg=;
        b=FEFdGw5uOhVwmlB7IU1kaWdzZEcbir34JRFUKePXEXT+b3PgN0bxZ2Pi6lZs3snMlx
         GSp0mEiJ+lEoCUwCC3tKGFg1gteMWBqDIZZesnt7eOdhyOkT//kBzTsG0OdT30jghpqj
         TQ6dTthYMslQ9SYpkCYorN/ZkV0DDsG9n+xC2fG4utAZJhOolNCXJos6BUJdv7VmaT/8
         k7wLjdBUU1hobbC/GQ6UnPlRbjCk8D4uE6TONFmb1zJSxpTRa8izlhybuEXdqI7Qc/cP
         mO4bI5L6VsZo3i/D+vzOiQpNlA6LnFSh/sCfGQ0ZguwWx+eK+GnPhw/nI9itzTzjdun0
         XxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986657; x=1793591457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yevYxKqoMpJZwCLQClSsJi+dFUwCf030YPfXIGC6jzg=;
        b=YoaOzCiXKDnnO6VHu3VS8844XBnHDIigYnBkwbm1NxlDIQJfqMJUcBC8f7W8/q+Rkb
         rDW0gVeo7kXBvU0WqNhtEuFC3Ha/lzOsouZkOkDUrfZCmVKoXJzByjaG5Xs3SE/86R+/
         6lwR8dMxantvT1Yxs3VkH+HdHWR3XFPj9hlZEherWdD/qBwHc+zeNUgvHxbNAU7J+bku
         xjb7QxZ6CcN1xSAjCJkULIblOFOSRYvxDbul2hqucLF9l2cqoncRaeMRJgwte/l7rLK3
         mOjDJ9AA/sTA3cC5dbsakslr0fyc7qps/rgzj68+Gv4nqDQA48O/h6XFEM3SffuncWIa
         dNpA==
X-Gm-Message-State: AFq9FYI/2nQCPlN2+vXjWYJl5DTqXkFWCnCS2wwZ1SX7pXMZ2srouCbd
	85JORc66cP0qAi9hzng/B3WYnfo9xORB/i9go3wbbtyXet8M1/hHsHFxkykfSe+P
X-Gm-Gg: AYBFou2Ft+v+ryKliyzznNGnR2yhProVoqenDWkp+Ayr7ugQmymNPmFpTfP5Q6ZX5GU
	46Goxgr2jdqkZBn5ymIliQC6IVTCQGbMFXau+/p8yYKPJK5QFKa4aHXpD30OYL2yAP/XIMln1vP
	c5QXjZ1LPZAylVZHWIL3ZCQs62218ChuJUdVM6EFaHICkvJEyP5gbZoAbM0J1NTx9d/RsHWXFId
	e7cLbw6U9mSy0KRbOsOA2TlwdOnYvrTU6D8vL17b/TZwrc2WkGNQqeUGcirlswm6Jn1HZejRTbK
	A51E29GkEKoijwv5RKLH8JT9ufWm7t6dn6+vPmY4hOyB6hrkXlq+p9zU/bfHK3A6GJko7aqMVY/
	Rnxq8UCAepi2Ht8slQy5KgSlN6ZWPoX1yaWyj1JHp7x8ZEg/cXbYWti/12ObtWQ5autFsprasMJ
	lY6OQN3L8apaBQ6/Fq+bH3XnYE5Sm3s7evc/7V+yKGt/P5Cn6PB25+STc7hmYdiLLndzWtAxXHn
	bhmaEFtIByHBMWJVNzuFyHwZM586V80RCVpcmgvjuw2FtxnF5RRVG4TfumunTxkmXAUYpYA0Lfb
	72UBLgu+BnkVrIEm4sSk
X-Received: by 2002:a05:6102:449b:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7ce5ce9a4f4mr1434993137.34.1792986657424;
        Sun, 25 Oct 2026 20:50:57 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:56 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v4 5/5] media: ov02c10: Add support for a 26 MHz external clock
Date: Mon, 26 Oct 2026 00:50:15 -0300
Message-ID: <20261026035015.110903-6-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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

Some Raptor Lake laptops, e.g. the Samsung Galaxy Book3 series, feed
the OV02C10 a 26 MHz external clock, which the driver rejects today.

Add a PLL table for a 26 MHz clock, with the OP and VT PLL multipliers
at 0x0127 instead of 0x0190. This yields a link frequency of
399.479167 MHz, which is added as a second link frequency. Record in
link_freq_configs[] the external clock rate each link frequency needs,
and pick the link frequency listed by the firmware that the external
clock can produce. The pixel rate follows from it.

This replaces the external clock check in probe.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v4:
    - Record the external clock rate in link_freq_configs[] and pick the
      link frequency listed by the firmware that the external clock can
      produce, instead of a table per external clock (Sakari). This
      replaces the external clock check in probe.
    - Name the 26 MHz PLL table after its link frequency.
    - Like the 400 MHz table, the 26 MHz table only holds 0x0303, 0x0305
      and 0x0316, following patch 3.
    
    Changes in v3:
    - Advertise 399.479167 MHz as a second link frequency instead of
      relying on it being close to 400 MHz. The pixel rate follows
      from it: 159.791666 MHz on two lanes (Sakari).
    - Choose between two PLL tables, split off in patch 3, from the
      external clock rate (Sakari). Fail probe if the firmware does
      not list the matching link frequency.
    - Make the last menu item the LINK_FREQ control's maximum and the
      selected frequency its default.
    - Stop writing 0x0315. Its reset value, 0x01, is what both tables
      need.
    - Drop the dev_dbg() and move the test details to the cover letter
      (Sakari).

 drivers/media/i2c/ov02c10.c | 52 +++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 62ea20dc5..1fb2a8586 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -16,7 +16,9 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV02C10_LINK_FREQ_400MHZ	400000000ULL
-#define OV02C10_MCLK			19200000
+#define OV02C10_LINK_FREQ_399MHZ	399479167ULL
+#define OV02C10_MCLK_19_2MHZ		19200000
+#define OV02C10_MCLK_26MHZ		26000000
 #define OV02C10_RGB_DEPTH		10
 
 #define OV02C10_NATIVE_WIDTH		1928
@@ -336,6 +338,18 @@ static const struct reg_sequence sensor_pll_400mhz_setting[] = {
 	{0x0316, 0x90},
 };
 
+/*
+ * With the other PLL registers as set by the common mode table, the link
+ * frequency is mclk * M / 19.2, M being the OP (0x0304/0x0305) and VT
+ * (0x0315/0x0316) PLL multiplier.  400 MHz would need M = 295.38 at 26 MHz;
+ * M = 295 = 0x0127 gives 399.479167 MHz.
+ */
+static const struct reg_sequence sensor_pll_399mhz_setting[] = {
+	{0x0303, 0x05},
+	{0x0305, 0x27},
+	{0x0316, 0x27},
+};
+
 static const char * const ov02c10_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
@@ -346,9 +360,12 @@ static const char * const ov02c10_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV02C10_LINK_FREQ_400MHZ,
+	OV02C10_LINK_FREQ_399MHZ,
 };
 
 struct ov02c10_link_freq_config {
+	/* External clock rate the PLL settings are for, Hz */
+	u32 mclk;
 	/* PLL register settings, which set the link frequency */
 	const struct reg_sequence *pll_settings;
 	int pll_settings_length;
@@ -357,9 +374,15 @@ struct ov02c10_link_freq_config {
 /* Indexed like link_freq_menu_items[] */
 static const struct ov02c10_link_freq_config link_freq_configs[] = {
 	{
+		.mclk = OV02C10_MCLK_19_2MHZ,
 		.pll_settings = sensor_pll_400mhz_setting,
 		.pll_settings_length = ARRAY_SIZE(sensor_pll_400mhz_setting),
 	},
+	{
+		.mclk = OV02C10_MCLK_26MHZ,
+		.pll_settings = sensor_pll_399mhz_setting,
+		.pll_settings_length = ARRAY_SIZE(sensor_pll_399mhz_setting),
+	},
 };
 
 static const struct ov02c10_mode supported_modes[] = {
@@ -520,7 +543,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov02c10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    ov02c10->link_freq_index, 0,
+						    ARRAY_SIZE(link_freq_menu_items) - 1,
+						    ov02c10->link_freq_index,
 						    link_freq_menu_items);
 	if (ov02c10->link_freq)
 		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -872,7 +896,8 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	};
 	struct device *dev = ov02c10->dev;
 	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
-	unsigned long link_freq_bitmap;
+	unsigned long link_freq_bitmap, mclk;
+	unsigned int i;
 	int ret;
 
 	/*
@@ -897,7 +922,19 @@ static int ov02c10_check_hwcfg(struct ov02c10 *ov02c10)
 	if (ret)
 		goto check_hwcfg_error;
 
-	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
+	/* Only keep the link frequencies the external clock can produce */
+	mclk = clk_get_rate(ov02c10->img_clk);
+	for (i = 0; i < ARRAY_SIZE(link_freq_configs); i++) {
+		if (link_freq_configs[i].mclk != mclk)
+			link_freq_bitmap &= ~BIT(i);
+	}
+	if (!link_freq_bitmap) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "no supported link frequency for external clock %lu\n",
+				    mclk);
+		goto check_hwcfg_error;
+	}
+
 	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
@@ -934,7 +971,6 @@ static void ov02c10_remove(struct i2c_client *client)
 static int ov02c10_probe(struct i2c_client *client)
 {
 	struct ov02c10 *ov02c10;
-	unsigned long freq;
 	int ret;
 
 	ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
@@ -948,12 +984,6 @@ static int ov02c10_probe(struct i2c_client *client)
 		return dev_err_probe(ov02c10->dev, PTR_ERR(ov02c10->img_clk),
 				     "failed to get imaging clock\n");
 
-	freq = clk_get_rate(ov02c10->img_clk);
-	if (freq != OV02C10_MCLK)
-		return dev_err_probe(ov02c10->dev, -EINVAL,
-				     "external clock %lu is not supported",
-				     freq);
-
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 
 	/* Check HW config */
-- 
2.56.0

