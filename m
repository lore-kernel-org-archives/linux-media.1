Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7018D4F96A3
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417278; cv=none; b=Tk9l+Q0v6y/da/nLPLAlTH8Caviyy1upRXrcu5LH7ge80ZbaK9i2OAzC9NAX3GjpPxFAd+ryD5XsBIH6SjQe36BhgRdtOtCDS2UCBylmBjPKaBP07su0XA+DKAp53m0cgWUWOZmxJftjONdDSE32wnl5JvVc/TPJOqAbsl63zyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417278; c=relaxed/simple;
	bh=79NePLRFmrd7rdgbUFC/vHMIOAp+lqAA/eP2R71eY3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZHb4hsyFG8gEbVyf9fLvtUNckA2AatPVhl+Y/+0p/heP5gzrjW2ED+AtiJF+qiNc8O44SrVXcY0oEP4qsbx9YZx0nNZHmFSq0xU6ca7qweQY2CeTM/iJqtHWaIV/OPXZ/jJOVTS7ze8Q6Nda6aRUHn/joZrlXHExcog0QgDgQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESn5q1YF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hilGCWh1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESn5q1YF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hilGCWh1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P92k1666883
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7V0F/Y72/7OGZ47mWnBuhOhW4np+jY4wEzyo6MoLT0=; b=ESn5q1YFF1Fju81y
	CVFKjlqS+mnAsvkJyl06oMRYwt+690EwZ+XsXan9ovZQ4L3/1rKikqKHEyM62HKn
	KAEimNUr4f15ilKt5kg/7jv1yDevPCT/16a+0dTplLWmIypkCG/WB8/Wzk8VC77T
	cfP39z4doS/nLFJ+hSPJZCN3XZRf9wconWqMCROJas/xSj950VpBEG7vFXXMdKM3
	F72k0VbKK6shknI9Uhzm+JeXf+uzrymfw3uczdUZ7B3zblCWb/xQb2QtoDnO4vp3
	9Z/q5kVGin0i0uVxQ5+XADtrrXWXAP24XpHKjEAb8qMTotCd3UN+wER2/4Ke0p4Z
	ur4TiA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1bty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bc57d4d11so48420686d6.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417274; x=1793022074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7V0F/Y72/7OGZ47mWnBuhOhW4np+jY4wEzyo6MoLT0=;
        b=hilGCWh1NPHddLnWNL6qKgWXNITwBH41PqX5HElpRxbMuFqvA2Jhi0pU44ENAGhLmf
         U5TDw0ir5orwHJbWZ/bqT9Hqtexgb5XyPVTVENoF0oBPXRiy83sRpE/sVPz+d3C5zY8W
         wP+378ShNWMj9JlJgPAHF3xMjFHYiBY4PtWtpfbaO/uYPOVKvj0utGTxqJQLC9ncpjOZ
         xD5BuIpTfjucQLHv4xgE0NZ7gqIveG4do1S4fCUPaoWHgxeweQ3x/XSIllboZHWQz+W/
         9vmjbNIzyYK/s0NgCJhMhTdkuKDB/Xl+P5IzlwDwKzq1mwjX2UBOu/YVaYcv0x6Uw0PW
         xarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417274; x=1793022074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7V0F/Y72/7OGZ47mWnBuhOhW4np+jY4wEzyo6MoLT0=;
        b=FZiTqJvPGSrW6EHcBoqtlykoLDEkUIHHFQGfiyk3woUY02L3tMhIsRKgcJaTj+fgwW
         D20pYEOGa3aYWvxagFd3gKcLbS3CVrqFAa9hZJwh6baw1SUzeUOPF+QUpcrI5sPvxOWs
         /iEscHUR6zCQfjP/m5NRXNDvqZwWJXhWR4P2ESADo0k4hloPLZ29zwsjkIKRWU9TOsA3
         OoqYMBPAzjXpiCKggLVkMlFhBPz99ApnivC0PGtctyBDIGf1OBHE/p8kEUvjWRWWTQSO
         CrAApjRMap802stblQq4EaHvn6aok6oi7o6oj7xEw/JE34Boi6qiG4VQRM1NRmsM10pN
         I5jQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5AopUHfoH1CuGNbmaPAO2dKr4PTbN3VQmnYxR8hu4z8w4DKZ/WW32TdxfGxJw11oNxn2Ux5cAvoSbdg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKRjvJn9bDJzwizo4/xqnYZoNG0u5XQZPPgl5r2o/b0V36Jm9pb
	WK4aZlHC6xZ+LIu7QskHEIC9eTGe4XLvgQuzPY5a+J+JD4LYpJTf0ch/Q+dmu07zgOMwWU6ZeRo
	g3swCt+Km4f6Tu67pwAn7gF4a2RhiVYb0dB25E1Mgxbgy3yiNNgMYEJnbaxzLMG6Kpw==
X-Gm-Gg: AYBFou16d/UUG7hkyPmGD1WNabzSsgY71/mynV4DO4G2Bns1Ox9Q26sQfw0rWLPXp3I
	/nyFFn9Xhnv8vWf1rNeV15m2y8C/VWL6BHzs8tYotjSkIEDfUsaXcOXMuf22Avr9CgNQX6p/ss9
	fKTuzU48di4oxnKYqpaeJ5O2ASdgRuoa0OnSWw/km2UJuAq6ARRrVvMkzp7uyNyiX4apB3nyMhT
	Vbxwj96IKvelvBs9HZVr/V1wfyMN8RHho3D2sb4+QzM0xQDgmeNs+soGXK1wL7WeSQ74xxU8cBh
	GKqy2g+K09F3m6WIdbvhxsYkNELEVT1TFvBNezAg4RrTP2bRBee+/0+GSy5sorxRrodqC/1ug4S
	xLKrYIuMwM40pYZ3GC5rS9IdvLStnOzNf2veaO9bDaTTYE8tXpPsF6I0bhMdGMIKAfAtfij0vwu
	Ir4Bw8P9gInMtQ
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr1112464085a.72.1792417274183;
        Mon, 19 Oct 2026 06:41:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr1112457785a.72.1792417273613;
        Mon, 19 Oct 2026 06:41:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:01 +0300
Subject: [PATCH 02/10] clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=79NePLRFmrd7rdgbUFC/vHMIOAp+lqAA/eP2R71eY3s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3wWDYTIIsptmeZDY+VQ2PJTvoBG67g2hr0w
 rJ2yocETzeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8AAKCRCLPIo+Aiko
 1enyCACcV10DWrfOtqBVJaqQ/44sCyXy/4yydgZAW1Q5pnFko7GFd7JSr75nQxLIEDRWVPTvkz4
 8oq2PmMK/TiL8KCJm8nW1hKoDun7EAK00UOy6yiW24HIJDT1Xg+QSThrV/Sgsnd7fjLl8gizFvH
 /iYCMqJG7pw33B35qOh2fAsanO+jEN1mey1sy4i8r2ghHspjSEnag9IjD+IhHFo8BHjxThMFljY
 8qVhmPmgDyxgAdHpBlD9Bog2JAvHO2cCqrQIk27PmYUdZJyT/ExNznuDjMilm8i98IYne6whhw/
 zl0A4pIkDfXrzAPxS8vHqNeCiZNLzhjW9TOF/2D3JJIyx9ZN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX+Z3ZXMLrfAui
 NU6qTl9/GN5Ct2OzDj53IRMvywyeZs2GvDjRS4vja8h6nAyVp2/mvw9e49h2kkf2OIC7p64ER/n
 0j9y+bfB7BFvWN6gig3sjUP3h39PrB4=
X-Proofpoint-ORIG-GUID: dc9326lwfsnEotnA-CWMuwJQjrz1etDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXxhZJxyFJTaD+
 NfkCVmdax1is3l5wTy+2XdoqFZ7HlzWCNhkkQyxI+MtBsRyWJHroCe/6fGZrHAAfiz+pPwc0auo
 remPeYfbhPDUDUnH33bfoUvT1YWoeVsISOu3IPd/N0V65zQuVCoPzQuhukwU1LiCu66VN0b9gWn
 ifiaX9zYmcQiEn9HrDJSNEI728HAseZp3ksXXd84kydpNFAPGCmbFGvXSuUqovGFISvxO9fupfQ
 chkIS7dF/CEafvrvHzIWQl+M5ByR/xOWgWEawWQxuklxxa4pu3/SRcdctkiKSCBwGS4LK9XsG5e
 36QEWUMhuuU6ZcGCIuCozUKilaMu07b0xJ58neAGhFnvMQRvRH0fWCkHKLN+eRYIlTyH7DHRg9X
 5V/r5KrPZeJ+n/R018tmTuOQADGJKCWd2cjHX5b06MtKUDW74RANeep4RDYJvCdhCwlPwf+/dFu
 AvC99olaj5RSbkqW95A==
X-Proofpoint-GUID: dc9326lwfsnEotnA-CWMuwJQjrz1etDt
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad61dfb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PTyEg73AS9DQD2Kx6bQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

Booting MSM8998 without clk_ignore_unused, the SoC resets while the
modem is being started: restarting it in a loop takes the board down
within a few dozen cycles. Nothing references gcc_mmss_qm_core_clk, so
it gets gated, and keeping just that clock on is enough to survive.

Downstream never registered gcc_mmss_qm_core_clk, and dropped
gcc_mmss_qm_ahb_clk because XBL controls it ("clk: msm: clock: Remove
support for the gcc_mmss_qm_ahb_clk clock"). Treat both like the GPU
BIMC source and SNOC DVM clocks: stop registering them and enable them
at probe.

Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-msm8998.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 97d4968c5bdd..f07868b35da9 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2254,32 +2254,6 @@ static struct clk_branch gcc_mmss_noc_cfg_ahb_clk = {
 	},
 };
 
-static struct clk_branch gcc_mmss_qm_ahb_clk = {
-	.halt_reg = 0x9030,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9030,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_mmss_qm_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_mmss_qm_core_clk = {
-	.halt_reg = 0x900c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x900c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_mmss_qm_core_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_mmss_sys_noc_axi_clk = {
 	.halt_reg = 0x9000,
 	.halt_check = BRANCH_HALT,
@@ -3068,8 +3042,6 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_HMSS_RBCPR_CLK] = &gcc_hmss_rbcpr_clk.clkr,
 	[GCC_HMSS_TRIG_CLK] = &gcc_hmss_trig_clk.clkr,
 	[GCC_MMSS_NOC_CFG_AHB_CLK] = &gcc_mmss_noc_cfg_ahb_clk.clkr,
-	[GCC_MMSS_QM_AHB_CLK] = &gcc_mmss_qm_ahb_clk.clkr,
-	[GCC_MMSS_QM_CORE_CLK] = &gcc_mmss_qm_core_clk.clkr,
 	[GCC_MMSS_SYS_NOC_AXI_CLK] = &gcc_mmss_sys_noc_axi_clk.clkr,
 	[GCC_MSS_AT_CLK] = &gcc_mss_at_clk.clkr,
 	[GCC_PCIE_0_AUX_CLK] = &gcc_pcie_0_aux_clk.clkr,
@@ -3298,6 +3270,8 @@ static const struct regmap_config gcc_msm8998_regmap_config = {
 static const u32 gcc_msm8998_critical_cbcrs[] = {
 	0x7100c, /* GCC_GPU_BIMC_GFX_SRC_CLK */
 	0x71018, /* GCC_GPU_SNOC_DVM_GFX_CLK */
+	0x9030, /* GCC_MMSS_QM_AHB_CLK */
+	0x900c, /* GCC_MMSS_QM_CORE_CLK */
 };
 
 static const struct qcom_cc_driver_data gcc_msm8998_driver_data = {

-- 
2.47.3

