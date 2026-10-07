Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC374908DB
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363886; cv=none; b=hvA00CUdtlEWKbC5TNLq9AVCmgjn9z3cUowV2b3C7xUHmOKrNjftZRhiuIVE57iqbu9wFvqmNhFLD1/3dePl80SI67Kg8YhucW0vb6w4glD8lJMn3bUrLZg91Xe49Q0LvrhRL1ip4Q/gj7x7KPFGVcUK5I5P8C6pMYpcs8Vd8FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363886; c=relaxed/simple;
	bh=RYibGEzxtihko5PwDqOj5fA9WIiMP/2MvesgUwHHFM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=soRhs/m6gAeoR4i2LQBUbTBcztCAIBJkEL4KMXU33vBKzXhEGsep2AG3dzpaKTqZyr8bR8vzDDEsL9HEoj7jAIqXzu9pN1d8VBYcpQENNky+dbTIa/WM10XfcvsTRpMRQtE7TRXMw6gkpf/5PIPIGyRoEf/xTTGaRJqkXCOMoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLskxHyG reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLskxHyG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jSmV3298193
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcQv+ESudV3
	lx6NUJHsnUC9DLitCg5UjxSMMc7AIUxU=; b=hLskxHyGbXu29vaFUujbvarQ0cs
	7pCvhkXHQVgyy/gLkAtZ+TLaukSPIb3594s9U6TnYrimfz30Wf15AchnFPpG1q7N
	x4aFJaALBpbu+ySndW1UquSgJii0sv4HmLjHloQy6sXAX1JLFe7cQXbjfS8pS1dL
	NrXnWUpEyb+Ri3IMC6roJftDgMF2Vee6lBWDh1kKzsEdNFplSCJWt6eMJYohhHZ/
	RdOojGKF+5S8GWixXqnHoeMWFhhy+rUjwC2xDEPQZnTI1wooJ+yXoy/MlJJSiGa0
	DXZDYRDF9GsZHz5yN2nCTLp1ZDpVgC0nxchCrpoW+qlBWMANg5/o2eKw5Vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrc1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:03:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso739075885a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363780; x=1791968580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcQv+ESudV3lx6NUJHsnUC9DLitCg5UjxSMMc7AIUxU=;
        b=HBFF0Pau7hHmtL6Lo/FMbsfUshO6SysA4zus3XNpzyl1rdHq+v2TQBostULmFC9koN
         XPBdmGyKPIlNWT66JwP8hd6vImsjwkE1Hfori8ViOwEqyj+HRhwc0jHwOQDQ1RpdKhX3
         wos0iMGRMxdpHoahRKl8PV1UcvU8iLUeFE/1+V/UFbTWFvroszUPlwEgstZFUXpCyWCQ
         J9LQ9+I/cceWn3Pa5LYB4sN0TVx/L8L4s4tOdqn3PJLZgEM0u+buIHUUVDW9Kat8sPa3
         LXF++I/p9V8kcP6g64WKsYw19W7jG/xZcI7j74lOwelR/V8yeHI2OYtDt+V1iBziAyeQ
         ULtg==
X-Forwarded-Encrypted: i=1; AKwUvBy1+5fFZxK9BBsO99A1DSOFKkDlMLjOuzpyVcmp3xHEBUjUBWGY8lBtMaNAAeqC2zg+Yl76MGhwQ9GcGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kvnuol/jeKqfPrTwtNtsssRibI54fS77tPllFIpmRQMM0nhV3l
	vWUYpXFNgBxQzlpr3+DJpNOLYTiOslKBJ74GWqueSlQ6jwaD7j46h07/O38uBnmcEbK2kVoL3Cw
	96ZZ0rht5dsxeX2E0JS8dgk8njqAfkuNzLSfHNCmZiVS4IZDoQO1Xn9BiKXQT8Ok/ZQ==
X-Gm-Gg: AYBFou2lqegb/b220Qoab5kAckeHgCBl9/lLfaZKW7k/YMdeIsV+HMjIvo9tp1G6Ynf
	HYtlr94r7hIS9mRFLEYDs/8zuFd5rUH5YP+FLdyPm9PW1lq5lFlrY1nhnfniqOpkmkGZZ7KIQO+
	f2hXqe2OFPHyqPY94tscBjaowFwKZYqtgJDTID08pLkZokXazFNrA6nCoESLLFesZ/p3dgini4r
	XE+g5eMphWwCXAmwkuhk/uIW9nAe7xmDjEZ+//TmRWg6z1nRuiqz30jEI3jYUd7eXyrcwcacjAM
	iis0Ny7WZHNWeZm6dsF6/a8Kaz9JCJ7GkLyvK/NXc01H0KTD4XH4bg7Gyro=
X-Received: by 2002:a05:620a:1a13:b0:93e:6e6a:b686 with SMTP id af79cd13be357-93e860c61b5mr1021848185a.29.1791363780377;
        Wed, 07 Oct 2026 02:03:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93e:6e6a:b686 with SMTP id af79cd13be357-93e860c61b5mr1021841985a.29.1791363779756;
        Wed, 07 Oct 2026 02:02:59 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:59 -0700 (PDT)
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
Subject: [PATCH RESEND 39/45] media: qcom: camss: sa8775p: add white balance parameters
Date: Wed,  7 Oct 2026 12:00:35 +0300
Message-Id: <20261007090041.3732717-40-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8MkIFx93SByuvhR3YgLnJm_DJ_wYx9Nz
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60ac5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=rrQ0n_boRlREehwvzwcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7FWXSw6fvqF8
 iSa/3LJGXnFmu7YU1IZ79iyXhtJQETsH8l3YZESbP0VRf0qq0Q862KZiUl+bXTZAOXM6dRZB5A4
 XQYjL1VFJ/bvgxiUjJvgAAjj7WQHO7U=
X-Proofpoint-ORIG-GUID: 8MkIFx93SByuvhR3YgLnJm_DJ_wYx9Nz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX54qty57wRcqZ
 R5reTfl6LTcLlHWIlDZfQi1LKI9OOVWgoipkiXvJXfHkvXDTSZbsGp+4UK2ZrZFHbHg3wGyOQin
 EGP7HmFIow3Y2uFAxdL/zHVZeWIP8lT6vyKs5gK3CqQGggSCGfEShHVteUY648U3ppd8K0LqQUz
 G1L2100T7tjErEitZPGl79SS8q+dSU/Hocnf1dMCV8vpCQCindrZrBp2gbwuGDGjXO1BrYEQAwS
 PWnKXUgsQx/A7xEhifZ6ZPRFsTmoSYHobwGTcXo6MHkC0sKP4WvSwF3hwdc2tAy0vx5Qfl1zC0M
 jr6/UDqiqs6fpzlBZ5VKE3/0aIOpVaEcofme+Les3nFNX7LMQvsu6XCZdpbPySISnJ6KTkWiqh0
 N5UBouF8IXy2YbJBINcsX4iC8hlNJ57p9xnNqAw9eUuz0fbdj2dQmlVzPtEVYwcM6SPn6Jho1zC
 Ifol9eD2EPXpxC7b0SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue white balance gains from IFE parameter
buffers. Enable or disable the gain block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
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

