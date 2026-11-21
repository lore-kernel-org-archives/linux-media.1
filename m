Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233367;
	b=eSZ0dvUzSUhc8XnIQvEMFfJK8Qk+S/ljXs7o29sEpYsh5WsJU+risywsT5WwR6I/b1sl
	 zStIHGWOZakrPCsvWHLUR4Ar00FfAmbOWG4cWHMs80Ns6DbkYEoGj89/vOp4f9jqAM8jM
	 N5QMtRYKDo5dEG/L0O83uj/FCBRtJwGdYrlbrpx7xsy1MVE5CGdvigHzq5ovJ3GGtlJr3
	 hi0J4bTbquM5+VAMUWjaDnIsiyAxEzWExb/qxZW9uF6ydsIIpcuxKaSZxTruFQB7BEN3K
	 pPYxuwRa4ZtgwsosJrC/6WZxcFOSATPUg6pPysAC10koH/dQsyZrcvEzJ9RM5SwWe+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
	b=FropRC3xiflaOrOsN2/CfJjirDGYhA4n8yRzoW+To8GoS9ElDOSmd1voqRGEcea1dJJZ
	 TQwJPQgHDquOnkdEdlus/g0TGXVpcOsaa2Ub1Nz8Q8acmJCAB4OKyMsN4JXX7EafmN4yX
	 aNxeVdFLJ8/nuQj/FEIEyknQjuWmlq8mRlWMTRR/SsBt5gaEkqqDuNb58lwm+5T3rbvGF
	 Fkwav6urRkdhirYrkNKuaGLjSxHm8b43aIbLGDC4oI5jMpYfxPfAhOxf/GPWrQq4GyTZ9
	 jFsKEkuHsthQKHnSwxCtCojK/ft5icCL+Rig2tPX1qmfrQSV/US9AuvVdI/nnqBi8mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u4E/dKTK";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722660A260D
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4722660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4E/dKTK
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8629fc8ad64so960435a34.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233356; x=1795838156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=u4E/dKTKtcwE3wAVyt2IeSMyuej0OsnaZnnOcwcl7gRRe6OseQ96iSIEbmoga3jc8y
         KpD5Y0GVkPD6LXLpGe0amAV1oNHKaZtNWMRMl4YgDfB3opcftNzDDDKtr7TCLY+RdtFv
         LEGM/bqSLaoULci5qbs4RJf9ipR6r1XGg01aJ5q18zmY0UyZxtUk6E++wXUM1vE4P4Uh
         Kkbri8opAFff5D17bJJgAWQs7VPdNA1YLb0T3yhdvAQyZOFlyRCkarP3RJFBF3rKumgT
         DZWsHmOSxITuATjA5J3AQyjxGR1aXnK0j7OWDmrDyt6Yf2TZBKtZyDEcZe4LxqlqJBIy
         jVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233356; x=1795838156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuGEAzWS3xcIcvSu/cuY37PG3g4bSwO/xoH2Fm6M/Eo=;
        b=y7ZPWHNw3UHFTbEZtZyJ5eMpR8+u8PEPF140xloSrlcXJpFUk5/LbNqAgmBKS6UkD+
         Bpas9K+1gKgboaH2FhEc0dXoUwTmjwMuVNuYuVTlt5mNVPJpyHbrYMXa8XbxVsw3D91T
         1UYvhrTmCR/UX52RbfUS9te3j5HAmtcd2fix83GMWYugbvWo97WYq3BdlJ2xnHkVHD7B
         AsAnKlrwgXoGM9HlWZ2sjb/9qU5/sLp8oLaCvdkf7hXS40mq3poI5H1GJVnkZxRPJa2x
         /3Q6yFAx9nAGgqA/7dGIpnXs0oUQUIgMTbfdSJxk04AmQ+qexeIiWGLlXmCTBEiknzWD
         TStQ==
X-Forwarded-Encrypted: i=1; AL+hErFRlTm4+7R26haua/BlhfXqT2/qxe8jYVfX6jAVkwrm9+7oOQjcI1eAflr1Bu12AXcosYUq9kuAJuDZcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e2WbcWwFn8oS67K9pofqx08OaNGZCw8kTRIqPAaw89ceuRXXy
	1L7/XiBwe+9IqGAaOReAa8tdDqEMy+t1MLwhy15GurPOSbdukuAeo+E=
X-Gm-Gg: AYBFou3R5RaHOI7vckW7xKJCEAUndX3ryTSmUCew31beQXKlpfMWsqt1sradD1QiQbZ
	GmLIoHigV8CksNapHwZtGddnLBN1xkYWl/BDxVYG0RkbweGjv4r/FlDAZcTEcGF3f9VF9NaCmn/
	oJMbrTWO22kMRCWSIPJ8ayVcmE5uDsnlKlKvyR34Onb1mjaJQ2+zQyNqsgVyN46qqC43tsWmBG0
	72vTdOQ6bVz3BDPsk+zQ6joMD+ZSlUcQvVoUZJObed/Ks9+ATmLL9iilVEe7bapXFPLv1ccxyMm
	vKL0xB1LXSGYPGtP4k859Po5yIm4GAQDJPxqt8fnJocytdVKAyzCHwNrOnx3BmMFh0EK2No5tNH
	SMubsoSDwxNwBmvyd3HtwLS9rjsRzwARObxT9pc8hMPNScvjoHGyDQsM/fBEPB+jeOeoHMdiJdv
	80tlDw3CwOFfdiLUSwclqw1mLXtU1BiDalpMKPzVAvpeTsu1xOhk9/ATEKrYxgR3JSSisrARCLn
	Ph0dK9H+LDDuvOptR1Lz9EbFo2XFVtwWwQfn5ZgUtMZ4kEUwRRd5zdV1u2U5Wp+HBxEUH4Pt8tz
	t/b92h5wpACenGokhnScMowVRD9xPYja6NuLPWDrdgvd3g2sx82W/n1H
X-Received: by 2002:a05:6820:80e:b0:71a:e1a9:4b74 with SMTP id 006d021491bc7-71b39616d74mr4329743eaf.72.1795233356164;
        Fri, 20 Nov 2026 19:55:56 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:54 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 07/12] media: tw9900: power down analog blocks in runtime suspend
Date: Fri, 20 Nov 2026 21:55:18 -0600
Message-ID: <20261121035523.26764-8-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

On boards without a controllable supply or reset GPIO, runtime suspend
leaves the decoder fully powered. Set the CLK/Y/C power-down bits in
ANALOG_CTL and the PLL power-down bit in ANAL_CTL_II before cutting
power. Runtime resume rewrites both registers from the init table.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 585509c1b41d..b2b754e898c2 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -34,6 +34,9 @@
 #define TW9900_REG_CKHY_HSDLY			0x04
 #define TW9900_REG_OUT_CTRL_I			0x05
 #define TW9900_REG_ANALOG_CTL			0x06
+#define TW9900_REG_ANALOG_CTL_CLK_PDN		BIT(3)
+#define TW9900_REG_ANALOG_CTL_Y_PDN		BIT(2)
+#define TW9900_REG_ANALOG_CTL_C_PDN		BIT(1)
 #define TW9900_REG_CROP_HI			0x07
 #define TW9900_REG_VDELAY_LO			0x08
 #define TW9900_REG_VACTIVE_LO			0x09
@@ -48,6 +51,7 @@
 #define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
+#define TW9900_REG_ANAL_CTL_II_PLL_PDN		BIT(6)
 #define TW9900_REG_OUT_CTRL_II			0x1B
 #define TW9900_REG_STD				0x1C
 #define TW9900_REG_STD_AUTO_PROGRESS		BIT(7)
@@ -689,6 +693,13 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 	mutex_lock(&tw9900->mutex);
 
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANALOG_CTL,
+			 TW9900_REG_ANALOG_CTL_CLK_PDN |
+			 TW9900_REG_ANALOG_CTL_Y_PDN |
+			 TW9900_REG_ANALOG_CTL_C_PDN);
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANAL_CTL_II,
+			 TW9900_REG_ANAL_CTL_II_PLL_PDN);
+
 	if (tw9900->reset_gpio)
 		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
 
-- 
2.47.3

