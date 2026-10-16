Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2396349BB75
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194917; cv=none; b=jdMjtGFiz642DEDCFJBGDMIhoOT40fna3yeG+BmNJQDAsRpvqA7FbMw2F4qCt4Ndwd5znNaJMWYi2o3cechbiQw9JJgKnJj5LBKk8bCymi4wU3EIdYfc50F09cZCHPh3Rh9rw4HhzrWV/HTwQAAfbQnemXfQTCYuudbphz30nmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194917; c=relaxed/simple;
	bh=rjEkRXkDW/NeUBEbcYsDj43bMOc3+anYQvHIF55fi+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vCpZYs2MF8BYkhAMlJZJjxZjejCah++58+lsc5pdtdmTwUPKmTvd5clzcyJgFEDj61PBOLrZoC0Jh3bGuaIS+ld4BEBYuaqH9TL+olqB/SReH85DDuyMRsBV6DHEdXVAIkyJTaxPryKix5rtTzFeogk8r5eyF5KWjNEGqfJdNvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrakSfxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCVqB0Io; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrakSfxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCVqB0Io"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFIkt552054
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TMK2D0Xsalq
	35d5JVXrOTRo/ALDXc2zvWoXTXQBmI34=; b=PrakSfxGYDF+3BpkgJSkVQcY2tN
	sEAvw24p2OyunXf86jG0g8t/lvVBKXpOTJ2LCavjW+f48db6Gl/meJmfxMY2nqqu
	HVzbb5kO4oVCFX1th2IOrzLkm3TG7/OdPM8svLCpWjGLg8giAnJUWow3AJiIEfzE
	3fpeCgA/nCc/lKlBl9nqmYfsRJG4BUHKxS/v1lr+ewTBnp/afWIGirYyIRojjo3f
	w6ytzjkIApPVeZ+2cuTlWTmxuQZlKTVtR9t+SmcG/MpdxFY4eiG+VaT5VCvi4kqv
	IlbDjbbIq7xcgCSdlLXxwaBN5fXHEFHJbkSU9xFKLVUSZ1645MR6tAZJOyA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrw710kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:55:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso882449c88.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194914; x=1792799714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMK2D0Xsalq35d5JVXrOTRo/ALDXc2zvWoXTXQBmI34=;
        b=SCVqB0Io0qBVj6E5dRPLGf8npys/Poexhq6t1x8I40VCqdRxL4+xgpjAge72CElH1J
         9S0UyoeCrOafn5tHmcyAIW0MT/XkePn3UWn4M1Xu2dc9VFKXEARNWiDYn5XH76i81YCq
         QWZX5S7nPxnQI58ZHa10bXc246QJWBgmYaQyNPOwvZwlCJXDnd/j3GGeYC3OdnAPZMZ3
         o0PYWWp5ffg5RSOHBr9mHHkMjcpueqioXdkl9UkYE9GIjAJY83uI3RyOsXsadaaYfIa7
         S5tI4dmQDs03ehbVPDadbl8HHKDOLRn++gh32l6kbCObpTT4pTPsPEWFQnJl40PjydS2
         nf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194914; x=1792799714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMK2D0Xsalq35d5JVXrOTRo/ALDXc2zvWoXTXQBmI34=;
        b=ZZkz6RutBP/TdeeFCYChuryOAXjZeP9E2H+DfS0psVa/LU+YUE081763sDi+XsgwYk
         shDvEJ4By619aGFwEzC/ZaRgeebnqXQStowFypqWZS1fptCbp3UdXIhajHO2DcQw/sld
         Hv6DIzIBDbt9GeDrKk36PdM46s1cNVw9F5Ygddffe5VffH33FmoGDChg/8oYmBu9+Y0m
         2GsboDxdc9kQflOyT8niy9ReKgacEyhYvchbSomrGQczeSMRDNI+GRPNylnJj6maUzOI
         fEx7OL8W6X4XcNniFAXmci5B9+4YDleq5wzoP/rKGF5iFvBVCAMxAk5wTt3VdkD8spsO
         6pHw==
X-Forwarded-Encrypted: i=1; AKwUvBx0PCc95khgQQUsqgcBNZUsQfQyQlrk6UNZ0Ko+ehy3Z01A4/cII/wnBCyEdSMlPLqormh1wHrj3M82Iw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJZ2cltnSVWmOgQtpDhqA6jle2+H5l5x+w2e6+ETaIMNaxvk2O
	JhdViE42OS7dEqDtxwPrrEiXQrZc8jMuyLB/T3O8xWZuocrc4So+dt1/EegI0tTb9zLi/tXVOx0
	CkRCvw5yPUy8z0wBf7Tru3HoINLbklsMwXdav//m6jTYZ2gL1Xucns8Sti4BM6a1Dgg==
X-Gm-Gg: AYBFou1ATBGWO1MA7zZOHbIVPIYq5FkIJ6WBmjbfZxIY7/HgtLBHTjf9b1tpuwWQDVf
	JPsBQJ+tckkqQGKEEqyTiIF8ct4m5R6MBQIqmXox/DxNgl+m5e1uxiQhL6RrM+caC5/Ol7edc6k
	3lGtokMlWILMRqSUuleiSaeqS4Pc1lDttVptdcGn+aNYN6Gc27BaIXZMYy6FBEcyA+ICLUYDUAb
	lcsmC4UUPNn+jA2C+p7/3VeCMnDI920HdA1pB/jccDSnCkw9em6hWsY60aiQdP4EikebGF2q7jQ
	LTftEUEcNFe162p81nYHpIvR6CuIbSttKSttdfheBaBll3NflQ9HTWtpD4vkOaMfevAmvb7IcgK
	H1wviF7fMhoZBMZRhXSWH7gGt4NQ60+A0521fy/IylR91JDmEN5hWlA==
X-Received: by 2002:a05:701b:2908:b0:176:2095:1ac4 with SMTP id a92af1059eb24-18512579547mr1437641c88.18.1792194913734;
        Fri, 16 Oct 2026 16:55:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2908:b0:176:2095:1ac4 with SMTP id a92af1059eb24-18512579547mr1437606c88.18.1792194913104;
        Fri, 16 Oct 2026 16:55:13 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:12 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] phy: qcom-mipi-csi2: Add sc7280 D-PHY provider
Date: Fri, 16 Oct 2026 16:55:02 -0700
Message-Id: <20261016235502.2274268-8-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX379KBHZMkGp/
 RMX+CSbmBvKn3c72izzppm16LJu8qvFur0gRlTcwUVEzq6UN4T77dSmCRMlwLPGIVJYtdSrd5mA
 K1pkPcCjA9iwrB1KvEaeHYIyBXrpTHo=
X-Proofpoint-ORIG-GUID: s_M7BSvZao3IhI-gsidRaP_s4mgijHnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX3Dt6IgqG1DN8
 CTg18vKyqrr8MVVpxuBlSNkuRacY0PDQNEx5J/M8KyMpR/5xCV0K4FoaqDheWzVvtT2ai0hOaKf
 AjnOndt8FCTjORvO+fr3TIYSPqLo/uVR1D5mx0lng77TGu6n9GLJ5yztLle80AufSFqmAlGncgC
 sg+SfcluQdIph8QK3zRAEh8HOsTWF2fT77UE4ejS82/7cRXK7UOP0cf1rdqDSQI2USMciJ0gEl3
 6fYCdi8MQBGlDf//iW5keaA767yCtUocoH+irBpMNz5yPN1jCsdfXzN4ZtXft75buSpfskT0Bjw
 OZpkqcuaKdgaL5k72Gn0YWZ3vAyVSz2AqBncXg80TlLUi3ZXrYyICGvDuwduwumgHQhiM6IIjcE
 UAy5rNkl3oPBToVT3x/fbQciI8BlY1Dr2Tf9J+9c4mtMJwVGMkbe15MPnW5ZA/WCRvkzL1E/70M
 K18wuLXEoNpBFpZuujA==
X-Proofpoint-GUID: s_M7BSvZao3IhI-gsidRaP_s4mgijHnI
X-Authority-Analysis: v=2.4 cv=XKKl2ghE c=1 sm=1 tr=0 ts=6ad2b962 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=AWjmOwsh-vm-DMLkILQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Add the SC7280 (also used on QCS6490) CSIPHY to the generic MIPI CSI2
PHY driver, bound to the new "qcom,sc7280-csi2-phy" compatible and
reusing the existing D-PHY 2-phase hw ops (phy_qcom_mipi_csi2_ops_
3ph_1_0). The lane_regs_sc7280[] init sequence is the CSIPHY 5nm
2-phase 2.5Gbps 4-lane D-PHY register set ported verbatim from the
legacy in-tree camss-csiphy-3ph-1-0.c table; common_regs_offset is
0x800. A new CSIPHY_DNP_PARAMS marker skips register entries the
legacy table left as do-not-program placeholders. The soc_cfg
declares the core/timer clocks (matching x1e80100's and sa8775p's
clock-names convention for this pair) and the vdda-phy/vdda-pll
supplies.

Like SA8775P, SC7280's CSIPHY has a single power-domain, the Titan Top
GDSC, matching camss.c's sc7280_resources.pd_name = "top" and
kodiak.dtsi's existing camss node; it is not OPP-scaled, only kept
enabled.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 139 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 141 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 85e89235f7c9..f3d67d75105e 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -43,6 +43,7 @@
 
 #define CSIPHY_DEFAULT_PARAMS				0
 #define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
+#define CSIPHY_DNP_PARAMS				4
 #define CSIPHY_SKEW_CAL					7
 
 /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
@@ -258,6 +259,9 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 		case CSIPHY_SKEW_CAL:
 			/* TODO: support application of skew from dt flag */
 			continue;
+		case CSIPHY_DNP_PARAMS:
+			/* Do-not-program marker: skip this register. */
+			continue;
 		default:
 			val = r->reg_data;
 			break;
@@ -495,3 +499,138 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p = {
 	.genpds = sa8775p_genpds,
 	.num_genpds = ARRAY_SIZE(sa8775p_genpds),
 };
+
+/* sc7280 5nm 2PH 2p5Gbps 4 lane DPHY mode */
+static const struct mipi_csi2phy_lane_regs lane_regs_sc7280[] = {
+	{.reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0900, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0908, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0904, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0904, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0010, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0000, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x000c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0028, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0024, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0730, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C80, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C88, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C84, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0704, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x072C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0734, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0710, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x071C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x073C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0708, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0700, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x070c, .reg_data = 0xA5, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0738, .reg_data = 0x1F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0714, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0728, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0724, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0230, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0204, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x022C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0234, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0210, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x021C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x023C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0208, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0200, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x020c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0238, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0214, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0228, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0224, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0410, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0400, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x040c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0428, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0424, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0630, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0604, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x062C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0634, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0610, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x061C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x063C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0608, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0600, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x060c, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0638, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0614, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0628, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0624, .reg_data = 0x00, .param_type = CSIPHY_DNP_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+};
+
+static const char * const sc7280_clks[] = {
+	"core",
+	"timer",
+};
+
+static const char * const sc7280_supplies[] = {
+	"vdda-phy",
+	"vdda-pll",
+};
+
+static const struct mipi_csi2_genpd sc7280_genpds[] = {
+	{ .name = "top", .scaled = false },
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280 = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_sc7280,
+		.lane_array_size = ARRAY_SIZE(lane_regs_sc7280),
+		.common_regs_offset = 0x800,
+	},
+	.supply_names = (const char **)sc7280_supplies,
+	.num_supplies = ARRAY_SIZE(sc7280_supplies),
+	.clk_names = (const char **)sc7280_clks,
+	.num_clk = ARRAY_SIZE(sc7280_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
+	.genpds = sc7280_genpds,
+	.num_genpds = ARRAY_SIZE(sc7280_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index cef4a90ca539..fca67d3625b8 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -455,6 +455,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
+	{ .compatible	= "qcom,sc7280-csi2-phy", .data = &mipi_csi2_dphy_sc7280 },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 5578741c0930..e2a346bcec89 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -97,5 +97,6 @@ struct mipi_csi2phy_device {
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
-- 
2.34.1

