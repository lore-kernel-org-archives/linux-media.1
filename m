Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84F493655
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363816; cv=none; b=jv9Z7uEtIkyLQLg3qIZLSNwilyoZrGmWFxKulNwcE+uYmFXS3WPS7EV266SyLCdzJPtQQac5J/qE49212i71694EdnJih+a1Idmj2HiUwxfdl0GhNSvSm7W4W/hJJeQ2sCz71QyTiDCRBdCGmFbouxIJoiZm/qPpP2s/HR2X0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363816; c=relaxed/simple;
	bh=lOmfvyw3XlxTtLP3rd4+jL2YmaWRT6O45D7rsJBBOvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j7AZF7u7INfJ0cm2AeEMcx1aSUb0VHaXn4eeunO7UU/tep/DYpV/asHeFrPKtGV+L36BiEwpdy36QH5HnaE5Z83zpAVNofOrX48gZH1U8eXp2Dq2uc1X/cKxidiABz+82Q3bzFio7MAY+s6JrAjoC001dutHFWym37vAyrU9O9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE+zUkud reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE+zUkud"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k38r2711704
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LdndrdMM61X
	79e5QOlAFoauUr7WYD/MqS5dFJt6wZas=; b=FE+zUkuddFs0KpypwXPqPghqFmO
	lSpNbhS2TQjjfybKvUjfL5NR59o6Ds59KmaQL1lxqkyM/wcsPfEqvIPDgsXaktCW
	mCAelTEHb1dF8OzIzQ/uoApE81hT8bXJ28ZUN1uIO3LxXDjCc0D10keMjG3IhMgo
	wO8KRzDH3OMYqcp0uOfw69Vo+rSm4WdtBYxrsEHJP+LNP66jGqfZmsdx2sT43aGR
	tV3cy/9mmwZO9r1NHD3J0A8AxAlnSg5ng2P997yLc7q4Nb8MSGD04dxkt4ULv42E
	KP1cyMxkp2wrykBwbrhF7PJwoC5KcqVHdu27VNlHplYn76Szg2OKU3qqKjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1da4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso745543085a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363777; x=1791968577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdndrdMM61X79e5QOlAFoauUr7WYD/MqS5dFJt6wZas=;
        b=qPaS0y1WDsL7lS3DWVrCBUacUy4LMMgGw2M+nBgbf6selYb+xdVNTV7pepNH2QEs2S
         1xgF4q/IipVcZByijiAesHx0rZa2FV3ybzG9nNg8pmlYJIax95we+zqzCYWphJDteTtM
         IPvkEJbdCXwtljuip74T61fnbATRhjfR0Yeks2JGT89LdvYiNV2U58JVLdwCoIsaz5ID
         9LGApYQ0RBsAhUy8DJE4fDIHFEdYjdUfnCwvuZvUApb9J0E9GXw/54EPAca7kuO5Rd/R
         /aSR84nin5Bwk0APHzLuitiC7jZqVZMfIPuxUS9ZMDT80N5GcziatQlJQCY41q6OZ90E
         ECig==
X-Forwarded-Encrypted: i=1; AKwUvBw1+SPgFlWl5VBwgn9BRSLacZ5BmOi2BFUYJWAO18dsMAFVCg7TIMXxx5KT+V/biJqqZSYLjtd3zLihGg==@vger.kernel.org
X-Gm-Message-State: AFuF++mGSTjEnRMKnSDlJ/jQZ20dD+8EBQ6cMDjEVSa7h841ONfs6U4U
	JC2mGEvTKzWX70JcCoUqJk/0c/apBJC/n3JvpPiNYaUrrXnFNNNJaszwO2ZyOwexfasYDNu+/2t
	MI14ZZswSwplh19o1x1WTI0KAy9s6Xz3Kc/S7uY+Thz5usv5ExSnY1eSDd1qWOhGXOg==
X-Gm-Gg: AYBFou0bpv2HO7CIef60YMHLcqZNUPQ/e78BU1nfrUx9/0GhcOO/Rfrf1TinuZ8zahf
	g25TCvjOVA4RAF3wpGLTcAcoMCjXYQi9uNpKTCQOnCIJyntwZMBA4Pz2WH8v7ItJTzlzad5PTOv
	Awg/bf8kevQ2V41U+mPC7GmEqui5fVLBB5saj0fbxKOdiIV6//b0BvHK03C+b8FizbX7fPBQWMg
	ZAyGu3GeMrQXP8A6zGDsTsf5Y8dckOZFJItu1lcfRAUuO9lYv1CzdnEl2kmaEGH8Ns2WinJLl5g
	TTYQ5stw6QwO+b2M6xCbEt4F/V/QrY9zOhJdvlcotmPvbbWFXkYO8BX8RLc=
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr270477585a.40.1791363777341;
        Wed, 07 Oct 2026 02:02:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr270472985a.40.1791363776884;
        Wed, 07 Oct 2026 02:02:56 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:55 -0700 (PDT)
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
Subject: [PATCH RESEND 38/45] media: qcom: camss: sa8775p: add gamma parameters
Date: Wed,  7 Oct 2026 12:00:34 +0300
Message-Id: <20261007090041.3732717-39-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rhx2vr1ksqSnSu_3wRMSrdSd4Fw3HjOD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/bT+xax6v26r
 7drU8REgADrAsNPYvMgPGVwk9hzxaro1pAM5RxOtQ+cwdAteiLUEPxf5AIFWed6Mp6FRoZLt1xo
 t+pmjU2AE8QoBl5FbquUezqaulXyR8qPwMrGED54Ewa0hc8j3eusqTvLnU/NtBw2qnuHaWi6l0W
 N5ppcTkvNLp4srjbEms1YwwS6Se0bftr0J3btQvXg2pngIv4s1jKPnIo946yXabbHuK8ki/e0Ov
 g6zM2Tw1feQtT19d5Xw1TRwTJtzRM+lWjdqtmZSbj30ieKhkOEApo4hGb1UTUQMTcA0r7Xj2NVd
 DiPTV0VdMAsf6xxfRRn3o3NF/HT4ob4v+Yg/3snMxs3VltrwPrqU7FwoYDsjeNzF8DFL5TYbO3D
 HlkA0ba3V4SNQyaKocswo9IXZanhiVuhQPf9tLAHlajf52OtWhKDOq/YqGaoBSvDSgf19lye/Vi
 uqSn16cqJXdNuUJW1tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6DoM+WyK2555
 OiqMYOZXRlXyxxizTLuuGpElYH5v5QnF2mLrpxT+0oYhQPXym4WiLFng/gJO1ucKpUgNmZE63Ot
 h77Ezx6rLJdqkPkdclKsJkJ69PgxGwI=
X-Proofpoint-GUID: rhx2vr1ksqSnSu_3wRMSrdSd4Fw3HjOD
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60ac2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=fErnbXRPH48mtnlGaVIA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue gamma tables from IFE parameter
buffers. Upsample each userspace table to the hardware table size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
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

