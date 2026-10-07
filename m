Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844647253F
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363777; cv=none; b=NsdoBFZmP5oSGYx5AMweN94HJKiVysRgg5UUwBv405hznrZ6d5Naws0OC+P0GTq0oAshai1jUNz6fGz/SEFCd7Blk60I55JOptc2JDh6vTpFGScJ3K+sJeKpWOgE7IaRgtjUTT8X435fTBluLLplgTpjYOqlyklkc2UqJTtnF1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363777; c=relaxed/simple;
	bh=p8Ti0u4sdKq7mIREjZGqcoxubcQI7Yt6m8duN+3uyEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fhX9OGtP1C9NugVumtTCze8nXnbOL0OqAT9OCewNqsSzzl9vpJs/Hz5qDAyQ5sybGYc67JX3z6v/j3ObQ/K/Jss0ueB0wCdZ5fKV4XorED+drc46E8bBYLXi/jJPg+YffmI9qsyNet99lAIG/ihSI/6NfOa48DWhTDHzssREcFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klJoOTRo reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klJoOTRo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmYO3334818
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i2wPgEblZYI
	w1lpVbl7SSHkOXLD426In94VaISBPMNg=; b=klJoOTRo4y2nA19tw6py9hIXPGe
	R9K5BJWVb4sD0OKMeWFIPynJDsy5Pt/UBYzAaF38c0VGHYPb67dyoghK64rPhpx3
	pqG7N4fpfC308CdvoGe+XZtS0orI0yxYOm8/HD9YKvY/a0XOw8gwaZBHZtQ5O3rc
	6RWW7RmcMQJlJFZjErOBC7ENUHqGOfgHS5RcJn5FMyG+DmpxXmJsdTUOvO9DhUii
	IRFeuh0r68b6nKaQaHDupRQ/Gi6+GKJ8+fa7B5gHMGBd/JiSNh5mjPyhzA26bn2/
	vPVuJZ1THK6Gnns2q99FhHKtsuIl/ohxVgsuDfNoG+QlK2P3VUlMrb07uMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623avd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso731059085a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363742; x=1791968542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i2wPgEblZYIw1lpVbl7SSHkOXLD426In94VaISBPMNg=;
        b=b56DjO0FpMttU9VZRnEeYwIe5iMCwZnX/K7L/Fu03aQBOaincp6T+aiTj5BhqkCfUM
         toyGbcCXz0+t7BA/+/aYRs7I8dF5Z4/qbVMZThW6CW8xOe0B7xUXUnbi9TvCGznqIKy/
         UTgTbTKtujL+1poq7sYPz9wh5TWdc+A9H6VIxHo59lvorUxdI182F9IfE63UX9VksvCJ
         G8VJbB+/iAKVypyUY5YhF8H76b6fFmhBPajobqnFOX9rbB/ef0UDVtvgDkM14rosrZS5
         MmnYsPfe5BuNEu0RS36+XPFN2lJWrzlaKv9GFgVhMRMNg81iHZJI4Din5GRyP/fP95go
         U/Ow==
X-Forwarded-Encrypted: i=1; AKwUvBycChws0qkJKVS0POnK5XhJfaMvwVE3PrEViwl+dzYwKaatwcXAFFvz44CHj5lv1NvEQb8c9yKeD8L2wQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l5qQxYC49DhNK2muEFwWf9ixWsD0hxIZ+GBggAAf+Ngv/pmEmf
	h9VTU6Dtei861+Ngj93bN+Ow1lvEG2tLH32BGsIk1KHNbkPx0LS/KtmiJRr0sPZt1JY09Y9FgT6
	LfvjIbNrd6pe/tRcCpcV1koXmguXmgrjEhsiP4iiv1NHabrpFzJMsk8kplyOH7AAq5w==
X-Gm-Gg: AYBFou2gvCpphQPgUXjiXkMG5O54Cydf3BpCmyv65Iaql0UBglgqsOr2/SpShoI12CY
	e3Qlt0IKEqIjeNeBKxFbBiVHrVcpIGaHRdnTr+73gIaTNI0MmrE0xoe2leuoY6TZKL/mCMBjyI4
	ZOPGBPckXpbrwu+YFb0X5qdFusQRjCb/BG/KRuLz8n1nh4Z8LLio+HNz9we+uo5Nabvu3k4ShYr
	NGCKnwFHKbRVQ+JNhPEbjZuzO0WOZ1puCccn70+ZCW0OsMPNb5X1pigslYHYVEONJUAoGLdinfo
	5AmnDZUzG0XfwYiIvdHTOmYbAXeFK++eqmUCpnsGt/17UGx41L5O/HfJyxg=
X-Received: by 2002:a05:620a:460d:b0:93a:1b82:4962 with SMTP id af79cd13be357-93e9b802eb8mr315066085a.47.1791363741974;
        Wed, 07 Oct 2026 02:02:21 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93a:1b82:4962 with SMTP id af79cd13be357-93e9b802eb8mr315058585a.47.1791363741424;
        Wed, 07 Oct 2026 02:02:21 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:19 -0700 (PDT)
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
Subject: [PATCH RESEND 27/45] media: qcom: camss: sa8775p: add IFE scaler v2.3x
Date: Wed,  7 Oct 2026 12:00:23 +0300
Message-Id: <20261007090041.3732717-28-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: mbxCTF9Edq0J67no9RjNRbM40pmNunJm
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60a9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=N-zR7XLjbuXmyhDf3rIA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX14Y0QaNhPGfZ
 sC2vdO3QuKWm1zpebQXb9tIllkn5KU6nMrhD3ICsQ59a1gCv/Lvl8rupmVB1MnjvriCzkEBjmqK
 bZO8ADutHpnjVLVbNX0NAPq9sYr9rXc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0mh8vZdvKtSp
 y3R+M9xjVhmn/VLX0O9oo11EiiCWTwS+k3A1/VojsbYiKOrXfYKU1JQ957P29u84fZKFKQgNpVV
 2P/VBxyOwn9AKgjPxMKFick1sUVcufOJIfikYoiD4Tw3/OIqVS4wR/RkMaFUSUfo2mS4/+QFcr3
 Vt5jLs1eADHmDG5yZPjKdtvFQQBKw0wVJBtegmdBPsTVFyTD2YJR18LDY8qH6o+MNFzctKXKNI1
 5mp8dTJhBJi19D+XfL0cAHuE137KOg8RKRlPSz93fzUNhhYqmyJCEjtfqBB2qvrGz/8T3ufhq9N
 LXJQQn8I2F8gbGqTYvSCOVMWSt4QJvM/k16ExyNqAKntiQHQ+9nNT+KAkBPP76qpcYSRJ0HKt/9
 GjFtMtQPRws86drnCLGSnCdQsU2V3OiSjc5z22nwMqf1Wqyi3bXQ6mJySjj61wO0t+sgjfq5ERD
 Rss40dmfidVKViazp4Q==
X-Proofpoint-ORIG-GUID: mbxCTF9Edq0J67no9RjNRbM40pmNunJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the scaler helpers used by the IFE v4.1x pixel outputs.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-scale-v23x.c         | 203 ++++++++++++++++++
 .../qcom/camss/camss-ife-scale-v23x.h         |  19 ++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 2251b57ba38b..e28b7477dab1 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -22,6 +22,7 @@ qcom-camss-objs += \
 		camss-ife-mod-v10x.o \
 		camss-ife-params.o \
 		camss-ife-scale-v10x.o \
+		camss-ife-scale-v23x.o \
 		camss-ife-top-v20x.o \
 		camss-ife-pads.o \
 		camss-ispif.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c
new file mode 100644
index 000000000000..13ce9cb93bb0
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/bitfield.h>
+#include <linux/math.h>
+
+#include "camss-ife.h"
+#include "camss-ife-scale-v23x.h"
+
+#define CAMIF_V23X_Q21_FORMAT			21
+
+#define CAMIF_V23X_DS_MN_MODULE_CFG		0x60
+#define CAMIF_V23X_DS_MN_CFG			0x64
+#define CAMIF_V23X_DS_MN_IMAGE_SIZE_CFG		0x68
+#define CAMIF_V23X_DS_MN_H_CFG			0x6c
+#define CAMIF_V23X_DS_MN_V_CFG			0x74
+#define CAMIF_V23X_DS_MN_CROP_LINE_CFG		0x7c
+#define CAMIF_V23X_DS_MN_CROP_PIXEL_CFG		0x80
+
+#define CAMIF_V23X_DS_MN_MODULE_CFG_CROP_EN	BIT(8)
+#define CAMIF_V23X_DS_MN_MODULE_CFG_EN		BIT(0)
+#define CAMIF_V23X_DS_MN_CFG_V_SCALE_EN		BIT(10)
+#define CAMIF_V23X_DS_MN_CFG_H_SCALE_EN		BIT(9)
+#define CAMIF_V23X_DS_MN_IMAGE_SIZE_WIDTH	GENMASK(29, 16)
+#define CAMIF_V23X_DS_MN_IMAGE_SIZE_HEIGHT	GENMASK(13, 0)
+#define CAMIF_V23X_DS_MN_CFG_INTERP_RES		GENMASK(31, 30)
+#define CAMIF_V23X_DS_MN_CROP_FIRST		GENMASK(29, 16)
+#define CAMIF_V23X_DS_MN_CROP_LAST		GENMASK(13, 0)
+
+#define CAMIF_V23X_INTERP_RES_0			0
+#define CAMIF_V23X_INTERP_RES_1			1
+#define CAMIF_V23X_INTERP_RES_2			2
+#define CAMIF_V23X_INTERP_RES_3			3
+
+#define CAMIF_V23X_POST_MN_MODULE_CFG		0x60
+#define CAMIF_V23X_POST_MN_CROP_LINE_CFG	0x68
+#define CAMIF_V23X_POST_MN_CROP_PIXEL_CFG	0x6c
+#define CAMIF_V23X_POST_MN_CH0_CLAMP_MIN	0x70
+#define CAMIF_V23X_POST_MN_CH0_ROUND_CFG	0x74
+#define CAMIF_V23X_POST_MN_CH1_CLAMP_MIN	0x78
+#define CAMIF_V23X_POST_MN_CH1_ROUND_CFG	0x7c
+#define CAMIF_V23X_POST_MN_CH2_CLAMP_MIN	0x80
+#define CAMIF_V23X_POST_MN_CH2_ROUND_CFG	0x84
+#define CAMIF_V23X_POST_MN_CH0_CLAMP_MAX	0x88
+#define CAMIF_V23X_POST_MN_CH1_CLAMP_MAX	0x8c
+#define CAMIF_V23X_POST_MN_CH2_CLAMP_MAX	0x90
+
+#define CAMIF_V23X_POST_MN_EN			BIT(0)
+
+static u32 camif_v23x_calc_ds_q2(u32 src_size, u32 dst_size)
+{
+	if (src_size > 64 * dst_size)
+		return CAMIF_V23X_INTERP_RES_0;
+	else if (src_size > 32 * dst_size)
+		return CAMIF_V23X_INTERP_RES_1;
+	else if (src_size > 16 * dst_size)
+		return CAMIF_V23X_INTERP_RES_2;
+
+	return CAMIF_V23X_INTERP_RES_3;
+}
+
+static u32 camif_v23x_calc_ds_q21(u32 src_size, u32 dst_size)
+{
+	u64 rq21 = (u64)src_size << CAMIF_V23X_Q21_FORMAT;
+
+	return DIV_ROUND_CLOSEST_ULL(rq21, dst_size);
+}
+
+static void camif_v23x_crop_config(void __iomem *mod_base,
+				   const struct camss_ife_pipeline_cfg *cfg)
+{
+	u32 rval;
+
+	rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_FIRST, cfg->ds_mn_crop->left) |
+	       FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, cfg->ds_mn_crop->width - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_PIXEL_CFG);
+
+	rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_FIRST, cfg->ds_mn_crop->top) |
+	       FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, cfg->ds_mn_crop->height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_LINE_CFG);
+}
+
+void camif_v23x_scale_config(void __iomem *mod_base,
+			     const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg)
+{
+	u32 height;
+	u32 width;
+	u32 h_q21;
+	u32 v_q21;
+	u32 h_q2;
+	u32 v_q2;
+	u32 rval;
+
+	if (cfg->ds_mn_crop) {
+		camif_v23x_crop_config(mod_base, cfg);
+		width = cfg->ds_mn_crop->width;
+		height = cfg->ds_mn_crop->height;
+
+		rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+		rval |= CAMIF_V23X_DS_MN_MODULE_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	} else {
+		width = cfg->in_width;
+		height = cfg->in_height;
+
+		/*
+		 * Vertical scaling misbehaves unless the crop registers are
+		 * programmed to the full frame, even with crop disabled.
+		 */
+		rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, width - 1);
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_PIXEL_CFG);
+
+		rval = FIELD_PREP(CAMIF_V23X_DS_MN_CROP_LAST, height - 1);
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CROP_LINE_CFG);
+
+		rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+		rval &= ~CAMIF_V23X_DS_MN_MODULE_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	}
+
+	rval = FIELD_PREP(CAMIF_V23X_DS_MN_IMAGE_SIZE_WIDTH, width - 1) |
+	       FIELD_PREP(CAMIF_V23X_DS_MN_IMAGE_SIZE_HEIGHT, height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_IMAGE_SIZE_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_CFG);
+	if (wm_cfg->width < width) {
+		h_q2 = camif_v23x_calc_ds_q2(width, wm_cfg->width);
+		h_q21 = camif_v23x_calc_ds_q21(width, wm_cfg->width);
+
+		writel_relaxed(FIELD_PREP(CAMIF_V23X_DS_MN_CFG_INTERP_RES, h_q2) | h_q21,
+			       mod_base + CAMIF_V23X_DS_MN_H_CFG);
+		rval |= CAMIF_V23X_DS_MN_CFG_H_SCALE_EN;
+	} else {
+		rval &= ~CAMIF_V23X_DS_MN_CFG_H_SCALE_EN;
+	}
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_CFG);
+	if (wm_cfg->height < height) {
+		v_q2 = camif_v23x_calc_ds_q2(height, wm_cfg->height);
+		v_q21 = camif_v23x_calc_ds_q21(height, wm_cfg->height);
+
+		writel_relaxed(FIELD_PREP(CAMIF_V23X_DS_MN_CFG_INTERP_RES, v_q2) | v_q21,
+			       mod_base + CAMIF_V23X_DS_MN_V_CFG);
+		rval |= CAMIF_V23X_DS_MN_CFG_V_SCALE_EN;
+	} else {
+		rval &= ~CAMIF_V23X_DS_MN_CFG_V_SCALE_EN;
+	}
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_CFG);
+}
+
+void camif_v23x_scale_enable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	rval |= CAMIF_V23X_DS_MN_MODULE_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+}
+
+void camif_v23x_scale_disable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+	rval &= ~CAMIF_V23X_DS_MN_MODULE_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V23X_DS_MN_MODULE_CFG);
+}
+
+void camif_v23x_post_mn_config(void __iomem *base,
+			       const struct camss_ife_wm_config *cfg,
+			       bool chroma)
+{
+	writel_relaxed(cfg->height - 1, base + CAMIF_V23X_POST_MN_CROP_LINE_CFG);
+	writel_relaxed(cfg->width - 1, base + CAMIF_V23X_POST_MN_CROP_PIXEL_CFG);
+	writel_relaxed(0, base + CAMIF_V23X_POST_MN_CH0_CLAMP_MIN);
+	writel_relaxed(1023, base + CAMIF_V23X_POST_MN_CH0_CLAMP_MAX);
+	writel_relaxed(4 << 3, base + CAMIF_V23X_POST_MN_CH0_ROUND_CFG);
+
+	if (chroma) {
+		writel_relaxed(0, base + CAMIF_V23X_POST_MN_CH1_CLAMP_MIN);
+		writel_relaxed(1023, base + CAMIF_V23X_POST_MN_CH1_CLAMP_MAX);
+		writel_relaxed(4 << 3, base + CAMIF_V23X_POST_MN_CH1_ROUND_CFG);
+		writel_relaxed(0, base + CAMIF_V23X_POST_MN_CH2_CLAMP_MIN);
+		writel_relaxed(1023, base + CAMIF_V23X_POST_MN_CH2_CLAMP_MAX);
+		writel_relaxed(4 << 3, base + CAMIF_V23X_POST_MN_CH2_ROUND_CFG);
+	}
+}
+
+void camif_v23x_post_mn_enable(void __iomem *base)
+{
+	writel_relaxed(0, base + CAMIF_V23X_POST_MN_MODULE_CFG);
+}
+
+void camif_v23x_post_mn_disable(void __iomem *base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(base + CAMIF_V23X_POST_MN_MODULE_CFG);
+	rval &= ~CAMIF_V23X_POST_MN_EN;
+	writel_relaxed(rval, base + CAMIF_V23X_POST_MN_MODULE_CFG);
+}
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h
new file mode 100644
index 000000000000..d3ca6420a5c7
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v23x.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#ifndef _CAMSS_IFE_SCALE_V23X_H_
+#define _CAMSS_IFE_SCALE_V23X_H_
+
+void camif_v23x_scale_config(void __iomem *mod_base,
+			     const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg);
+void camif_v23x_scale_enable(void __iomem *mod_base);
+void camif_v23x_scale_disable(void __iomem *mod_base);
+
+void camif_v23x_post_mn_config(void __iomem *base,
+			       const struct camss_ife_wm_config *cfg,
+			       bool chroma);
+void camif_v23x_post_mn_enable(void __iomem *base);
+void camif_v23x_post_mn_disable(void __iomem *base);
+
+#endif /* _CAMSS_IFE_SCALE_V23X_H_ */
-- 
2.34.1

