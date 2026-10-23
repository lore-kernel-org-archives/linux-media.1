Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773111;
	b=nq7ASO1wG0n19MeqwhywgP12vNZt7HuYolvMbiwHsLQwMxLxHHyx5oA69lXETp/dzCYz
	 ZSeXWdMfif/jMGIpfqwsE7Nu0VaqRxPi3wvtZTr+dv2RJ3E3dE5imsvSFMZPPIurFZlxc
	 UWhqHJvaN24NkxP6SKp1zNwExwFO4Xn7WwuWB6SO2AgjmvJaj8155dLL0QGhDc4kBxLON
	 TVinIkO88vQBhfqznD9G6LlDPugHV+PoSLqCt/kC1cqqPnoxQxZ9O9Z77Qr5OdWPK/2OK
	 JXvM8HIN6Oc/tVodiOk0csIiHie6XmhbgLcdbFcJdJLPfzV0NTqnbw2IYo2U6g30xhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773111;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yl8QJfRZuvkNJm2THHc8v87wJg0vu5rrEXOwizXufww=;
	b=CVkUXbe5vJOg3IdETVj6yqdBn2LFlMckPhSnVeqc9H60aH0jJgrBCkF1T/KICv+203JW
	 0dGJspa45W2FgEOuv8BFwRKAN6NBFLR3i/bKPmOGv+0RJarB7JlgZbKn+IPS2BLCXftYf
	 uoh+C/EvDRdrdJc8G+GwJ4QVjF7N6JxVFFEtbXsoTfGNoRyG0Gp3rXt8RExc+HhwZHPbi
	 o4dkX52sDmlsP/ILBFfVMryTTnQ+OjGr2pQlpVWF3S+NIZCQZtjFV9dxxxI0Ws7AzL+lA
	 kRdje472gu1gHuMl51Nw9IlpViqjKYyhPexHr7PC8zEHiz+L7VcdXbo8/aD/gaRyWaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvVPXfO+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46524606A31B;
	Fri, 23 Oct 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvVPXfO+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E711F01825;
	Fri, 23 Oct 2026 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773110;
	bh=yl8QJfRZuvkNJm2THHc8v87wJg0vu5rrEXOwizXufww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AvVPXfO+KOJhWIebgeXSyxZU2hKeHuDiH0DooCvS2NtZmxFSX5tGSGoyLEdDhlCe7
	 bi51+uLV1qS+D3sprUJKoe5Fs6QtkBwANePNSjhgIRcEpTE5wwYpe1wGly8G0hhNdO
	 lqVMKPNkTXH6y/eJSVs3i0sPZGrQQW6vTnmgRacVOtzYU6u6AlmVLMfsbUrykrOlwZ
	 OZW4t6Z1lTHeY7NFF0DnCTZwfkj3EirjVFahh9irdnP6QF2rzxsvZWfce+53Bq13Tm
	 /QmfV/DPOpYlewBxJvSGkdqsVTqvGb8dhq1xdrmmwU52Ev8ajfbM1m79Av0wjF/HnN
	 4XkMkhqEyspUQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 7/7] media: qcom: camss: Add Waipio CAMSS support
Date: Fri, 23 Oct 2026 19:30:57 +0300
Message-ID: <20261023163057.775917-8-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261023163057.775917-1-vz@kernel.org>
References: <20261023163057.775917-1-vz@kernel.org>
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

Add support of the camera subsystem (CAMSS) found on Qualcomm Waipio SoC.

The CAMSS IP on Waipio contains:
* three CSID and two CSID lite, which are supported by CSID 680,
* three VFE and two VFE lite blocks, which are supported by VFE 680,
* three CSI test pattern generators, which are supported by TPG Gen1.

Qualcomm Waipio CSIPHYs are supported by the CSI2 PHY driver only.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 236 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 239 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..f2aada991a0d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_WAIPIO:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -2013,6 +2014,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_WAIPIO:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b0d60e70e4bb..efb8f9cc983c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2967,6 +2967,226 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_waipio[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 480000000 },
+				{ 400000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 480000000 },
+				{ 400000000 }, },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 480000000 },
+				{ 400000000 }, },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 480000000 },
+				{ 400000000 },
+				{ 400000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 480000000 },
+				{ 400000000 },
+				{ 400000000 }, },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		},
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_waipio[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "camnoc_axi", "cpas_ahb",
+			   "core_ahb", "cpas_fast_ahb", "cpas_vfe0",
+			   "vfe0_fast_ahb", "vfe0" },
+		.clock_rate = { { 0 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 432000000, 594000000, 675000000, 727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845,
+		},
+	},
+	/* IFE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "camnoc_axi", "cpas_ahb",
+			   "core_ahb", "cpas_fast_ahb", "cpas_vfe1",
+			   "vfe1_fast_ahb", "vfe1" },
+		.clock_rate = { { 0 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 432000000, 594000000, 675000000, 727000000 }, },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845,
+		},
+	},
+	/* IFE2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "camnoc_axi", "cpas_ahb",
+			   "core_ahb", "cpas_fast_ahb", "cpas_vfe2",
+			   "vfe2_fast_ahb", "vfe2" },
+		.clock_rate = { { 0 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 432000000, 594000000, 675000000, 727000000 }, },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845,
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "camnoc_axi", "cpas_ahb",
+			   "core_ahb", "cpas_fast_ahb", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite" },
+		.clock_rate = { { 0 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845,
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "camnoc_axi", "cpas_ahb",
+			   "core_ahb", "cpas_fast_ahb", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite" },
+		.clock_rate = { { 0 },
+				{ 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845,
+		},
+	},
+};
+
+static const struct resources_icc icc_res_waipio[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8550[] = {
 	/* CSIPHY0 */
 	{
@@ -5769,6 +5989,21 @@ static const struct camss_resources sc7280_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
 };
 
+static const struct camss_resources waipio_resources = {
+	.version = CAMSS_WAIPIO,
+	.pd_name = "top",
+	.tpg_res = tpg_res_8775p,
+	.csid_res = csid_res_waipio,
+	.vfe_res = vfe_res_waipio,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.icc_res = icc_res_waipio,
+	.icc_path_num = ARRAY_SIZE(icc_res_waipio),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_waipio),
+	.vfe_num = ARRAY_SIZE(vfe_res_waipio),
+};
+
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
@@ -5831,6 +6066,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,waipio-camss", .data = &waipio_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..b62f555bd0f6 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_WAIPIO,
 	CAMSS_X1E80100,
 };
 
-- 
2.53.0

