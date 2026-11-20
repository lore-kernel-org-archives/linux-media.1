Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173112;
	b=dNoxGwPTmkpU+v8isSj8qEeFtBIr1GMrywU99F7e9bWZDw2xrC9jFMqLblXiRQ8rRlq6
	 O3YAn6ly3Xq79zoJF5RLEVpafW9Uhf8Cn06MIJYOK+Zw9ffcRNvUKelTobm+OK9fXFt9y
	 ZchJjH2mRkdOI8J33HslmQAoirXR81NCgH7Xlw8Wom77SnK2sejGjT4HfniGBTsZqN+bW
	 ZNdSVR6yl/kBBwgBk0flDLtWcdD18W5wRCbFsbuYKcepy6jxNPRfD9Hah5DrGNU130S+L
	 AEdezKqtpdwu36+Fh24Lw5ZGoI2ux7+B/4t9qztXXv5CNIkYqmtxAAwnpbQ0Q24sCvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=;
	b=oCX6l9FPXYsnL6snEIElU7pPTVFroGyTv+4FZYJy4nlRMg39Rg4rcwIGzbmX6VIxnu3+
	 6rEvF+rPRHZPSe9czBL+aJdt/D6dlhCAtQqs1I1vJDktJApd0Te9PEq4LBPUWpu25OHeE
	 1YEhCs5sqRQji8RZhl/PXy9e1zPLBAhMnKfuOJ1w97kKe8VtkSq0mnMpzxB7WvAOx8IU1
	 VAqabpyBQ17HRJ/uHj+Le9j9IzMo7GkswzX3w5efV36IU8UkMCEx9ycr0NBa8g+nx33T7
	 9cNeuPf+3v/rVv/P/w1LoHOr7Vm42x5L7DFsn/quUt2dij8AumPM8A/LigSRfmzc9kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB8K1e3o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8AqT+T7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317060A2616
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4317060A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LB8K1e3o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8AqT+T7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqAE1681886
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=; b=LB8K1e3oOR9mdSPM
	RnXEQl7qgJqw2k0bbAgYFxXyJ1+jRbUwcibcelPlyW3oj9lk7hvs0Mjecxyf8wFr
	ujFOIJVp1tzQ6s17m9prDoqJb+SavYf6fOgMblyGYDSj6f8EfeYo5/WDUtLURcgi
	0VsT0Bk3DKv2iw285gDBmCokhrf8iXPwUuvnXm+BL+sT25JP8B9bEphFoJH4BxiB
	HAV34HSw5cdk6+BSpTNA1SzKkgTWN8i6Rd88oBIQltvrd2tHBitgQYsSo3LTx3LH
	YCvRzyX5g/e4GxkcLZmPsry8Uyos6fUcvb1DK1oBUL6m9vYVDzwL/NSKWr2TAyiR
	0WMHrw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t4gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b63b9665so781210c88.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173110; x=1795777910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=;
        b=g8AqT+T7RXOsnmE3jr20PGTdBz/S3MLpdTyhebhqpYJ0qWU3BmNXI7K+xEfHBiR/xA
         +etx1IviEnxbOxkwbGERIH6mPIrhodzq30YCGNaLTpvPEYUXXA2IiKxk9HbUNpqiuWy/
         /fovRJSTc1pqWV4cqebjiE72L4ShEacOkjlEElAMginI80ysN/0LIRZbCVF9xlq1UYTo
         PWAbPdpAtcAv8lAJusDiWkdo4R2rTjPnOs4C9zl9+qA7Ezs1mI16v/8/5XUEXq3GUyRO
         Ux64bWOPlOKtChaoaqqRJIn1Gurc6XOXMGaAGRbwBO6GBCNGbVHJrJ7dP7TQUaD3vdsc
         aSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173110; x=1795777910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkJiU9K7M/5B0olfMctd3rMqA4igeZ4vNjLDXlC9cI0=;
        b=L3EutUrcKhI6+vdGPV6Gj4tWzdW3NH4RYE9N6AL9olVvuBUi54LTRSby/OerI8osVY
         4BatrthxMZVZ2lsE35Rfyoz/r4qMc2UVdqYSLG48ARty1KxSFgdWu1GdzBhzHXAizS82
         ZT2ftOZeLVXnrCJ2vjgvQng4cqgwtTtRQC9f5rBxzXsw9d4WZsxyL9SbwDHy2MaFce6D
         wLIdVfTiybFU20TKPg3i4y+fmyBuEqvGWL8+G1sd4U0h5//uZa+uQRyn57tTaECaYb0G
         6TTkpzGgCdIKuTc6G5ZCyPtR+nI+9MLpFfgP3yDMatbMbBYBB4aOMqwItm/fKTn9GR5R
         ISCA==
X-Gm-Message-State: APuU4Z91Zs99fXvbbnV5BcUAcTEaLYRKpVJj3uOu/xfKuCXtmeibuPrx
	D3V2Ns5pxg7BediknP8LpglwsLoGjMjoRrYgMPA6VZgH5f+8MbnVuzNZxcMxTymJqRp/qCSHfSS
	scR6eJBes7r70GEhDA7ExsoCoioSlzLTmg+Wdftl6/PrNyLaJHG523ss0GQSvTahv1A==
X-Gm-Gg: AYBFou10jqnDEGWXinY1SM0QUlkEhFD3pn+Nacik84QXl5a+VeYPs/qi6VLLB1cV/ZZ
	Kp8YrKtgDZrJL9Q9KZm86sXPyw7kVlVZ1dTfW8+O1BenzBgLYo5j72j673IY0kDBhUTIgeMqZo3
	stxdGNsL7J4eNIW02O0TbRdGqBVeHIttqJE+newL9LkVSj0C789yTSm06/m2yV+w2saS/C0yM3i
	TvHfCRZ5FMrgn7dljtKDpLhKmS8Mlux6+0kEGhA79iJwlnvs2JySpnqne01uhiChiX5/rEstwza
	FMyWaoW+5r/XR/twT7p0/+QAMSnT0s+IqqDyhj/VKpW5Jg1rZJ8mCTnx0HZTRq8N/0VekvCGHdg
	X9p8Mi6qYFGAGQS/rZRcojab+zglq5vQ9F/OQrqq4o0m6chnSYzWls+bIkrlDRZy5HbmOd9ATCo
	ukc1cvxDEV
X-Received: by 2002:a05:7022:2522:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1b5568bc56emr3276842c88.15.1795173109859;
        Fri, 20 Nov 2026 03:11:49 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1b5568bc56emr3276808c88.15.1795173109348;
        Fri, 20 Nov 2026 03:11:49 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:49 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:57 +0530
Subject: [PATCH v7 07/12] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-7-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3527;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=btoycFksCKZ6PMNp1zXewyTnDdYfBgLTtofpChNuEF4=;
 b=5YOI2i+ZclNqs2+JiTB+PR0IpZKhAX2VfEFjccA02pnnZ7ZIrVgtNHoaJuLPegJZSoks7KdVZ
 iA30PDUoQ0zCQE0xRXy6dCAdRwkM8SVLzcA4VPDgl+61e1+/m5IRo/M
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002af6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bRDUUj4eVwvre-8AEcO4DOo7oivT6_27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXy/3LtZhzahNP
 CFtNaOnbLZw664cA4wbKTNGcR1F31MOXXlr1T+Gvd3VD35CiwgwrayBYcOA5eObXq2phK7m2alI
 sxTfXnBedPCEBuA89fiFf39udL5FqF4Qh9GCoOpeBeN4qHSFnUknJksyaDStQa60N0X2NOWEhrG
 yLWD9eG7lqn+ZKOUleja4ETTN4iWLkNSWG3aknAW4WfWEUM59KPM++1iqFXKyD9sKAwloKGbzLo
 DKyOJqqw4CJGla+fwuJi3R/w+bFWD04w3P0Xa9pHVwRQdfDKjhPNs5BNeLYeLcGSwAGloyxKTFb
 HUPU1dUJSf0gg2zuV9GRCSuEyfk+CCryC0j8cWJo5BsndXzCp0UGZpBESxZMl+JL0epifbQjXse
 bia3Aj3HMHBurx97oDYiV8g6ELLrQ0eJuEqKDhn1wm34jxnIGP8QOLq5ToSNQDXjaGk9oPi0rkN
 F1qwEjKbe3BlnbXWqww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2ZO/Z4AYmHIP
 c0PAxywLUWREM4rPISET0ibu7yeKpiy++EGFSR9eFIz2imui1OvyL5L61+IanjR4MvvuqM88rtw
 EwpcRdLYnDvwqof6WwwPmZmD95vfvys=
X-Proofpoint-ORIG-GUID: bRDUUj4eVwvre-8AEcO4DOo7oivT6_27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d918dce2da13a55cd399a68449b6f..68f1d955096493ed6b00c29288ffc42b21bb0905 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5482,10 +5482,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5493,6 +5495,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
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

