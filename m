Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A183B2FF6
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326494; cv=none; b=H445uOGLimtd7HG4ezYnWkJTPUrZbL8vXvdf9uzIPFL0f6DZqajEgjTJkirjQC94bJPpgCPrFFILtH4vDYRITLJS3K4r7K7FIAcz1MrslkwI1o4qKOnUxsvEK1LxfnLsjpUsRZPZzLx6s6xxI7Amky01nxLPjPIzPov7pJVUP74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326494; c=relaxed/simple;
	bh=Jwf+0+K9v4ZiGUn4GrpJqPMCEH18nouQcxm79+WBHMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NVRrnGjQLu3LteqtnUR3grZiXB74mtaui+kTvcrqQ2YbkccRbLzmuasSEUGdwqBrRTIlsj/iEl9hDgW62PP4EObPFLe6w4l/bCWvkIiJsrXMfVS0xvdvpzkrI0T3Rjbf/fgqGdksfunR24l+R/EIknnkheq3YP+6aqoLmlcdwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLK47e+9 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLK47e+9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeOID2011385
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/WAX3tXIYtf
	UYHfJJ0DzYn390FJgpp7sq8g9weWyJn0=; b=cLK47e+9x8L9M9EUncY1Xuy0+IY
	GDnYw1e0g3dsmCoCoaUdnljUUsvlxV1GipeO6/+O8TbN3KbgaNjUx3FBPHv0H6sI
	bRWo07qlg8JFdXmRvTgoHGNkxNUZRxkb+6ph4+RGa4aqhaoiW0KYZtI2g7h3bELH
	RXYSZjDj3Nk3vQSvP6KXwvWwrWwYY1AFp3uEx3wLFhL2w/KjXNu0cic7cRghSi2u
	PsO+14GmQWz8R2i08ki1nEnjrvRbP26OCMrtSQSNLEBUs3qcKApdWHjAlNqYPqLB
	+V5ucyfg3b/yRmbPtWIO3G4uYyiiVU5zjyYZ6/iawUDPUYvv9rB2zBj35bg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9u1rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so641633585a.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326461; x=1791931261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WAX3tXIYtfUYHfJJ0DzYn390FJgpp7sq8g9weWyJn0=;
        b=APxQtn3qPEGVwFkf0Nuro70MtOjUFoAN0Ke5n69OCwgnjnNv8JbJQNKFJ3UjRvtP99
         L00Jbzcys5BmbP3zdRNllJE0Cl3ZWFE1R4LPMPml48gccJJvO0SdnbM8QBRkatgDdcFh
         /z2MZlwXXtG0i3/d2uUXHU3IP+w9mZXVCHpbObPAYvWREjD/ExZA4uW3WwXxtRiZJSrk
         hd0oel6u/czNNxlopdiJksUxq6+HAuDIx5LyaItyyjWAHCrQEWqUjBMg3pTHFE6DVV5Z
         FJCFzRDkt1339qv8XUT2VwkHdvB1NJhRCp6bMTC3ZQRHt/qrG6EqZ0J+jKg5ztbhxsPm
         /Vbg==
X-Forwarded-Encrypted: i=1; AKwUvBzsTlTQcoM53kKqZZQcJxoSvo8hRXv1sH0fv2ivFPiXXbWGidU6CI9/C1gyYD1C1RgE4A0IU2v0xbrtdA==@vger.kernel.org
X-Gm-Message-State: AFuF++nifyhP4AkjaE4Casqqpqru6zo4frZzIitKYbrcIMcSyMtP03ev
	rgTeTh04pjFIfnckRIPgbf8k8GvH8N17iBY2qEPz8TtARpe4BAY51rhJ5TCGc964UBbzEvSBlsC
	Xh45g1aDmGcrumXeNTuBayMKtBCR0uHZIAoBrBrbdOuIMeiZ2UsoNxbPY0Bc82SGVJQ==
X-Gm-Gg: AYBFou3lVq6s4uA4mb3DqGA7NSDOaBktTksQw8x2/Bq5ho6+wEwlC7QgCsAILeqcztT
	urJfNUuBXy0qlAejbjx+DVCpL3iqpB+7LnIEcznv6QCD1icSGz8A2xxBVE6cFFQ7yWmDcaEQshN
	2JmNZantL061sNoOcSX/v7Rrc4ZwnU7N9j2rGl6WanZ6JozwjhufCDDMH0bbB96E1IH3hT0Hlmg
	7SxaAZvx60fpmxk/1QIQOMYssDn7GeuJlyJu9MErjadpWitR4WA20BVoCK1qLODJ00d4kThg1Q3
	LKaA48ga/8wdvOhcEqz/3k5VIhOlGSanAOUiSZqnP8W1X+rrfMQhpEg8XpI=
X-Received: by 2002:a05:620a:2984:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93e9b829e79mr73826385a.57.1791326460846;
        Tue, 06 Oct 2026 15:41:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93e9b829e79mr73822085a.57.1791326460367;
        Tue, 06 Oct 2026 15:41:00 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:59 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 19/45] media: qcom: camss: sm8250: add pixel path resources
Date: Wed,  7 Oct 2026 01:39:27 +0300
Message-Id: <20261006223953.3382273-20-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac578fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=O1XUiH9HgQSgLzsyt4oA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+Z9wID3BMgCl
 ExD8FoPSsqBHkXFMjgCBjjd68JY4JfcWo4wgJ6gfiKz9L2cHvlhWT5L2bQyzyZUR4OLC+V3fRZ3
 5CAitzsQU5vhFEpvSywWTtFvIyxOTKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3IqBY/cfCR4d
 1MHOj//hPArxKOpYtVscIFRgvXnrSaQmOKWqplH2/vJ13IZPm8+Zny5JCoynR0scbcllZu49XMI
 vH5h9w767loOpY/NDjSr7irifk5noriUD6J+rB4hgJ/lL605ox7Ek3MpfRgMJTnivXFNGwdoSbq
 L6W2d8ieQsp9v0bZkSJR82k+VHKxN7kpfkMBpU3zrXbT5hZWhQ9jxBo5hLKEntjTVj19JAWKcvU
 l5KsY4wx5ails52WD2iWNmyJiCjUAIIWJyvVbbUFdOE9oDjlisMLsyfSU+/+qJzR8z2olpB2F2t
 iAkuIb9Doc9UGCyijVAJO860mvKlsrMw8dFxYHM1xs3RHiZLNZDqnfZ2WPqJ66QqyDj62sFrscm
 0TlMNjQD04mTmQzG9/K0DJdv+YZi1KfJxUz8W0fNxb8UYa+DiqVV05sZsjl1OtvM/i+QDxPkF8l
 esnIxJoLbaxfYJyO+Ww==
X-Proofpoint-ORIG-GUID: 8abyv_2HF7f73K7f-ldi0YxPbLha-W63
X-Proofpoint-GUID: 8abyv_2HF7f73K7f-ldi0YxPbLha-W63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add CSID, IFE, and IFE Lite resources for the SM8250 pixel path. Select
them with the qcom,sm8250pix-camss compatible.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 224 +++++++++++++++++++++-
 1 file changed, 222 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7c355003c957..2dc7864ebe07 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -27,6 +27,7 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-fwnode.h>
 
+#include "camss-ife-camif-v10x.h"
 #include "camss.h"
 
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
@@ -36,6 +37,7 @@
 #define CAMSS_NUM_OF_PIXELS_PER_CYCLE	2
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
+static const struct parent_dev_ops ife_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
@@ -2269,6 +2271,208 @@ static const struct resources_icc icc_res_sm8250[] = {
 	},
 };
 
+static const struct camss_ife_stream csid_ife_streams_sm8250pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_PP },
+};
+
+static const struct camss_ife_stream csid_ife_lite_streams_sm8250pix[] = {
+	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
+	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
+	{ .id = 2, .pipe = CAMSS_IFE_HW_PIPE_RDI2 },
+	{ .id = 3, .pipe = CAMSS_IFE_HW_PIPE_RDI3 },
+};
+
+static const struct camss_subdev_resources csid_res_sm8250pix[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.streams_enable = true,
+			.source_streams_mode = CSID_STREAMS_SINGLE_PAD,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite", "vfe_lite_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite", "vfe_lite_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid3" },
+		.interrupt = { "csid3" },
+		.csid = {
+			.is_lite = true,
+			.streams_enable = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &ife_parent_dev_ops,
+			.formats = &csid_formats_gen2,
+		}
+	}
+};
+
+static const struct camss_subdev_resources ife_res_sm8250pix[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
+			   "vfe0_axi", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 100000000, 200000000, 300000000, 400000000 },
+				{ 19200000, 350000000, 475000000, 576000000, 680000000 },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v20x,
+			.top_ops = &ife_top_20x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.mod_ops = &ife_mod_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sm8250pix),
+			.sink_streams = csid_ife_streams_sm8250pix,
+		},
+	},
+	/* IFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
+			   "vfe1_axi", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 100000000, 200000000, 300000000, 400000000 },
+				{ 19200000, 350000000, 475000000, 576000000, 680000000 },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE,
+			.pads = &ife_pads_v20x,
+			.top_ops = &ife_top_20x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.mod_ops = &ife_mod_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_streams_sm8250pix),
+			.sink_streams = csid_ife_streams_sm8250pix,
+		},
+	},
+	/* IFE2 (lite) */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
+			   "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ 19200000, 400000000, 480000000, 480000000, 480000000 },
+				{ } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v20x,
+			.top_ops = &ife_lite_top_10x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sm8250pix),
+			.sink_streams = csid_ife_lite_streams_sm8250pix,
+		}
+	},
+	/* IFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
+			   "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { },
+				{ },
+				{ },
+				{ },
+				{ },
+				{ 19200000, 300000000, 400000000, 400000000, 400000000 },
+				{ 19200000, 400000000, 480000000, 480000000, 480000000 },
+				{ } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.ife = {
+			.type = CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+			.pads = &ife_lite_pads_v20x,
+			.top_ops = &ife_lite_top_10x_ops,
+			.camif_ops = &ife_camif_v10x_ops,
+			.buswr_ops = &ife_buswr_20x_ops,
+			.num_sink_streams = ARRAY_SIZE(csid_ife_lite_streams_sm8250pix),
+			.sink_streams = csid_ife_lite_streams_sm8250pix,
+		}
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_7280[] = {
 	/* CSIPHY0 */
 	{
@@ -4977,10 +5181,10 @@ static void __iomem
 	return NULL;
 }
 
-static const struct parent_dev_ops ife_parent_dev_ops __maybe_unused = {
+static const struct parent_dev_ops ife_parent_dev_ops = {
 	.get = ife_parent_dev_ops_get,
 	.put = ife_parent_dev_ops_put,
-	.get_base_address = ife_parent_dev_ops_get_base_address
+	.get_base_address = ife_parent_dev_ops_get_base_address,
 };
 
 int camss_attach_host_data(struct camss *camss, struct v4l2_subdev *sd,
@@ -6142,6 +6346,21 @@ static const struct camss_resources sm8250_resources = {
 	.csid_vfe_fixed_pairing = true,
 };
 
+static const struct camss_resources sm8250pix_resources = {
+	.version = CAMSS_8250,
+	.csiphy_res = csiphy_res_8250,
+	.csid_res = csid_res_sm8250pix,
+	.ife_res = ife_res_sm8250pix,
+	.icc_res = icc_res_sm8250,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8250),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
+	.csid_num = ARRAY_SIZE(csid_res_sm8250pix),
+	.embedded_csid = true,
+	.ife_num = 2,
+	.ife_lite_num = 2,
+	.link_entities = camss_ife_link_entities,
+};
+
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
@@ -6229,6 +6448,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
+	{ .compatible = "qcom,sm8250pix-camss", .data = &sm8250pix_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-- 
2.34.1

