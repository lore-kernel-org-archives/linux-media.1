Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835965;
	b=1dG8Qj7GGcqgZmPyGB23rRceGhsOCZgp/dnkoEZ12UCpArCnVA2fuf4Fs5Y2sHsLB/nb
	 ETQuoUaecWkO+pgtRwFnjSTZNKdV42v2yQv6QpcIM5A9sV1Mrk3v21lux6k/cC1ukBD6H
	 mPQM0cKtvzulp0FtxwB/0qOgjKMlvKsG4/dxozLYEwfAL4F+e0ndSL3f1CTK/LymbKjeU
	 LymGD+zXuHLhwSKxVvMjV3hZQsbscCL/TONA0Hxbv38XIy5MbcRqI4jMBB566tA+8r56K
	 jltVDiS8FJkXxdncILgE+8o5Df4dCF3OHZ/f7+jjhSYa/8l7LaYeem485exEJc4IHqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835965;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KuXqYocoLhVizV5+uDkZOQ8T+Ta9Mt/oF23jxASUD+U=;
	b=AAUaGeqKPvipjbRHzhA2uPWq9el4OpsLT733PEnos0uL4raBvJ0QhetqVUKQeAoUmjvL
	 8Uys2w6RAXDV2LXkBWkrV3gCsyTyUWWGM0bTJfRPsmTM71kqm8mrN+lhELecaaHgXSf70
	 AzfY4IqGA40K/j6cbasymbRF6yDiEw4OabJpfNcf62/9bGHtGg/0/c3gd/l+UsfzdP1H+
	 esSwbEflNuP/Vm9+HnSCizmAzcUDZTd6TG3xsCpAAfI2wHkYdDRsou6mspffekowKPAEg
	 UFNulNWokTMNFV8oGf5NFOSjSoALybhHSjMyArPAz1kN/wXjncmrX3PFUg7TS8RVkxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cd6Gn+0C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ABC606A328;
	Wed,  4 Nov 2026 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cd6Gn+0C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548511F00A16;
	Wed,  4 Nov 2026 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835965;
	bh=KuXqYocoLhVizV5+uDkZOQ8T+Ta9Mt/oF23jxASUD+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cd6Gn+0CNvsCUkYxIfxvYtDyaXRBksMpOxr/NmltYbziZB1LXYwJIYb9tJACHwv+8
	 O8QFvffKVaoP8J0xHmYEz1yqTRHvQE8bbwjVUWKgwuuDRJB0ZjztTOkKLlquFI+4yy
	 ggJeJYMg4N7pN5BtB8Ij+kP/tYMgQfNPPt8377su/XDyCX4r1NkMm2y2OKyrZnFkcj
	 uPY6iHaYgzr3nHYhEvJBrVa4cI9CAyeHWwf0BJo9OHYywVB5MGwNde8p2CfQPhiLPz
	 dREViQoYpy3abEyva8lrqFCj70/P8dGAyOtFHxrxCoQZgUeqdfkstr4RdrKHcEdlcO
	 VL67YEXal5mzw==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] media: qcom: camss: Add SM8350 CAMSS support
Date: Thu,  5 Nov 2026 01:45:32 +0200
Message-ID: <20261104234533.3044265-4-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261104234533.3044265-1-vz@kernel.org>
References: <20261104234533.3044265-1-vz@kernel.org>
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

Add support of the camera subsystem found on Qualcomm SM8350 SoC.

The CAMSS IP on SM8350 contains:
* three CSID and two CSID lite blocks, which are supported by CSID gen2,
* three VFE and two VFE lite blocks, which are supported by VFE 480.

Every CSID and CSID lite block contains a CSI2 test pattern generator,
which is supported by CSID gen2 and controlled by the CSID subdevice
test pattern control.

SM8350 CSID and VFE blocks are known as version 580, the hardware is
programmed in the same way as Titan 480 found on SM8250, in particular
CSID register spaces are placed inside VFE register spaces.

Qualcomm SM8350 CSIPHYs are supported by the CSI2 PHY driver only.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../media/platform/qcom/camss/camss-csid.c    |   3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 213 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 4 files changed, 218 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 9e64e8d44926..800a32b41667 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1114,7 +1114,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Memory */
 
-	if (camss->res->version == CAMSS_8250) {
+	if (camss->res->version == CAMSS_8250 ||
+	    camss->res->version == CAMSS_8350) {
 		/* for titan 480, CSID registers are inside the VFE region,
 		 * between the VFE "top" and "bus" registers. this requires
 		 * VFE to be initialized before CSID
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..dcebbfc97441 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -349,6 +349,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_8300:
+	case CAMSS_8350:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
@@ -2009,6 +2010,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_8300:
+	case CAMSS_8350:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..0bca61b630d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2242,6 +2242,206 @@ static const struct resources_icc icc_res_sm8250[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_sm8350[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "vfe0_areg", "vfe0_csid", "vfe0_cphy_rx" },
+		.clock_rate = { { 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
+				{ 400000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "vfe1_areg", "vfe1_csid", "vfe1_cphy_rx" },
+		.clock_rate = { { 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
+				{ 400000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "vfe2_areg", "vfe2_csid", "vfe2_cphy_rx" },
+		.clock_rate = { { 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
+				{ 400000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 80000000 },
+				{ 400000000 },
+				{ 400000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 80000000 },
+				{ 400000000 },
+				{ 400000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_sm8350[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "vfe0_ahb", "vfe0_areg",
+			   "vfe0", "vfe0_axi" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 338000000, 475000000, 600000000, 720000000 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "vfe1_ahb", "vfe1_areg",
+			   "vfe1", "vfe1_axi" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 338000000, 475000000, 600000000, 720000000 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "vfe2_ahb", "vfe2_areg",
+			   "vfe2", "vfe2_axi" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 338000000, 475000000, 600000000, 720000000 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "vfe_lite" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "vfe_lite" },
+		.clock_rate = { { 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_480,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
+static const struct resources_icc icc_res_sm8350[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY0 */
 	{
@@ -5738,6 +5938,18 @@ static const struct camss_resources sm8250_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
 };
 
+static const struct camss_resources sm8350_resources = {
+	.version = CAMSS_8350,
+	.pd_name = "top",
+	.csid_res = csid_res_sm8350,
+	.vfe_res = vfe_res_sm8350,
+	.icc_res = icc_res_sm8350,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8350),
+	.csiphy_num = 6,
+	.csid_num = ARRAY_SIZE(csid_res_sm8350),
+	.vfe_num = ARRAY_SIZE(vfe_res_sm8350),
+};
+
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
@@ -5825,6 +6037,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
+	{ .compatible = "qcom,sm8350-camss", .data = &sm8350_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..aa722e68450b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -92,6 +92,7 @@ enum camss_version {
 	CAMSS_8250,
 	CAMSS_8280XP,
 	CAMSS_8300,
+	CAMSS_8350,
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
-- 
2.51.0

