Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A287A2F90C9;
	Mon,  3 Aug 2026 05:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785736251; cv=none; b=E6GcXjEyoMVBy3uRwLrKsuqaVe18z9D1gfnA3S5nZCsW3KP0nnAG4Qs9LLhpnXffOjGOvwXfH6XhMW5H9s9b3gRL7QYA5Oirt4Y0e+1MX3B47BIMe29shKgJmMmFqPYlDGT3PS6ZOymXGIdb8NtsnFhK5Ukqs8tMhKiuLjTxfw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785736251; c=relaxed/simple;
	bh=QHx/6VT+2eE/nev6vnNkXcBJg2kevi1ddJtjcllAIoU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aaXy82ZjwZbrMGPacGZhu2yzpwNeE4BetfW8Ykl43KVs29b02tWkbso7Nj9KCpy4GQxlh+WcIQTdCRuyGtPmd71gLVtthqyi/qxI0zQ+AyWODvX9EsCDvNMHrdIcD3hBI/LheXptnce0FfCbgzMLYUB1/Fjz0ljuFc0LFCjM/I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xhgAeqtt; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xhgAeqtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785736249; x=1817272249;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QHx/6VT+2eE/nev6vnNkXcBJg2kevi1ddJtjcllAIoU=;
  b=xhgAeqttoWFFEAe3mM9KfcC/vCKgsP5yoQWV7SvLQfJ7+i6mgb2SVRks
   JJwcD7uyaHwdvTwuI3ig8sD+NrB03ydAl3FLnZs9ZwCcy7Hh51cPqS5zm
   wrnhsi6HZ2asFVz6lkIAv+YEyHBDHtTW0Ubgaoc7iWQX4pV55SRrHqoCK
   xQSHA/SdtVcx2HGrnjuozzMj9jh9ubseGimwQcTBnw2cqdgk+AmULdT+P
   lp/eadB9AvHrpxpgdCw9PQpdUp9/kPH2hWmZxneL31oAip0OnUaiBYGbE
   J1q9CNuPxv9cIf6i6LEKkflcul9t493+Dw3MFx7v6F8Isy8vcVDwKjeEQ
   w==;
X-CSE-ConnectionGUID: 46zazo67RpaGzwwvuOJhsg==
X-CSE-MsgGUID: N9rO7BBqQXODMUH3FcsR9g==
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="61860626"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Aug 2026 22:50:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 2 Aug 2026 22:50:43 -0700
Received: from hyd-ld-i35088a.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 2 Aug 2026 22:50:40 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<conor.dooley@microchip.com>, <valentina.fernandezalanis@microchip.com>,
	<praveen.kumar@microchip.com>, <shravan.chippa@microchip.com>
Subject: [PATCH V3] media: i2c: imx334: add new link frequency configuration
Date: Mon, 3 Aug 2026 11:20:34 +0530
Message-ID: <20260803055034.3807438-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Add 222 MHz link frequency support and refactor clock registers into
per-frequency register lists. Introduce imx334_clk_params to map each
link frequency to its register set and supported resolution range.
Make the link frequency control writable so userspace can select the
desired operating point.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>

---
Changes from V2 -> V3

- Refactor: Introduce struct imx334_clk_params
    - Maps each link frequency to its clock register set and supported
      resolution range (width_max, height_max, width_min, height_min).
    - Includes a default_mode pointer for fallback when resolution is
      out of range for the selected link frequency.

- Enhancement: Make link_freq control writable
    - Removed V4L2_CTRL_FLAG_READ_ONLY from link_freq_ctrl so userspace
      can select the desired link frequency operating point.

- Enhancement: Add resolution bounds checking in set_pad_format
    - imx334_set_pad_format() now validates the selected mode against
      the clk_params width/height constraints and falls back to the
      default mode if out of range.

- Cleanup: Remove __v4l2_ctrl_s_ctrl for link_freq in update_controls
    - Link frequency is no longer tied to mode, so the explicit control
      update in imx334_update_controls() was removed.


Changes from V1 -> V2

- Fix: Default mode selection bug
    - Problem: Used __ffs(link_freq_bitmap) as index into the compacted
      active_modes array. This index corresponds to a bit position in the
      bitmap, not an array index in the filtered modes list.
    - Fix: Use index 0, which is always the first valid mode in the
      filtered array.

- Fix: Rename fields for clarity
    - Renamed struct fields:
      * new_supported_modes -> active_modes
      * new_modes_size -> num_active_modes
    - Updated kernel-doc header for struct imx334 to document new fields.

- Fix: INCKSEL2 register write - add error handling and switch-case
    - Location: imx334_enable_streams()
    - Problem: Original code only handled 222 MHz case with no error
      checking (passed NULL to cci_write).
    - Fix: Replaced with switch-case covering all three link frequencies:
      * 891 MHz -> INCKSEL2 = 0x02
      * 445 MHz -> INCKSEL2 = 0x06
      * 222 MHz -> INCKSEL2 = 0x0a
    - Added proper error handling using &ret accumulator pattern with
      dev_err and goto err_rpm_put on failure.

- Fix: Use BIT() macro
    - Location: imx334_update_supported_mode_array()
    - Replaced (1 << i) with BIT(i) for kernel coding style compliance.

- Fix: Use devm_kmalloc_array() for overflow-safe allocation
    - Location: imx334_update_supported_mode_array()
    - Replaced: devm_kmalloc(dev, n * sizeof(struct imx334_mode),
 GFP_KERNEL)
    - With: devm_kmalloc_array(dev, n, sizeof(*temp_ptr), GFP_KERNEL)
    - Provides overflow-safe multiplication and uses sizeof(*ptr) idiom.

- Cleanup: Condensed copy loop
    - Location: imx334_update_supported_mode_array(), second loop
    - Simplified the struct copy with post-increment:
      temp_ptr[size++] = supported_modes[j];

- Fix: Updated function kernel-doc comment
    - Location: imx334_update_supported_mode_array()
    - Reworded: "Search for the supported modes add them in the new list"
    - To: "Build filtered modes array based on DTS link frequencies"

- IMX334_LINK_FREQ_222M changed from 222500000 to 222750000

---

 drivers/media/i2c/imx334.c | 132 +++++++++++++++++++++++++++++++------
 1 file changed, 112 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 553a16b84f4d..fb036873859c 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -109,6 +109,7 @@
 /* CSI2 HW configuration */
 #define IMX334_LINK_FREQ_891M		891000000
 #define IMX334_LINK_FREQ_445M		445500000
+#define IMX334_LINK_FREQ_222M		222750000
 #define IMX334_NUM_DATA_LANES		4
 
 #define IMX334_REG_MIN			0x00
@@ -154,7 +155,6 @@ struct imx334_reg_list {
  * @vblank_min: Minimal vertical blanking in lines
  * @vblank_max: Maximum vertical blanking in lines
  * @pclk: Sensor pixel clock
- * @link_freq_idx: Link frequency index
  * @reg_list: Register list for sensor mode
  */
 struct imx334_mode {
@@ -165,7 +165,28 @@ struct imx334_mode {
 	u32 vblank_min;
 	u32 vblank_max;
 	u64 pclk;
-	u32 link_freq_idx;
+	struct imx334_reg_list reg_list;
+};
+
+/**
+ * struct imx334_clk_params - imx334 sensor clock parameters
+ * @data_rate_per_lane: Data rate per lane in bits per second
+ * @link_freq: Link frequency in Hz
+ * @width_max: Maximum image width in pixels
+ * @height_max: Maximum image height in pixels
+ * @width_min: Minimum image width in pixels
+ * @height_min: Minimum image height in pixels
+ * @default_mode: Pointer to the default sensor mode
+ * @reg_list: Register list for clock configuration
+ */
+struct imx334_clk_params {
+	u32 data_rate_per_lane;
+	u32 link_freq;
+	u32 width_max;
+	u32 height_max;
+	u32 width_min;
+	u32 height_min;
+	const struct imx334_mode *default_mode;
 	struct imx334_reg_list reg_list;
 };
 
@@ -216,6 +237,7 @@ struct imx334 {
 static const s64 link_freq[] = {
 	IMX334_LINK_FREQ_891M,
 	IMX334_LINK_FREQ_445M,
+	IMX334_LINK_FREQ_222M,
 };
 
 /* Sensor common mode registers values */
@@ -233,13 +255,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ IMX334_REG_UNREAD_PARAM6,	0x0008 },
 	{ IMX334_REG_XVS_XHS_OUTSEL,	0x20 },
 	{ IMX334_REG_XVS_XHS_DRV,	0x0f },
-	{ IMX334_REG_BCWAIT_TIME,	0x3b },
-	{ IMX334_REG_CPWAIT_TIME,	0x2a },
-	{ IMX334_REG_INCKSEL1,		0x0129 },
-	{ IMX334_REG_INCKSEL2,		0x06 },
-	{ IMX334_REG_INCKSEL3,		0xa0 },
-	{ IMX334_REG_INCKSEL4,		0x7e },
-	{ IMX334_REG_SYS_MODE,		0x02 },
 	{ IMX334_REG_HADD_VADD,		0x00 },
 	{ IMX334_REG_VALID_EXPAND,	0x03 },
 	{ IMX334_REG_TCYCLE,		0x00 },
@@ -397,6 +412,39 @@ static const struct cci_reg_sequence mode_3840x2160_regs[] = {
 	{ IMX334_REG_TPLX,		0x005f },
 };
 
+/* Data rate 1782Mbps per lane and 891Mhz link frequency */
+static const struct cci_reg_sequence link_freq_891m_regs[] = {
+	{ IMX334_REG_BCWAIT_TIME,	0x3b },
+	{ IMX334_REG_CPWAIT_TIME,	0x2a },
+	{ IMX334_REG_INCKSEL1,		0x0129 },
+	{ IMX334_REG_INCKSEL2,		0x02 },
+	{ IMX334_REG_INCKSEL3,		0xa0 },
+	{ IMX334_REG_INCKSEL4,		0x7e },
+	{ IMX334_REG_SYS_MODE,		0x00 },
+};
+
+/* Data rate 891Mbps per lane and 445Mhz link frequency */
+static const struct cci_reg_sequence link_freq_445m_regs[] = {
+	{ IMX334_REG_BCWAIT_TIME,	0x3b },
+	{ IMX334_REG_CPWAIT_TIME,	0x2a },
+	{ IMX334_REG_INCKSEL1,		0x0129 },
+	{ IMX334_REG_INCKSEL2,		0x06 },
+	{ IMX334_REG_INCKSEL3,		0xa0 },
+	{ IMX334_REG_INCKSEL4,		0x7e },
+	{ IMX334_REG_SYS_MODE,		0x02 },
+};
+
+/* Data rate 445Mbps per lane and 222Mhz link frequency */
+static const struct cci_reg_sequence link_freq_222m_regs[] = {
+	{ IMX334_REG_BCWAIT_TIME,	0x3b },
+	{ IMX334_REG_CPWAIT_TIME,	0x2a },
+	{ IMX334_REG_INCKSEL1,		0x0129 },
+	{ IMX334_REG_INCKSEL2,		0x0a },
+	{ IMX334_REG_INCKSEL3,		0xa0 },
+	{ IMX334_REG_INCKSEL4,		0x7e },
+	{ IMX334_REG_SYS_MODE,		0x02 },
+};
+
 static const char * const imx334_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Color Bars",
@@ -442,7 +490,6 @@ static const struct imx334_mode supported_modes[] = {
 		.vblank_min = 90,
 		.vblank_max = 132840,
 		.pclk = 594000000,
-		.link_freq_idx = 0,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3840x2160_regs),
 			.regs = mode_3840x2160_regs,
@@ -455,7 +502,6 @@ static const struct imx334_mode supported_modes[] = {
 		.vblank_min = 45,
 		.vblank_max = 132840,
 		.pclk = 297000000,
-		.link_freq_idx = 1,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -468,7 +514,6 @@ static const struct imx334_mode supported_modes[] = {
 		.vblank_min = 45,
 		.vblank_max = 132840,
 		.pclk = 297000000,
-		.link_freq_idx = 1,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -481,7 +526,6 @@ static const struct imx334_mode supported_modes[] = {
 		.vblank_min = 45,
 		.vblank_max = 132840,
 		.pclk = 297000000,
-		.link_freq_idx = 1,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
 			.regs = mode_640x480_regs,
@@ -489,6 +533,46 @@ static const struct imx334_mode supported_modes[] = {
 	},
 };
 
+static const struct imx334_clk_params imx334_clk_params[] = {
+	{
+		.data_rate_per_lane = 1782000000,
+		.link_freq = IMX334_LINK_FREQ_891M,
+		.width_max = 3840,
+		.height_max = 2160,
+		.width_min = 3840,
+		.height_min = 2160,
+		.default_mode = &supported_modes[0], /* 3840x2160 */
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(link_freq_891m_regs),
+			.regs = link_freq_891m_regs,
+		},
+	}, {
+		.data_rate_per_lane = 891000000,
+		.link_freq = IMX334_LINK_FREQ_445M,
+		.width_max = 1920,
+		.height_max = 1080,
+		.width_min = 640,
+		.height_min = 480,
+		.default_mode = &supported_modes[1], /* 1920x1080 */
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(link_freq_445m_regs),
+			.regs = link_freq_445m_regs,
+		},
+	}, {
+		.data_rate_per_lane = 445500000,
+		.link_freq = IMX334_LINK_FREQ_222M,
+		.width_max = 1920,
+		.height_max = 1080,
+		.width_min = 640,
+		.height_min = 480,
+		.default_mode = &supported_modes[1], /* 1920x1080 */
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(link_freq_222m_regs),
+			.regs = link_freq_222m_regs,
+		},
+	}
+};
+
 /**
  * to_imx334() - imv334 V4L2 sub-device to imx334 device.
  * @subdev: pointer to imx334 V4L2 sub-device
@@ -512,10 +596,6 @@ static int imx334_update_controls(struct imx334 *imx334,
 {
 	int ret;
 
-	ret = __v4l2_ctrl_s_ctrl(imx334->link_freq_ctrl, mode->link_freq_idx);
-	if (ret)
-		return ret;
-
 	ret = __v4l2_ctrl_modify_range(imx334->pclk_ctrl, mode->pclk,
 				       mode->pclk, 1, mode->pclk);
 	if (ret)
@@ -746,6 +826,7 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx334 *imx334 = to_imx334(sd);
 	const struct imx334_mode *mode;
+	const struct imx334_clk_params *clk_params;
 	int ret = 0;
 
 	mode = v4l2_find_nearest_size(supported_modes,
@@ -753,6 +834,11 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
+	clk_params = &imx334_clk_params[imx334->link_freq_ctrl->val];
+	if (mode->width > clk_params->width_max || mode->height > clk_params->height_max ||
+	    mode->width < clk_params->width_min || mode->height < clk_params->height_min)
+		mode = clk_params->default_mode;
+
 	imx334_fill_pad_format(imx334, mode, fmt);
 	fmt->format.code = imx334_get_format_code(imx334, fmt->format.code);
 
@@ -824,6 +910,15 @@ static int imx334_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Write sensor link freq registers */
+	reg_list = &imx334_clk_params[imx334->link_freq_ctrl->val].reg_list;
+	ret = cci_multi_reg_write(imx334->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(imx334->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &imx334->cur_mode->reg_list;
 	ret = cci_multi_reg_write(imx334->cci, reg_list->regs,
@@ -1096,9 +1191,6 @@ static int imx334_init_controls(struct imx334 *imx334)
 							__ffs(imx334->link_freq_bitmap),
 							link_freq);
 
-	if (imx334->link_freq_ctrl)
-		imx334->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
 	imx334->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
 						&imx334_ctrl_ops,
 						V4L2_CID_HBLANK,
-- 
2.34.1

