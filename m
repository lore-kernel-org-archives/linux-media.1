Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35583AEB5C
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648087; cv=none; b=VmkgXpXg+InwJXjoRoqu+Hufn+LZBtSOV7pf3OrO5xNCbx5OBCE/1UZwlxtILM6OZ2YJ64eDzcCdBT/joRTBlvlXKTxYlwDioeVpqcfYvSPYAAY5B4Ozev+0m5V5MsTUhOCdoNroXco2QZDreFfVjQ6v8yPUyf3L5t2hc3trTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648087; c=relaxed/simple;
	bh=RzCywbWgx8dE3jNijkrCi/shzOFGdqaG/+4eys9w8X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UU3OVS7P29jW9RAOxU8xe29OcLjJ46hMjei8bPnyTZ+8r9J8ZZvkR+IzeI5130ZFGrSjjLtTo/N08uMW3be2n9/wpiv9xo6GgyUhCb1ywZDt2f04NvFPQ/3uSO7TKNgxZ5jnwNNvI850eZv84r7JgGaTIN3HU3452dv4UHvdmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW2WKOA3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEmmHmwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW2WKOA3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEmmHmwz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFP26U639829
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=eW2WKOA31ShPJ4f0
	/jEXeAjHajDOxy/nOuSfsf+7bW7zL5NyHTybai9T5Pt+YpxDR43QY/hFYk8hW74h
	MDrJ5o/Tbl0zzVXio3En0MrBh/K7QiV66vKEoxJhOsaJy77Af9ddggCAQg3zD6gp
	YEYL0za+foE8+ePw0qwkGX5qYnv3XFtoSEiez7o5vsXhP8Qo2rcZtcmoAL2QCjaH
	JPdfiNG7QECud6eZMLSPyxLhbCU7OWu3zME75aQ4dxpj6W4m+VsfJybrMHSb/UR/
	7CdB+b+rx/e/2ObmsCwudOQAcAc+D7fXlEpPCez9VQLQ1F9VkT0yfiORNY8qPUrb
	aKHnaw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpgherm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so1358252eec.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648083; x=1792252883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=TEmmHmwz7X+fIGqR6xzcEeuxA9KdGkkq3nBPf/elmpcU+lW5hUy8WRW3DVbAtuI9Td
         0IPAjlUMkB+xjYDYw7Y3Z7o/o0kUU4bK1B2ykhIMDLbfGrmfs7hNFX1dXdPYzrovOiPT
         VR9O7T/O7t5XYmHUnDHFNmIWvi5Nl8oMreAmIANC4zQ6iCV0fOnYjZtcbudsiLaBK/Xr
         EOFtwEMJqPqB06kF5aXepRi1LG1pkAd7FW9iER1pKfHzJYzMsMvduy4C1HVVmX5XvZVG
         +ez5fsiUlEYUMmBW/x/xqRTmBcUroN1+VxKlVFIvYQJm+22+04cQJg5015hr4QwXVqwM
         qrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648083; x=1792252883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=WMz/Y0wT4IqdCYADFdNq3Cdd3htQLZIaQ7e64lK/bYujE2Z90O7oFaRBBpyRZIPf48
         l0cpMXP4+ruAG0j5RR3Qn4NKbCWHdzjk7z71zVuN+kAfcwFTLb0ZEFd3gUDAnOMi+X7V
         6vocWiIuSwBE4y4Q4bzFw8hiyY1fLUC9OBGjPOu25djZ8ssUspAwr1XYIxMbZwwuq8Cm
         8skmf15BKNJTD9LiaOGsbtpvCqAcB8bwTM2Kr5iFxsWjAGfo448FFauSlg3zkpVKp+9o
         aYPvg3Evn8V8KRDMkeFrQQNB4LsCo5myFJI4xdNcVMaa8nW+MsWiqYBuv7zp9vehktut
         nlsw==
X-Forwarded-Encrypted: i=1; AKwUvBw3hCL9X65U7AG/LVQ2EzDKTMfEbtE+paedk1mtcY8GrhKVcyPCs8LY5/8pFMCNLFDoU8RoErEn+3Udyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKl6EVGz9iR8pV4mzHAv33B3x4sGLpZDNFmkRs0J9jqiH7fkpsq
	rqv87on2ajkwWobiWwdmdWGixL6N0XHBIPJw41I8Z+Y40PeC/J/XBEkGIbrKjTo68P2nR84qndc
	MfflPSHI9oOfK0JBdFFI9jQVB1R8p/p6x7lfeRFQRl5LqrsHLwEs7+bafXinssQMsZw==
X-Gm-Gg: AYBFou1m/p+fZTrXMza12USQiS6Q/aD8RGGKSamGPZm8eLCPKZ2kPYVkgE0NZKbjh3j
	stw9fu9Mm9O/KVrtu9e1RVbTcHAuTzrAz/nfwoHMCCdJtbGFUmmaD6mvLDhv2LBSjKR8/z+ws9a
	6q/IYp17RRx6Z31d5vRiFDqH59pXn/2VYhmESTTLyb9NwGPxstL0wKT8TIoYGodvA5KZaApN14J
	IVsZpxgCA3BdHd5Cmr+ias+CrFBathHJmbXogXvHh6MHlTQ6qhxt0w/z4gCwR6XNdOJOSw3mNeG
	85pRqF/Xzgo6U8go5OT9cXU64hghCpO6JniycbkDk5FX1vzVN9/rcNPrVQcEFdpvzy0rQNPvm28
	HS9UveVlTKrnanOiT6tRtc9Jf9mrbnwxEXhMd5JzTwi59pw+jIC5JJxSrU6VT4E0U9/kB1ZgVod
	kkuqzTDCdXbA==
X-Received: by 2002:a05:701b:4512:20b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-16a62bcc0a7mr6077979c88.40.1791648083277;
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
X-Received: by 2002:a05:701b:4512:20b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-16a62bcc0a7mr6077906c88.40.1791648082484;
        Sat, 10 Oct 2026 09:01:22 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:22 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:07 -0700
Subject: [PATCH v20 02/13] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-2-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXwBtCEsNEfy+e
 bM6IuWfxiPqXr48A/iQaT8p3++DKECX2C+OIvWYXEg6RrFPZDUX9q9wcmtf/G4/ELB+qL0TAi1L
 V67aI0J/sv5RqNsGiM+qpGvQNgxx2RU=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6aca6154 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: nN1a1hglbGkOmztjjaV1jCsoJ7DIppjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX18MXQSkWLUVz
 CNqA8jRX8yYwe3ekJGrLuCVEcWu7lxsVUyF0xf7f0CUeir6zrAv0dU/1SKO+M4tOC6KOG95s6gM
 DWoI0e3cf4F5IMHMJsNHxEJk9frEQZVofiCh+n1qAib9LA2my+s7ykj+yjZv3otpGGtb3Vn2zIb
 ggopGqm6ILvVsgT07iMbw0KXsSNjYwhkq+tGz3w95EsrL/vZPuTe2s0hwXD9VS/Syj498BgT1EM
 hDwUNYuBBiDEbQfp9jM637GKquYtl/z/gx/CPA5vfSmdc57WepxEmK6h0iOHNkC5KE0V9fsdWb0
 sNsr8GuhwRUZAdQyTw3cyXMQOdgl7wPEr+v5POrk+0UgTC6kQmwPoUuiQiVOSA/QkUOMXgYq8Bs
 JRTCunAe5nO+43EiVId+Ki9HP9pWNVAwmv4tglpaDrAxWDRsK1Y13pdbWzaUWtXbwelBSXcrXoT
 SRakg0tlcI0H1/pRVdw==
X-Proofpoint-GUID: nN1a1hglbGkOmztjjaV1jCsoJ7DIppjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

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

