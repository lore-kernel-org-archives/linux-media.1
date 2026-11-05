Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922705;
	b=IsbWcCv370ndORXmFjXQ2fpSz3tXX2aiD7K7G/zb0NgYujvpcvZ8Xxb9AmwH7IctBxGC
	 CfbKSWZdXt+0B4thfMRWYezX8LBpBw61p8syNVDzpY1ThCdGZp0FDT1VYsM4Xr7Oyrsad
	 +z8GXKI7wtt4lu0x84XQ58Zchk+E9AGNM5fWqY8O9SwTmWd1dcuX2zWoA9JO0AWnqLva7
	 qeQ1lMRxIBhu5BEwNrjlQazOS7ONd30V70XrNPqiQL8je/otNCHgK06eh3M8V5QAhJaCV
	 kCt+nXepUaGPDh7PJ5LEn8YCQmWBAaP2BwsDmF9ViVRh3PLelK0fom07XJDWlRL+TJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X2o9cUd2qHXReA0bRiBPgQ74+T3hh2zLgXg2cSSw0KA=;
	b=KUbiKhDdBLxy1OfVuROp20y+AB81IlQ2FbZg3HaNw4uCIk/A+4nqXJsLSO9Rx8/C3fRP
	 9zFRuUu0w7NMf+T0yHizm5uADw6v33nl8jrb6ypJ5aPDlea5fNRNSt/UKLc0hlDNjtA5x
	 6Rnn19XzmaGKjDqXOzTK2SYoWyfrVnypwJ4MRhPOCcDa+5TsM+eKt0JlzDkIqbhQRQ/UH
	 X5X0+6fT8latcO3nOwBEKsV+hEaw/PPQozmwbXWiEf+aZs9bwZzfR10+boR2tlhBVJQLX
	 Tbefqjr02rgfPjAe+qiYphkKKza0OWiIMA3c8zCHWqFFka1vRNNw6do0WFHwQMbkoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NGHT/rcp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L1C/p0LP";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33F3606D830
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A33F3606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGHT/rcp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1C/p0LP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeTs41308257
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 23:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X2o9cUd2qHX
	ReA0bRiBPgQ74+T3hh2zLgXg2cSSw0KA=; b=NGHT/rcpt23284hfViWjRlWL6uM
	1vxHTZ9eg7iYKUR6DKr26vy1qAmkUs3It47omRulSZYSMap/vdTkxeSl2VKNsbzT
	cVkm9yL9rBXvmKxixzGT3iKczwzeLV3XNtV9vCKzIakmAarFclomC1pceykoicXe
	UfVLxl9rmkR0AzJ7a2ogAG/zMEGs+C15n5vC7YEbH0qAji0IwGQiRJ/hBGydaSAO
	8m0rC7yieMXsvugTVMDo+w+QI6M4yKnSy7iWGsqILRS6AuWuGZwGFW6E2w0MXNnv
	GjQqXq1rSFv3gjCgkUIO6YU1Ajso6gQdzkxJvt4QgqY78fcvNUIbsZEnzkw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p980xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 23:51:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso1855590eec.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922703; x=1794527503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2o9cUd2qHXReA0bRiBPgQ74+T3hh2zLgXg2cSSw0KA=;
        b=L1C/p0LPpOW6XCThPvl/ka8l2810xcPjZ6m+Ra9D9aYh+4bFxFl1LF7w9Hin+S2Ggf
         noTY+RIuauvsXpSrQWv35SKonzvngPDl7kDJHRU4N0fRtaiD5mUgnMzRsQMWg0eL2Szq
         8zxeJsXO8y5jxljV2L5T2ic1NJtu/TuK9c1hig8TeZcb84y9EmymW+bJKd8/oyUdxykc
         A3fJg974x4BIUW3+70B54foLfmaIiqAtZV7lotbG+j8optE/Ph3m8EpYGIM5zlVKWwXx
         FZwI/XW21SkRh077pX7vGrPgzdpYzO0twwotxJc4hGC2OqaN5rMr4aRLgvslSA2uqgrX
         V6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922703; x=1794527503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2o9cUd2qHXReA0bRiBPgQ74+T3hh2zLgXg2cSSw0KA=;
        b=NvjgFXXSCrZtBwKZCX+fTAmDpwn/mPJZ2U3X5vMGaXf6k7LjA7eKDQGziMXVbtrstF
         df7VGnUkrcZJw6A4fNdlIi0JW6Z7PAhN2GZhW1oGTpEK70Ue07TT38feTvTykjkl/IH4
         yATrFfAqptL/Z6rLToiMmy/pmujMASeQuHgluzysFP5OQvDlaoZmizISgLepTdwhRiJN
         A9o6WC8QpShJkKT8ZUbo34rZ/B2h5DQZITRAAgg8OtFisoyBcJRfQl4V5gF7o4tGWdRp
         yTQdGPpE8zn4fG4AYlS4EkK017gxG1OkFfv5ZL+t+OimWuiiFO3wG+fbOYCXLtnAyoeS
         MTYg==
X-Forwarded-Encrypted: i=1; AKwUvBwAFFBlW1sE+OS7Wast7i5VnA2+0jgEip7gfocoYSKWsBcwVCAUZlgnP8Wu2DNgTESPAfvW7T8Q4wLJ5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pYoNbrfjr03Iqpq8orb8zcQTx4U543mNZ2AxJOE3ZZZnmgVV0
	H9GWzRXkBdGMMTlf6yTkp9+ulYLn6kxXDcDNGj8ecI6OTFLGic4Mk01bQu0TKjWK2MtwxzZFNXl
	gx1KUERd8hQkThxr1HLK5s0PRgoMjeLg54MftYvKQW9rlB/4I1v9qHFV8EH+UrIDDgA==
X-Gm-Gg: AYBFou20bMEzSorfhw1zfLVyBT6Y+vc4fsConJmQrxxjDqlWHOOkzZC8EdC7JI5taY+
	jJCI5iDnvARBJR56/hZZPtNhP7TGaZD0HZbNQQ6JGFzLMhhU4aO7xUV7rEsLrWFxTy2APGErntA
	S8ERxfERTAzfkxMMQffyQ7y4wdAjUutEC8NXhfcYvoFk0g/CpLWZMP4S3IfQpXZJOityrgYYVVT
	jYLkxPHAScNEuMbFrg6rZsB+YZNFY2BqXk48Outy+Nqvm1y0KqGrFMUZM185fArg5T8RNZaw+bR
	0Ssokug3Qv5wd1b1pFvzzrTxqFFTb6P03nsxgGTAtEy9OYJ7+1XSBf1SLqLcwzQMqw5tK3+TW2l
	AWYs6dBGSPoIsqQbrhN+wuQfJC67nfSVxLQBdvV+BBjLlXXrfyJCtOSfEmPH9y77e1tGDcKZ/9J
	hU2Pey9d+IepZsYrJNZAO2YxMW4T8=
X-Received: by 2002:a05:7022:3f0d:b0:156:d588:c881 with SMTP id a92af1059eb24-1b24f432240mr5489995c88.2.1793922702945;
        Thu, 05 Nov 2026 15:51:42 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:156:d588:c881 with SMTP id a92af1059eb24-1b24f432240mr5489933c88.2.1793922702259;
        Thu, 05 Nov 2026 15:51:42 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/4] phy: qcom-mipi-csi2: Add sa8775p D-PHY support
Date: Thu,  5 Nov 2026 15:51:36 -0800
Message-Id: <20261105235137.2635442-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _hLThcmsrJGz086gjbUhB_zUUxLrUxek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX1ReLVqbtT9l4
 NMY0nKLuCIDrVJmHnuZtwA7Bs36AkhAkA74EylzGS9w6xXFLbD3UmNv/g/0piAemgyrbtkk+B1A
 wu61bp3ZNUT7W3apQKSCVMCD8I68T2yiW9zDC00LPCa4c5U7FJ3Ayn2U73+jeoEm4fProZsQQan
 FGZLNMVY+sLjYNonm60rbHS+qVGfLVWduVtj2Hct1oS0o2GMMtXBd3VGuC5JeYlYyGlwEVwjING
 aPj5LF3WhIEPtpRVbmhCbZzZ7fNhzPbSejE+ih6eKvvs4Q8AAkMNvEhzEzsZqAnj1KOQGLt+7+V
 ySn1MGb93MEsi3qdPxTe7XT3SqSZtxLl18ex7j3APwzhH9wSTQq4+62FdQ01YZbQv1XAF0TOlSG
 G8BzGLHd3cdAgcpuA9KmUirSbxswaw1J9UTuo7t9zpoJOAISQZUCSL0abcD2j7I87I7rwZyqRAR
 ZQZee7G1T0mJ4vo6icQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX4Ma1Yq33MvDM
 tmmWQEIMSQ3AtYqBIfXTiecr7KS5gCXJAOb/nfRP5l/sIuP0+nsdjQlltshATUV8PI1+XJopu1f
 m9pIgpHcC3bCAR8Hc87sze3W8dhRoxs=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed168f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NbtrdQoedUgDOuZm1b4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _hLThcmsrJGz086gjbUhB_zUUxLrUxek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

Add the SA8775P CSIPHY to the generic MIPI CSI2 PHY driver, 
bound to a new "qcom,sa8775p-csi2-phy" compatible
and reusing the existing D-PHY 2-phase hw ops
(phy_qcom_mipi_csi2_ops_3ph_1_0). The lane_regs_sa8775p[] init
sequence is the CSIPHY v1.3.0 2-phase 2.5Gbps 4-lane D-PHY register
set ported verbatim from the legacy in-tree camss-csiphy-3ph-1-0.c
table; common_regs_offset is 0x800.

SA8775P reuses the same "timer"/"core" clock names as x1e80100 (both
are hardcoded literals in the driver, not per-SoC configurable - no
SoC this driver supports uses different names). Like x1e80100, its
CSIPHY core clock is OPP-scaled against the sensor's link frequency
via the shared csiphy_opp_table in lemans.dtsi, matching the legacy
in-tree CSIPHY driver's own sa8775p_resources OPP wiring.

SA8775P's CSIPHY has a single power-domain, the Titan Top GDSC,
matching the legacy in-tree CAMSS driver's sa8775p_resources.pd_name
= "top" and the existing lemans.dtsi camss node. Like x1e80100's own
"top" domain, it is not OPP-scaled, only kept enabled.

QCS8300 shares this same CSIPHY D-PHY hardware and does not need its
own of_device_id entry: the qcom,csi2-phy.yaml binding declares
"qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, so QCS8300
CSIPHY nodes bind through the "qcom,sa8775p-csi2-phy" match entry
added here.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 108 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..52994cb721ec 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -317,7 +317,6 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 7));
 
-	val = 0x00;
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
 
@@ -383,3 +382,110 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+/* 5nm 2PH v1.3.0 2p5Gbps 4 lane DPHY mode */
+static const struct mipi_csi2phy_lane_regs lane_regs_sa8775p[] = {
+	{.reg_addr = 0x0724, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0728, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0700, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x070c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0738, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x072c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0734, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0710, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x071c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0714, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x073c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0704, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0720, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0708, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0024, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0000, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0224, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0200, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0238, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x022c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0234, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0210, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x021c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0214, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x023c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0204, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0220, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0208, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0424, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0400, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0624, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0600, .reg_data = 0x8d, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0638, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x062c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0634, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0610, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x061c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0614, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x063c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0604, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0620, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0608, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0060, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x025c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0260, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0264, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0460, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x065c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0660, .reg_data = 0xfd, .param_type = CSIPHY_SKEW_CAL},
+	{.reg_addr = 0x0664, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
+};
+
+static const char * const sa8775p_clks[] = {
+	"core",
+	"timer",
+};
+
+static const char * const sa8775p_supplies[] = {
+	"vdda-hs",
+	"vdda-lp",
+};
+
+static const struct mipi_csi2_genpd sa8775p_genpds[] = {
+	{ .name = "top", .scaled = false },
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_sa8775p,
+		.lane_array_size = ARRAY_SIZE(lane_regs_sa8775p),
+		.common_regs_offset = 0x800,
+	},
+	.supply_names = (const char **)sa8775p_supplies,
+	.num_supplies = ARRAY_SIZE(sa8775p_supplies),
+	.clk_names = (const char **)sa8775p_clks,
+	.num_clk = ARRAY_SIZE(sa8775p_clks),
+	.genpds = sa8775p_genpds,
+	.num_genpds = ARRAY_SIZE(sa8775p_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 8bebc943a771..d0e08d4bbea5 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -454,6 +454,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 6cf9e5b956f7..f092366a0436 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -96,5 +96,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
-- 
2.34.1

