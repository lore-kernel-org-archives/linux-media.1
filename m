Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA239023D
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404546; cv=none; b=XIHLkiaRJM7Rk3HAEOUvIijlITqVqZOGtlKoJ2KyD7KYIzrrfsq3ftHSFNJmeBTK/+Ov96kvkYPE4BCqW5rTsY8d7U9MfmOTDBU5Y7WerdumjIPlUqey4rytDEkLl4QbdrMMdQ9eKpExC+ODmSbPS/IGmuGSg+RKw8NHwpczF5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404546; c=relaxed/simple;
	bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugkRu8rsGTMr1BQpCj9oDdihDkY7WFPvek8EBD9dwITQXazlpjHDdhb4BfMs90xMLaTYLQfrlndZFrhhywUqwOYfUXM9nHBby9t5RtEcRLZVUHI+hxJAzK76BeWRJ9AqTFw9sCkwCcm08WZFKCQCZGGYsuGWEpvHPNouxgVqhO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzuNVcMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsnchC/P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzuNVcMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsnchC/P"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OXSL2574035
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=; b=mzuNVcMcwtQYq1/J
	24JOcipfQexlxPfqJnHv+9mKGsz/fEp0i2sqBpwbQlf3iepKzrd/3GcI1xPbJ/1n
	IeUpMlsbqch3GH/i0HloKK+tZCjYEWL+AxWwML1LAKGAjpvIHt1Qr/9VsRxvqeNY
	JGgl3/ylig7nD/mbvvP1aTIPZXXgXHuWlMOLdVPUXQZSVyxzhttx3UHLlLOiuZLn
	gS2pJTXe0sc47VF6kco/Cck8OaPrS8NDgDLFnS4i9wZ6w7vel13mVTm18DUsESGm
	+bL4Y6Ch43qqbU5lCXu/EdWYfOI2k1Cw7mSwtjlcYXNK3AfF1fx4nkH7CH1nYvYo
	D58LRQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9r56t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:35:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438719cc1eso1876069c88.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 23:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404539; x=1791009339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=XsnchC/PFP0E27vCGtxgKvWxszlPiknXtdMlRUiA+t4oaTKz39TNJhGd6kGPqIEHeR
         v882ixBfVCILjLasw/VAQcIQnbdWaOcfLt8Ur/OtrZ5su2Cv4mfCnr1lfH7H7+8yJOUG
         oueD1MYTt1B8Ok5cf4NwyAEvoaTP8UbmvCDFX1GHOpQAdyS18OFDJr/mvLP4YXodivMH
         KD+K1Ytu9/5NM78Cqjle0RCo+KcHvRkl/58UAdOxmi1YAno0k5MDgGpdhrHckaSATnTR
         rtkVQLDLAPCsHw5ogclEI5mw6GSrpzdZiquIGMkDN7d567lCCMNrt9JjS8KBPD0oKH5J
         aiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404539; x=1791009339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=lJMgLXXPmzw7L7ZR323rxi7YleeEOgkGqrGrFJFxY/hVce9c5k/r3BlTjW5Z0F0OEl
         OVFI+4c/E0/xHDWXsR7xDDxpvTohxTSrViCHSsHc2pROY1+1Xwk+rjyPYO90+GlsOL6+
         u264xPrGf2LckkQAYdAo7SWvNTB0RQytMZUBvEPokaF77Do2psVS/TYTh9tVbV7wnNjG
         dRca/9i2tCNSBnHTHFBZ9kJwSAbA+7LBfOt+VClNM0azGxXFpqJocyuAAlcNu0c8P2/v
         p7/A2OToMbaHOCkeqGGrpPmdXm2s6mHWsElXrwWau66xGEcYBWyqbps1m9T8ZltAca3x
         eG5g==
X-Gm-Message-State: AFuF++kOiol2JTa6UuAKIbZRjVGDuQBgnJiPDA4xQz0xu9BuZ7kyth4U
	7/DdRHZg4BfA7NA3vV3ucvZ+ST6vSQA6jx7sXfDqcIgRIZDOah3jGvHDjCOuXQtwgU5nDC92BVY
	QurT4ITMElXkWP7Vfr+4myGltppmaohmJKxL5uUqMwbpP/rkGSN/cwt2JrVFyVIX82A==
X-Gm-Gg: AYBFou0GVt1sKTHHKOYeZZS63tRYQJERbGwJyjjDOf0UjmhLclgFl6bY2Dm+qGVxade
	I8YiWnrPlDxg70MwsH6hTslfRBQPTrVzERVkynAtiRAH+lEHC3dcsVCcFKFdtx9Ee+6UeY6Ocr9
	9skspfNO68gahuNtwTbLoFvnF6wLTFi39wyy8XzaSi3cSo56BFg4HzVeMeSQ46KTMjsdV/QCCz1
	hG8qmVxN1dvE4Y1GwVyDGuidereVk8eGGo68korsFA/ibBY6bNEa9eyEzgUhyMp5DnYou9lEXGC
	dgY5mQ1/UQiMo/Vv6/3pwzs2qgHQPjBzFVqrxYIVWgwaiNP+/zr+PSjEM8yBxpG2Km2kk2bgnyo
	BCKE6lOEsdqLYW3CenBu4KQuT7B58STXAGQ==
X-Received: by 2002:a05:7022:f515:b0:141:b2c3:d878 with SMTP id a92af1059eb24-146cdebd135mr2129837c88.7.1790404539121;
        Fri, 25 Sep 2026 23:35:39 -0700 (PDT)
X-Received: by 2002:a05:7022:f515:b0:141:b2c3:d878 with SMTP id a92af1059eb24-146cdebd135mr2129797c88.7.1790404538316;
        Fri, 25 Sep 2026 23:35:38 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:37 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:08 +0530
Subject: [PATCH v5 09/13] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-9-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3295;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
 b=VQvWNv0T3/I01JEcmNNQiuzm889M2nZWBkO+kcBZXIlPlhrREBhiKxukdBGS1EUV5SbvQzK7w
 bD+1onMbM7XDs18PJBecS5Dtr7XXfBQzP28iuonhpHJ7TInL2lNA60t
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX8swroIRXhuen
 xPpfpvqGJj6H3+l0d+niy3dQHXMNcnbVICS5DiqCsY+gxObZ2iynGcuuMMvPjFJLDiCoGnd/RZu
 +Popna0ZRIYllgHoF2gEVnoKS3p1oQE=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab767bb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: PC9P6xLMwJnwO6nkpQv8_Rvyn-crB_sP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXwwjKr2/mj3c+
 z/RMuJ7kFTdmEFCLoscx8B4niv7MFKmoVPqV2sMuIv5zwXGjMx9hyOaBSrXvu0UWWpUKjuZ8n0V
 5Kd15NRqJlSBFKqMTnFtIpA+VQQ9oouzYze+NlX1RmOww1jPQFLFhnhm86Jg5gaAxPxAc9tXVk+
 9BOz8CgurMv3D3uDOGbCkdcVKUawvKwKvf9/jaBCWbmECiusU0ZcbMWVHts9GZe6kHM5YkO3z6H
 QfeA8mBhF+FH5jblGLyn6qWY4jCZuMHznBHALZ20llDkas9vGyVe5BcpQrvnxl1uD/B4zKg60qs
 6/D+sFQ8VAp33lR1F3AEcYDSOSKlo0frape2xHETrz6PvE/lmuBu0/nerJH6DDPWoqOSDuDt3T0
 ONxQbvi7Pw/XwgLyophR6e/Ynm9fDpHv2JRkGqIXjP7JG8Ke8is+Ce19sItCW5/AAMURjD7dr+T
 vsqU36I3A2briym2qow==
X-Proofpoint-ORIG-GUID: PC9P6xLMwJnwO6nkpQv8_Rvyn-crB_sP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add303348867f890890f2f7af4f831af..60164b853ae0764cdd79c4680490e66a548b0613 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3690,8 +3690,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3701,6 +3699,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

