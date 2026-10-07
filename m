Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2D347255B
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363815; cv=none; b=Zl4n6ebsVPvtitBO+lVemb75/OmLuYsFq6AWthOo1p+8FZ+PaR4x52+wpnyXreXlInRIt6sxbBwAGc6TctjKg9nX8YuAOvxnRZNVVF6DQ5g7J/NbQoGGkeFMNV4lmkIk6Tm2nmSQUyGaal7Bfzr8SeC/GZJVd5zeOnj95N/H84g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363815; c=relaxed/simple;
	bh=6hQfTpXcWJCXMi9PLy+5xVUK/Z6Ol/PrhtBHuKTtcKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j3QxRtELXATXx51gXbrSvamAIDdABGn5Uc2Pl4DQjgrgfx5R3o939CoZ9/Aq2d0iP+Z4tV8En3HEysfJZd3p6bXHB4l3AbC1nFqmUssJIEf3O8Bw3v+7bM24qzPqM5BjP5Wfdxn2jthQL/NGzBcBkaC1N4RZ66CNrL04hRUFzKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhkB/ECM reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhkB/ECM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnEU152120
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YS4pH/oE/I5
	Tfkm4NadULCHmtqcTm2/Hf/Nrx/my0a0=; b=hhkB/ECMM36N45R/tmGA29qRd/1
	1iC96QF2tuHR9middIprrREFjhVDK8fzK2a5f4YSbQ1PJZQkobCG73p4W/MN6wEi
	vjh7q7U9kI9OykbgLF45g5WAC93Z5Trt912B2WQkuAkNbik+L7UdTqy+FEgr+tWx
	kAqAO2NBFST9+BIdulRXpuOGmelovBF1WsaLB4NtfLqgTHEX90YdyRAfhaqLjcsS
	Xr+4h+l8CVuUi4gBc8v1cwE8njHbu256FgcG+eip6Pkoahr7zYn2W8O5pV7Q/6kZ
	vdRV+tlIIm5ImJDCna9LTIuBvZr/9f2qb1pwywzsxF96pNyfxRLEnlMNOJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719c46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:03:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so626392185a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363783; x=1791968583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YS4pH/oE/I5Tfkm4NadULCHmtqcTm2/Hf/Nrx/my0a0=;
        b=oKNDMivwm8Q0e6PJSUqmk+Xq3OcVOgbCLaQPaGZ2/5KbeVLQ+7L876STsNLdJIpkFT
         4nagF4l53seebqFuCUEfrouDgjywDu72texVIf+CIxY8FMVw9KK0bvyRogAwKpDu8Z77
         dnOAaXNeG6V64SlygyYN3WcMRAFqDKEzw26R6B19TRdz5ms+e+eohPRpv2xOp255lqmx
         wQcmMJIijDm68BgZeMO5ZsZDtzs/skVScIuCVUlvPir83Q/qOy3ZX0LPxwb4ufLGRa8L
         C6j2owMpTrhivwJJ86oXdHnMHkTrM5aPtpIEhWHg2Z6FOhMOsu1pcecFAmR1GQHp38um
         FThg==
X-Forwarded-Encrypted: i=1; AKwUvByvjdeDBjn44iJyiCjX89CcVdEERjPTpPY4QlBW8K18g4q11OAWIG5B8ACxY4DCzyN5nnKo99blNckDYw==@vger.kernel.org
X-Gm-Message-State: AFuF++l75YVdfPqOcB06d3CKyc+yhejQBb7bvLA5vQpFpj1DeywQmCH6
	EW7XRAUuz2/WXqQbDe3V1fNC38PmDsCYiSx4HwtO0Y6C8AqKMNPp5qpqvVpLpyxNKzohqsjTykJ
	WdIx3DqaXrBfDWvYCieTkqgZwtu8xS2mWmSWpgYCB6jKbeD12jNOI1PJ7YBbZph+lZQ==
X-Gm-Gg: AYBFou1OtjvIYMq7ZK/G5cB4D3Pyg9XDZZ2kKi4ReVguCWc8szGLptnytpUFvHWzYr5
	r8rcuLYwHP8jufF/gESjhT6epQlQIA8ik57ZbM7FMjaCjP5CpSllheouRxAvCibJtWw0vzoYW/L
	ers73hOH+15zHxn6pY4kdgA/nRUSl5/dWY4z9WzvTtcRDwW9q0Of/WrdUzcWq7v3LNq8DTzAUAX
	ZyBol6r/dpSt7LoDpglrOtLrGkpVRlUJGKJ4f/ua+RJdzCibv7OH1xXqmHj7kl1GDwRF9OsN1Qg
	t6qeWJke9imNyJcWouJtU1taz5qszMk3ygMv3JyGnnMpoMb1hsAdwfUWucE=
X-Received: by 2002:a05:620a:470b:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93e9b80174amr315318185a.54.1791363783152;
        Wed, 07 Oct 2026 02:03:03 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93e9b80174amr315310785a.54.1791363782645;
        Wed, 07 Oct 2026 02:03:02 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:01 -0700 (PDT)
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
Subject: [PATCH RESEND 40/45] media: qcom: camss: sa8775p: add AWB BG parameters
Date: Wed,  7 Oct 2026 12:00:36 +0300
Message-Id: <20261007090041.3732717-41-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX34jx57CE2yGh
 ZTtTYgtfA1XFzgy0E8QF5sCnTf9bz2zoBm+24oO/fh+3PNH3/KsOS307U+mFslW2uyoHl2zAx/i
 wbMl3QMHFlEBPMJ0bZSLJLDM6H07mWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXw20i8pDOd2L6
 Xgve4do2YtzV/ghOTrx6Zy1kY9wxep6BOg8ZgF7YZjeJaXzYXzjgiG+D8ns3curtW5SYR2YsYX4
 XjsRTq/JwArDUV2H2AsqVuL++3Fhfji0nEZQieg0jrQTKVx9t3ihWPOLV5W6gFlcbq+knJ0emB+
 MPU9esJFC2xh1GxphPVY5Df3K3sDd81QhNNnKEzylLn4GPA7qMMeYUjI+qzkpV/wdktO5WfstRc
 AJ2b6c484Mh3J04e5CFRS5APotcDLQ3Grs2rFGX4ASODoMWiHC+S1X++NOEfWQQdywkVcNl2Nie
 FPhfbTNFabTYjN7x1xGArX9qAZ5TzK0kJrMOq6OBNHHWksbY7LezbqUGGYN2m0xzhlha0xILQk9
 /nORcqr728rVSFzck5UL3A/8zvSmZZFkcf4mrQ16T6s3ug1FEQFilYK5cemBbFxx7Di7ZA2zr17
 +75nxhcAT2UZimeDXuw==
X-Proofpoint-GUID: WoQMSDmMEIbwdrR0YddrEHID8VfIGln7
X-Proofpoint-ORIG-GUID: WoQMSDmMEIbwdrR0YddrEHID8VfIGln7
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60ac8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=aZ-3kUUx37z8FZvU82kA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Configure and control the AWB BG statistics block from IFE parameter
buffers. Derive its grid from the active pixel-path size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 3c53f585133c..b35a3f375026 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -678,6 +678,17 @@ static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params
 	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
 }
 
+static void mod_v41x_params_apply_bg_stats(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	if (enable)
+		mod_v41x_awb_bg_enable(ctx);
+	else
+		mod_v41x_awb_bg_disable(ctx);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -691,6 +702,9 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_WB_GAIN] = {
 		.size = sizeof(struct camss_ife_params_wb_gain),
 	},
+	[CAMSS_IFE_PARAMS_BG_STATS] = {
+		.size = sizeof(struct camss_ife_params_bg_stats),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
@@ -698,6 +712,7 @@ static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
+	[CAMSS_IFE_PARAMS_BG_STATS] = mod_v41x_params_apply_bg_stats,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

