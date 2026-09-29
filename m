Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8044078E6
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661654; cv=none; b=jMbxacWcHoJ/wfpDLNEwhu0WRM2VlQIowRlXk7xc/mk1x2bcH9lH+8tLdpQANc3tTe3/RcHy9IKq5W3HsNzWZbaVdrQHflouBgLULl0FI+NSxY783WbCfRTT0D0qAX5FM7cqJ3kN5hWLxvcv6yReIbKfKn31hyUmDiibcciZ8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661654; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jgkke25HXakyCdF6oNGhSVR7uGMsig600vw+3lMGpv4zUDxSSyknIBL1sJ6vfneslAvY9O/rSfJzMCGEtdDD0s6rlAyQlOXSAaqLJKe9N1vu1fuu47P8la93bSQ/S6VJbzOJLGBFxoPpnIjK7QSA5zJDj1ZvJZ2fjpDbCLobglU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uxk0dx/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJ/y8ARq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uxk0dx/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJ/y8ARq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475J83390859
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=Uxk0dx/3RKpivDjQ
	LfQ/jjnmplCoxQ8ikD8gZD/URWqCmvOuRVJOTMEwn2XsP6EY5v+YPl/vCDwYVy26
	bNtfTzYPwgeVa06CyX6+WvAkPWd6pbD/kGvwT8h4MPUt5uA+/nNRq1atzVnmRW7e
	3O+DkKYkcX7wnMuJAvFYsAyk2OXUkUz1yG5oaz6exLJVPQIv/Ax613xEQ+Ntg792
	iJNX3/TNZSDDokzNFfOKzK7jKsHs62IcmLBargHePrDccAfVAeee0lHGRRWtrCAv
	tVGNMYJnZBosugoNk4gwnvJaz+2j6F3Yt95aPAqNbv1+Eih+VaFSJWvALDEOO08X
	kRv/ww==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkh6kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0ca27a114so2705362a91.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 23:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661649; x=1791266449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=XJ/y8ARqAWdWg19brfd2DXnMteLsXKmeHk5xhCBhLVOo1UapwYj+cEtPfPWZX9Kpad
         1V0yoz/CJKKoqwSrLtMUNi5DAOytKM3dAyRLZAgGEsu5lmPCGmzoni8wKOFzggJAXQOe
         jsoCopFEaX+bkf5WZ4bP7gEPqFGulrSf+2Z4gXVzkgfbrbYcleOtd7bW/wLwHsZqxK5y
         iizI0Dy/85EsyZ8xre7/Mr2olBXuMUhEDq63OAxRrW5ToDK6C2N+DljFt1dUTJSlT06B
         B2XUWHXOY8/3DEYsoE7aCcPhn0BNd1eOXuVlwnAjXyHD/lte3UAS6QxCuPbLjMVEZ566
         Fm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661649; x=1791266449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=adYrQoXBUH84YUX2jht8DatDAI0/CnR8rIET55mQEp2W0W8UXxDCQM5Xc9ikFAPZaz
         HrO5JgqxbOuzQ6eRqLuVfv/7TOv1sDgp6j3A3iAAq1iM/T3Bw7Z2yMWvuj1iwOuN5g7H
         wVUh0HOb6TRlj1SO52MqNbn5YDfqCHazWmBMCnIbJWCY0YRqdntdMkWQg6SEthcvbP/L
         SOooBuLUr8cGO3MQK3KxeFCPcOA+uNNW6gbxpfUNkrF8xk6ha51Di55gH/qxed6B0A5q
         xZ3B2kcenoM7POOgNBG8Wu0zTZ9SlzzkPf7nCBqSokMrCS5QhbcS0sMXEvRxRacM58Wz
         SJoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuxVJZc0bRiq3rGWaIa7u8r0f/bMCEfM3a1ntTV1MKmxmNzxDFPf6JwwJser/8oxvtGPEUKVIVC6dLgQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYITLtrvpSePP06q9d4iAehoHLT81SbgwE1TZqoBHnSznRdH6coC
	AxfBU8bGX7M2wGsHAPPHxt9sJ0bOlPZ50Sm9TonKiKpw3CofoclIxcx/Zq09EB+zex0W2khvFHZ
	Zti23HhSIB+e8SLk8/OPiQH1uDcfTHzJxUUlBQ8cG4vEHqRNXC60nPyRvoaAyinNbTQ==
X-Gm-Gg: AYBFou0rv7p4LQWXbHQfpura7coAaY/zQW6RqLN6PYpz9s5FVDEd8h5r92OxhmclEnY
	jVFMMtq+73z0OtZt3LEFYzXKyNEIDmoAyVRiCB/mqYG3/5/K1Hw6kZR4hLxGDf8ZJlgsanl3GZZ
	utDbdOTF1vgpQadWwPVK4c1ZQUpbKZxkoBAXKfAzQC0M1ASeMpHCtFWLLkzDPPCS3zjcIDHYufx
	ueZONN0Iy20blpb7dshlF8GQ8YC6gE5QiIJZnHRyvOSdwA2pjQe7zPJnZRVQ+2yAn9UN5ijCAzW
	KH5xbVUsNFTAlldBXE+t2u+CKcZb20bSMeGt+7z/Q9GRFdgAl+0v92TZHkATdpeUFBVfnKM+tZW
	rz9Ahw2+fObpT1YCtfzVSztQHoSvqJScYJ0v1Y+hwY2Q/AusQbAdanhKmeVDr3lo4uxwNcErv+0
	XCWY6A8WAg1IVT1LgPyi4G
X-Received: by 2002:a17:90b:4c81:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a46e84ea15mr3549971a91.5.1790661648851;
        Mon, 28 Sep 2026 23:00:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4c81:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a46e84ea15mr3549938a91.5.1790661648271;
        Mon, 28 Sep 2026 23:00:48 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:30 -0700
Subject: [PATCH v17 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-4-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXyX58i5VNNMi6
 0N0QXnXVGuQGOZG6cFhB9IUqL/h+qql1/fsOg1mSG888alQJ1/jkjsFiTURm6wkqNJViu9EQSgg
 psjmkrJGyM4uGK200yT2kTH8v7MYF2Xq5WhT7ixQTCQ/AVNjNr+zyB7+iLB5Y/fOuhNjkNPjAuH
 asxSnvOq8PnSToremQ0v0Wc+VVmyXa3kDUKhp/wof3zFwyjUVdQRMnWqBhldqpL4YLxE0WEBOtq
 GjM3nnzyvphSg9K/vuG1UZr5KnidPV8bR8Ra+pBuvVjl4dcBA0Q2DHyNXRQpxgzobtyahkvcQcV
 cCDRmnnSAK2Lzp1uyL0ITsPrm2lkJfX5I0agCj9wqnKW6MzUIMpNYdWPSUxXOX/cVKY0NOVOi9a
 d/8pWhIwl45chEX4TZEuWsEU7LuU29H2tPKF8VXPg+TE4Su1rJYHR5OTFOduXJT/bDx91NM2gZR
 TWsFP1WGG28m11LfDuA==
X-Proofpoint-GUID: 1qyldEczTqGsryWaw20axt_DRj9i0a7v
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb5412 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1qyldEczTqGsryWaw20axt_DRj9i0a7v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX9I/N/nj4m/EU
 qR7VxP48eIN9EemTqcNLy+0ikSJoFi0sR6zxg5g7Pja16fYPjWdF6Ezmb4xguMhzY+bIys7OMC2
 +qGxMz8INKoCSllyCYHK6ntR1dfdAmY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

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

