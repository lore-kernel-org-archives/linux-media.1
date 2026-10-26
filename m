Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009834;
	b=tZnr5gymfBa7wYsIdYvXapLvKDLg7/6EXZFY3QNI+UoLt3N+qkKyS5VfJeOdjsM0gL6N
	 Js9AWwCTA/iDrYx31+UE/LOPKJmtKfCNbVjbyfz82jxOENm0o6+a0+uXqESBKoATQK6cd
	 Nd8YDAv1XIqblEFV2Dz44V/OqDBzNdmbFrKf911jCHLC2vMHLm7xbSLwb2XmO7iq7Ozr4
	 QmXLnM7BadP7QwAxX7iOYyuciPavyGm8NKs6pcxH2e8x8z3/sWUFdPwib0FP0o29UClXn
	 YhKnAlYkgMXg36p9kQx0gIKgyUnY8AzoZA8I3POGLqxeaQVqH7c8QVyBWphe2VPP5bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009834;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cAh/f/LtRJBcGO5Sa8hubjcExZGXq4HWZtjQ+a9Ju1Y=;
	b=3URZxdLRQ1SWcO7mO801TMff5dbo1wOhK72O9JDyh+bWdxhvwFTXQajLBlN8dgrUhlNi
	 WnWxBm5Ahheu77TAs4Yk0z20upCC3ZqegqntxEwAC6SgusOad2hSYEFonyBZVsNh904UE
	 mCnnTXSyOh8iK+LyB5cDjGojBFXmGir8EeY6g1MWQIYtDiEmpKVRlfHKgqCp14LrGMZG2
	 YZZqZ1OCRlZBvzSM8RDy7hRfIBSmXqJCR7Ouwl2KecgwZD5r7HlUfq85G81FSMMUtiYO0
	 M72q/PQFL06BDDskUvjfCHm9Hd6MkI4QB3F4/SKdRohYFcsEqbeTvRL368YuoYlryrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=VwYNNYbg;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFDE606A321
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFDE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=VwYNNYbg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=cAh/f/LtRJBcGO5Sa8hubjcExZGXq4HWZtjQ+a9Ju1Y=; b=VwYNNYbglHBpD41rNOuiNiNe5b
	s1c/wx4LWDpANJ4TvdJacxpDn+vsgXIi0VtIWZOiV04qtlf9aT8JDSlseLjEUVpH93poDGXZOKyNa
	1hNIjGyz9I93KMGdwuZER0dxn3x/k9pj1EhTFlI+1NI4AXpFEhAphMlqcX+3sm8Y0oGRibo5gpRsp
	gYFzuz0pvtu+HOLOnkg4XDvM58oeZUMqZErxNfvCQvgVOCO40A6i+bP0IMjwVUECQlQL0oticR0Va
	vLwaw4sFaA9GOKt9c7JNYVAugsaZ7CEYFnUraZCKWX6fnT9uuY22TNskkNJ6XcD2TTJyFvi4lpMc6
	pfsN1dQw==;
From: Heiko Stuebner <heiko@sntech.de>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 4/5] media: i2c: ov5675: Handle PLLs using actual register descriptions
Date: Mon, 26 Oct 2026 11:16:45 +0100
Message-ID: <20261026101646.2450051-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026101646.2450051-1-heiko@sntech.de>
References: <20261026101646.2450051-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The datasheet actually describes the clock tree, so we can set PLL rates
using actual code and not via an opaque register write list.

This allows the easily add additional rates for different input clocks
in the future.

With the old hard values + the default values in the other registers,
I was able to verify that the previous settings result in the correct
900MHz MIPI-PHY rate, 112MHz MIPI PCLK and 90MHz SCLK when following
the clock diagram in the manual and re-calculating the rates from that.
(Exact values are 902.4MHz, 112.8MHz, 91.2MHz, coming from the 19.2MHz)

A caveat is that the datasheet is not fully consistent between the
graphical clock diagram and the register description - with the diagram
showing another selector between both PLLs, not mentioned in the register
description.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/media/i2c/ov5675.c | 287 ++++++++++++++++++++++++++++++++++---
 1 file changed, 271 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 1a0ee12912ca..d5d90d911e7f 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -34,6 +34,42 @@
 #define OV5675_REG_SOFTWARE_RST		0x0103
 #define OV5675_SOFTWARE_RST		BIT(0)
 
+#define OV5675_REG_PLL_CTRL0		0x300
+#define OV5675_PLL1_PREDIV(v)		((v) & GENMASK(2, 0))
+#define OV5675_REG_PLL_CTRL1		0x301
+#define OV5675_PLL1_MUL_H(v)		(((v) & GENMASK(9, 8)) >> 8)
+#define OV5675_REG_PLL_CTRL2		0x302
+#define OV5675_PLL1_MUL_L(v)		((v) & GENMASK(7, 0))
+
+/* datasheet calls this sometimes MIPI_DIV[1:0], but mostly DIVPX[3:0] */
+#define OV5675_REG_PLL_CTRL3		0x303
+#define OV5675_PLL1_DIVPX(v)		(((v) - 1) & GENMASK(1, 0))
+
+/* datasheet uses both [0] and [1:0] as range */
+#define OV5675_REG_PLL_CTRL4		0x304
+#define OV5675_PLL1_PIX_BITDIV(v)	((v - 4) & BIT(0))
+#define OV5675_REG_PLL_CTRL5		0x305
+#define OV5675_PLL1_SYS_BITDIV(v)	((v - 4) & BIT(0))
+
+#define OV5675_REG_PLL_CTRL6		0x306
+#define OV5675_PLL1_PREDIVP(v)		((v - 1) & BIT(0))
+
+#define OV5675_REG_PLL_CTRLB		0x30b
+#define OV5675_PLL2_PREDIV(v)		((v) & GENMASK(2, 0))
+#define OV5675_REG_PLL_CTRLC		0x30c
+#define OV5675_PLL2_MUL_H(v)		(((v) & GENMASK(9, 8)) >> 8)
+#define OV5675_REG_PLL_CTRLD		0x30d
+#define OV5675_PLL2_MUL_L(v)		((v) & GENMASK(7, 0))
+#define OV5675_REG_PLL_CTRLF		0x30f
+#define OV5675_PLL2_SA1_DIV(v)		((v - 5) & GENMASK(1, 0))
+#define OV5675_REG_PLL_CTRL12		0x312
+#define OV5675_PLL2_PREDIVP_MASK	BIT(4)
+#define OV5675_PLL2_PREDIVP(v)		((((v) - 1) << 4) & BIT(4))
+
+#define OV5675_REG_CLOCK_SEL		0x3020
+#define OV5675_PCLK_SEL_MASK		BIT(3)
+#define OV5675_PCLK_SEL(v)		((((v) - 1) << 3) & BIT(3))
+
 /* vertical-timings from sensor */
 #define OV5675_REG_VTS			0x380e
 #define OV5675_VTS_30FPS		0x07e4
@@ -82,6 +118,74 @@
 
 #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
 
+/*
+ * PLL1 Clock Tree:
+ *
+ * +-< EXTCLK
+ * |
+ * +-+ pll_predivp (0x307 [0]), partly labelled prediv0
+ *   |
+ *   +-+ pll_prediv (0x300 [2:0], special values:
+ *     |              0: 1, 1: 1.5, 2: 2, 3: 2.5, 4: 3, 5: 4, 6: 6, 7: 8)
+ *     +-+ pll_multiplier (0x301 [1:0], 0x302 [7:0])
+ *       |
+ *       +-+ pll_divpx (0x303 [3:0]), partly labelled mipi_div
+ *       | |
+ *       | +-> PHY_SCLK
+ *       | |
+ *       | +-+ pll_pix_bitdiv (0x304 [0], special values: 0: 4, 1: 5)
+ *       |   |
+ *       |   +-+ pclk_div (0x3020 [3])
+ *       |     |
+ *       |     +-> PCLK
+ *       |
+ *       +-+ pll_sys_bitdiv (0x305 [0], special values: 0: 4, 1: 5)
+ */
+
+struct ov5675_pll1_config {
+	unsigned int pll_predivp;
+	unsigned int pll_prediv;
+	unsigned int pll_multiplier;
+	unsigned int pll_divpx;
+	unsigned int pll_pix_bitdiv;
+	unsigned int pll_sys_bitdiv;
+	unsigned int pclk_div;
+};
+
+/*
+ * PLL2 Clock Tree:
+ *
+ * +-< EXTCLK
+ * |
+ * +-+ pll_predivp (0x312 [4]), partly labelled prediv0
+ *   |
+ *   +-+ pll_prediv (0x30b [2:0], special values:
+ *     |              0: 1, 1: 1.5, 2: 2, 3: 2.5, 4: 3, 5: 4, 6: 6, 7: 8)
+ *     +-+ pll_mul (0x30c [1:0], 0x30d [7:0])
+ *       |
+ *       +-+ dac_div (0x312 [3:0])
+ *       | |
+ *       | +-> DAC_CLK
+ *       |
+ *       +-+ pll_sa1_div (0x30f [3:0])
+ *         |
+ *         + (pll graph specifies selector, not in register description)
+ *         |
+ *         +-> SCLK
+ */
+
+struct ov5675_pll2_config {
+	unsigned int pll_predivp;
+	unsigned int pll_prediv;
+	unsigned int pll_multiplier;
+	unsigned int pll_sa1_div;
+};
+
+struct ov5675_pll_configs {
+	const struct ov5675_pll1_config *pll1_config;
+	const struct ov5675_pll2_config *pll2_config;
+};
+
 static const char * const ov5675_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
@@ -105,7 +209,7 @@ struct ov5675_reg_list {
 };
 
 struct ov5675_link_freq_config {
-	const struct ov5675_reg_list reg_list;
+	const struct ov5675_pll_configs **pll_configs;
 };
 
 struct ov5675_mode {
@@ -142,11 +246,31 @@ static const unsigned long supported_xvclk_rates[] = {
 	[OV5675_XVCLK_19_2] = 19200000,
 };
 
-static const struct ov5675_reg mipi_data_rate_900mbps[] = {
-	{0x0300, 0x04},
-	{0x0302, 0x8d},
-	{0x0303, 0x00},
-	{0x030d, 0x26},
+/* PLL Targets: PHY_SCLK = 900 MHz, PCLK = 112.5 MHz, SCLK = 90 MHz */
+static const struct ov5675_pll1_config ov5675_pll1_config_900mbps_19_2mhz = {
+	.pll_predivp = 1,
+	.pll_prediv = 4,
+	.pll_multiplier = 141,
+	.pll_divpx = 1,
+	.pll_pix_bitdiv = 4,
+	.pll_sys_bitdiv = 5,
+	.pclk_div = 2,
+};
+
+static const struct ov5675_pll2_config ov5675_pll2_config_900mbps_19_2mhz = {
+	.pll_predivp = 1,
+	.pll_prediv = 0,
+	.pll_multiplier = 38,
+	.pll_sa1_div = 8,
+};
+
+static const struct ov5675_pll_configs ov5675_pll_configs_900mbps_19_2mhz = {
+	.pll1_config = &ov5675_pll1_config_900mbps_19_2mhz,
+	.pll2_config = &ov5675_pll2_config_900mbps_19_2mhz,
+};
+
+static const struct ov5675_pll_configs *ov5675_pll_configs_900mbps[] = {
+	[OV5675_XVCLK_19_2] = &ov5675_pll_configs_900mbps_19_2mhz,
 };
 
 static const struct ov5675_reg mode_2592x1944_regs[] = {
@@ -469,10 +593,7 @@ static const s64 link_freq_menu_items[] = {
 
 static const struct ov5675_link_freq_config link_freq_configs[] = {
 	[OV5675_LINK_FREQ_900MBPS] = {
-		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_data_rate_900mbps),
-			.regs = mipi_data_rate_900mbps,
-		}
+		.pll_configs = ov5675_pll_configs_900mbps,
 	}
 };
 
@@ -513,6 +634,7 @@ struct ov5675 {
 	unsigned long xvclk_rate;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[OV5675_NUM_SUPPLIES];
+	int pll_config_index;
 
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
@@ -595,6 +717,22 @@ static int ov5675_write_reg(struct ov5675 *ov5675, u16 reg, u16 len, u32 val)
 	return 0;
 }
 
+static int ov5675_update_reg_bits(struct ov5675 *ov5675, u16 reg, u16 len,
+				  u8 mask, u8 bits)
+{
+	u32 val = 0;
+	int ret;
+
+	ret = ov5675_read_reg(ov5675, reg, len, &val);
+	if (ret)
+		return ret;
+
+	val &= ~mask;
+	val |= bits;
+
+	return ov5675_write_reg(ov5675, reg, len, val);
+}
+
 static int ov5675_write_reg_list(struct ov5675 *ov5675,
 				 const struct ov5675_reg_list *r_list)
 {
@@ -919,9 +1057,125 @@ static int ov5675_init_module(struct ov5675 *ov5675)
 	return 0;
 }
 
+static int ov5675_set_pll1_rate(struct ov5675 *ov5675,
+				const struct ov5675_pll1_config *config)
+{
+	int ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL0,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL1_PREDIV(config->pll_prediv));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL1,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL1_MUL_H(config->pll_multiplier));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL2,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL1_MUL_L(config->pll_multiplier));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL3,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL1_DIVPX(config->pll_divpx));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL4,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL1_PIX_BITDIV(config->pll_pix_bitdiv));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL5,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL1_SYS_BITDIV(config->pll_sys_bitdiv));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL6,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL1_PREDIVP(config->pll_predivp));
+	if (ret)
+		return ret;
+
+	ret = ov5675_update_reg_bits(ov5675, OV5675_REG_CLOCK_SEL,
+				     OV5675_REG_VALUE_08BIT,
+				     OV5675_PCLK_SEL_MASK,
+				     OV5675_PCLK_SEL(config->pclk_div));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+
+static int ov5675_set_pll2_rate(struct ov5675 *ov5675,
+				const struct ov5675_pll2_config *config)
+{
+	int ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLB,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL2_PREDIV(config->pll_prediv));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLC,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL2_MUL_H(config->pll_multiplier));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLD,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL2_MUL_L(config->pll_multiplier));
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLF,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_PLL2_SA1_DIV(config->pll_sa1_div));
+	if (ret)
+		return ret;
+
+	ret = ov5675_update_reg_bits(ov5675, OV5675_REG_PLL_CTRL12,
+				     OV5675_REG_VALUE_08BIT,
+				     OV5675_PLL2_PREDIVP_MASK,
+				     OV5675_PLL2_PREDIVP(config->pll_predivp));
+
+	return 0;
+}
+
+static int ov5675_set_pll_rates(struct ov5675 *ov5675,
+				const struct ov5675_pll_configs *configs)
+{
+	int ret;
+
+	ret = ov5675_set_pll1_rate(ov5675, configs->pll1_config);
+	if (ret) {
+		dev_err(ov5675->dev, "failed to set PLL1 config\n");
+		return ret;
+	}
+
+	ret = ov5675_set_pll2_rate(ov5675, configs->pll2_config);
+	if (ret) {
+		dev_err(ov5675->dev, "failed to set PLL2 config\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int ov5675_start_streaming(struct ov5675 *ov5675)
 {
 	const struct ov5675_reg_list *reg_list;
+	const struct ov5675_pll_configs *pll_configs;
 	int link_freq_index, ret;
 
 	ret = ov5675_identify_module(ov5675);
@@ -933,12 +1187,11 @@ static int ov5675_start_streaming(struct ov5675 *ov5675)
 		return ret;
 
 	link_freq_index = ov5675->cur_mode->link_freq_index;
-	reg_list = &link_freq_configs[link_freq_index].reg_list;
-	ret = ov5675_write_reg_list(ov5675, reg_list);
-	if (ret) {
-		dev_err(ov5675->dev, "failed to set plls");
+
+	pll_configs = link_freq_configs[link_freq_index].pll_configs[ov5675->pll_config_index];
+	ret = ov5675_set_pll_rates(ov5675, pll_configs);
+	if (ret)
 		return ret;
-	}
 
 	reg_list = &ov5675->cur_mode->reg_list;
 	ret = ov5675_write_reg_list(ov5675, reg_list);
@@ -1229,8 +1482,10 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	ov5675->xvclk_rate = clk_get_rate(ov5675->xvclk);
 
 	for (i = 0; i < ARRAY_SIZE(supported_xvclk_rates); i++) {
-		if (ov5675->xvclk_rate == supported_xvclk_rates[i])
+		if (ov5675->xvclk_rate == supported_xvclk_rates[i]) {
+			ov5675->pll_config_index = i;
 			break;
+		}
 	}
 
 	if (i == ARRAY_SIZE(supported_xvclk_rates)) {
-- 
2.47.3

