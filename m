Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25D63CEBA7
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326555; cv=none; b=WwP17wq44L+IXUSqrRHZVy3+hj+H8bmx8FI+SHIS1UcuJXXXWyY8YQeU7oLWA0p2/xBVVmGIYh1Xt8KmHZBma2CEDL9xaR6QvFROZkPd8lxQswhCp6N+XdTNJtMbwGeXB+dC/VUW8leF0/TEnpodMx6hJtqT+0LB7+n8MEwx1Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326555; c=relaxed/simple;
	bh=BE7YzDo+aN29l+DtyE+XekQRfNcAL1DNITTfUFzaEtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AxhuFRWq6FBTdgrPdxpuRvGk3BTSjHWNvhYOqNJ6qFcBVBflezHRwUPYh92BbbEifDDRx7NfY99VblNnTQ0HXbK8nyS9p1j+TMCjHyWjaTrbYj8ZjgOF0BPUFV3GybupyrffUWywfLcIMT05O4KM0kNHZxdA0J8hcK4QqIm1S1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXv3o45S reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXv3o45S"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeenQ2049953
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VHG6ZX5Wta/
	/3VVJ69soAnjhXm/vQwBil5LfrH7AnYY=; b=kXv3o45SsPcI1sS09fyLkXFgyXX
	jrom5iRMUELsHZWUYl25zjtmv0o64gAcvQdYf7smpaqLmacIg1m/M10cg3dFvVmo
	FQT3MyiuaWFGdqaeT/pt7x0aLGbK05ItnWXt4qxXtlKWiOUCQbfzr6YElHZX3qMX
	MebDsq1UwPm432rgDVrVqmPQ0EHjBodI6Us4k4q3/E0gAtS9zagejq0LeGi3d14w
	NEFpBOfVb0TZ0NxVgRL4bmD0pPZZBFuBral+UffZKASQK5Dt8BiyIlwmi/Cwxr1k
	p20V64ZtM6AtaTGKjk73lC/SNF0fmQBZkj5A+Ezdc560x5wec5Nq8Vg8/Zg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54621h3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc359d9easo536174685a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326501; x=1791931301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VHG6ZX5Wta//3VVJ69soAnjhXm/vQwBil5LfrH7AnYY=;
        b=amWi30OsViPnvDSLG/Mk8bJJNv+vWU3ow2GIMvX+bNgtW1/j3MRpqhRNk3qJO8UsJh
         1dBSbPssHZ9iYIuhAPcqgzuN68L/fod8TtOU1R8hNnTHlQFOmdj/aISLtHeRqc2EvCXf
         ThxQsRASevlVAyno7UfKARSAhL5k/A5aZ3Wny5J1sqoeGor3RHJRpeF0t/+Z0j8AlP+O
         5+QNKQRh9J1os750cpQzTtPkvdvhYECFymWP/obzkhY8czyzmsLSs1QNUp6BTGoxuwQY
         DninXR6fpx7Ie8to+NnBdHzn+wq2XTd5HB5q/sUYI0hXa4GN/Z3wuPAPAtHoZ+KODwpy
         8rGA==
X-Forwarded-Encrypted: i=1; AKwUvBz4IZdEIcCXL0BOzcLxJvRKSJyYn0q3MiRnTMhSLRHiGUc6g7iPLOqvNC0dLkP4IEinhgbUspKsdUxpIg==@vger.kernel.org
X-Gm-Message-State: AFuF++mP/2jT1IdG9V0pw/eTj2brav+CXxgMwNj24YrbmRk3qif4CDnN
	GY5NBoYZrjkO40lxB3Svok3+4CJoEJ4iUHU8CMrXj6k6VMcgHZHEqdk6s8ql/vRTqZ7wmDB3uab
	5eyRZI97JzdBexVvrbjlrd4VHZZlTYkDoXzmb+Yw1wlpF9Ev3G48gNjoTm6baleb6nA==
X-Gm-Gg: AYBFou1hds5g1eWvSy09fBVgDuw0YI9z/Xrqj4zHHsAXKsgOdsPVtjFB4TNpvYeUr9a
	CNhPO7F3D+fskZWQAhS+3qdFA6bOfZLjhz+4AIW26VrvK18/OBR5TSx+gCJ31u1p6JQlDDG8Jnk
	d8ikhlU+sa4ETFTw7F9pEwkFkuGxmvqGizc7SoTCJPYeXT8lZrbkMTumE28nYc900ukTbKtkRJa
	HY5X2v5ngqdh4JODkiHMgErLRsucag/9picAjpA1OcahG08MSzAQFgrgXMiZRXq72TOiNorikyX
	G46xZfKHEIeG+GDG6U0KVQKbhQL17zmYIqmUZmwmgeJH9hLrOszQ2eYPSEg=
X-Received: by 2002:a05:620a:4727:b0:93b:d79b:9a61 with SMTP id af79cd13be357-93e9b7e3728mr78400685a.66.1791326501083;
        Tue, 06 Oct 2026 15:41:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4727:b0:93b:d79b:9a61 with SMTP id af79cd13be357-93e9b7e3728mr78394985a.66.1791326500458;
        Tue, 06 Oct 2026 15:41:40 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:39 -0700 (PDT)
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
Subject: [PATCH 37/45] media: qcom: camss: sa8775p: add LSC parameters
Date: Wed,  7 Oct 2026 01:39:45 +0300
Message-Id: <20261006223953.3382273-38-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: bWg_3rgN3nVA8W_r7mosZdPZ-2kNqfKR
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac57926 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=V7XpcatRP1mUk8Ry8oYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyzu8gz35QAEW
 u4AY/fKLQQ/aK8o+yipLm6Cnevwc7s6Si15Bs6PmiRt16iLciivQqGNf6md8uVfIzsKMAKvFtsF
 JNMTBX30GHABp1Y5TO/uMrDua2s9P7E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3AeTrv9W571W
 2zdQIOjK3Xfk1D3XFfde08lYz1ya7u/BfZrAVnGUofICm+/a5eF5/FxRAVK/CO4T3gVC2txjYUr
 G6TxCEZXTj+8XQAdDYAncbeyO3rnhgB8LkxkvnmsWVxaHqNHd7TzbeQoDH0IfvcDUcjNYJpwUGC
 0QFRwMjaqx68MwOvQ1l9uTRZnozslP2/HGOPn5J8Qj7WipOJb1pZsoMYERBeUHA67CGcKz1HBfv
 TrApVpgHGI3CgaeiJq/xYlMrzDCmepJnUkTxkrisvxTbt/gBY+/5ZmKdShhpgD9HQ96m+AZqSt5
 XR/l+EJgCGTfxrT8zuZAmwI1ty2T8IS23UcGzOA9vcB7wX3D3HJMxZeoH7pHp0vFuizvcipaM9G
 CTtrzhI92rHn+8rZ55ditvkW2jQco1S3wDxtqP3TySsbTOHxuQrn5jRY38P3qYXzIz9zwiumgqz
 JcJJkRyPIf+mRREX5oA==
X-Proofpoint-ORIG-GUID: bWg_3rgN3nVA8W_r7mosZdPZ-2kNqfKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the lens shading geometry and red and blue gain tables from
IFE parameter buffers. Validate the block counts before updating
the hardware.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 0db88534b421..df21ea4040df 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -134,6 +134,31 @@
 #define IFE_MOD_V41X_CCM_SHIFT_M_PARAM		GENMASK(1, 0)
 #define IFE_MOD_V41X_CCM_SHIFT_M_Q8		0x1
 
+/* Shared DMI port registers */
+#define IFE_MOD_V41X_DMI_LUT_CFG		0xc
+#define IFE_MOD_V41X_DMI_DATA			0x10
+
+/* LSC offset, registers and bitfields */
+#define IFE_MOD_V41X_LSC_OFFSET			0x3c80
+#define IFE_MOD_V41X_LSC_MODULE_CFG		0x60
+#define IFE_MOD_V41X_LSC_LSC_0_CFG		0x68
+#define IFE_MOD_V41X_LSC_LSC_1_CFG		0x6c
+#define IFE_MOD_V41X_LSC_LSC_2_CFG		0x70
+#define IFE_MOD_V41X_LSC_LSC_3_CFG		0x74
+#define IFE_MOD_V41X_LSC_CFG_EN			BIT(0)
+#define IFE_MOD_V41X_LSC_NUM_SUBBLOCKS		GENMASK(13, 12)
+#define IFE_MOD_V41X_LSC_INIT_SUBBLOCK_Y	GENMASK(30, 28)
+#define IFE_MOD_V41X_LSC_NUM_BLOCKS_H		GENMASK(3, 0)
+#define IFE_MOD_V41X_LSC_NUM_BLOCKS_V		GENMASK(7, 4)
+#define IFE_MOD_V41X_LSC_BLOCK_WIDTH		GENMASK(10, 0)
+#define IFE_MOD_V41X_LSC_BLOCK_HEIGHT		GENMASK(25, 16)
+#define IFE_MOD_V41X_LSC_INV_SUBBLOCK_Q20	20
+#define IFE_MOD_V41X_LSC_INV_SUBBLOCK_WIDTH	GENMASK(28, 12)
+#define IFE_MOD_V41X_LSC_INV_SUBBLOCK_HEIGHT	GENMASK(28, 12)
+#define IFE_MOD_V41X_LSC_LUT_SEL_NONE		0x0
+#define IFE_MOD_V41X_LSC_LUT_SEL_RED		0x1
+#define IFE_MOD_V41X_LSC_LUT_SEL_BLUE		0x2
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -234,6 +259,102 @@ static void mod_v41x_ccm_apply(struct ife_pp_ctx *ctx,
 	}
 }
 
+static void mod_v41x_dmi_write(void __iomem *dmi_base, u32 sel,
+			       const u32 *table, size_t count)
+{
+	size_t i;
+
+	writel_relaxed(sel, dmi_base + IFE_MOD_V41X_DMI_LUT_CFG);
+	for (i = 0; i < count; i++)
+		writel_relaxed(table[i], dmi_base + IFE_MOD_V41X_DMI_DATA);
+}
+
+static void mod_v41x_lsc_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_LSC_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_LSC_MODULE_CFG);
+	value |= IFE_MOD_V41X_LSC_CFG_EN |
+		 FIELD_PREP(IFE_MOD_V41X_LSC_INIT_SUBBLOCK_Y, 0) |
+		 FIELD_PREP(IFE_MOD_V41X_LSC_NUM_SUBBLOCKS, 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_MODULE_CFG);
+}
+
+static void mod_v41x_lsc_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_LSC_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_LSC_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_LSC_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_MODULE_CFG);
+}
+
+static void mod_v41x_lsc_config(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_lsc *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_LSC_OFFSET;
+	u32 subblock_w, subblock_h;
+	u32 num_h = cfg->num_hor_blocks;
+	u32 num_v = cfg->num_ver_blocks;
+	u32 value;
+
+	value = FIELD_PREP(IFE_MOD_V41X_LSC_NUM_BLOCKS_H, num_h - 2) |
+		FIELD_PREP(IFE_MOD_V41X_LSC_NUM_BLOCKS_V, num_v - 2);
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_0_CFG);
+
+	value = FIELD_PREP(IFE_MOD_V41X_LSC_BLOCK_WIDTH, (ctx->in_width / num_h) - 1) |
+		FIELD_PREP(IFE_MOD_V41X_LSC_BLOCK_HEIGHT, (ctx->in_height / num_v) - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_1_CFG);
+
+	subblock_w = (ctx->in_width / 4) / (num_h / 2);
+	value = subblock_w |
+		FIELD_PREP(IFE_MOD_V41X_LSC_INV_SUBBLOCK_WIDTH,
+			   (1 << IFE_MOD_V41X_LSC_INV_SUBBLOCK_Q20) / (subblock_w + 1));
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_2_CFG);
+
+	subblock_h = (ctx->in_height / 4) / (num_v / 2);
+	value = subblock_h |
+		FIELD_PREP(IFE_MOD_V41X_LSC_INV_SUBBLOCK_HEIGHT,
+			   (1 << IFE_MOD_V41X_LSC_INV_SUBBLOCK_Q20) / (subblock_h + 1));
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_3_CFG);
+
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_LSC_LUT_SEL_RED,
+			   cfg->table_r, CAMSS_IFE_MAX_LSC_BLOCKS);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_LSC_LUT_SEL_BLUE,
+			   cfg->table_b, CAMSS_IFE_MAX_LSC_BLOCKS);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the Blue LUT silently never commits.
+	 */
+	writel_relaxed(IFE_MOD_V41X_LSC_LUT_SEL_NONE, base + IFE_MOD_V41X_DMI_LUT_CFG);
+}
+
+static int mod_v41x_lsc_validate(const struct camss_ife_params_lsc *cfg)
+{
+	u32 num_h = cfg->num_hor_blocks;
+	u32 num_v = cfg->num_ver_blocks;
+
+	if (num_h < 2 || num_h > 17 || num_v < 2 || num_v > 13)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void mod_v41x_lsc_apply(struct ife_pp_ctx *ctx,
+			       const struct camss_ife_params_lsc *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_lsc_config(ctx, cfg);
+		mod_v41x_lsc_enable(ctx);
+	} else {
+		mod_v41x_lsc_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -433,14 +554,35 @@ static void mod_v41x_params_apply_ccm(void *priv, const union camss_ife_params_b
 	mod_v41x_ccm_apply(ctx, &block->color_correct, enable);
 }
 
+static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	int ret;
+
+	if (enable) {
+		ret = mod_v41x_lsc_validate(&block->lsc);
+		if (ret) {
+			dev_dbg(ctx->dev, "LSC validate failed: %d\n", ret);
+			return;
+		}
+	}
+
+	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
 	},
+	[CAMSS_IFE_PARAMS_LSC] = {
+		.size = sizeof(struct camss_ife_params_lsc),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
+	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

