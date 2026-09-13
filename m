Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967723FAE19
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325469; cv=none; b=SIbsWZVOmIiNzQIcXKmQZdculQKsfmpDBRb/SBZ6OgRYqWsr5xqQtJ21EaZWp57r9EL0o7/oVLy7Nt9jOF/xDiv5ywhTDJpVBKwv0+N/UTf6K9lJ1yKN21W0/GuI16liHM1qWVsswYKEIJ8Yec4ttnGQbmeuNiiFVqz3o4+Xo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325469; c=relaxed/simple;
	bh=hSjOhcc48OJghLc+5hynLFQU9EGrwxyIHApwVUWJDT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+HxZxtL88Bc9ULX/GiOnRv31TEy6JrVJxog4RJEatdKCB2he/HTzG4ohWetxbRKVqtPWpKV5c7PPrhyfv1H2pXgfY+LEfH+Hcj/86pxtWgxq7jjda+PekEgvkGpnGz2zIsy1vWGdhReJnRbpru6e1905mvpfNT3KCNakSmJpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6wEii+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbdB/srX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6wEii+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbdB/srX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2faR1749458
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=; b=a6wEii+AcrYF/jNb
	fTL5eJGPrtG/DS06S8C9poMnseBMYrKS9DeKEvlJlGnPfayvDTZd5CqrIn7UXxqj
	96/JEs57jDJifjTh3Rf9mcs2c3AjbOksWMb+dUm0DOJCGe+YrDONdJHd5mGdfkGu
	mh14gfgHe4ZvLobuQE6r4Sg5JqesUqPji3epcdehdjsiwd6mVa70X2CW3KjYuTvr
	W9VRyizxRLBJLJBfMFM870UHvePPIVKetafsj9YNjdd+3R4SmVBc13vGtyPFAnI4
	HI2jzh6T0G0MYf7mWaGPT8x8Q0WuZnTm11T7celbJ9uTdGKGcPoOFFyfwvwBvxby
	U4DDgQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbw4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:51:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so506787a12.0
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325465; x=1789930265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=;
        b=ZbdB/srX3GiEq0eud0PxZm3hXiMcrxAejJlXW7UNT+ZKGpImUlkNuVJex5RLtTmokC
         ML2Bbvyw2gQIFN9rU0AgkzACO33MdQMLacRnKcv1gERhoF3bkGnPvsNSGcceCgXyG1zV
         pHytur9/h/VXWV7fpPyugdm2MJOj45TWqNwFa6g4HTpLDsRQNvQ5JIbQFXuHqtXX78+5
         rCve8zLKkHp57+U+pdkIKFUt14LEUweE+X8KEMzzqk787FdpAM89EaonYAnC6LdESvAD
         lvsidrYq2Sp+fI463A8e+Z11ReyuMC+P3P4R7dBJn9euAp4VDEbWx9stxxPiIR+ImM/d
         l97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325465; x=1789930265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=;
        b=bHmlkYA+KplhdhHMS23DdQkIoCvCzHak6oPkAji8gScOrpQR8ISm7Z6gvEN23427Tg
         656OI5UzPOzwtFa6gFBEjbMm1d9+A6kvtRXveFxjHSMAdVapKNU9nKIMi8SZUfJXtSWa
         k6I+gdAuOrvhOiUbTgzNisGK8Vi4/S9D+I2rQFEJJjbi8QW+0oKb69TE73L9F/kZya9H
         160QqVpYT/yczmcu92G4BbbCFY3UqXmyX8axPsOPKUsnzY20IX5m1Nqhz2G0hrXSdnx4
         jIPwRyyteuUVhb8erkQUWFMBz/y/q39RvxnshiVR4z5DVJBROB34GLF2USzztNGk16Rl
         GMnA==
X-Gm-Message-State: AFuF++mAvhvXbZ24isGAacCqCJPluHr37YKfarlzR8QN5MapGe79JHfp
	PkfAyTv8m9xL8nrEEZdqhWITzH6FV1o9HYid8n9cnL5QC2GkWcdcXPvBmhKFFr4dIDVuDnkiPEX
	BYq0NnpQ6WkSK4NZB36F32q5pOMXXlrcO3rfqyO+4v/lZZIjsLLAN+O58b/YA4Ust1w==
X-Gm-Gg: AYBFou3StxAx061YjPfEtpo0J94YDmMPBvdTx8npOTx6Ta8WijqUC0QH0bXTLpx8sv9
	EIXkKISIIIvZuQx34TY4ckNVZmZdavirg0mhyefM+EvDzswdyfN0rGDbocfeQNiOiDIXG6Mvba3
	R8VtJxxgv3RNOvPn7N/q4SDhRGfnWO3/bhux1sl2lrMssYDt2Xy9SjOnlcKxLP5MNoE4kcFR925
	T2kLY6guCqy9gpR1uZQdBlo6G7CKOi943cgo0/JIsQLu+bwI4CouD0AkEuw5zKFo6ldQGbu89yQ
	xYLioulgcHlaCipfbrZu9p38BONn4MgAP1+URu8Q5wkbRfFocB2w9OC9WlP4L8F+aAdgT6zvb4F
	Zhb7PJ73PS/2bhXf30QQaUrGliL2Xnkb5WL4=
X-Received: by 2002:a05:6a20:3c8d:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3daed15360bmr29215152637.1.1789325465283;
        Sun, 13 Sep 2026 11:51:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c8d:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3daed15360bmr29215086637.1.1789325464863;
        Sun, 13 Sep 2026 11:51:04 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:51:04 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:27 +0530
Subject: [PATCH v4 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-10-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3217;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=hSjOhcc48OJghLc+5hynLFQU9EGrwxyIHApwVUWJDT4=;
 b=rNRYR2UL+6T+Y/48EKnbZEZhgN2E1kCdWuexvsvexUC1FXasDOTGl0dVgyL7S6L7yqUiwHPkQ
 AeWD3PV3JnSA9ir0zeujjgzPioZI1LuG1StoJZP0bpFuv0+1J5quea1
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: lTd_ql25HXElIE8YLrWWHRsPezFZdeJk
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6f09a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXzQOdP+viZ0Ae
 m0nfv4lMUP5/kLGvaC9CfydD6aEUz6w0UAhQ48sSm5CTD2acs2PXF7Jrkd/JPJXXIpCmGba+4RJ
 ohCWT6OuTNw0KpYbRN8eu2Jy5PcGQUQ=
X-Proofpoint-ORIG-GUID: lTd_ql25HXElIE8YLrWWHRsPezFZdeJk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXyYZrqLkOh9cz
 P5ww6EFjifEgYUlXrwCuR+6iU082RP7qJXI2GLw19GlGnuJeDpW8AuDPOwAEgt/nTX10bq0yaNA
 DmbjJXry/GQ+uFpaDujuc+lXF5JZP4pa802nUO8g0gkiuDl6WzdN0d5Y7Op6lJOjcVU7vcSjgbY
 a+awMLZA+ZI8Z8ibQt0SjvlLi1PbPVUqoDoi77dYtBNK3wt8V7w/u4TvzoCjj01yNod7W/i4seh
 3wMYewAq4vdN41cAXpalLZHIfRnPWHBwQfd2W8WI4AM8MG7UtQVTm7BCugk5XO0azjNKll2M/p+
 1z9QL58LHgbirtw/ohOvhNKjrscGTMMdCeeic6Df1lyHRVYu9FkCQK8gTUkGw3bVXK1K1W0O1Pr
 ohXzDAWlVCg2KTDu66VOAliMoDedB9Y//HgsPwDxyH1hQR4PmvboMumGuLATYLKBzq1VXGL5IEZ
 CnA7YdQ39UcWO2w8w9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256911e656ab1ecdd92aca135d92f39..afed5e43b4fcda8b8400e815d24c5094834677f3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4962,12 +4962,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

