Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4FE38886D;
	Sat, 27 Jun 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570594; cv=none; b=AycJUpwa0LiBBTBsMxaSiQbiLW1/ifpRg64YzbZty+MsDz73vObYW5ZBWNFiZUVx/rVeQgbDIsnytMFkO5lW8Ka0SPPpBGk3EKiashn3KizpJw2j9g/fC1vBK41b6D4EZT1jH9IGOTPwhGui3VdsypPWgTDAjYrLwayOlY0C0Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570594; c=relaxed/simple;
	bh=v12bjv5+uJitkBW9afk05HXNzN96YZBYE6YeJlCK648=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/hYuu/zm4oQOuEG+vCV7gT0pEHmLxgQzgD++e9y0hmeM/L2N+h10rU8SC1wcVzOBv3iTPq3TNIoewLSYtinJ+ITouu0QW5LQYq2t58FMO/N0nv9gVgXsO+KMGn2aJZk6vtEOOyKT37zwdQ6q7MeELu1fB2AosQPIzaq16ADSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q48EvPoH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q48EvPoH"
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8935C82A;
	Sat, 27 Jun 2026 16:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782570546;
	bh=v12bjv5+uJitkBW9afk05HXNzN96YZBYE6YeJlCK648=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q48EvPoHeQ/FyFX5vqZcdr77bEFS5liEUn22tMxVBl4E8RqTubUAS2rxHvD/BaICf
	 rCvPovIyw/GaNVmJZUl81AvBWpZgbu6qst6G70035fOrRsRNhjZ0+xyC80YG5YNctt
	 aC0VWRnwOrr7Hi/h/9uuwe8qP3XmjsVv7dM40s8E=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 27 Jun 2026 16:29:15 +0200
Subject: [PATCH v3 3/4] media: mali-c55: Add support for RGB Gamma
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-mali-c55-ccm-gamma-v3-3-113584c05174@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
In-Reply-To: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10716;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=z7S1LDaWLRMmxi7PONYUmjsD4DvA8lmDKFoJw0mq0mw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP95ViuuBJbNuh2khnzi2GjaeZGxN2shkNAZ+h
 a4XkaTAvdSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/eVQAKCRByNAaPFqFW
 POqPD/9KQR71y4dvCo9VN5YWk9axame35ONL3vmXCac+Yx4mcluu/HFKeiZGAd+JOK3X/OxsLrd
 AJXzgxno34WiCJMmrqCxiXbbEaxgEIHnznhoUrOFIQBMaeQy5HAz5lPi45oIbHUdztwUpQRvzj4
 4Geeb04krO46/WzwMmHdTyRR/cd2iEoMH22f5VpnGrx6KodQaAlvYydyoSTt9noCxWvqllGNAWZ
 9vjZZZCQ492FJogu7QynOARFf8QzmLoG16PLE9HoA+gt5rB6umYfxcTZ80TTDX/xJ9NshJ9pirY
 b2TPY6SXCkfxOCkuU3bgaVrfESsOgF79gzIcEDdvg2CtKIGGF6XprJi+tZ16gfA4W5IrJo4G7EH
 GI/9utxkEi5As8WXZardqL1Tpt9sFx+U3ii6cc27CJyLnhcxgRxi4FU5VOlgPvw3OgSXQlvfm9q
 b8zojoC0dI5Lj6WQXPuU7GQVTT6kgsMOZt/jfsxFFGASyM03C0FdNqqXEYPzMunQ1MI+Gmiu4Y/
 UBvCYV5W1QtXIKQUi6cXStcfH75IAHKZYUxcOIR0jiDf6J/DgZx0K/1D27qlEcxKPmdyeGWwrSh
 TERtg2VtJuz3zdwHAcvmyEglGsTW0jRrVG+2o3DlTcCfPEwcSKZMzYEcfSqr6kdhgbB7h48h+c6
 utSt9ljIe1UEn3w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Add support for Gamma curve correction for the Mali C55 ISP.

Define a new block in the uAPI using the extensible v4l2-isp format and
implement support for configuring the RGB Gamma parameters in the
mali-c55 parameters handler.

While at it, rename the MALI_C55_REG_GAMMA_GAINS_[1|2] register name
to MALI_C55_REG_GAMMA_GAINS_[RG|B] and the
MALI_C55_REG_GAMMA_OFFSETS_[1|2] register name to
MALI_C55_REG_GAMMA_OFFSETS_[RG|B] to better clarify their intent.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v3:
- Rename register as suggested by Linus
- Remove an additional tab and fix gamma maximum value in uapi as
  suggested by Vincenzo
v2:
- Remove unused 'rgb_enable' member
- Address checkpatch issues
---
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 75 ++++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     | 13 ++--
 include/uapi/linux/media/arm/mali-c55-config.h     | 45 ++++++++++++-
 3 files changed, 128 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 333e66ee3923..5857e9c2daf7 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -47,6 +47,8 @@
  * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
  * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
  * @ccm:		For header->type == MALI_C55_PARAM_BLOCK_CCM
+ * @gamma:		For header->type == MALI_C55_PARAM_BLOCK_GAMMA_FR and
+ *			header->type = MALI_C55_PARAM_BLOCK_GAMMA_DS
  * @data:		Allows easy initialisation of a union variable with a
  *			pointer into a __u8 array.
  */
@@ -61,6 +63,7 @@ union mali_c55_params_block {
 	const struct mali_c55_params_mesh_shading_config *shading_config;
 	const struct mali_c55_params_mesh_shading_selection *shading_selection;
 	const struct mali_c55_params_ccm *ccm;
+	const struct mali_c55_params_gamma *gamma;
 	const __u8 *data;
 };
 
@@ -462,6 +465,70 @@ static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 1);
 }
 
+static void mali_c55_params_gamma(struct mali_c55 *mali_c55,
+				  union mali_c55_params_block block,
+				  __u32 offset, __u32 lut_base)
+{
+	const struct mali_c55_params_gamma *params = block.gamma;
+
+	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		mali_c55_ctx_update_bits(mali_c55,
+					 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
+					 MALI_C55_GAMMA_ENABLE_MASK, 0x00);
+		return;
+	}
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_RG + offset,
+				 MALI_C55_GAMMA_GAIN_R_MASK, params->gains[0]);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_RG + offset,
+				 MALI_C55_GAMMA_GAIN_G_MASK,
+				 MALI_C55_GAMMA_GAIN_G(params->gains[1]));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_B + offset,
+				 MALI_C55_GAMMA_GAIN_B_MASK, params->gains[2]);
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_RG + offset,
+				 MALI_C55_GAMMA_OFFSET_R_MASK,
+				 params->offs[0]);
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_RG + offset,
+				 MALI_C55_GAMMA_OFFSET_G_MASK,
+				 MALI_C55_GAMMA_OFFSET_G(params->offs[1]));
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_OFFSETS_B + offset,
+				 MALI_C55_GAMMA_OFFSET_B_MASK,
+				 params->offs[2]);
+
+	for (unsigned int i = 0; i < MALI_C55_NUM_GAMMA_LUT_ELEMENTS; i++) {
+		__u32 addr = lut_base + (i * 4);
+
+		mali_c55_ctx_write(mali_c55, addr, params->lut[i]);
+	}
+
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
+				 MALI_C55_GAMMA_ENABLE_MASK, 0x1);
+}
+
+static void mali_c55_params_gamma_fr(struct mali_c55 *mali_c55,
+				     union mali_c55_params_block block)
+{
+	return mali_c55_params_gamma(mali_c55, block,
+				     MALI_C55_CAP_DEV_FR_REG_OFFSET,
+				     MALI_C55_REG_FR_GAMMA_RGB_MEM);
+}
+
+static void mali_c55_params_gamma_ds(struct mali_c55 *mali_c55,
+				     union mali_c55_params_block block)
+{
+	/* We cannot apply parameters to DS if it is not fitted. */
+	if (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED))
+		return;
+
+	return mali_c55_params_gamma(mali_c55, block,
+				     MALI_C55_CAP_DEV_DS_REG_OFFSET,
+				     MALI_C55_REG_DS_GAMMA_RGB_MEM);
+}
+
 static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = &mali_c55_params_sensor_offs,
 	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = &mali_c55_params_aexp_hist,
@@ -475,6 +542,8 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
 	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = &mali_c55_params_lsc_config,
 	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
 	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
+	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = &mali_c55_params_gamma_fr,
+	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = &mali_c55_params_gamma_ds,
 };
 
 static int mali_c55_ccm_validate(struct device *dev,
@@ -551,6 +620,12 @@ mali_c55_params_block_types_info[] = {
 		.size = sizeof(struct mali_c55_params_ccm),
 		.block_validate = mali_c55_ccm_validate,
 	},
+	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = {
+		.size = sizeof(struct mali_c55_params_gamma),
+	},
+	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = {
+		.size = sizeof(struct mali_c55_params_gamma),
+	},
 };
 
 static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
index f098effde7b4..7d9f51b53448 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -422,15 +422,17 @@ enum mali_c55_interrupts {
 
 #define MALI_C55_REG_GAMMA_RGB_ENABLE			0x1c064
 #define MALI_C55_GAMMA_ENABLE_MASK			BIT(0)
-#define MALI_C55_REG_GAMMA_GAINS_1			0x1c068
+#define MALI_C55_REG_GAMMA_GAINS_RG			0x1c068
 #define MALI_C55_GAMMA_GAIN_R_MASK			GENMASK(11, 0)
 #define MALI_C55_GAMMA_GAIN_G_MASK			GENMASK(27, 16)
-#define MALI_C55_REG_GAMMA_GAINS_2			0x1c06c
+#define MALI_C55_GAMMA_GAIN_G(x)			((x) << 16)
+#define MALI_C55_REG_GAMMA_GAINS_B			0x1c06c
 #define MALI_C55_GAMMA_GAIN_B_MASK			GENMASK(11, 0)
-#define MALI_C55_REG_GAMMA_OFFSETS_1			0x1c070
+#define MALI_C55_REG_GAMMA_OFFSETS_RG			0x1c070
 #define MALI_C55_GAMMA_OFFSET_R_MASK			GENMASK(11, 0)
 #define MALI_C55_GAMMA_OFFSET_G_MASK			GENMASK(27, 16)
-#define MALI_C55_REG_GAMMA_OFFSETS_2			0x1c074
+#define MALI_C55_GAMMA_OFFSET_G(x)			((x) << 16)
+#define MALI_C55_REG_GAMMA_OFFSETS_B			0x1c074
 #define MALI_C55_GAMMA_OFFSET_B_MASK			GENMASK(11, 0)
 
 /*
@@ -441,6 +443,9 @@ enum mali_c55_interrupts {
 #define MALI_C55_REG_FR_GAMMA_RGB_ENABLE		0x1c064
 #define MALI_C55_REG_DS_GAMMA_RGB_ENABLE		0x1c1d8
 
+#define MALI_C55_REG_FR_GAMMA_RGB_MEM			0x18280
+#define MALI_C55_REG_DS_GAMMA_RGB_MEM			0x18484
+
 #define MALI_C55_REG_FR_SCALER_HFILT			0x34a8
 #define MALI_C55_REG_FR_SCALER_VFILT			0x44a8
 #define MALI_C55_REG_DS_SCALER_HFILT			0x14a8
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
index 0b2085eed81b..fc345809f746 100644
--- a/include/uapi/linux/media/arm/mali-c55-config.h
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -36,6 +36,9 @@
  */
 #define MALI_C55_MAX_ZONES	(15 * 15)
 
+/* Number of RGB gamma LUT entries. */
+#define MALI_C55_NUM_GAMMA_LUT_ELEMENTS 129
+
 /**
  * struct mali_c55_ae_1024bin_hist - Auto Exposure 1024-bin histogram statistics
  *
@@ -220,6 +223,8 @@ struct mali_c55_stats_buffer {
  * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
  * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
  * @MALI_C55_PARAM_BLOCK_CCM: Colour correction matrix
+ * @MALI_C55_PARAM_BLOCK_GAMMA_FR: Gamma gain and offset for FR pipe
+ * @MALI_C55_PARAM_BLOCK_GAMMA_DS: Gamma gain and offset for DS pipe
  */
 enum mali_c55_param_block_type {
 	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
@@ -234,6 +239,8 @@ enum mali_c55_param_block_type {
 	MALI_C55_PARAM_MESH_SHADING_CONFIG,
 	MALI_C55_PARAM_MESH_SHADING_SELECTION,
 	MALI_C55_PARAM_BLOCK_CCM,
+	MALI_C55_PARAM_BLOCK_GAMMA_FR,
+	MALI_C55_PARAM_BLOCK_GAMMA_DS,
 };
 
 /**
@@ -795,6 +802,40 @@ struct mali_c55_params_ccm {
 	__u16 offs[3];
 };
 
+/**
+ * struct mali_c55_params_gamma - RGB Gamma correction
+ *
+ * Gamma correction is used to program a standard gamma curve such as the sRGB
+ * one. It provides gains and offsets to implement contrast adjustments.
+ *
+ * Gamma correction is applied on both the FR and DS pipes separately in the RGB
+ * colour domain where the following operations take place:
+ * 1) An offset is subtracted from each colour channel
+ * 2) Each colour channel is multiplied by a gain
+ * 3) The Gamma LUT is applied to each colour channel
+ *
+ * The Gamma LUT has 129 entries where each node is an unsigned 12 bit number.
+ * It is expected that LUT[0]=0 and LUT[128]=0xfff, with the other 127 values
+ * defining the Gamma correction curve.
+ *
+ * As one Gamma correction block is available on both the FR and DS pipes, the
+ * header.type field should be set to one of either
+ * MALI_C55_PARAM_BLOCK_GAMMA_FR or MALI_C55_PARAM_BLOCK_GAMMA_DS from
+ * :c:type:`mali_c55_param_block_type`.
+ *
+ * @header:	The Mali-C55 parameters block header
+ * @gains:	Gains for the red, green and blue channel in unsigned Q4.8 format
+ * @offs:	Offsets subtracted from the red, green and blue channels
+ *		in unsigned 12-bit format
+ * @lut:	129-node Gamma LUT in u0.12 format
+ */
+struct mali_c55_params_gamma {
+	struct v4l2_isp_params_block_header header;
+	__u16 gains[3];
+	__u16 offs[3];
+	__u32 lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS];
+};
+
 /**
  * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
  *
@@ -819,6 +860,8 @@ struct mali_c55_params_ccm {
 	sizeof(struct mali_c55_params_awb_gains) +		\
 	sizeof(struct mali_c55_params_mesh_shading_config) +	\
 	sizeof(struct mali_c55_params_mesh_shading_selection) +	\
-	sizeof(struct mali_c55_params_ccm))
+	sizeof(struct mali_c55_params_ccm) +			\
+	sizeof(struct mali_c55_params_gamma) +			\
+	sizeof(struct mali_c55_params_gamma))
 
 #endif /* __UAPI_MALI_C55_CONFIG_H */

-- 
2.54.0

