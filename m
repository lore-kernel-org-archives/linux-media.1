Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F63D954D
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 23:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327789; cv=none; b=YZajriyGoMtoynnAZJIHk4ffKYKjdB3QQXZJwfef1rwJA0nWMnxZY/Ae3xodHDUIplEJ0PnZROkpvre5nSpMbtRhGFVOlX27RnGqwKqfLqHG1hshKqH6nqzN4gLeiF5Sfy2daRSoBTujY59U8B1eMaOIjKWhESrmyAbxGvj4O5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327789; c=relaxed/simple;
	bh=Pmsmy2qqiP5xodTQBFlseJBs12bs8MwUvw4gFMv27cw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YmtyZljAOZUCXP//ER6VgIrUrc83jt0Mvy327+nbgtDe+UgPbl+SW0NUYL52fFSsXIQjnLHoZIT0aqhrD1C8vgoOYr3OuM+bk2SbzepIcsMLl1lSEwsIABivPKJfPF+tDbztHWD4bveeNcyvWBBLl/JMOF5EdW6mfpLxvT1DbOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/soTDBK reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/soTDBK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeNHt1195954
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GF5lTBFJaVZ
	Rwfu404c6fB819j+awfZq7TKaG1+0FDU=; b=o/soTDBKz0G1PuYPKRSzTYXGQrx
	lDJH6djpYIVXAcppIcZYp7umWuDjES66P1EbvkTLXwv+z7K5HKgHUtEDUs6jVL78
	v/9Js40ZUpCvCcARGpKQFDkAPgNOKOfyVbDB0Vcc7NpfqSpMYf0EN6Tw62NDSGD3
	GpZReeSj+Ow66YwF9dW95b40yEVl6xvMBQTugqEqE7p5tk9/5mnVx+b3EXuBE/2G
	41O2I/SretAngDJkCFGnFFaBTia89HrEVYEepb0DQER8YVy2bg12FHq9d0bAtgJh
	slKogi+Ybum24xa1YZB09GOR2qUNzDcKqGq8axJ9PSxF+QUHGYskVo0XQrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmruf7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso717211085a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326505; x=1791931305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GF5lTBFJaVZRwfu404c6fB819j+awfZq7TKaG1+0FDU=;
        b=QOOIlpne9VQbVgYX5eNecKLkIubOTKjR4L8UXt8C1Lcc393svzofrW8Bn20X6/32PY
         Oy3c7WC6cNn7ydtOjuhgyG/U0H9ch9FnG9gK2mDPlb6cS8XB6g/XTOCkCE94eIby8cfd
         G+VzC52HTAkNWuJx93W6EwrUiESDORY2GbHrGcOasjbzfGfu0jtiGifh1AIY3Uk931rw
         HSaS+GxkmF0O/wYq7AagKvWFgcJ4s9W6XrJ7yPuwtBLAwCibeqd3AEP6A1hIoi5l9sbs
         JEo6bkmV9trg95ckHxIqplziXbefH1W6rXrJ1yRQOSHE8vQOyGZoG4BGca9G1GfI1W3y
         5FpA==
X-Forwarded-Encrypted: i=1; AKwUvBxofg1Ph+wEYIx0Wja/QZfa7DWoabHwSiX9RHek2cQgIQnHUgCOIolhCFfATfG2N3bDjSLnpmexzCHqKA==@vger.kernel.org
X-Gm-Message-State: AFuF++nZqYaievj+8KSCeANc/D6IlEg3aBhHvUEfjL26HjAQPJ+yjFLF
	FUG+K6+IIG2phruDZi2kO8YapSFH+TM5a/nevZg8Z2eBEubl3k5m06JKATxduXdoWrO5hYmfH5w
	DK53K5+hRxsw+tVajDc2u3+/tVYl26xkLLaiggNagocvitoWx5u7RR2p1KkBXgmXtLrlyRAOuW0
	jr
X-Gm-Gg: AYBFou3auh3cZSB7xRTFg4XmhIIr94K6RdNhIDqMu003Kge89XB8/U56bwuuI1e91KB
	hIGj/uYVetT9B7HdIjQhUZ4b3T3g++lPoCWnyIgaSm1avyDfE8ch1eNcyDpI0UWDwpGsFT1rN3j
	lbd+iBV9O+dqNDnRwjUDREmHnIqm+NWZgiNeK/ewnrXUFpDxZDXDcBfMhtnm0iKy9HDbXHjyxrt
	r6jSm/C7idL65x6/3/HI5dcnM0ZsgUZWm10uPQhW/IejdGzTTi7AGRJLojg3E9CLRxH2GogQy5D
	mRwItw+oVbpdQI5t3ivFHDz9/3aBw98q8avSxxy5lanhEDSIoxby14biH3c=
X-Received: by 2002:a05:620a:2a08:b0:93e:980a:88b9 with SMTP id af79cd13be357-93e9b895493mr76889685a.72.1791326504666;
        Tue, 06 Oct 2026 15:41:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:93e:980a:88b9 with SMTP id af79cd13be357-93e9b895493mr76885285a.72.1791326504231;
        Tue, 06 Oct 2026 15:41:44 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:43 -0700 (PDT)
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
Subject: [PATCH 39/45] media: qcom: camss: sa8775p: add white balance parameters
Date: Wed,  7 Oct 2026 01:39:47 +0300
Message-Id: <20261006223953.3382273-40-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac57929 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=rrQ0n_boRlREehwvzwcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KQX0lNorD1WzMaA85u59w5tgLdfq-Qq7
X-Proofpoint-ORIG-GUID: KQX0lNorD1WzMaA85u59w5tgLdfq-Qq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9owf4HeUtxkn
 UuFjtGNF++vr2e4daNw2K/uxbgRObOEadMSqbTpMKG5GP0TK4GaTiBsMYNYowyC7q1jTlk8tNQh
 Xyhmr8GmPR1b/5AN11MJACWMhZAeGWpzgx64plKNkztsSUqjlGpRT/EU/mHRgFZJbwN6aON/xnW
 E4iVCKTKKRdbmsE/9Xu8Dn+nj+PNc19niSoHaQjYWXMayIZnNH79bENSBmOxEvWV3G8RAilnRT2
 SLt6uN1Fv3tZcq9HdD9gbT+w55TkhyaYVoBDbecZ1mUmUxnbCgThbvVT8E/Z8r610EE9rRlcnGu
 bTdS7Tz1pkhC4szlohyIwMGvOnjlrq/mOAhYuGj8vIySLEXwTVAq0BMtCZnnCE4+kCG298kfuyd
 1pS8fcn5u9Fi4S3KuK+TtY49KIsXMBznzQamZFi9weZcsAduDCp1G1348l2yxaYj5oYwPTCRP7f
 hK9SeOu0eCxtjg6EiyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyM5yKJIIUT2G
 NZpwjIxxs/chTKD1BMuj9zWTYUxmIW2oMclD2nGJoEIrvzGFq/nWwD8pPdS2woNWiEU2PItpG4X
 qCSiMmtZ/4tHXRb9KYKRNbGe9G+Nv9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue white balance gains from IFE parameter
buffers. Enable or disable the gain block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 77d33c05cc6e..3c53f585133c 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -179,6 +179,36 @@ static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_2);
 }
 
+static void mod_v41x_wb_gain_set(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_wb_gain *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->g),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->b),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->r),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_2);
+}
+
+static void mod_v41x_wb_gain_apply(struct ife_pp_ctx *ctx,
+				   const struct camss_ife_params_wb_gain *cfg,
+				   bool enable)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	if (enable) {
+		mod_v41x_wb_gain_set(ctx, cfg);
+		value |= IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	} else {
+		value &= ~IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	}
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+}
+
 static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
@@ -632,6 +662,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_wb(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_wb_gain_apply(ctx, &block->wb_gain, enable);
+}
+
 static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
 {
 	struct ife_pp_ctx *ctx = priv;
@@ -650,12 +688,16 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_GAMMA_256] = {
 		.size = sizeof(struct camss_ife_params_gamma_256),
 	},
+	[CAMSS_IFE_PARAMS_WB_GAIN] = {
+		.size = sizeof(struct camss_ife_params_wb_gain),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
+	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

