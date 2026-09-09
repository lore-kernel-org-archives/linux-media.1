Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F858B6B2
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965935; cv=none; b=ZgRr1J/OjzYEjrvdgQLBNzYQ9pdMVCodZ1OEnHoAIU48pZRvx/HKENXJ3jy6Z4pkBPOaLf3/SVE8leh6rd94k6L64xUyWut+hEbYdcqRvpFYgHh/kLNg8u8A9AK6RY1KM83DrQV41q5OE1lEI7Imx8qYJcrgdFoYAyxDgUflcTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965935; c=relaxed/simple;
	bh=nYlHwC6PKpfUPCQFPEdwMq/Ct3VZxMxSmtdDkckeGT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpR0DbmafFvTXGsU8e2dc1KNWkhwVbmGPyoqlGyYYjp5q2hyfZbcI0xtMAAiaW2RGios0u/XabatABHWE6rvCH8BBsmvmKzpx5e+1ecInS+oZBGWDFjDC/xLrExydzQjl9zgjs08BHJWqueWRaQVdk9uT30Z8hZo8aKgSMOUPjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqpS/Z1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3mQh/HO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqpS/Z1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3mQh/HO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUbwX2019807
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 14:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1NS02MIUiZWRkHxOc0gR/eQgS1BhxaJu4QXKOfECR4=; b=VqpS/Z1z8WzRIEx8
	TzAM0QfQkHJ2p0D16mQgfW3fsApDBvZLRr+DCahCxyEkpFq2Fh4EFJ5HrIroDBXC
	23q9mJqSEeDfHg5qmOa2SqMz5EuMEuhgVRs7fGzswNB0jkJAvPzJBB6XB6hylxQL
	GJXDSygRwxwy1NpE5uucNJiVeOdea2XcSYbJljmF6oVpV4Dm9yKawpvCab5l2++P
	agNz3MU0SxZm0tZa2O7+28XOQUTtE3hBqYHWX+EEA+Ip3ljCIVnbUmPSasPe726Z
	naFEKThmcz8iHv51YdBBZQlNDM+vFhhPxGjl2YnfH0V3GsPzc9gx8qz4w2hs8xoq
	rvvsQw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8yy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 14:58:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso9831047a12.1
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965932; x=1789570732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1NS02MIUiZWRkHxOc0gR/eQgS1BhxaJu4QXKOfECR4=;
        b=Q3mQh/HOFgm7IPUXoQkxhTVfVdwUQom1oW/7IfAdeRcDSSnOctRKhULTixN7AzrNWX
         dBnsBbcPoAmza4H7bzA2zI6ijriXXfTfKlQEnsPKvQ0gK+zMUDOtXfl0+dXzVZ9iMd1/
         0c/L6YaA98PBx/Q6Q3so18oXSAYJRRrcrb2PHI2M9/NHvnXY0oKUI05TIwxl92zf4D20
         amensocP9P8+4a2RJ59BO9OH6lUlXRLulv8mq+iMcjakBd2CV9NguNO0p/3rIfzGiv1g
         LZx3s0VsyrIazrjECnfkjo8ogslpFhlGAlB+wCXKqLl+aLA3o4kKUWYlFVE9K3qKxklu
         bD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965932; x=1789570732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1NS02MIUiZWRkHxOc0gR/eQgS1BhxaJu4QXKOfECR4=;
        b=Bhw1h/BgU3qY/3cbVQ8gjjetDl5hWfW0YaGdJAdQuV6NYpG+6J0vc2xnOz9BAjrdyb
         kZHiT+MVgQM0eFUIYjcpT6TJzurVuNHQUgVjBiaJHKtS8WC530Yo1Bmb98ABJ6vZW1ES
         x7F5S4sVBeE1+686RI3Mt+iPThMBW3MRUJZDpYhWYL6ZxKUUwozFlIpKDZO02rGFvoJ/
         kouo26UZPaGsgUdMkCYcaNcqPbkZLj64WoGPFdk4gVTJDTtHqY1XcPYdlzKaHBWoDuKz
         MTjHLxBJHoXYIEXfyBTMi1aaDIcKYwbozLfoqMg3tbSFQFBTruRbeoC0B5WcVTeL3cUN
         Nw8w==
X-Gm-Message-State: AFuF++mXjg5eyKrZeEpxeMgMsFPhdjYCCWmPYeI0ps/v9ZYMooTe/8RO
	SOJbrbqFqQmnVSGpz9ERlb5Nw9XHK0ITr+d/5HCeYhWb9lbmGex4NN6OMPY1/rd4GILCXXoRbni
	oIpTL9J/sjqHZ2mmWQhUUxUKao/ppo8HCDmFqueqSpdg07DShkJV1ZOLg1EAVI7cnR9gCnC2j1A
	==
X-Gm-Gg: AYBFou0E/rahqmmakqqpVHwJKB3FysLr8TasSdIWxFgYo+sz4VFa+DDFKU0WjueEx+4
	JiU8T568vJbRX2ubipTeu7E+eXvmmF9zNLswbnnlTsl6IQscNDbt6QUuJOT2lXO2ENE+YSFe/xT
	vOeYqQYyxcTwRFL5GTxF0Nqw11TrgLRsegdHEgu+v2kmSjx87pgeiH/BZoC6o2MlAuNJKwLbtYX
	bDuhVFFK60ASHMgu+OfjpbdeEvop7rUJS2ppwL+UoPOFQOPnWLzaOOcH032wQ9T/pOidn1ocdvi
	Kt8NHs8WdrNRa53qP1is7djo+MljlV+JZ6KsyX1AQJahnwK8B3oVZF/rN1JGDqJR+criSITOlkD
	EdskL/a+/MrqW7GP9gP8Le9U5sQzMrTZxhH8=
X-Received: by 2002:a05:6a21:32a2:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3da39d18cd8mr53688423637.1.1788965931399;
        Wed, 09 Sep 2026 07:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3da39d18cd8mr53688366637.1.1788965930967;
        Wed, 09 Sep 2026 07:58:50 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:50 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:17 +0530
Subject: [PATCH v3 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-10-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
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
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965841; l=3265;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=nYlHwC6PKpfUPCQFPEdwMq/Ct3VZxMxSmtdDkckeGT8=;
 b=TJg9jPW+LtEtoQPVLGk7bkpFtL3R6/FJZVqPXa5SHK6hi1G3HPDBiRrVpSEykLC2USjw2SuR0
 7usvYl/9ejuCaFydP4EkjJpaliOsB3TSM0itCPBuuWLWfJEF62LJLBu
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXzRxeATowzR7a
 Ukv4sid+rgSYVR5SaT8y04UEqLRdxaC8YuncI9MFfFEtaRAw1MgENuRXvHVNxMO4CpxqHxFZ5Oe
 FWcZNrIF7YS+/jfkqpSjhQ7aVx7b1zg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX52RGI1hg1p4e
 SHvJDtaTSfgAU/jGeVjNMqsq8wLqk8pNBhxTBsItTf/dD05Gu/7+g/nCaoHYKwEZCJHj3zHBpSb
 GosUAeMUQINFYQjzxZFaxY7+541G5TbNV5FgEOW4P4eRDd8IMisduKn0o1f3UZerKUmtFvlNtYb
 9lz6ODfhJ0KQT6gWllGypQ8IcPo6td4UcQG6e5Hunb/zFpUCWG1jf8oRpqJqDWDvg+SOmGOqYfh
 qvEuhp5JjD20rgN6DuM1udT0Q7IruI2O7n5Vxy63JEwy+u4Klur0uAbX9/rG6xkdyoYqLzm1PYx
 RrP7bOaX2wqbAb7f2fmr211NFYx0+XXdw490yPBffLB+AuVdoLCjjiDw64Dspn1X24JcfyI1+rq
 9yDttfk+RDpp5pMuiIbBZI+dEfCuVEB40NNp7qD4tJ0WmIYnK9QS5JAyw6/2VidAcBsGhm7BAmv
 QuXI+P28TxF5fIerATQ==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa1742c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=w7pRem5UOBajBC5HA0sA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: ExLnzQSEZRwqwQ6gV7z6I6oyHAttaE_4
X-Proofpoint-GUID: ExLnzQSEZRwqwQ6gV7z6I6oyHAttaE_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

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

Tested-by: Daniel J Blueman <daniel@quora.org>
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

