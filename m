Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0C13B19BA
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326647; cv=none; b=BXuhklnzvWrOxcutSEjUNA431zGRV1kjOy28RIGZP6d7H6Z8XnQVDr+0woiOkwhdob5KqV/u2T4Ux3cRJ/jZECbgO/qK5R7JZnF4ooofcAcvXiLbpVpA/O4eoc2s9g2sAu5CrahAVhMdtddNj63V+HR4LeSIf3E/QhUre6NqTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326647; c=relaxed/simple;
	bh=H8xW3WaT5QzL7YlCh599OMCWmKVT/zJTArtkEPK7F6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K+od2T/VnuBw4ZEMksQiqn5lFA/kJYaGDlJVkG9c1QeJytN/K0V8XBEauseUf6Rdoxz8Fbjc9GROSVJKjpj8M1YPMfR4JKmkrFz70fEbfw+sked24vNj1RHHet9rSlwoxFvWI7PmnGdq39DKRvZc2EtXFiRaLdtzNjwf6XVB6yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cx2Ceru9 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cx2Ceru9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeM8o1899628
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qyjU6pygVpJ
	nJM/+E+bubKaUn444o1Lpl8EIN3PRpWw=; b=Cx2Ceru9JX84D82EkYNx5nu+f+S
	iVxXUSMD2OdF87dgj9DmTYKRvIK4NxfbyX6Kmc2XsgC6zlBmqfLw0PByu+Zoyk84
	3Q6zNBv88gkqwWAIprn+FlYBVwqDH2ccEOUXbWdrAdFzQtBevqrDKnlNlQzZFf/O
	LYnS868iXPm3atbXfTrzfkXYRKhfApIv0/plKS93GFCs8WGJjet2FWjqkPl78uNX
	4rFujavQ+7tTFx9vlAedNwLl7k3nmfm9ePu0W8uF1CirbZBLL8pD4W+/i5OLbSS+
	51jr33tW7EyHQTrOoYPHvYXRLPZkzugF314IGa7L1HSjCYUJ7IUaG2cJN3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uhn42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be1861d2dso556008485a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326503; x=1791931303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyjU6pygVpJnJM/+E+bubKaUn444o1Lpl8EIN3PRpWw=;
        b=wZsqTBax+8G+1PuXcg2HN8fR4kNoGbupFUqca1+eIy2UtTpptcZbWxRWcm1HSXELLZ
         C3VvNEgkPyA/5UgMAzpKH0EkpbpvSYPARRphxeJk9y4dVsZT8KM94iWREI5A1kUhwJmK
         w04auLKrKjo7fPDnHS3Z8zzxtVUlI72DrtCcXpmH6aneEX/as+wAsPOMvu/fH0IBLUaY
         f5+/0hSJKQ64wV7gW7QbBGXp2+S/BP+ZCPXBF0Sfs0WUGnEpSKjiY666wndDeo1u4cwa
         cly2mhFxAx0xb3X7aIuE34+BIVYkL+I3YgTLWubphN5rDSwdDMe5A6dGJ3rpRPkme8fM
         Jg/w==
X-Forwarded-Encrypted: i=1; AKwUvBxUtno9KXkNoMNlekaMQtOjqufztt2562PPoNLvwsOuBW4CjT9hmBuRhceWSghoJURTlIt4l7zM9Fpocw==@vger.kernel.org
X-Gm-Message-State: AFuF++kRGj20wDRMNyGlbLGOy7blnEUod2tHa+mOzBC1sPXtHIpbsBUW
	lJy6aXG5MFwXg5nXlQ7GzFXbOlD2BVVbzb09MaXjTFnEfKiAuSm1IsU78oNW4YmRNcigt3LYAXP
	uplhgtHXcB8/LT3+WFfw4kOrHZYdz4Ak5z2StNeUKatNCTgkknYTbsMi5mfPFb+Gj9Q==
X-Gm-Gg: AYBFou1wXBd76iBYnBcGpuP6mJaqdsGghKK1wEGWkkjfJP7KbAj8kCBYQ/M6yXbWziF
	+oL1iJ9Iyh0SjNnmds75ZwodlHD0ZU9k5LHkzEfMFwXdq+Bjx0Fk5Il6LkQV6/1zOttB71hVsET
	B67iM80iKfeMyIAzjBE9d3rHTHlq75D14FmlZdZMIPEwyg7ARN0nEYoI9WpopwCH6Ev4YbMMRga
	qtqWNf1kPSvKiKQG1SqcgBjw+v24YnOh95ooADrivQho0sPLbOy26MED9hxyZdgL56tR+pKxdjL
	T4Z3J9qAyJpEvuBMhUjF4VLLsiVWwnHAVAlyZZzowXq/oE0SIZvQl+/m65g=
X-Received: by 2002:a05:620a:618b:b0:93c:65f2:7d63 with SMTP id af79cd13be357-93e9b7c2094mr80059885a.31.1791326502939;
        Tue, 06 Oct 2026 15:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:93c:65f2:7d63 with SMTP id af79cd13be357-93e9b7c2094mr80053585a.31.1791326502350;
        Tue, 06 Oct 2026 15:41:42 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:41 -0700 (PDT)
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
Subject: [PATCH 38/45] media: qcom: camss: sa8775p: add gamma parameters
Date: Wed,  7 Oct 2026 01:39:46 +0300
Message-Id: <20261006223953.3382273-39-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: VF8ls1-Dk_Du13FcbCKcm9fcNwrujB-O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX5jrqPU8xiVjH
 FE84+gqMyA1Ssex8HffpySJMoY5jpA+/pLNgVpg4yMKdFOfFo5dbhbiz9P9zXvbvkYGj5gFg9Nv
 H4NatuTCA/T4MyvrWyZdul+oDnzE3BU=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac57927 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=A9bscV92ZXObkQ-UZPYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX08vCqXWM2e5e
 QoUEI7Q1tV1FCtrN5Jn4GGuDpqZG4TcM+ibyU/SaPE+MHg+knIB/h3pSQ1WID2P0062XDlQfa5c
 tEPyReLv0u8olix/tjN1sqtMFqVbpRSmGKoyZSGwLR/C6q0cp15iG+PftaZYXOZFiaaIuy8yIIm
 EAWXUtZYlk+GdmA31gtHueKdkAHshG2QDU4HegejoDqkTGQ81KWm3eDVzuGfym7ZU2lRoL9U+59
 S1QLWAYez7pjn/6qLeeI6j9kY91Ia7BHXknfuO/WxGiQstXZuneIqbe8fkwoDpCy/14bciweslX
 8bsZrSvxjOmSm3PlTT9QCGfgWOxzeDR3+eFRSRGVFkvwgkn15y89WL4VEXK5IT0GyxvRzW4Vz5b
 IqaVGoySdokhRQPjigCqRBzn2jP75J8tkrrfElJNeDNBkA9MuI514neVzf73JZYkf71mBwHt7LK
 /8UKBOWwyRnP+6u1xLg==
X-Proofpoint-ORIG-GUID: VF8ls1-Dk_Du13FcbCKcm9fcNwrujB-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue gamma tables from IFE parameter
buffers. Upsample each userspace table to the hardware table size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index df21ea4040df..77d33c05cc6e 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -159,6 +159,15 @@
 #define IFE_MOD_V41X_LSC_LUT_SEL_RED		0x1
 #define IFE_MOD_V41X_LSC_LUT_SEL_BLUE		0x2
 
+/* Gamma LUT (GLUT) offset, registers and bitfields */
+#define IFE_MOD_V41X_GLUT_OFFSET		0x5f00
+#define IFE_MOD_V41X_GLUT_MODULE_CFG		0x60
+#define IFE_MOD_V41X_GLUT_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_GLUT_LUT_SEL_NONE		0x0
+#define IFE_MOD_V41X_GLUT_LUT_SEL_G		0x1
+#define IFE_MOD_V41X_GLUT_LUT_SEL_B		0x2
+#define IFE_MOD_V41X_GLUT_LUT_SEL_R		0x3
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -355,6 +364,58 @@ static void mod_v41x_lsc_apply(struct ife_pp_ctx *ctx,
 	}
 }
 
+static void mod_v41x_glut_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value |= IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_config(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_gamma_256 *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_G, cfg->table_g,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_B, cfg->table_b,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_R, cfg->table_r,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the final (R) table silently never commits and GLUT reads back
+	 * black on that channel. Deselect the LUT once more to flush it.
+	 */
+	writel_relaxed(IFE_MOD_V41X_GLUT_LUT_SEL_NONE, base + IFE_MOD_V41X_DMI_LUT_CFG);
+}
+
+static void mod_v41x_glut_apply(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_gamma_256 *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_glut_config(ctx, cfg);
+		mod_v41x_glut_enable(ctx);
+	} else {
+		mod_v41x_glut_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -571,6 +632,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -578,11 +647,15 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_LSC] = {
 		.size = sizeof(struct camss_ife_params_lsc),
 	},
+	[CAMSS_IFE_PARAMS_GAMMA_256] = {
+		.size = sizeof(struct camss_ife_params_gamma_256),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
+	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

