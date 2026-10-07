Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7AF4908AA
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363804; cv=none; b=loJ9QXblGAz90NcnAxMmLw0uuVEex6NHrwhuqNRQZFgF4gi3XVCZcYx1p8SswBovuH2XF4c9LI7Iynhv8zgJagXa3qtPP0C1lyVCmD1PAprnlHOzF6MXg2m+n5z+3U83kYTq8s7I6c2xWjIRJg2B30Rmw23fsxZjhvkWD4B6+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363804; c=relaxed/simple;
	bh=xcRpzjUh6jenj3NgP7O2q/fAVPnO8kJXfrm+z8hs5dU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c1H266oi4XaYA4IegGW9x37fYXwZBykjRHFtz5+CO2fOlWP3nGocYkc4pUDRVh9TAuPbw1Jrc41cQljrNV/GWFAcaY2lZKlF4/T/ywhdl+Qc24RyhEQwwuJrUWWxg2OxnD6+7NZjy2oQc0TEfHTY7EU3lw+6jd5n0/INbFKYzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nr8KyTOZ reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nr8KyTOZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeDO3334684
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nt0Wl+HD0Mh
	cn0W5+oG9doGqYFu6fdeFKPqmXbq0yn0=; b=Nr8KyTOZXyTFCe/ArQYX6G1qUX8
	c42spxW5Vnw0WnHEId5mGVEeeOE3IgTf2Kr1kry3D6DIBaGZYeK6MOxXnpwonY8g
	TYaSK67qYbUb6EYoGCs49b98wGHPtBNQlJqWVqab/F1+ZeXEH4ZnhuWaWYLQ8hfo
	5yJ6eLM+j0YMl2bHffDYxmserYujl4/gYq0JsMLzTgaPNV9RktwbE/Vw2qZ+6PU3
	H32yKL/2brgVRo6voSvqOo812OE/BZx+1SorKDf2FPiaiLBtxA6lf8wMGfGfbnnm
	rpNTV+uSfqe+yz2oE00ADlLaXRE5aAC+sC68o4il0m9ItoaAHlSsXOwqBJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623aym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso664657585a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363762; x=1791968562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nt0Wl+HD0Mhcn0W5+oG9doGqYFu6fdeFKPqmXbq0yn0=;
        b=K+HxZBjmLTmGN0ZMc637alxMiNACb1RD4h5k+dry6jr+6+YzN+0nBHYosGS/n0+Wrh
         h3kcf9yXAstlzEAPGivm+yOHGWZ+4xhpM3nP3F3ecg4r51Re7F5B9G3Crb5khlqIWkr0
         62q8VFDw1alkbDaycKhp1EQX2aUyu/ZqwzM2zHF+14tBDR4Gkl0kbGyTZsFdADkAhKgA
         RdETZaPitMzOiZn3zJwac2furFtfR+4T7HzztsceHMk3P9xrUDdpOjLrLvjYaBcF/kk/
         4L3sa/HBF0EMO8OoTVp742SJRBkbhGlcoWs0tN+ZpZUZnt6cL5V2MbW0tMYP6xLDjGxz
         hfpg==
X-Forwarded-Encrypted: i=1; AKwUvByPej/++z18mW3g3CXRySWlyIyusflG/da8hGSrFFx/pk2RpKWBOcGrAq02FCvFDoQh7rzB8/vOtAe5mQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mFw9T3SxoA/Mdsp2uSqV54GG6EDc5Y2+PKcw9VG+yuu7iKqTco
	Zi+VLvGKISlbQyD6Itr4SBKtp0k2kSQXssi9RkQWQdUTDGbpNI6vjKZPHwLGd5FI2aWGfiUvWHz
	FU6F9Ehxu4ByQnhCw9BvYNIvA+jXuD+zQuemrCEPDrp7RNUFetQ1CSb1LfZlQiRybZQ==
X-Gm-Gg: AYBFou07APzmh6dXANUpgir8aI5HA2e4HCykpvIjShXL8LzJZ5KE9DPsxD5cByut6Fx
	mT2uW8ddp7/Qs4CNQvIOW7ewytbjC4cnwFA4UGlBn2Tadyvcsh+0XEScDe6Zgg946Fkh2yvjLlU
	IJnUan14HVD3LCPZ9IMszEk1cuT1hrHFAomDNWCR2KLymghDEP4QHk1D72C8LoTgn2X6pCVYSJK
	geWza1Zarv41sY14glbv1RHxEeviKlkoUHPL1IyDLhXtosmlm2KcEAvRTt4t/sHHrJs9deO1yZn
	I8TZof+yK7zysoCqu9+Wk1TWR3ax7ycp5JkSKjim5m/RzbBnfSknkcxY0Cs=
X-Received: by 2002:a05:620a:45aa:b0:93e:63fd:40a6 with SMTP id af79cd13be357-93e9b7e1051mr279140185a.40.1791363761546;
        Wed, 07 Oct 2026 02:02:41 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:93e:63fd:40a6 with SMTP id af79cd13be357-93e9b7e1051mr279135185a.40.1791363761002;
        Wed, 07 Oct 2026 02:02:41 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:40 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 33/45] media: qcom: camss: sa8775p: add IFE modules v4.1x
Date: Wed,  7 Oct 2026 12:00:29 +0300
Message-Id: <20261007090041.3732717-34-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S1kVjqkm48l9i3ISTs6Nk_bUGyPMYdje
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60ab2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=ZGwZCkOzJVZuJOTSXmIA:9
 a=8GFvXUyn-dLsZM-V:21 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5RDUyufRoXjg
 LXM5+Yc9aN9hMCcwO8zMhVJ4eIj5ADFEk8CO4jZcGzwBqQVlKo/f9I/1TFvz4qfUbbpBCYl2UzE
 E05ZXzLM5n/qZtjwGMi1ljDZMsz/Dbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX01TUpRN3Y/CY
 enHVamb/aUQqifx0UVjlBL8/YbE/KcgmWgUEQ6eHqWIcm01b4xUw5uD/SQyM2Ghr2dMM4cYc4li
 +bjdTenPWU98422j9O18kZ5V8K/Lglf651mJ5sWfCU1VBBI0rAG4AaGj/8GEuKpbW5Ewpqq79y+
 Ozi3+1InDC06uqY6BWHRluGbFUeEBbd3ka9+b3hIzOL2c+Jfng/SrMiAbq7XUg8EFeATUeJ6cEj
 Z6G5Mk8WPVLEECFs2Gwi839JG+MWU+4qR/QnUw/8QEOsQd++Kf/bTnQMCsw3YvbCgajtTfZXIhz
 PDVRDpqhYeIivcDZEPssWUndbUmzDbHSFLOrgfxiyf/Tr1NmCdPM2K0IMUzDy0UmJp0z6vIvA3h
 xFjYJk2pzvXilc4W2n2IOp2Uv0yHqGN4syh1q0zqSY3mr6qzvT3jHxPtQPBBhz10ca5DVB/7EWW
 NJhkEsthfJfx+pSqg/Q==
X-Proofpoint-ORIG-GUID: S1kVjqkm48l9i3ISTs6Nk_bUGyPMYdje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the module backend used by the SA8775P IFE pixel path. It
configures the default white balance, demosaic, color transform,
and AWB BG blocks.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 328 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 330 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 695924e0c03b..2e4c07fda524 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -21,6 +21,7 @@ qcom-camss-objs += \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
+		camss-ife-mod-v41x.o \
 		camss-ife-params.o \
 		camss-ife-scale-v10x.o \
 		camss-ife-scale-v23x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
new file mode 100644
index 000000000000..9f4c8ae9667e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ * IFE pixel-path post-processing modules for the v41x register layout.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+
+#include "camss-ife.h"
+
+/* Module base offsets */
+#define IFE_MOD_V41X_WB_GAIN_OFFSET		0x4000
+#define IFE_MOD_V41X_DEMOSAIC_OFFSET		0x5580
+#define IFE_MOD_V41X_XFORM_OFFSET		0x6200
+#define IFE_MOD_V41X_AWB_BG_OFFSET		0x6800
+
+/* WB gain registers */
+#define IFE_MOD_V41X_WB_GAIN_MODULE_CFG		0x60
+#define IFE_MOD_V41X_WB_GAIN_CFG_0		0x68
+#define IFE_MOD_V41X_WB_GAIN_CFG_1		0x6c
+#define IFE_MOD_V41X_WB_GAIN_CFG_2		0x70
+
+/* Demosaic registers */
+#define IFE_MOD_V41X_DEMOSAIC_MODULE_CFG		0x60
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_0	0x68
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_1	0x6c
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_0	0x70
+#define IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_1	0x74
+
+/* Color transform (XFORM) registers, 3 channels */
+#define IFE_MOD_V41X_XFORM_MODULE_CFG		0x60
+#define IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_0	0x68
+#define IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_1	0x6c
+#define IFE_MOD_V41X_XFORM_CH0_ADDOFFSET_CFG	0x70
+#define IFE_MOD_V41X_XFORM_CH0_SUBOFFSET_CFG	0x74
+#define IFE_MOD_V41X_XFORM_CH0_CLAMP0_CFG	0x78
+#define IFE_MOD_V41X_XFORM_CH0_CLAMP1_CFG	0x7c
+#define IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_0	0x80
+#define IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_1	0x84
+#define IFE_MOD_V41X_XFORM_CH1_ADDOFFSET_CFG	0x88
+#define IFE_MOD_V41X_XFORM_CH1_SUBOFFSET_CFG	0x8c
+#define IFE_MOD_V41X_XFORM_CH1_CLAMP0_CFG	0x90
+#define IFE_MOD_V41X_XFORM_CH1_CLAMP1_CFG	0x94
+#define IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_0	0x98
+#define IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_1	0x9c
+#define IFE_MOD_V41X_XFORM_CH2_ADDOFFSET_CFG	0xa0
+#define IFE_MOD_V41X_XFORM_CH2_SUBOFFSET_CFG	0xa4
+#define IFE_MOD_V41X_XFORM_CH2_CLAMP0_CFG	0xa8
+#define IFE_MOD_V41X_XFORM_CH2_CLAMP1_CFG	0xac
+
+/* AWB-BG registers */
+#define IFE_MOD_V41X_AWB_BG_MODULE_CFG		0x60
+#define IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_0	0x6c
+#define IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_1	0x70
+#define IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_0	0x74
+#define IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_1	0x78
+#define IFE_MOD_V41X_AWB_BG_RGN_WIDTH_CFG	0x7c
+#define IFE_MOD_V41X_AWB_BG_HI_THRESHOLD_CFG_0	0x80
+#define IFE_MOD_V41X_AWB_BG_LO_THRESHOLD_CFG_0	0x94
+
+/* WB gain bitfields */
+#define IFE_MOD_V41X_WB_GAIN_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_WB_GAIN_VALUE		GENMASK(31, 17)
+
+/* Demosaic bitfields */
+#define IFE_MOD_V41X_DEMOSAIC_CFG_EN			BIT(0)
+#define IFE_MOD_V41X_DEMOSAIC_CFG_DYN_G_CLAMP_EN	BIT(14)
+#define IFE_MOD_V41X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN	BIT(15)
+
+/* Color transform bitfields */
+#define IFE_MOD_V41X_XFORM_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_XFORM_MATRIX_M0		GENMASK(12, 0)
+#define IFE_MOD_V41X_XFORM_MATRIX_M1		GENMASK(28, 16)
+#define IFE_MOD_V41X_XFORM_OFFSET_VALUE		GENMASK(31, 17)
+#define IFE_MOD_V41X_XFORM_CLAMP_VALUE		GENMASK(31, 18)
+
+/* AWB-BG bitfields */
+#define IFE_MOD_V41X_AWB_BG_MODULE_CFG_EN	BIT(0)
+#define IFE_MOD_V41X_AWB_BG_RGN_SAMPLE_PATTERN	GENMASK(31, 16)
+#define IFE_MOD_V41X_AWB_BG_HORZ_CFG0_H_NUM	GENMASK(21, 16)
+#define IFE_MOD_V41X_AWB_BG_HORZ_CFG1_WIDTH	GENMASK(8, 0)
+#define IFE_MOD_V41X_AWB_BG_VERT_CFG0_V_NUM	GENMASK(21, 16)
+#define IFE_MOD_V41X_AWB_BG_VERT_CFG1_HEIGHT	GENMASK(8, 0)
+#define IFE_MOD_V41X_AWB_BG_RGN_WIDTH_LAST	GENMASK(24, 16)
+#define IFE_MOD_V41X_AWB_BG_RGN_WIDTH_FIRST	GENMASK(8, 0)
+#define IFE_MOD_V41X_AWB_BG_HI_THRESHOLD	GENMASK(31, 8)
+
+/* WB gain default */
+#define IFE_MOD_V41X_WB_GAIN_UNITY		0x400
+
+/* Demosaic defaults */
+#define IFE_MOD_V41X_DEMOSAIC_LAMBDA_G		0x80
+#define IFE_MOD_V41X_DEMOSAIC_LAMBDA_RB		0
+#define IFE_MOD_V41X_DEMOSAIC_A_K_DEFAULT	0x08000000
+#define IFE_MOD_V41X_DEMOSAIC_W_K_DEFAULT	0x66
+
+/* Color transform defaults */
+#define IFE_MOD_V41X_XFORM_MSB_SHIFT		4
+#define IFE_MOD_V41X_XFORM_CHROMA_OFFSET	0x200
+#define IFE_MOD_V41X_XFORM_CLAMP_MAX		0x3ff
+
+/* AWB-BG defaults */
+#define IFE_MOD_V41X_AWB_BG_MAX_H_NUM		64
+#define IFE_MOD_V41X_AWB_BG_MAX_V_NUM		48
+#define IFE_MOD_V41X_AWB_BG_SAMPLE_PATTERN	GENMASK(15, 0)
+#define IFE_MOD_V41X_AWB_BG_THRESHOLD		0x3ffff
+#define IFE_MOD_V41X_AWB_BG_NUM_THRESHOLDS	5
+
+static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value = FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE,
+			       IFE_MOD_V41X_WB_GAIN_UNITY);
+
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_0);
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_1);
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_2);
+}
+
+static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
+
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_LAMBDA_RB,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_0);
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_LAMBDA_G,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_COEFF_CFG_1);
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_A_K_DEFAULT,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_0);
+	writel_relaxed(IFE_MOD_V41X_DEMOSAIC_W_K_DEFAULT,
+		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_1);
+}
+
+static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
+				   const struct camss_pp_cfg *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_AWB_BG_OFFSET;
+	unsigned int i;
+	u32 height = (cfg->height / IFE_MOD_V41X_AWB_BG_MAX_V_NUM) & ~3u;
+	u32 width = (cfg->width / IFE_MOD_V41X_AWB_BG_MAX_H_NUM) & ~3u;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_AWB_BG_RGN_SAMPLE_PATTERN;
+	value |= FIELD_PREP(IFE_MOD_V41X_AWB_BG_RGN_SAMPLE_PATTERN,
+			    IFE_MOD_V41X_AWB_BG_SAMPLE_PATTERN);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_HORZ_CFG0_H_NUM,
+			   IFE_MOD_V41X_AWB_BG_MAX_H_NUM - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_0);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_HORZ_CFG1_WIDTH, width - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_HORZ_RGN_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_VERT_CFG0_V_NUM,
+			   IFE_MOD_V41X_AWB_BG_MAX_V_NUM - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_0);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_VERT_CFG1_HEIGHT, height - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_VERT_RGN_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_RGN_WIDTH_FIRST, width - 1) |
+		FIELD_PREP(IFE_MOD_V41X_AWB_BG_RGN_WIDTH_LAST, width - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_RGN_WIDTH_CFG);
+
+	value = FIELD_PREP(IFE_MOD_V41X_AWB_BG_HI_THRESHOLD,
+			   IFE_MOD_V41X_AWB_BG_THRESHOLD);
+	for (i = 0; i < IFE_MOD_V41X_AWB_BG_NUM_THRESHOLDS; i++) {
+		writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_HI_THRESHOLD_CFG_0 + i * 4);
+		writel_relaxed(0, base + IFE_MOD_V41X_AWB_BG_LO_THRESHOLD_CFG_0 + i * 4);
+	}
+}
+
+static void mod_v41x_awb_bg_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_AWB_BG_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+	value |= IFE_MOD_V41X_AWB_BG_MODULE_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+}
+
+static void mod_v41x_awb_bg_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_AWB_BG_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_AWB_BG_MODULE_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_AWB_BG_MODULE_CFG);
+}
+
+static void mod_v41x_xform_write_coeff(void __iomem *base, u32 offset,
+				       u32 m0, u32 m1)
+{
+	u32 value;
+
+	value = FIELD_PREP(IFE_MOD_V41X_XFORM_MATRIX_M0, m0) |
+		FIELD_PREP(IFE_MOD_V41X_XFORM_MATRIX_M1, m1);
+	writel_relaxed(value, base + offset);
+}
+
+static void mod_v41x_xform_write_channel(void __iomem *base, u32 coeff0,
+					 u32 coeff1, u32 add_offset,
+					 u32 sub_offset, u32 clamp0,
+					 u32 clamp1, u32 m0, u32 m1,
+					 u32 m2, u32 offset)
+{
+	mod_v41x_xform_write_coeff(base, coeff0, m0, m1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_MATRIX_M0, m2), base + coeff1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_OFFSET_VALUE,
+				  offset << IFE_MOD_V41X_XFORM_MSB_SHIFT),
+		       base + add_offset);
+	writel_relaxed(0, base + sub_offset);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_CLAMP_VALUE, 0), base + clamp0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_XFORM_CLAMP_VALUE,
+				  IFE_MOD_V41X_XFORM_CLAMP_MAX <<
+				    IFE_MOD_V41X_XFORM_MSB_SHIFT),
+		       base + clamp1);
+}
+
+static void mod_v41x_modules_acquire(struct ife_device *ife, struct ife_pp_ctx *ctx,
+				     void __iomem *base)
+{
+	ctx->base = base;
+}
+
+static void mod_v41x_modules_release(struct ife_pp_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void mod_v41x_modules_config(struct ife_pp_ctx *ctx,
+				    const struct camss_pp_cfg *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_XFORM_OFFSET;
+
+	ctx->in_width = cfg->width;
+	ctx->in_height = cfg->height;
+
+	mod_v41x_wb_gain_config(ctx);
+	mod_v41x_demosaic_config(ctx);
+	mod_v41x_awb_bg_config(ctx, cfg);
+
+	mod_v41x_xform_write_channel(base, IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_0,
+				     IFE_MOD_V41X_XFORM_CH0_COEFF_CFG_1,
+				     IFE_MOD_V41X_XFORM_CH0_ADDOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH0_SUBOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH0_CLAMP0_CFG,
+				     IFE_MOD_V41X_XFORM_CH0_CLAMP1_CFG,
+				     0x259, 0x75, 0x132, 0);
+	mod_v41x_xform_write_channel(base, IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_0,
+				     IFE_MOD_V41X_XFORM_CH1_COEFF_CFG_1,
+				     IFE_MOD_V41X_XFORM_CH1_ADDOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH1_SUBOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH1_CLAMP0_CFG,
+				     IFE_MOD_V41X_XFORM_CH1_CLAMP1_CFG,
+				     0x1eae, 0x1fe, 0x1f54,
+				     IFE_MOD_V41X_XFORM_CHROMA_OFFSET);
+	mod_v41x_xform_write_channel(base, IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_0,
+				     IFE_MOD_V41X_XFORM_CH2_COEFF_CFG_1,
+				     IFE_MOD_V41X_XFORM_CH2_ADDOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH2_SUBOFFSET_CFG,
+				     IFE_MOD_V41X_XFORM_CH2_CLAMP0_CFG,
+				     IFE_MOD_V41X_XFORM_CH2_CLAMP1_CFG,
+				     0x1e55, 0x1fad, 0x1fe,
+				     IFE_MOD_V41X_XFORM_CHROMA_OFFSET);
+}
+
+static void mod_v41x_modules_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	value |= IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+	value |= IFE_MOD_V41X_DEMOSAIC_CFG_DYN_G_CLAMP_EN |
+		 IFE_MOD_V41X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN |
+		 IFE_MOD_V41X_DEMOSAIC_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_XFORM_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+	value |= IFE_MOD_V41X_XFORM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+
+	mod_v41x_awb_bg_enable(ctx);
+}
+
+static void mod_v41x_modules_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	mod_v41x_awb_bg_disable(ctx);
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+	value &= ~(IFE_MOD_V41X_DEMOSAIC_CFG_DYN_G_CLAMP_EN |
+		   IFE_MOD_V41X_DEMOSAIC_CFG_DYN_RB_CLAMP_EN |
+		   IFE_MOD_V41X_DEMOSAIC_CFG_EN);
+	writel_relaxed(value, base + IFE_MOD_V41X_DEMOSAIC_MODULE_CFG);
+
+	base = ctx->base + IFE_MOD_V41X_XFORM_OFFSET;
+	value = readl_relaxed(base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_XFORM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_XFORM_MODULE_CFG);
+}
+
+const struct camss_mod_ops ife_mod_v41x_ops = {
+	.acquire	= mod_v41x_modules_acquire,
+	.release	= mod_v41x_modules_release,
+	.config		= mod_v41x_modules_config,
+	.enable		= mod_v41x_modules_enable,
+	.disable	= mod_v41x_modules_disable,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 3d35c17fca7f..c38b96076a1f 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -403,6 +403,7 @@ extern const struct ife_hw_top_ops ife_top_v41x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
+extern const struct camss_mod_ops ife_mod_v41x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
 extern const struct ife_pads_descriptors ife_lite_pads_v30x;
-- 
2.34.1

