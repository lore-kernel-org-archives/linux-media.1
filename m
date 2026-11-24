Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539096;
	b=Or8GnE+EpeeOVw6C+wLdbhfo+N+KgtnYnR5VOXAKmDlknbCUPcJrcIBfOyL9Lk2hMv7t
	 GXkzZlp5vdHQmznXSuHl/f7UIGbkb+OO7qsQFHm+6vDPz+exQfkMRA4Jy/QEqGy8av5AT
	 /lkxls52qcTSScGMoq/e/v0EkjzrtovmwCBGiWSIdf2eDYkpRTE0/j27T7mv/SvKUBCQ0
	 pwhy7TOWQPbqOK8YcLat7SvTpktQRFUU0oSYKGjr3x2vIES6NGpbrKWQ3/cmSTz5yZE9m
	 ClPQBTAz7TPMm/DLwpbDh1rvmkH1auHZaSjSuwkI15juvjYXj8Yz5rIhxoBFs0P6cSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539096;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CSFo0s435R2tlBD6Ayumb9HWuiAzrOLYNWMVhPCHOHw=;
	b=F9ejA3/ZqckSXH1PLmsB+rG0NeW1aqJMkgSmDARuWHQUEp1aLmhDIP4CMAXFiOyPgzjv
	 2QRnoRFF9Iz4qwtnxAV9fcP0EpWBHF4ERnH7XGBrEE3FyNtyA+hQ4b3FCJi98I1nOmtqP
	 Nmm5MKCGoILpwmIa2eWRI7xFy8pRFF9kui5EUbaDbjYWg+qswRPQUSNVnKdklcYFbX96x
	 +cQY7Oq4331CqSzDOckpeUYIBg/UNK+J+2aA4QaBmVfsqY8aG+WWcuOV4R6NC6zp0xVyD
	 PwJ0axEBGeiYyASs17qSBapMLt5S4xLG1d2nYLyRHGQq3XT5m/X2NP9XF/8ww4c+Hcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ve3SVD8V;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869EB606A33B;
	Tue, 24 Nov 2026 16:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869EB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ve3SVD8V
Received: from [192.168.95.178] (mob-5-90-67-29.net.vodafone.it [5.90.67.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CDF2BE;
	Tue, 24 Nov 2026 17:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795538934;
	bh=x301ZznYDmTjFQqwXF+wbXFR13pbQGwPBuMYL/d4u+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ve3SVD8Vug7ULxq+ikEt50GBFHjqFXYpb5I2V0JzAHonBIT9PfdeVwdzkP2GL7ynB
	 dHLtg6Y4E3wpUNtZrWID+qGrohaH71D0EBnhxREr90u4CjBZqFgaCPQslt7QyzYlVp
	 w+IdN1Ux7+nBugDRtqGs6Iz7DnsDkl4+U3Oubsy8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 24 Nov 2026 17:51:11 +0100
Subject: [PATCH 1/2] media: mira016: Update the gain model
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
Message-Id: <20261124-mira016-fixes-v1-1-20a7be606268@ideasonboard.com>
References: <20261124-mira016-fixes-v1-0-20a7be606268@ideasonboard.com>
In-Reply-To: <20261124-mira016-fixes-v1-0-20a7be606268@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hans@jjverkuil.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9192;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=XGuZnjKenh8hir7LDgrNVc95z7s5ygxOJqA5y84Uxyc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBrBcCMKVWYHIC49jiE/YoTQu7nA4R/iDtRlDigk
 suqMSlWv3qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCawXAjAAKCRByNAaPFqFW
 PD3kD/9Kv1xf9v+h8/qUtbQJg+AZleYk6I7oo0C/TOmJxyacVkZwbku4H3DyRWiwSwEKFiN+/C7
 QrejwG4KBhN0fEjlwesHdzXG+HwwIMjYOzb2hhgbjTmdc/5PdXp+ySpBtX+XGA8z1rWtfvucTPF
 flcu9edJ0fJwIytV1O7/eThhhRKtBRpiMw4Bi7NZiR3OT3K5VA+cQZkYoB0U+o4Qg7w0RQDBL8r
 +1jI0ulw8o9j2Q1uEQ0vg5uL4hr9MtTTcwgpwwJUvn/ri93UGQc1p/d4j9tzjeNhloglpT00feo
 vRQVP2xgzFhL6+bqnjV85q2mQyPxBxOSJG9+14Rglda+u21WMRE6730w2VM4D+x7aIlfptYklSb
 Erfr6VNP0xVHoRK6DTpMGLj0WEvsXunPkUbVYCFqhYsI+27toVNUgqvRYSgCb3maCQIirm450it
 SQxoMjN3aawGnbWRR2IipiJUu2ZPcu8BFCLFq/EwpOTeUqdEUQvdVOTEunhvOvpIMdEXF840SEx
 G2v9SCleD9MqiJix/UG5iyWefjon/zlRtSXB96FQJl3Z/VT2BBJgcStNocM967FR2pM7zWX+5Xf
 L8+P7CzkOeNFj+5ejOzKdt7yijKGhAILSI7kmtA4eJ5YYBgE8W9sdYzsoYqPTwKeRIxRCMUaGMm
 t2Y8qFeAtHaKf8Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

The analogue gain handling is currently modeled using tables that
contains the values of the three registers that control the gain
(ADC_GAIN, RG_MULT and GDIG_PREAMP).

The underlying gain model has been characterized as

    analogue_gain =  57 * 2^(2 - RG_MULT) / (ADC_GAIN + 21)

In 8-bits mode the output of the 10-bit ADC is scaled to 8-bit allowing
an additional 4x digital gain, for a total achievable 16x gain, compared
to the 4x available in 10-bits mode.

Implement the calculation of the [ADC_GAIN, RG_MULT, GDIG_PREAMP]
registers values in mira016_fine_gain() and remove the tables.

The expected gain code is the desired gain value multiplied by 1000 to
perform all calculations with integers arithmetic.

Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/mira016.c | 143 ++++++++++++++++++++++++--------------------
 1 file changed, 79 insertions(+), 64 deletions(-)

diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
index 082442ffad28..cecef53d8af0 100644
--- a/drivers/media/i2c/mira016.c
+++ b/drivers/media/i2c/mira016.c
@@ -127,8 +127,15 @@
 /* Fine analogue gain */
 #define MIRA016_GDIG_PREAMP		CCI_REG8(0x0195)
 #define MIRA016_BIAS_RG_ADCGAIN		CCI_REG8(0x01f0)
+#define MIRA016_BIAS_RG_ADCGAIN_MAX	63
 #define MIRA016_BIAS_RG_MULT		CCI_REG8(0x01f3)
 
+#define MIRA016_GAIN_UNIT		1000
+#define MIRA016_GAIN_MAX_8B		(16 * MIRA016_GAIN_UNIT)
+#define MIRA016_GAIN_MAX_10B		(4 * MIRA016_GAIN_UNIT)
+#define MIRA016_ADC_GAIN_VAL(n)		(57000 << (n))
+#define MIRA016_FINE_GAIN_REF_MULT	2
+
 /* MIPI CSI-2 link frequency for 1.5Mbps per lane */
 #define MIRA016_LINK_FREQ_750M		750000000
 
@@ -956,55 +963,71 @@ static const struct cci_reg_sequence mira016_soft_reset_assert[] = {
 	{ CCI_REG8(0xe009), 0x0 },
 };
 
-struct mira016_gain_lut {
+struct mira016_fine_gain {
 	u8 gdig_preamp;
 	u8 rg_adcgain;
 	u8 rg_mult;
 };
 
-/* Table 29: Lookup table for fine analog gain in 10-bit mode */
-static const struct mira016_gain_lut mira016_gain_lut_10bit[] = {
-	{ 15, 36, 2 }, { 15, 35, 2 }, { 15, 33, 2 }, { 15, 32, 2 },
-	{ 15, 30, 2 }, { 15, 29, 2 }, { 15, 27, 2 }, { 15, 26, 2 },
-	{ 15, 24, 2 }, { 15, 23, 2 }, { 15, 22, 2 }, { 15, 62, 1 },
-	{ 15, 59, 1 }, { 15, 57, 1 }, { 15, 55, 1 }, { 15, 53, 1 },
-	{ 15, 51, 1 }, { 15, 48, 1 }, { 15, 46, 1 }, { 15, 45, 1 },
-	{ 15, 43, 1 }, { 15, 41, 1 }, { 15, 39, 1 }, { 15, 37, 1 },
-	{ 15, 36, 1 }, { 15, 34, 1 }, { 15, 32, 1 }, { 15, 31, 1 },
-	{ 15, 29, 1 }, { 15, 28, 1 }, { 15, 26, 1 }, { 15, 25, 1 },
-	{ 15, 24, 1 }, { 15, 22, 1 }, { 15, 63, 0 }, { 15, 61, 0 },
-	{ 15, 58, 0 }, { 15, 56, 0 }, { 15, 54, 0 }, { 15, 51, 0 },
-	{ 15, 49, 0 }, { 15, 47, 0 }, { 15, 45, 0 }, { 15, 42, 0 },
-	{ 15, 41, 0 }, { 15, 39, 0 }, { 15, 37, 0 }, { 15, 35, 0 },
-};
+/*
+ * Fine analogue gain of the Mira016, from the formula:
+ *
+ * analogue_gain = 57 * 2^(MIRA016_RG_REF - RG_MULT) / (ADC_GAIN + 21)
+ *
+ * with ADC_GAIN in the [0, 63] range and MIRA016_RG_REF fixed at 2 for Mira016.
+ *
+ * The analogue gain is realized by controlling the ADC ramp current which gives
+ * a gain multiplier up to 4x. In 8-bit mode the digital gain GDIG_PREAMP takes
+ * the 10-bit ADC result to 8 bit and gives an additional 4x.
+ */
+static void mira016_fine_gain(u32 code, u32 gain, struct mira016_fine_gain *fg)
+{
+	unsigned int bit_shift;
+	unsigned int n, k, j;
+	int adc;
 
-/* Table 26: Lookup table for fine analog gain in 8-bit mode */
-static const struct mira016_gain_lut mira016_gain_lut_8bit[] = {
-	{ 3, 36, 2 }, { 3, 35, 2 }, { 3, 33, 2 }, { 3, 32, 2 },
-	{ 3, 30, 2 }, { 3, 29, 2 }, { 3, 28, 2 }, { 3, 26, 2 },
-	{ 3, 27, 2 }, { 3, 25, 2 }, { 3, 23, 2 }, { 3, 22, 2 },
-	{ 3, 22, 2 }, { 3, 22, 2 }, { 3, 55, 1 }, { 3, 54, 1 },
-	{ 3, 52, 1 }, { 3, 51, 1 }, { 3, 49, 1 }, { 3, 47, 1 },
-	{ 3, 44, 1 }, { 3, 43, 1 }, { 3, 42, 1 }, { 3, 40, 1 },
-	{ 3, 39, 1 }, { 3, 37, 1 }, { 3, 35, 1 }, { 3, 32, 1 },
-	{ 3, 31, 1 }, { 3, 29, 1 }, { 3, 28, 1 }, { 3, 27, 1 },
-	{ 3, 26, 1 }, { 3, 24, 1 }, { 3, 23, 1 }, { 3, 22, 1 },
-	{ 3, 61, 0 }, { 3, 58, 0 }, { 3, 57, 0 }, { 3, 55, 0 },
-	{ 3, 53, 0 }, { 3, 49, 0 }, { 3, 47, 0 }, { 3, 45, 0 },
-	{ 3, 42, 0 }, { 3, 40, 0 }, { 7, 39, 1 }, { 7, 36, 1 },
-	{ 7, 35, 1 }, { 7, 33, 1 }, { 7, 32, 1 }, { 7, 30, 1 },
-	{ 7, 28, 1 }, { 7, 27, 1 }, { 7, 25, 1 }, { 7, 24, 1 },
-	{ 7, 22, 1 }, { 7, 60, 0 }, { 7, 58, 0 }, { 7, 55, 0 },
-	{ 7, 52, 0 }, { 7, 51, 0 }, { 7, 48, 0 }, { 7, 47, 0 },
-	{ 7, 45, 0 }, { 7, 43, 0 }, { 7, 41, 0 }, { 7, 40, 0 },
-	{ 15, 38, 1 }, { 15, 36, 1 }, { 15, 35, 1 }, { 15, 34, 1 },
-	{ 15, 32, 1 }, { 15, 31, 1 }, { 15, 30, 1 }, { 15, 29, 1 },
-	{ 15, 27, 1 }, { 15, 26, 1 }, { 15, 25, 1 }, { 15, 23, 1 },
-	{ 15, 21, 1 }, { 15, 61, 0 }, { 15, 59, 0 }, { 15, 57, 0 },
-	{ 15, 56, 0 }, { 15, 53, 0 }, { 15, 51, 0 }, { 15, 49, 0 },
-	{ 15, 47, 0 }, { 15, 45, 0 }, { 15, 44, 0 }, { 15, 42, 0 },
-	{ 15, 41, 0 }, { 15, 39, 0 }, { 15, 37, 0 },
-};
+	/*
+	 * In 8-bit mode the digital gain takes the 10-bit ADC result to 8 bit
+	 * and gives another 4x.
+	 */
+	switch (code) {
+	case MEDIA_BUS_FMT_Y8_1X8:
+		bit_shift = 2;
+		break;
+	case MEDIA_BUS_FMT_Y10_1X10:
+		bit_shift = 0;
+		break;
+	default:
+		/* 12 bit gain is fixed, we shouldn't be getting here. */
+		return;
+	}
+
+	gain = clamp_t(u32, gain, MIRA016_GAIN_UNIT,
+		       (4U * MIRA016_GAIN_UNIT) << bit_shift);
+
+	/*
+	 * Analogue octave: largest n with 57 * 2^n <= 84 * gain, or
+	 * floor(log2(84 * gain / 57)).
+	 *
+	 * 84 is the max adc_gain value of 63 + 21 from the formula.
+	 *
+	 * Limited to 2 for 10 bits, goes up to 4 for 8 bits. The remainder of
+	 * the gain that cannot be obtained through the ADC ramp current goes to
+	 * the digital part for the 8-bits mode.
+	 */
+	for (n = 0; n < 2 + bit_shift; n++) {
+		if (MIRA016_ADC_GAIN_VAL(n + 1) > 84U * gain)
+			break;
+	}
+
+	k = min(n, 2U);
+	j = n - k;
+	adc = (int)DIV_ROUND_CLOSEST(MIRA016_ADC_GAIN_VAL(n), gain) - 21;
+
+	fg->rg_adcgain = clamp(adc, 0, MIRA016_BIAS_RG_ADCGAIN_MAX);
+	fg->rg_mult = MIRA016_FINE_GAIN_REF_MULT - k;
+	fg->gdig_preamp = (16U << j) / BIT(bit_shift) - 1;
+}
 
 static const u32 mira016_mbus_formats[] = {
 	MEDIA_BUS_FMT_Y12_1X12,
@@ -1140,10 +1163,10 @@ static int mira016_set_pad_format(struct v4l2_subdev *sd,
 
 	switch (fmt->format.code) {
 	case MEDIA_BUS_FMT_Y8_1X8:
-		gain_max = ARRAY_SIZE(mira016_gain_lut_8bit);
+		gain_max = MIRA016_GAIN_MAX_8B;
 		break;
 	case MEDIA_BUS_FMT_Y10_1X10:
-		gain_max = ARRAY_SIZE(mira016_gain_lut_10bit);
+		gain_max = MIRA016_GAIN_MAX_10B;
 		break;
 	case MEDIA_BUS_FMT_Y12_1X12:
 	default:
@@ -1152,11 +1175,12 @@ static int mira016_set_pad_format(struct v4l2_subdev *sd,
 		 * changes the line timings while streaming. Only allow 1x
 		 * for the time being.
 		 */
-		gain_max = 1;
+		gain_max = MIRA016_GAIN_UNIT;
 		break;
 	}
 
-	ret = __v4l2_ctrl_modify_range(mira016->gain, 1, gain_max, 1, 1);
+	ret = __v4l2_ctrl_modify_range(mira016->gain, MIRA016_GAIN_UNIT,
+				       gain_max, 1, MIRA016_GAIN_UNIT);
 	if (ret)
 		return ret;
 
@@ -1692,23 +1716,17 @@ static int mira016_write_analogue_gain(struct mira016 *mira016,
 				       struct v4l2_subdev_state *state,
 				       u32 gain)
 {
-	const struct mira016_gain_lut *lut;
 	struct v4l2_mbus_framefmt *format;
+	struct mira016_fine_gain fg = {};
 	int ret = 0;
 
-	/*
-	 * Use 'gain - 1' as the gain control values are indexed from 1
-	 * while the gain luts are 0-indexed.
-	 */
 	format = v4l2_subdev_state_get_format(state, 0);
 	switch (format->code) {
 	case MEDIA_BUS_FMT_Y8_1X8:
-		lut = &mira016_gain_lut_8bit[gain - 1];
-		break;
+		fallthrough;
 	case MEDIA_BUS_FMT_Y10_1X10:
-		lut = &mira016_gain_lut_10bit[gain - 1];
+		mira016_fine_gain(format->code, gain, &fg);
 		break;
-	case MEDIA_BUS_FMT_Y12_1X12:
 	default:
 		/* 12 bit gain is fixed, nothing to do here. */
 		return 0;
@@ -1716,13 +1734,9 @@ static int mira016_write_analogue_gain(struct mira016 *mira016,
 
 	cci_write(mira016->regmap, MIRA016_BANK_SEL_REG, 0, &ret);
 
-	cci_write(mira016->regmap, MIRA016_BIAS_RG_ADCGAIN,
-		  lut->rg_adcgain, &ret);
-	cci_write(mira016->regmap, MIRA016_BIAS_RG_MULT,
-		  lut->rg_mult, &ret);
-	if (format->code == MEDIA_BUS_FMT_Y8_1X8)
-		cci_write(mira016->regmap, MIRA016_GDIG_PREAMP,
-			  lut->gdig_preamp, &ret);
+	cci_write(mira016->regmap, MIRA016_BIAS_RG_ADCGAIN, fg.rg_adcgain, &ret);
+	cci_write(mira016->regmap, MIRA016_BIAS_RG_MULT, fg.rg_mult, &ret);
+	cci_write(mira016->regmap, MIRA016_GDIG_PREAMP, fg.gdig_preamp, &ret);
 
 	return ret;
 }
@@ -1919,7 +1933,8 @@ static int mira016_init_controls(struct mira016 *mira016)
 
 	mira016->gain = v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
 					  V4L2_CID_ANALOGUE_GAIN,
-					  1, 1, 1, 1);
+					  MIRA016_GAIN_UNIT, MIRA016_GAIN_UNIT,
+					  1, MIRA016_GAIN_UNIT);
 
 	/*
 	 * Changing VFLIP requires re-programming the top point, hence we

-- 
2.56.0

