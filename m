Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CA3CDBD7
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326552; cv=none; b=mGp+3dQienisJmS1HA6Usbxqo8AoXo1gdFkdWDLTg0J6Orl39eEvWAAUJ7HDa6rZax4gPufLlb8VigYIA9XbgUr08Xlwhmb8uYIKzRVntsyblbdRvsH09JLW2cqpWjCKITgJEK6aYo+8OIOAWH623lsBD+HurIpmujfwkrQPzME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326552; c=relaxed/simple;
	bh=HVwHToaJyXzsP1X54gd5nmFtr8QmcA1/+NTce1Z1jYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E13oLKZpi1yhwLfyZnbuNlX8c4bHJ7THnYACuZlwB06gkbmRa7/ckUts2Mp47uP3NxD6ViQtceYU0pH6KCYTo5ZxvZSkjFBiG/G3gY2Q9aLLowgvakA5Ug0JoI+WUFpTS0ivdF7kGQeApfc8GH28dQYK60jfP+WR3fF4M0UUlAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3MoDy/q reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3MoDy/q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeIOC1029248
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zI/OM1DaK08
	7Fl1+eaugez81Hxvhln74qIkYx1WEGkM=; b=W3MoDy/q3AdalO40xjHrJ6gkVSV
	A4xui29D4BNzj4LQW7hjfd8jVHEggQsABIhoRfJioVAo4weLwx+a3IHZZk2K/CjK
	qu3L4AYHOJgLPfb1tdvXzXO8LisSD0jvD166TUK8ZwNS3l8/UqWxmVb1KmpO9KDj
	7kc1wDGSFi6IB47oIjsAMoHoTbawAJUFNTjPmxuPlxygl+w4fWtPdTAUBoEBXRM2
	0Gh8Rfu4a0PyKu+ByEM97Ei+uKpwnn4y/x49VRc6KQK+wf8yKU+Ex2DDCCAvvw6Z
	87U/wrFGHFP3iPeZrRzuT1jFO0CcHhUDrCpgIx0hWJksy/ux9we3K1wzJuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46b4b700so565366185a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326499; x=1791931299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zI/OM1DaK087Fl1+eaugez81Hxvhln74qIkYx1WEGkM=;
        b=AybqxoNkLIGQWlx6e6+VUmZmgzrt8fkHOEnKiv0TOP/6DL7H+/c+w9P8xP7vd4yMNK
         uAk+c58ow9rLPTNMQy/VRwlG6J4Go2sVv0rdLZDNBMnixboMATg7idqbMfl7SO57yI5G
         QxdugEun3IoqhxbaxQGt278X2DzL7JqnVmPo4f82aF6AzZQs6sKV8mW2fYwuryeNzpuj
         Xr7dAeH83PnYPOovaTUHYKrOk2Zg0Bxlcnp2KtwRGGJcYw8RCBznptO39v7FuNLXoIAk
         h89NtZqTm1t8UugO/2Z8uDnu1ikzThea/CP+M+q66fH0axNVb0zxHQbHKHJiLYKxSFXn
         anOg==
X-Forwarded-Encrypted: i=1; AKwUvByoQIN68fP0+M9P01j3cZwDQWcuCkIaj0sPxjoPckb8FKZJA6IBsFjFiW3yHfP5BGNIIQAkeAvQsQXf5w==@vger.kernel.org
X-Gm-Message-State: AFuF++krh37O3QzUrkBuSgsgDYkcRe41STqlIn/AqXq8IXHsHxEDhUdk
	0OvION7iM0BCk64JXmp/IP8j4kRB0Srt8q6mY9uBRlWG01lU5t1WDgHVdl0Hm8HcdMTvWtZBs5x
	bMVXcXKtPekKglG7VyeZ+6BK0Xb6Z/g4GZau5UGsvs4yOoRRBn+FbE3jZidEJXEEm/Q==
X-Gm-Gg: AYBFou2mmlSHswO4sqmH2+dLxAM/b6XYRov1oy2VDmC/3ICqZ+R6w/m+QyBJAY7Ujv6
	0qTh84Em+TX/+RRPptOFO43cx8IELUZ1RsOH0a9D3dN/pIzh3tjXDB+ksbK0Ubyh8I91UK28kAW
	VUpvwgSMKITdC4vh4B39K0MD69z4sngpciEGMlT5Xc5YytBDrv57MnDxspjSVWS8KGSiAuSrLTo
	9wbllLLpcLqk7UIyCLthaCIG/bJy9hpyZSNJ++wB0OHssHNpRSGPzza46kiJXJtUH7IJwnTuI+P
	IuDQDE+qKP2bYonQDAAeurxKx8kOQFtRwGQlk9l3CIzEBQMfhoHizN/XfA0=
X-Received: by 2002:a05:620a:448f:b0:93c:66da:ee12 with SMTP id af79cd13be357-93e9b74d219mr76116785a.19.1791326498786;
        Tue, 06 Oct 2026 15:41:38 -0700 (PDT)
X-Received: by 2002:a05:620a:448f:b0:93c:66da:ee12 with SMTP id af79cd13be357-93e9b74d219mr76110185a.19.1791326498229;
        Tue, 06 Oct 2026 15:41:38 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:37 -0700 (PDT)
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
Subject: [PATCH 36/45] media: qcom: camss: sa8775p: add CCM parameters
Date: Wed,  7 Oct 2026 01:39:44 +0300
Message-Id: <20261006223953.3382273-37-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fcgGmGre4RCQQPuhYOF1p5f-MBNeQyRc
X-Proofpoint-GUID: fcgGmGre4RCQQPuhYOF1p5f-MBNeQyRc
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac57923 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=MPkjE9NDq9863M1uKlEA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX0e4OH4HCn4zF
 dVScN4eIAScyWlEZMKF+JPRc3mb4e1TH3ZaR+A0pQzn8s8admdRF72zmsARAHVveFkR7HqaYhRC
 PDpyxTJdk8g4nRp9bkWH8vqnhMcUal3APJ8BzQqTZRoFoBxekKoQ56vtp/ZWCbNUKCr5tEjsQ49
 pT7oTw9SuIL+jcmC78lR+r32NP2r7y68xSvwDlmgC3IA8vwnAVT1GUXOn6JIqXuiO6uBmz2XcoA
 CTetidff0SULo9LtDXbzD83KMfGle18nEHSITPl+MZHIzfxFzPFe8Hokr4s0SbUbpYCvWK3Sl7t
 QHVzUwzw7LvWwYuTJRgSP7e7BUHIUxBUuMvgjEumDe6Fis94H3b8XRwYzW5Ot84MNqcJ9f1s6a/
 o0eTb2NFNGnyzqdFuTnE2HBkewWuSUpXO75EH/LyYp/7cjVIRSsBY0IjNMc6b1Cws2lwrDgmzY5
 GhFHhvdi6KCqFADI/hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4jfohZFZcyBf
 LbEP1vxpDb+fCX64NyafY9DiV0wVXu4nfYsVYM85N/LmQgXU0aagb2d7OWSw0AFhe2gLKHZFYdW
 vZva1Io+4eAWrwVQjmHPlNvzHZ+pHTw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the color correction matrix, offsets, and Q8 shift from IFE
parameter buffers. Enable or disable the block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 9f4c8ae9667e..0db88534b421 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -7,8 +7,14 @@
 
 #include <linux/bitfield.h>
 #include <linux/io.h>
+#include <linux/slab.h>
 
+#include <linux/qcom-camss-config.h>
+#include <media/v4l2-isp.h>
+
+#include "camss.h"
 #include "camss-ife.h"
+#include "camss-ife-params.h"
 
 /* Module base offsets */
 #define IFE_MOD_V41X_WB_GAIN_OFFSET		0x4000
@@ -108,6 +114,26 @@
 #define IFE_MOD_V41X_AWB_BG_THRESHOLD		0x3ffff
 #define IFE_MOD_V41X_AWB_BG_NUM_THRESHOLDS	5
 
+/* CCM offset, registers and bitfields */
+#define IFE_MOD_V41X_CCM_OFFSET			0x5800
+#define IFE_MOD_V41X_CCM_MODULE_CFG		0x60
+#define IFE_MOD_V41X_CCM_COEFF_A_CFG_0		0x68
+#define IFE_MOD_V41X_CCM_COEFF_A_CFG_1		0x6c
+#define IFE_MOD_V41X_CCM_COEFF_B_CFG_0		0x70
+#define IFE_MOD_V41X_CCM_COEFF_B_CFG_1		0x74
+#define IFE_MOD_V41X_CCM_COEFF_C_CFG_0		0x78
+#define IFE_MOD_V41X_CCM_COEFF_C_CFG_1		0x7c
+#define IFE_MOD_V41X_CCM_OFFSET_K_CFG_0		0x80
+#define IFE_MOD_V41X_CCM_OFFSET_K_CFG_1		0x84
+#define IFE_MOD_V41X_CCM_OFFSET_K_CFG_2		0x88
+#define IFE_MOD_V41X_CCM_SHIFT_M_CFG		0x8c
+#define IFE_MOD_V41X_CCM_CFG_EN			BIT(0)
+#define IFE_MOD_V41X_CCM_MATRIX_0		GENMASK(11, 0)
+#define IFE_MOD_V41X_CCM_MATRIX_1		GENMASK(27, 16)
+#define IFE_MOD_V41X_CCM_OFFSET_VALUE		GENMASK(31, 17)
+#define IFE_MOD_V41X_CCM_SHIFT_M_PARAM		GENMASK(1, 0)
+#define IFE_MOD_V41X_CCM_SHIFT_M_Q8		0x1
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -133,6 +159,81 @@ static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
 		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_1);
 }
 
+static void mod_v41x_ccm_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_CCM_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_CCM_MODULE_CFG);
+	value |= IFE_MOD_V41X_CCM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_MODULE_CFG);
+}
+
+static void mod_v41x_ccm_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_CCM_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_CCM_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_CCM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_MODULE_CFG);
+}
+
+static void mod_v41x_ccm_config(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_color_correct *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_CCM_OFFSET;
+	u32 value;
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_SHIFT_M_PARAM,
+				  IFE_MOD_V41X_CCM_SHIFT_M_Q8),
+		       base + IFE_MOD_V41X_CCM_SHIFT_M_CFG);
+
+	/*
+	 * HW banks A/B/C each multiply one fixed input channel (A=G_in,
+	 * B=B_in, C=R_in), and HW output indices 0/1/2 are also G/B/R, not
+	 * R/G/B, same as IFE_MOD_V10X_CCM. The UAPI's coeff[out][in]/
+	 * offset[out] are R,G,B-indexed on both axes (0=R,1=G,2=B); remap
+	 * accordingly: bank X's slot N takes UAPI row (N+1)%3 (G,B,R output
+	 * order) and the column matching that bank's input channel.
+	 */
+	value = FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[1][1]) |
+		FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_1, cfg->coeff[2][1]);
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_COEFF_A_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[0][1]),
+		       base + IFE_MOD_V41X_CCM_COEFF_A_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[1][2]) |
+		FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_1, cfg->coeff[2][2]);
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_COEFF_B_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[0][2]),
+		       base + IFE_MOD_V41X_CCM_COEFF_B_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[1][0]) |
+		FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_1, cfg->coeff[2][0]);
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_COEFF_C_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[0][0]),
+		       base + IFE_MOD_V41X_CCM_COEFF_C_CFG_1);
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_OFFSET_VALUE, cfg->offset[1]),
+		       base + IFE_MOD_V41X_CCM_OFFSET_K_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_OFFSET_VALUE, cfg->offset[2]),
+		       base + IFE_MOD_V41X_CCM_OFFSET_K_CFG_1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_OFFSET_VALUE, cfg->offset[0]),
+		       base + IFE_MOD_V41X_CCM_OFFSET_K_CFG_2);
+}
+
+static void mod_v41x_ccm_apply(struct ife_pp_ctx *ctx,
+			       const struct camss_ife_params_color_correct *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_ccm_config(ctx, cfg);
+		mod_v41x_ccm_enable(ctx);
+	} else {
+		mod_v41x_ccm_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -226,12 +327,17 @@ static void mod_v41x_xform_write_channel(void __iomem *base, u32 coeff0,
 static void mod_v41x_modules_acquire(struct ife_device *ife, struct ife_pp_ctx *ctx,
 				     void __iomem *base)
 {
+	ctx->dev = ife->camss->dev;
 	ctx->base = base;
+	ctx->params_scratch = devm_kzalloc(ctx->dev,
+					   v4l2_isp_buffer_size(CAMSS_IFE_PARAMS_MAX_PAYLOAD),
+					   GFP_KERNEL);
 }
 
 static void mod_v41x_modules_release(struct ife_pp_ctx *ctx)
 {
 	ctx->base = NULL;
+	ctx->params_scratch = NULL;
 }
 
 static void mod_v41x_modules_config(struct ife_pp_ctx *ctx,
@@ -319,10 +425,43 @@ static void mod_v41x_modules_disable(struct ife_pp_ctx *ctx)
 	writel_relaxed(value, base + IFE_MOD_V41X_XFORM_MODULE_CFG);
 }
 
+static void mod_v41x_params_apply_ccm(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_ccm_apply(ctx, &block->color_correct, enable);
+}
+
+static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
+	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
+		.size = sizeof(struct camss_ife_params_color_correct),
+	},
+};
+
+static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
+	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
+};
+
+static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
+	      ARRAY_SIZE(mod_v41x_params_type_info));
+
+static int mod_v41x_modules_apply_params(struct ife_pp_ctx *ctx,
+					 struct vb2_buffer *vb)
+{
+	return camss_ife_params_apply(ctx->dev, vb, ctx->params_scratch,
+				      CAMSS_IFE_PARAMS_MAX_PAYLOAD,
+				      mod_v41x_params_type_info,
+				      mod_v41x_params_handlers,
+				      ARRAY_SIZE(mod_v41x_params_handlers),
+				      ctx);
+}
+
 const struct camss_mod_ops ife_mod_v41x_ops = {
 	.acquire	= mod_v41x_modules_acquire,
 	.release	= mod_v41x_modules_release,
 	.config		= mod_v41x_modules_config,
 	.enable		= mod_v41x_modules_enable,
 	.disable	= mod_v41x_modules_disable,
+	.apply_params	= mod_v41x_modules_apply_params,
 };
-- 
2.34.1

