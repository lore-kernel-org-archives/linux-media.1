Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11CA43C07E
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787535; cv=none; b=DCq/EuGDlkqiGR0rftI65rC1kh838yRNUCAnXGi07RUpx7A1TEG+ivig5QRPA7VmEwEumWz3kAw3RUrluUH82GMWUkm6tmZ2dAIqR0Dwp7TPvWc8YqkchE4PPcShwIcpQ7Xg+u4F19/w0ekQjIWoCujSqtBxmkvDpXDytvNGaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787535; c=relaxed/simple;
	bh=RzCywbWgx8dE3jNijkrCi/shzOFGdqaG/+4eys9w8X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+Oq4SUpIq7bsps1T/Hjqx2foLQEXQNxmCyzUt9ltHQ8jX5QnNlqHt2k6LICa29uaypdFQFazjZs5wkKXDa7D35XullGgrDRwnrdoHna1ZaMYfRODHpt2RRSNWo5GDqM8rCGLyk0Kt7H3ZZEigxm412NLeGwHRE6nIi3e5c7rwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjTAgA7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ax6t9m0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjTAgA7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ax6t9m0y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55dhc1314464
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=QjTAgA7lPTVWdWaI
	BqzPLXjEMpEaeuQ3xV6q1/t9w5yHFcnGp7kHy1KQVBV3TYvyF3VkzyEYhuxgUlPG
	6a8p4N6E/ffS2qq+2SiC2IGHU09dDWx3dja+GCTrDgZutudXHjJurje31XD6bGoj
	MW2RRmlER5TcCpKs1l6CvRtLGAJrgovLa8/F54/IMwaqyaDN5YUKeuZw8+Eo3YRX
	CgWsWz7qztPyd1M/rNvHEu+rZzQ2Me08YuHbLKPQa1SGQid6CpVUkfg9Gfi+RmtD
	gVlRzIMndQQDy9sfSQyTQHlevw3yzdaJq84p3mr8kAhdH+vCXzxQEJgOtQI6096L
	9FH69w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711cyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c535ba30bso2173025b3a.1
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 23:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787526; x=1792392326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=ax6t9m0ynBnM5tGMQKRPnU4UAnefu1x36LyYW2wibCk+jD24iuGCYfXI8JsVPU833r
         3qIA/lUOQR0gtfMd8pxk+HeWzBYFLrQmFJWATmqG1FGoB5iptt97GHws++iwczHpv8an
         m5ab+fr/RYQjbcX4IHXFAemeui5KlDWdBzuJ/Me78J4hSlVveOPeXFkQlmI4IjmRSI5y
         VtjDKTUI/nNY/D9xCAzfGAhYdEPpb99QNogCssGaxeGy+CN957prOPTDiwoE+m23cpQO
         K7jYKYfB2p10zGcBA2v0aysuTeY2DxSLwIbO5EzDL6rhpi1W/XemsfnaZdsw1pE1wkId
         /Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787526; x=1792392326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=Exw+HNAm8IiIG5ljiD3RhLVakGULeT3bmR7YPUzmD9B2R1WBvLMmZKjk1T3DTX7PdE
         DlYmLxtyqtxVbSEmAfrmh2Ig8YWNWRXX2LTXTMNQEX8qmpw5tAanTsaw1bnzlwteQIJe
         WDFrHdJrUVYCuh1AhYjrtbFlvK7zeuDwCHmWBywNmD60L2RQMm61u+xOfoqCzoI8oU/c
         Mqc2u9Ptk1LjKs5A6ADEXhA7h8dk8iopHAedM0TyVKAykbeth9bhjrTsSwRyM+F6d0Gm
         SKV+wMBe0jMG1qWQtCNyATTNJyixXgPnyC/cd1MTMOoQ9obJ5oB8fAMjpvOEpMKLhVuH
         yGWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw37DTzlVTZKiprhvMFHRHz0QUcxjVkrckpfFsjRRIRmWAZnUu4qEeTm5vRX+6Bh55fBGtrlLRUfzcyBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNxAFRN5Ria8XiAOo9KhhKR9zK8LGxxFEu5XSeg+ck+TUWcKY0
	XDoJHE1BcHLVNVFWXOknvx/kycbfivJo1jKfE2rt/bZSSjO2+FZc97ScJ5hZYc2pEBrDlVQzvuw
	zAygSsXg4gi2Qh/WEaaUo9G0cVhWALz1pVawXrffu8MWTajmhA5rj8z+flae73nnLRg==
X-Gm-Gg: AYBFou3mTWz85ps1AXq56Kjxj5glEXYOEdDqEnerlm/sTjuJobIkprdx5s4aZl0qeY2
	G5w8QyFw8AT8TflxiBhUvoSgZWt6XusdKqhziEGONBB2XKiJqnMcPPiHwQDUd4CpotG1Kd/Sg+U
	+vBe7SOS1BmOc+pWVz3c+TVRPT8pql5pSAjmYZ4296QSGUojlHJPaR7TphSGjWy2EW16NZQxe+R
	hseywfKBNDlnCnEs1knYgXXcICwDWuvFjFOjYjhF13FuNj/t7+XLLqYFgwGk6ZfN0PtnILiSC/7
	6RKfhrFK+DMmuDQa6m9d/2k/X2gteq5PZUv1M5GbU0+0OXR1/RyH3JdJA/dwm/4E7WZ4LDuvNF+
	AUV8Wf08mp6TlAs5fU7Se8YnuD2RpjgQeV1dDHsjG/z3LNTdK5fyDVQp6Yr7jGNTMDnnz6gRQpB
	bRl9Wrhh46og==
X-Received: by 2002:a05:6a00:2b98:b0:87d:d4e5:c54b with SMTP id d2e1a72fcca58-897d316ca3fmr4913562b3a.4.1791787526194;
        Sun, 11 Oct 2026 23:45:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2b98:b0:87d:d4e5:c54b with SMTP id d2e1a72fcca58-897d316ca3fmr4913530b3a.4.1791787525678;
        Sun, 11 Oct 2026 23:45:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:04 -0700
Subject: [PATCH v21 02/14] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-2-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXxV51mjN3hL8v
 ASXiPAH0IKsHYWkr4t9oCcKnbHv5EMHJivaU12ax63fPsFv0SZr0Dsx1ll5Qs06UuzrYvnWSbgl
 mDB47ecvPypUrHCy1VKn1iUyBHYdfQE=
X-Proofpoint-GUID: uFJW6rjbTiXQrL2SAs_oan6FDz6NkPIM
X-Proofpoint-ORIG-GUID: uFJW6rjbTiXQrL2SAs_oan6FDz6NkPIM
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc8207 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXxM9lMKstzGMb
 DvTyDg9r1QjIUVbGzr3vBNLeSQzh34bLbWlvt8+nEQSgO1Y9LxRu9Rwc1oz7dU2/4q1+VPDuR9U
 SoclxEXLrGBYidLv4X4CWa0eGogAGodZ61k1SDUVcFIA+15PblSNQDXxwix2/JX6+wQNzVBCXBj
 mOQ1B5mZ62PS713ItQuRxxt3A1WtLwZP/cYM9uuuv5z6jlWE7Txm10MrZlDBAmKhagGYgwi3g4g
 nysqsko0w+bXMDt4Ptho9mQ7imthbpXFjyWq0/kmNo7Z+KXsF76h9jFgFr6tWvDT3Mgn7Nfh8Pw
 R1rw7PMXHcid7BSdsW4N03R/D+so3ed/E7nnPFH9fdcbnXo1yp/kWyIqGFr0IYqHDpA+CwLLycV
 TuIo7nI6CDy70a4GwahJIsR4mnFKGiX8XSKxdo18EfSGx0u6v0hkjD1AVpOgBFkdDse6HqqxSP1
 Rc4SoGGQhvc5Vm/mo9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

