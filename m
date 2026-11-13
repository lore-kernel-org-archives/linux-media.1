Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537720;
	b=C6MZiLGKKI7pflauABTrTWCWzP+BOw4ivlVnFzrjHX8Zy8N4MuPkfn0xrCQ0A8XAGSkN
	 ggVMSqwlWmXVuh6ZuM76j+W4lnb6PNC6VtclTSwFJPB+36hNy+5r7a+yIhFJ01XITL/bN
	 XqUXS5dIrXsNd5oxauqM2DkWDlb2saJf+3nr6T9Daho32hyhx8CBxO1weQ58dxiLUUX0g
	 mV+qtaCp02as/Fmx5Iiqsm5G2Ehn83kS7OfoKSEzpjHsxlHzZZ8MnE83xBvrgpaGfaHcn
	 9YLLyWjIH0JQAjBd1X+N2r4uq34J54PlAROrLKqa8wE/dACcyOGOSMzcPj3d+JkCgmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yAUXFKohauE6hnB578A4JCF9Ebcxz1XNhHn9TQjh2qA=;
	b=YXT0dlAXbJ34/Lou1PV1Q42S9aJllhp6WvhNZD4Zuib/V9msOdjJ4sSQW5dD8H0Cgayb
	 D5rxkwW5LchUIJRA0osz1yZ+KSFMP4DaW33JGn8tMIY1WERAJwA5EOx+604gZ6nwcsxvL
	 Zefza40AA9F7B6g5SrO0YEGWYTluOJMT2op8Xp406xY2RwFpbg3vBduW4H4c8KXwEbnIF
	 jokE7VdrgCyUkbZWB588cPmr9qUs3VKvTMNIpqkpQGoKcMZ3cYB940G+OssVsFTkc7Fwl
	 rP7BEcV305iqoxppdix2ATCxKX6onS/ixcrDxX0Isxkdxvp4mhxjtwpVULHp9fqqZKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1+VYuMI;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEAC60A3830
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEAC60A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1+VYuMI
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36ca32a0faeso52668eec.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537719; x=1795142519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAUXFKohauE6hnB578A4JCF9Ebcxz1XNhHn9TQjh2qA=;
        b=E1+VYuMIOjzY2IcU0xW4Yl33bV2t4Dsr4rxtvbv3MWQ1SwXi2eAYCP0VNFLSz9CXi3
         wYNKO/Lq1PgCiB6PXAS0lNRPKjBzV67JyPD0eljN+xpfjxRme7ikyKx97NSrvjs8u8Sv
         5C0P/DUO6I3HESE3yFT6SR23rDtQu+v5dY+UBsRkTq6gWryTDdVdHv+Itz48KF3ihWs1
         a1fSeFZYQwucWjLJP5Ei/0BXOOiGrlOJsz1sxkTXomgGpyfWYpx3f+x68E1vT1U+bx5G
         ku9lKxveSGcfY+s/QkQ+ic5Fx4s07lfwokWANpRvznh+U9FGxto7NTLgbmhfmSDvxf1O
         7icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537719; x=1795142519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yAUXFKohauE6hnB578A4JCF9Ebcxz1XNhHn9TQjh2qA=;
        b=Cm4EhdO/JryT7A9CI1mx/Rble96+HKri/8Irpa9c5D9fC4V0AkJLktIli/sNLrykdP
         CqUfITNP/pjB73s9rQK9IT13sY0UH5Z+OPP72ROOIGUJ9lUo3bQ54Ci4Yr26n/tyCXeG
         5Q4Xrkp91X6yeRt8VKAHHF4ExJVaRrJB5A94kSKlCZuL5MJzzWpLCuc0J/oEXPt1xph1
         x4AyZBGnLubmOheQtYSvQXhXTo8QHEzUMQPIwWx7MP62Otk6K7l5TERTZoYO/7Eylnju
         6/iNan5+mh+bhPdTLtfIfs/A7PtqHvTjaL9CtrPO5F1D4UBhYR9yuoINSynmUBEfJ0zb
         6APQ==
X-Gm-Message-State: APuU4Z8nUm1+NnG92Bv3uJp7PmQKnEq2W2HIZRXhQbOuUjTwlsYqTMVR
	66Lq1glw3btkmC9PQtvlE/quNxdN/sKwZoUcm5JMm04IGp7Ui1WNRcunTum4WzeYr1/UVHOm
X-Gm-Gg: AYBFou1ehROCmta457YHqhPJEMiTIqpEApAw84s10tw0uz8GJjqjhvlKYGwt8NEDVUv
	BUo43PF5bJKyc6JvYZZAd921flDV4q9Qjd97oPYyPJM9ruKpf5B4biP3p1GYSVdypU6tOSWltDw
	XR+ISOPC0wCsD6xAbouiAD8JqAD4VeYUhoarkHnUqmRj3ZHXV58TEFyWwk9JrZFk2JflcumBQg/
	h1+VVR1Cs+GmIPYsGCbioEL04IT+NVqyRLg0h+wWaOHfd3+csvcK4/0B8WAdJ7rTex3dRxheQnc
	yhynFPDA5tFzgjIxwLebDijmG1AW2Dow5Kcf+AdNiyvaL4nbZ6lDS+Ofx1R1fJ4lU5qVkxi4Sgs
	Kz4vpuijfvxlVWXi+Ib4U9jzGIcSJyM220/x+VavfHkiiwDIFUoPcp0xNfizasfRBygw3k2kINb
	LTGm9yyrobjl57D3xk9c+L7t6TSHJYnPNJX0Sl2AaPYnqLbZabvY2VIShbr2QG9gYH9c3YNti5m
	cYqdpqGmfy71i8LwZcmxMfL/72oNg6Vjlvfa2ncaFBY76U+MA3tFrN4MRDbkCIhnNjDipnWU7TM
	gzuQXNK/pca7EjCiYjTcMegTZyjI9rlrGnbHzwEkY9NS3hknSoC4rndtj1A6Az6EaQAvxhf2LUK
	YO+R132wcbUczHv8nTfIqGeTqWg/0/cCIx0HFbjRX/hg0u8c5Z+dBhTmzWSwWZ68qvYW5nPchEs
	KKdFQHXG9OupAWBsUDtlHadnu8QSt55SM=
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr1825536eec.1.1794537719100;
        Thu, 12 Nov 2026 18:41:59 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:58 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] media: i2c: ov7251: Move the common registers into the global init table
Date: Fri, 13 Nov 2026 11:40:57 +0900
Message-ID: <20261113024059.1087031-8-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The three mode tables write the same 117 registers. Only the six clock
control registers 0x3016 to 0x301c differ between the 30 fps table and
the 60 and 90 fps ones, and the frame length (0x380e and 0x380f), which
the V4L2_CID_VBLANK handler writes anyway.

Move the common registers into ov7251_global_init_setting, written after
the software reset by ov7251_set_power_on(), and drop the frame length
from the mode tables, which keep the clock control registers only.

The common registers are thus written once per power-on instead of at
every stream start. The sensor keeps its register values in software
standby (datasheet table 2-8), so a stream restarted, or switched to
another mode, before the runtime PM autosuspend powers the sensor down
gets the same settings as a stream started from power-on.

One value on the bus changes: 0x3820 (TIMING_FORMAT1). The mode tables
wrote 0x40 (bit 6, vflip_blc) at stream start, but the vertical flip
control, applied after the table, rewrote the register from the value
probe had read right after the reset, 0x00, so the sensor streamed with
bit 6 clear. Probe now reads 0x40 from the init table and the control
keeps bit 6 set, as the mode tables have always asked for.

Tested on a Surface Book 2 (19.2 MHz clock, 319.2 MHz link): the clock,
timing, PLL, flip and strobe registers read back while streaming at
30, 60 and 90 fps are identical to those of the driver before this
change, except 0x3820, which reads 0x40 instead of 0x00 as described
above; stream restarts and mode switches on a sensor kept in software
standby give valid frames from the first one, at the expected rates.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
[antoine.pichot@gmail.com: subject and commit message, 0x3820 note]
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 258 ++-----------------------------------
 1 file changed, 9 insertions(+), 249 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 834420f2f843..2abf1b112351 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -238,19 +238,10 @@ static const struct ov7251_pll_cfgs *ov7251_pll_cfgs[] = {
 static const struct reg_value ov7251_global_init_setting[] = {
 	{ 0x0103, 0x01 },
 	{ 0x303b, 0x02 },
-};
-
-static const struct reg_value ov7251_setting_vga_30fps[] = {
 	{ 0x3005, 0x00 },
 	{ 0x3012, 0xc0 },
 	{ 0x3013, 0xd2 },
 	{ 0x3014, 0x04 },
-	{ 0x3016, 0xf0 },
-	{ 0x3017, 0xf0 },
-	{ 0x3018, 0xf0 },
-	{ 0x301a, 0xf0 },
-	{ 0x301b, 0xf0 },
-	{ 0x301c, 0xf0 },
 	{ 0x3023, 0x05 },
 	{ 0x3037, 0xf0 },
 	{ 0x3106, 0xda },
@@ -298,8 +289,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
 	{ 0x380b, 0xe0 }, /* height low */
 	{ 0x380c, 0x03 }, /* total horiz timing high */
 	{ 0x380d, 0xa0 }, /* total horiz timing low */
-	{ 0x380e, 0x06 }, /* total vertical timing high */
-	{ 0x380f, 0xbc }, /* total vertical timing low */
 	{ 0x3810, 0x00 },
 	{ 0x3811, 0x04 },
 	{ 0x3812, 0x00 },
@@ -368,260 +357,31 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
 	{ 0x5001, 0x80 },
 };
 
+static const struct reg_value ov7251_setting_vga_30fps[] = {
+	{ 0x3016, 0xf0 },
+	{ 0x3017, 0xf0 },
+	{ 0x3018, 0xf0 },
+	{ 0x301a, 0xf0 },
+	{ 0x301b, 0xf0 },
+	{ 0x301c, 0xf0 },
+};
+
 static const struct reg_value ov7251_setting_vga_60fps[] = {
-	{ 0x3005, 0x00 },
-	{ 0x3012, 0xc0 },
-	{ 0x3013, 0xd2 },
-	{ 0x3014, 0x04 },
 	{ 0x3016, 0x10 },
 	{ 0x3017, 0x00 },
 	{ 0x3018, 0x00 },
 	{ 0x301a, 0x00 },
 	{ 0x301b, 0x00 },
 	{ 0x301c, 0x00 },
-	{ 0x3023, 0x05 },
-	{ 0x3037, 0xf0 },
-	{ 0x3106, 0xda },
-	{ 0x3503, 0x07 },
-	{ 0x3509, 0x10 },
-	{ 0x3600, 0x1c },
-	{ 0x3602, 0x62 },
-	{ 0x3620, 0xb7 },
-	{ 0x3622, 0x04 },
-	{ 0x3626, 0x21 },
-	{ 0x3627, 0x30 },
-	{ 0x3630, 0x44 },
-	{ 0x3631, 0x35 },
-	{ 0x3634, 0x60 },
-	{ 0x3636, 0x00 },
-	{ 0x3662, 0x01 },
-	{ 0x3663, 0x70 },
-	{ 0x3664, 0x50 },
-	{ 0x3666, 0x0a },
-	{ 0x3669, 0x1a },
-	{ 0x366a, 0x00 },
-	{ 0x366b, 0x50 },
-	{ 0x3673, 0x01 },
-	{ 0x3674, 0xff },
-	{ 0x3675, 0x03 },
-	{ 0x3705, 0xc1 },
-	{ 0x3709, 0x40 },
-	{ 0x373c, 0x08 },
-	{ 0x3742, 0x00 },
-	{ 0x3757, 0xb3 },
-	{ 0x3788, 0x00 },
-	{ 0x37a8, 0x01 },
-	{ 0x37a9, 0xc0 },
-	{ 0x3800, 0x00 },
-	{ 0x3801, 0x04 },
-	{ 0x3802, 0x00 },
-	{ 0x3803, 0x04 },
-	{ 0x3804, 0x02 },
-	{ 0x3805, 0x8b },
-	{ 0x3806, 0x01 },
-	{ 0x3807, 0xeb },
-	{ 0x3808, 0x02 }, /* width high */
-	{ 0x3809, 0x80 }, /* width low */
-	{ 0x380a, 0x01 }, /* height high */
-	{ 0x380b, 0xe0 }, /* height low */
-	{ 0x380c, 0x03 }, /* total horiz timing high */
-	{ 0x380d, 0xa0 }, /* total horiz timing low */
-	{ 0x380e, 0x03 }, /* total vertical timing high */
-	{ 0x380f, 0x5c }, /* total vertical timing low */
-	{ 0x3810, 0x00 },
-	{ 0x3811, 0x04 },
-	{ 0x3812, 0x00 },
-	{ 0x3813, 0x05 },
-	{ 0x3814, 0x11 },
-	{ 0x3815, 0x11 },
-	{ 0x3820, 0x40 },
-	{ 0x3821, 0x00 },
-	{ 0x382f, 0x0e },
-	{ 0x3832, 0x00 },
-	{ 0x3833, 0x05 },
-	{ 0x3834, 0x00 },
-	{ 0x3835, 0x0c },
-	{ 0x3837, 0x00 },
-	{ 0x3b80, 0x00 },
-	{ 0x3b81, 0xa5 },
-	{ 0x3b82, 0x10 },
-	{ 0x3b83, 0x00 },
-	{ 0x3b84, 0x08 },
-	{ 0x3b85, 0x00 },
-	{ 0x3b86, 0x01 },
-	{ 0x3b87, 0x00 },
-	{ 0x3b88, 0x00 },
-	{ 0x3b89, 0x00 },
-	{ 0x3b8a, 0x00 },
-	{ 0x3b8b, 0x05 },
-	{ 0x3b8c, 0x00 },
-	{ 0x3b8d, 0x00 },
-	{ 0x3b8e, 0x00 },
-	{ 0x3b8f, 0x1a },
-	{ 0x3b94, 0x05 },
-	{ 0x3b95, 0xf2 },
-	{ 0x3b96, 0x40 },
-	{ 0x3c00, 0x89 },
-	{ 0x3c01, 0x63 },
-	{ 0x3c02, 0x01 },
-	{ 0x3c03, 0x00 },
-	{ 0x3c04, 0x00 },
-	{ 0x3c05, 0x03 },
-	{ 0x3c06, 0x00 },
-	{ 0x3c07, 0x06 },
-	{ 0x3c0c, 0x01 },
-	{ 0x3c0d, 0xd0 },
-	{ 0x3c0e, 0x02 },
-	{ 0x3c0f, 0x0a },
-	{ 0x4001, 0x42 },
-	{ 0x4004, 0x04 },
-	{ 0x4005, 0x00 },
-	{ 0x404e, 0x01 },
-	{ 0x4300, 0xff },
-	{ 0x4301, 0x00 },
-	{ 0x4315, 0x00 },
-	{ 0x4501, 0x48 },
-	{ 0x4600, 0x00 },
-	{ 0x4601, 0x4e },
-	{ 0x4801, 0x0f },
-	{ 0x4806, 0x0f },
-	{ 0x4819, 0xaa },
-	{ 0x4823, 0x3e },
-	{ 0x4837, 0x19 },
-	{ 0x4a0d, 0x00 },
-	{ 0x4a47, 0x7f },
-	{ 0x4a49, 0xf0 },
-	{ 0x4a4b, 0x30 },
-	{ 0x5000, 0x85 },
-	{ 0x5001, 0x80 },
 };
 
 static const struct reg_value ov7251_setting_vga_90fps[] = {
-	{ 0x3005, 0x00 },
-	{ 0x3012, 0xc0 },
-	{ 0x3013, 0xd2 },
-	{ 0x3014, 0x04 },
 	{ 0x3016, 0x10 },
 	{ 0x3017, 0x00 },
 	{ 0x3018, 0x00 },
 	{ 0x301a, 0x00 },
 	{ 0x301b, 0x00 },
 	{ 0x301c, 0x00 },
-	{ 0x3023, 0x05 },
-	{ 0x3037, 0xf0 },
-	{ 0x3106, 0xda },
-	{ 0x3503, 0x07 },
-	{ 0x3509, 0x10 },
-	{ 0x3600, 0x1c },
-	{ 0x3602, 0x62 },
-	{ 0x3620, 0xb7 },
-	{ 0x3622, 0x04 },
-	{ 0x3626, 0x21 },
-	{ 0x3627, 0x30 },
-	{ 0x3630, 0x44 },
-	{ 0x3631, 0x35 },
-	{ 0x3634, 0x60 },
-	{ 0x3636, 0x00 },
-	{ 0x3662, 0x01 },
-	{ 0x3663, 0x70 },
-	{ 0x3664, 0x50 },
-	{ 0x3666, 0x0a },
-	{ 0x3669, 0x1a },
-	{ 0x366a, 0x00 },
-	{ 0x366b, 0x50 },
-	{ 0x3673, 0x01 },
-	{ 0x3674, 0xff },
-	{ 0x3675, 0x03 },
-	{ 0x3705, 0xc1 },
-	{ 0x3709, 0x40 },
-	{ 0x373c, 0x08 },
-	{ 0x3742, 0x00 },
-	{ 0x3757, 0xb3 },
-	{ 0x3788, 0x00 },
-	{ 0x37a8, 0x01 },
-	{ 0x37a9, 0xc0 },
-	{ 0x3800, 0x00 },
-	{ 0x3801, 0x04 },
-	{ 0x3802, 0x00 },
-	{ 0x3803, 0x04 },
-	{ 0x3804, 0x02 },
-	{ 0x3805, 0x8b },
-	{ 0x3806, 0x01 },
-	{ 0x3807, 0xeb },
-	{ 0x3808, 0x02 }, /* width high */
-	{ 0x3809, 0x80 }, /* width low */
-	{ 0x380a, 0x01 }, /* height high */
-	{ 0x380b, 0xe0 }, /* height low */
-	{ 0x380c, 0x03 }, /* total horiz timing high */
-	{ 0x380d, 0xa0 }, /* total horiz timing low */
-	{ 0x380e, 0x02 }, /* total vertical timing high */
-	{ 0x380f, 0x3c }, /* total vertical timing low */
-	{ 0x3810, 0x00 },
-	{ 0x3811, 0x04 },
-	{ 0x3812, 0x00 },
-	{ 0x3813, 0x05 },
-	{ 0x3814, 0x11 },
-	{ 0x3815, 0x11 },
-	{ 0x3820, 0x40 },
-	{ 0x3821, 0x00 },
-	{ 0x382f, 0x0e },
-	{ 0x3832, 0x00 },
-	{ 0x3833, 0x05 },
-	{ 0x3834, 0x00 },
-	{ 0x3835, 0x0c },
-	{ 0x3837, 0x00 },
-	{ 0x3b80, 0x00 },
-	{ 0x3b81, 0xa5 },
-	{ 0x3b82, 0x10 },
-	{ 0x3b83, 0x00 },
-	{ 0x3b84, 0x08 },
-	{ 0x3b85, 0x00 },
-	{ 0x3b86, 0x01 },
-	{ 0x3b87, 0x00 },
-	{ 0x3b88, 0x00 },
-	{ 0x3b89, 0x00 },
-	{ 0x3b8a, 0x00 },
-	{ 0x3b8b, 0x05 },
-	{ 0x3b8c, 0x00 },
-	{ 0x3b8d, 0x00 },
-	{ 0x3b8e, 0x00 },
-	{ 0x3b8f, 0x1a },
-	{ 0x3b94, 0x05 },
-	{ 0x3b95, 0xf2 },
-	{ 0x3b96, 0x40 },
-	{ 0x3c00, 0x89 },
-	{ 0x3c01, 0x63 },
-	{ 0x3c02, 0x01 },
-	{ 0x3c03, 0x00 },
-	{ 0x3c04, 0x00 },
-	{ 0x3c05, 0x03 },
-	{ 0x3c06, 0x00 },
-	{ 0x3c07, 0x06 },
-	{ 0x3c0c, 0x01 },
-	{ 0x3c0d, 0xd0 },
-	{ 0x3c0e, 0x02 },
-	{ 0x3c0f, 0x0a },
-	{ 0x4001, 0x42 },
-	{ 0x4004, 0x04 },
-	{ 0x4005, 0x00 },
-	{ 0x404e, 0x01 },
-	{ 0x4300, 0xff },
-	{ 0x4301, 0x00 },
-	{ 0x4315, 0x00 },
-	{ 0x4501, 0x48 },
-	{ 0x4600, 0x00 },
-	{ 0x4601, 0x4e },
-	{ 0x4801, 0x0f },
-	{ 0x4806, 0x0f },
-	{ 0x4819, 0xaa },
-	{ 0x4823, 0x3e },
-	{ 0x4837, 0x19 },
-	{ 0x4a0d, 0x00 },
-	{ 0x4a47, 0x7f },
-	{ 0x4a49, 0xf0 },
-	{ 0x4a4b, 0x30 },
-	{ 0x5000, 0x85 },
-	{ 0x5001, 0x80 },
 };
 
 static const unsigned long supported_xclk_rates[] = {
-- 
2.56.0

