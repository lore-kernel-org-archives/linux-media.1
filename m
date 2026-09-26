Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2A39D3FD
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404566; cv=none; b=Wziq5kLM26i2iOrj8OOVbvfDO3JtA2dL1/9gvFQeufD9x7hxP0VFomXMCZq5ToJJtg55lhAbnykUvHakh3WcZ7eXckJEgO3B2BVwnBS7vdLFbGpUItxl/jdi4kcmY6RuuZqbf+qFjGpBhBwwlBiqPZxqS4Ma1jufkpX4Q/AVZd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404566; c=relaxed/simple;
	bh=zcX24z1Mg5QUNS5mW/qnvjI3UqwCsEZvZHUBAgeTQ9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHzRN59KkY9tdwMGwCxdR5AUciduSNbDGG4Xc09dx+G9VvMrOYvEIhDpSw8l8gOxwOlX4Ky7yRhBE6X6aFs32nKrhpVYqLOo2R9PNjK6/zrQkIzQHKdXaXZv81FvvFEMpo1mafpcoYjAkGLqSybk7fSZ1iu9zPlKBBEKNeYEMnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHKr3/+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UztvOYBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHKr3/+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UztvOYBe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6PZST234932
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8h3Hw6tUwjhHBR6HOeJy97W7Dl4s0kGI3eTkxjQwwac=; b=jHKr3/+/FxxmKjkc
	a1xV0y6ZJRQMa+of9DNnjYpGFdsk8+z2gwMvmH+W3PwSSZKI+OpcXo3emQgnqjjY
	BSqZgjTmNvlud1KHK+Mqm/4K5uhco/XITRbocXSPcwc9m6gqSebuwxWYzEHZQsLa
	mpeP2qzmgz0CkHOXFeZbmMv3WyXU7TYH5AYQJGKd2DYPoq37dk3ecL/IarJsmOEN
	V3LY79MRGHYfJGWfNI2xrwUq0cpShgQUMd0KOI8GzZV2Vke53DPSDHsDQmmGRaSq
	H8qsqs9zQPRPJXi3Gv2ACJw0Ln2A6jpC7AFBbgBhDyxXndDu0pAiADwCsIYLp+uV
	8ueL4Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfrkkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:36:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1466ab2bc8dso3092313c88.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 23:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404563; x=1791009363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8h3Hw6tUwjhHBR6HOeJy97W7Dl4s0kGI3eTkxjQwwac=;
        b=UztvOYBe1aQfCKKh40wKEPFokn1OPMU6Rfpib7VUMEMPIzDoAJVswhWMfgmZRTpbA6
         xff2gOH6Jhc3Tp6OuyDYbMgFCLK7Dmp1VKTf0/rkmOCba0Qc+WicTBRMn1g1GCoD07MK
         IgScTrulKCmo+XR8M+gZXvpXlOrUwJaypxeOTrXxsRuRRR5LPZMoQkCkjFYzPhaAM/iw
         EKwA4qAy0ShS3JwJDp1viRpgot6aEchCIoSibtQvoY4SImDvRaeILW2A3dr/nRmtJAVL
         C0cfbobvcYc18C4d7y+J/dY/ZCCAW6jDb1AUeMGIfNHxDHjMSJNJHoVeagy6rQRlBfHv
         z4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404563; x=1791009363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8h3Hw6tUwjhHBR6HOeJy97W7Dl4s0kGI3eTkxjQwwac=;
        b=abeU7o07qlpdWwMvGK3gq87k+HkL0DrOTPyyVz/MMdRXK+jBi1Ynx5cz1OZ8a+3rpv
         J9ki3rwLfaFCwLz4P2i6v35NwNNbJXh5lW61yZa1qgdBLJI9KGcIISzaWh6bRSI1jisz
         SidRl+YKrA82TkhkWyNAt+p1JVc5sIp2TrbxoSiLE1Erj8AnBEU0M89S9vSxJ5DYoDXW
         L5HfNQEDWlbMtiPgHtn5vLlj0XWHMqQa4QX/69M6T80Vbd3XtXw/rylcu4rN7mY/RGjM
         QrOERb6uZaA8vhU7ipvCloeLBtoUr2PkDTEbKavVTn7XWBrEciFlV1S+i334uB1OxsQ3
         Phpg==
X-Gm-Message-State: AFuF++mkPQM8gfmUOpPI2E/U3LbGbCo+WS5UnFoCMmEegECmXcAgxqDd
	GbfLdVvCLazZkGIi43ADkhIrzm1QtrjhI7s+9V9SxnA3CuFMd7AJrTx0wGiI9aXwDEraX/EX9Tf
	rVrXTNzafL9NJvBclmn47MQEMxs/4hrD6vPB4xBX2HUEfFqX4J12GEDXHrr3rA4L64g==
X-Gm-Gg: AYBFou1nfJbAHIGT/QOgMboou59cCBrwfDtFunSQ+yH3kZdN4WEhBbtmm08jq4y9VEJ
	rfv3BvsaJxR3i8ePmcsk4cytr5hhi1hnzksc+IxZeGU0dKZPX+8oC8flIYxFzQj+49r1DA04VmG
	5BLeHH9DrqntTY2CUK4kbzNnWjkLTCB0zdi6BOmhMyXZDqDoO4hdu2PX5llK67yVb0a2+WN4BYw
	6kKw9NXy331q+OboNIN4d6mRGS4NMFDuha7P05wZGfz0chHTzXIbrdm246ruCXZ6SqXPp5GNimQ
	D6R/I9jmL0F5npfeLND6zWDFAKZDSmcz7HZ/mtxr06PHMksjzWMJlo6P6A6yphZvTxDz8PRoMWY
	XGTxbbnnQ4RnjH+Ybd+UrQ9nR1QEFvOlaUQ==
X-Received: by 2002:a05:7022:1703:b0:144:f4a0:a399 with SMTP id a92af1059eb24-146ce775c78mr2231253c88.1.1790404562875;
        Fri, 25 Sep 2026 23:36:02 -0700 (PDT)
X-Received: by 2002:a05:7022:1703:b0:144:f4a0:a399 with SMTP id a92af1059eb24-146ce775c78mr2231216c88.1.1790404562203;
        Fri, 25 Sep 2026 23:36:02 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:36:01 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:11 +0530
Subject: [PATCH v5 12/13] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-12-0322ca5dc10c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3374;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=zcX24z1Mg5QUNS5mW/qnvjI3UqwCsEZvZHUBAgeTQ9E=;
 b=CKd98yAC95m2QLEjpzTBnk3A9uK7M0MDRzlIoOi8jjmMuf85VxbIDe89cKqEzY7VEeJsjOhJk
 Bf/1oX7JekPDzEtBq8YYzsrwmekBao0E6s00wMBBBN51cZeBzH0LG4J
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX0bz9u9PHEVwP
 +iW2q3XX0QHo8mjNkT0flIwLORRH5odZVYyE+4Ul84529ULzewxjlArX1gNAW8r3qWF9naAWV+3
 LOpWME3EuUZSpT4FkgKYEY6P/o9Y3Qc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXwhVqEVraPzc8
 ZWKkEho98KF500k2tgNuPfiLSA4tlvcKo9XAqG1aKzwNCOKVWJcE+rs9W0sUs/3rbP06Enoi4nt
 HnQrATD8zPktCNHwJ54F0Tpe+pXB5c1aZpeWgvZ1N1FIsz0U0ibvVfmaarx9tw096Ts/vFOMpWP
 HnyZi4GupDctEcI9Y3pmRxCEb8wcteOEkTsTuLKTNPvnuJeRbZsnrO7L5OCMVlTKOkQKpdOPw83
 N5Kq4DHPvxKna4uSQsLuQBos3D4rpoGnRfV1yQlEkvukAArTWSAX/st+ZJLCW+RDG/dzpNvrimL
 SY+MEJRsvlpgWbwznR6ROEwju3nQVlBsOiCceiy/plFsTU6CjLETBGCQoOVNRooTcdXLGBOiBYf
 varKtRCP+JfifQTyxau9KdG/VWBQmlicVWvlimDZj35Qf6KIhm72+eiD4D8+WiO6BYz+Df0nixy
 /xGlmXmagdLtlPJtoSg==
X-Proofpoint-GUID: 7Y-0Gx6Flvm0QEoFXWClcecIKnaHPN3l
X-Proofpoint-ORIG-GUID: 7Y-0Gx6Flvm0QEoFXWClcecIKnaHPN3l
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab767d3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
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
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 4e317c422d92ed72dca8bd97ac33c89f9b462218..078115d57dacd5d5f407cb4592c989ba0e9f78c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5274,11 +5274,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5286,6 +5287,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

