Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616148;
	b=zP43u7IwCpT2LUc0lUjQ33RQ3c87NkGL6eLuhZNaOBz0J6t6DVc1AX8VZIJSq7lQIrMO
	 F+P6m1QwdC+bh2192yv9pMCO9Nbu3v7gI3ehlVdEnqlhCARaqJ8VECplJLsCqYQ9rygCs
	 DeWIfQJTh7FjfjGH19hNUjt8BZ1Kr/NbLaKaQSLUzHZo9cgrYTGzL2EGLoUWMiY07pBRD
	 WMdJ+/W4KMYbCntqnj2ra9sP4aXHaElMMhWvHqyT1ToeWtrY9c08JvzKObN2FoNmsDWm/
	 +ii4SDQ4wZiwMvoszOdYhz9pdhCE937n57dkqEJAqUTDzxYPRbzjURd4dyw+2IQ2h7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
	b=E8fF0v12xDR6Iq4WFM51c5dljwaT/F25giPR6LMtQi+K3TNPRa5FohO0m/PwsKorqjOT
	 y3W3M1IV+MuDtgICPShk27rZPJZMy5kxRVTWnXtBzcGVBfDlBQNfq68Jphrc9BOJwJn/M
	 9pCxt1fhJ0UoY/x7taAII2RWw0N4lgpWDBGdJfnaMgbVZ2/ArfAjHShAQ6Fs+DrS1mAtw
	 ZX7HEaNWXuFT5nus7XFhAb+u4NUaNdhZymP03SyXqi6O/C/8Mf5Mj9fuJJR9WZjTquAad
	 l5kZuRXRtd5B0s2/qLtmPeZ2Yq6tZm7Gxb2F8RG+BTbvMDXJxGGOG3U4JN8tjOYsaIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVAXJiAc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G+OnG/73";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077760A2618
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E077760A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVAXJiAc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G+OnG/73
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AIvG4039587
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=; b=MVAXJiAcHKx346Z4
	gBF0ZYkZ8zmOHZmk8isiNBTpjqUf7N0j6ghGgwJK4/h80EI1ufdVtSY+qksON/5s
	VIGqu/risGfQ6EaJppiE6fVkC1mmexuD4yqANEQyT6335irJ8GLrN7PSZQ2XgReF
	7LQ51ZHI4W9llbgNTIzzthBnYLUjz02jRgGO9LM+jw95d4eCJ0qkQGw6NY+7WioL
	NjnRzfOSVop/b+1xp+clr8jzj82K0aV5Zv+k4WAZTLJVlcsn9gvJK8eSHZJOMApO
	QTzJxYyVg1WyGaXKhm0lB8DkmGf8B/wIZVXFPRoY3B3vGpwsrzNsmY1cZgrkO4P4
	y1rJQw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18qa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:20 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso4092341b6e.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616140; x=1794220940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=G+OnG/73ZuGVNPMEg63vRhcQzCUTjlB74A4c7HBXAkDtiq4O8FImYsmWED/y6MP7WK
         d9gGWx/AvQxVKmakDQqwsAxpmd6dEuJh0CwAxZxu42Hmne6krRTk2pz+hAacT6Nw0gvL
         /iECrSvOw/ou8zFngT3lbNGWMnq0pF7VAIdnXKcLuwhqOV9uBfV5EM8A/SW/ke9/+4fq
         xRo/DMfVxkOc3oUeSmQdBpSKxZEVZ6vj7mcTGfP2kHLmzjcuWXdHFpw+xCD+wNbm283b
         a7C4ybwa8SmNWf4jIg+ugpXq8zgdTbNUI3mfYSN+i01wBDb2ZO6KYaJtKn//WsEDwmfP
         mivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616140; x=1794220940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=OLIuUSdNLrBp9UIP5xG6Rt1z6JxX44dD4W4GAaewSGURRughDNHhOHEnlIdilTN82u
         ch5s0T8TSfMctwS2aq54hqe5VvjjOGa7/rMIeG+EhixGSrrwDasm+I/S3NrjQ0Jc+4nH
         NufGCfrO61B23rJlLEHV1lulnAl1uvBMUgfEAkZ60SJCpY6UhUcNcTKl/JPlWJSt0EKA
         LR+C4HMzHYSII2qw6UWCuLRKk1ceZBwlt6MEh2KS78XY0y2RfUXjnug8dBecqMGdu/en
         BGND6/uMXEuYhnzNVDZIlpWFk7hAhkcUlwShvnRw2nVaNCCTwRbwZtLoNYNOX1Vv3rL6
         en0g==
X-Forwarded-Encrypted: i=1; AKwUvBxia4epfjv2+/syoD49ezP8GFGhRGyd7LKnpS/3SxQrbvk6Aa8SgGVJ/YN2UrY9Hq4b5Fs6TbP+46oqrg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIF5n4b+aBUm/DlBjyz0FT8M3Sv6+od0eIX/ZK3qtbzOTG2zwrf
	y1GetCydGD8dBtqgdMwWcUwrp71knTy3HfPhNRl1Uhdb+hozZH85xSUeZeAnfyiF3B/dicBhPzw
	TlNWgM88qqIiaxfhowVC//zd07VYIj7IS78yn71h7/Gm9kCP7THCpQARKC7n8by4B3w==
X-Gm-Gg: AYBFou11z/BOBPRHDe5LLvfVNsnQulwtXvisN69R/Co8JBzHFgeGoHfDgenIoIUDb2+
	Agt/esptxNZRQYoBTtpVAdrm2Ro+WsqgKGprPp3VBQ9CeXwOBivXJVFfwWvP6CR2b7WWnP4gGpB
	YFhgHUO9rwzA5+/FYL5BXvLqv20MxKcXocZi3c9Zh91TM9mItq4eufl8yNTbUwwOByk/s5v4V1z
	Hx+v5x+ce68y4L4EfxmPHSJ6FEemojJ15g9kV6B22Ghu/qZSD4lR9i8HnLDzjUDyzM9G7sSkq+K
	PPGyZiNBYHXZ+pE3xQQ9lFVBLDH0r1lLnpuGPtcBF5sMFRZ8dWXmcRas0w4jITGvxd9Su71kG+R
	5ACM3Gj1WBNFwMRP0u0mViukSTKBd09nuZUI/+Wgy1tVZ5nM2maYqAXV3beJuzPMNrLQyPMrO67
	s6jrNTvKrsQ1/uKIAgvATuubhkCfMkDM4pM+NAeMTcD4AK7rqPSMsqx3jUSDI=
X-Received: by 2002:a05:6808:120a:b0:4a3:cea7:4ab6 with SMTP id 5614622812f47-5640de48fc8mr4536103b6e.10.1793616140149;
        Mon, 02 Nov 2026 02:42:20 -0800 (PST)
X-Received: by 2002:a05:6808:120a:b0:4a3:cea7:4ab6 with SMTP id 5614622812f47-5640de48fc8mr4536083b6e.10.1793616139644;
        Mon, 02 Nov 2026 02:42:19 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:19 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:10 -0800
Subject: [PATCH v24 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-2-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: U3QBcjjBqRCDoR823yM43x5673BdD-Xs
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8690c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: U3QBcjjBqRCDoR823yM43x5673BdD-Xs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXxxgRoek9p7ET
 n0VSuABjV9SHoKs++sL6Y6nqyHFZ2LkPi1ZqxCoVrc1sjLPEYcFBfa8tjOAjlpNYDVPjJ3ecmkJ
 9pXIpbyQXUE2GTfnq6endQpDSvK+OgimmV7eBs3xKW+KZp+MW7qrfs8Hho1QaBQVQjECPXCl/h6
 Ybq3sVr2kUW3XE2XBZuGNJEgbcsstP+igGMpZxi7rq/L/wY3ScoU+mBqs05+iVzIpErUXTZpVI7
 5XUz7gYbpparOyPDQXjzf4oyjNMKsalmKeRMSalawTZqCDf7WJhaB0CPCH0l7MRv3ZYrMjMVYHR
 8m2peb6NOY1Lk/OZyB6vbb91EbdHqXz1g7wMKBKVxQJ3REZ7r4bQ34Qo2OnPM4xdL4dF834+HWE
 9VNZRTvIhAFMjzatdeoFWZXSiEXWgQ3ScqmTJa9RHVcIHYbIKq0SlLKffB7sAIHXNFkuv7bvbvE
 TK78k8JZEQR9rIoj3Qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/vM+QxEH6GHr
 Gs17Vc4cWg2hwbq+K6UmmhtZJGSP/RyTLHgi7Ms0xvf0Mq9YQ4Z/dR0WSQWIc854DUM6OtLumCE
 iJZqi4LIyq3zGLlLYlj5FY9SE8WWvEA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

