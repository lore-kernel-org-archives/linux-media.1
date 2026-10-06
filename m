Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6743A5445
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326576; cv=none; b=m1qYXK7BrJqvHpwXdBJh5JPBJdnzdC+vZc+tSCAkM1PrLO2MXnhwDOcZ4/HBJA2ReQv/Kq03PE8PdXMpEREhhSLNye9Btf8FJf4KX+5GE/TfB5j29liHHxbgkR0Hkkdl6i6x4R8IzwWVFFEiEaegMsLV5sHA/gVkQIZNbNxpjAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326576; c=relaxed/simple;
	bh=rqu4FNhdUTumJ7gLHxysCsjwWP8otYcN5T2HHl3nAs4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MlQlKfMlDS92A8k8DHI6dToyH2Cd+xeEvG4N2rCyZx+kTmgXL0u84Qs6RFK6DEcRhHYi2YXe5fKSeJe6MT36ZjQBNSTjxc6eYpUPoDNT9nC7bqIDKNfo9tm4iW5VKbqLIaUbuMKsS/0j/7UBMA2QVhgEC70jA0lTiSvZNx31iXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgrjsCTg reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgrjsCTg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeVSZ2514037
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=suZeTeSV/HU
	Lbqllr/rTwPCg3vSPYtN+s0P60aSvpIs=; b=LgrjsCTgvJqoHs3EYouHDy1r61+
	UybrtS/7xWD2rod8ejOeHWcZFoQNIxAFCu18SnrLMJovGRdGNA6Gy6BIKTAELuxq
	Zu2C5+ViqQSZYmpM7gioUIj5m7VclldPKQJLn9+WUzJV5oaU/T4j0bFgkg+39T39
	7tgDsB0yBa3aAE6uk0KPTmPp/33ddqNYoHA6SAZetCyvfpBRdGXnKXmrzPjTwnxK
	2Q4Na6LK3/dyPkPC5BWREmVI1g/Ikvi7+MZMNI7i3fkbs4TOiV61c0dv7WleMhBh
	4B8Ly4EJXGKEYaXLbyVg1x/dBDqebE8vy+3ocWMn+w6KJgZIgvloCa2fonA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtwd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso644239085a.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326482; x=1791931282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=suZeTeSV/HULbqllr/rTwPCg3vSPYtN+s0P60aSvpIs=;
        b=erFyleIpYoAuloQoW0JInDW0Kue6FPjRh4epHp0xfYjtvH2FsyD0SR3jiAWyozz/rc
         M1Wm+ziQykBoch0vd6fQloflsrLjplbeY7TTv5pj74myJRMkWL51nM8i0DhG4WK5WR8z
         qBHvSPU1gCX96aGAZEfMLA0PPje9KOoVrEefqthhPN961dS4zbGWwETZBA5sF2XHZ0ku
         pMgyC/AkY5+OdDmuOge4sYnVVxluaQTtyKipIIjnn7RypP8xkCiKp4rRg+YDoFDnhqQ1
         4JaCkV5VVlF226IS0UhCqKddp3Skwmh3iWU4oU3RpmYw5JMhIyT989P/Fp182GbbzQJh
         rKBw==
X-Forwarded-Encrypted: i=1; AKwUvByMLSLMihdzx0Mn8w53+nmaQwApjgkYls7RrX8ihduqOfRz4pYLq6PcR2AHtdpNymErqm6L3LBQ+vP2pQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lSLEa4nd5sQ+Wu0d+WatqyyTl46Q1T3IaaGFyOp/71yOilPiCi
	pgFUOwhksEtlC8mq2SskstgAwzF3CYOSDM1yQSbQaARjqjbIsiDGeGnPW1vkXSYLsQoXsAm05sb
	eyoX0EFrndYGksyMPp5Y6K23ybw7SZvVor8iwEKtcZFzEflWvpiScVaUPOFECT70LPQ==
X-Gm-Gg: AYBFou0slcLs1ar5cGDnbI/dBT0iGUeUBIR/ZuQPjBDbTtE3oiKO6WJ0rIz15LRWfrN
	sZsvAWCugSZaREDFbT7dZ2M6QPkHDWxsWCYYXMpldI9KyUWTPej4m1S4O5IDHQwJNjZyIOD6oCJ
	mS7HUdpCLTYUlaBmV6PRULsmBt4zw0rmsrIIFQCEP3I4fT1xRAB906Bizj2w3LYWjZAWi70gfAr
	wX/eRZCNWlTFEXPwosC/Rhaph92HShZPACqKLh7yN4SAwTvLrD3G9klE6UeZTdOVZfb4VM3BvCC
	IoYJbZLE5OW7a7wa6QkJUeXS+q6XFwSg3lMy8KGhL+fHXBDcDKrN1J5Unb0=
X-Received: by 2002:a05:620a:700c:b0:939:c7dc:8712 with SMTP id af79cd13be357-93e86041086mr763436585a.15.1791326481734;
        Tue, 06 Oct 2026 15:41:21 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:939:c7dc:8712 with SMTP id af79cd13be357-93e86041086mr763422785a.15.1791326480259;
        Tue, 06 Oct 2026 15:41:20 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:19 -0700 (PDT)
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
Subject: [PATCH 28/45] media: qcom: camss: sa8775p: add IFE scaler v2.3x
Date: Wed,  7 Oct 2026 01:39:36 +0300
Message-Id: <20261006223953.3382273-29-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyMoeovM3B+QR
 wvPM20bQ9ChqhSJhGaJD6P6RXbzMGiFrBPHepIsnhghPQkZ0AOn/IHQFjzQrW9oHaD9DrRH6xCL
 wJKXwKk8Uc7H021eWg4WEuTuhQTfh4yIo71a6W2d/YeRHGYI1zgyqksvf9Mb4lfiqfihkWlFmgq
 Q6LmwCb4gMDL14zJlAeieTobqJMWmXWxHM6f4K40Xt+ztn9SftxiIp+SSTt+le6cCkFiyJa23eV
 UKzELn9A6yAuSMKQilic/BeGQizIprVAMuOEMsPPq1fIFaicuvfCPHFixa7czkaldXPXepKLQ6m
 cceMFp77V4993BepeJcNV9o1SnbuS8eXohKbJ5+/Ocxrg081mYmrBeYOrkOS8PScWHP1aKer85k
 iZg8sttfa99CezZy1/xDUUyrhEKHsxf5h+eqQo3oAYVKs5qG9tYRJhU7WJ8yd6URZwJjh/PWTvg
 5q39HhOz2d8VBMzWwJw==
X-Proofpoint-ORIG-GUID: qQFJBCcZH0z5Ql3mDmdL7WnRt_FJrTQG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4jMdXt6N6+7F
 L872T6YciHbKpLAVdQ1X6NmdxTReyWvSH7wTySWLtc2bU9sawU6j/5sLt89qp/b9jtyEN3a5oe3
 3iXdnIe5qO+cln2F7Y8yodqxZml82cY=
X-Proofpoint-GUID: qQFJBCcZH0z5Ql3mDmdL7WnRt_FJrTQG
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac57912 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=j_Fy4U6pMzJLmy7aSM4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the scaler helpers used by the IFE v4.1x pixel outputs.

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

