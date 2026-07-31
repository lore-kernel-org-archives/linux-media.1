Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E646F498
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522211; cv=none; b=r2OXu6RbKonWA49Cl1DIuvpeYeptZIMHIwISx8IRH7hie7fiMKEwNPT/yfh8wR6j6ndLW8VTuDeG1TRrxh834UqJh9FKvgZ2MfWbQ7BV2v64Wrzt42Ipl8vxVALNiBN0d4r9RCLm0WwYPZrRS0vMlFsMX/LNjws4ERTfk6tNBqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522211; c=relaxed/simple;
	bh=/gA087vWXx3cysR0t7T28Cc9plYicdv119MWMNJRVSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llBwjmmZtWsh6S9KKg2KC3uopQ9V4e8Z4fv7gpx2raKgJMB7HFAp4N5FP6qehNBS1ZvCuqSAjaLtBGPW5gfFe4HC+KCy+4la1ZvLgpwxbSOccmxvcey+YaW8WQejO7HrWYSKberqz3qm7RnUr9KOrEo/qGdcMasD1/7KfUP7wU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWPisUUD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4EclKK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWPisUUD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4EclKK7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOGKD3879527
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SxqM+Trj4dAGImSxVYbpUK76qL1nNxwjzbfp6Pf2bc=; b=OWPisUUDiRqzBoKK
	s8ANUgtHW19EClNguhuMHtBSCIB9gtjZWO7s8fQy43PSaUKS/vBCyBfIi/D+iI+w
	Y2W0ywnmVb3HWWILGX5UZVgTAFLri7AW/tjyOcNrFs63DR9o3O25zVV0LbxxpjK7
	MXmUPYqX/HWbiCTwQiZHmfJTmpL6AysRgFy1kNA20wvikNuL9Cmp7uQXjJUtk/h1
	GIv6kRG4uR0rQx2i3ou+kYG/lfG+H1V+wkfmhqzmHJu57hFb7j8ZMDeyGGKBAh/R
	4lKvQ9XERmrXM6Tm4v8+Y5BrvJNHw2veNuBrWdNrmBlmqMjh+1f/aYOY33UiY+Fj
	iUFObw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y1tt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1474644a12.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522209; x=1786127009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SxqM+Trj4dAGImSxVYbpUK76qL1nNxwjzbfp6Pf2bc=;
        b=T4EclKK7ovh+lvT+1blT0uuf+1soVrAw7UdzvfQ//ButUK8LfMiUK9iOoHVlCEOWh5
         ymRofKLfRuErmeg/62/ZQ68NmB6Xx7xG+5awjrIVJSaSQHZRgRd3l/GLT1eRrJWf+AhF
         zu+DFinqmEnc8br2TvHd3UVDEdzjDD5xiMa87ZVhkmw1uXwc1hR51Nq/4ghtZFlJjORG
         Xmwakl6uyr6mSbwjCR1O0T5UlBzUozL5/HcgpQ1T3zyhl6LxTqpfqqG1ZILdnBJAAjo3
         Hf5m2ZKQ/EORVQaKcSzs7k9qtFb70A705DCZVdjjRBCt2dcG1RpwfsYEjw1iAyIdH0MG
         CNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522209; x=1786127009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SxqM+Trj4dAGImSxVYbpUK76qL1nNxwjzbfp6Pf2bc=;
        b=saVh3MaT+zC30BcE2K4ewK/4b+mMtnKVNWLyjG662xypFhaPUVP2K5AYl4TfC3ipy0
         kQTy1f59O9v2ieTU7/F0n089pGNjgqsQPN/xNaKVCogPP1U7zDkGw1Dy/RH28XQhSC6f
         MHTx0KljOsGxG5QGB5Z4M0wIWznwMcOvDM7r6NhsyN0pABq2RM+z8ez6gCyUg4ibcC/Z
         yh1EEa2EAamh1aaSNE48NP+18ZZcvQGgB/5tA+ozTl9YPBlWl9wmOJa8r1+BXX5QiP4u
         lpakWSIfumNWeGMWEb6Zej02LRom6a9iQj/uxau50g3TX4+G/+w4E+0aYX4UG/gCnPf2
         kR2Q==
X-Gm-Message-State: AOJu0YwaDCqa6+MfYkOA2mx10nNGEGLkRrEFK9ltMTd1e+dGrOlyRcCy
	LFqiYUtsU1icoHKR9L1EGL6FtaEpqjO/9e074spgP7Ygkwhz8YRUfFAV9miRmnX9eoWrGuvDOi9
	tttmxgn19bq/+Sa9B/kri4Wv/AiNReDACDHorUYLbtM+RjYxab+KdzcDa9Rj8FWDbcA==
X-Gm-Gg: AR+sD10eS7WD8LxPDPG3BPts9fqeMgw7PbIcXxY55xMDenZimw9Jf6DN4zGOH8WZMXM
	C+SbAqeeh8S9a6hYDFKxj/M46oPtfWJdEQTrocS01Qi97aJkdMUt8kPOkKIemEeZfYIfVX9ukDj
	ElI/NhPm92TXGy82Ym+tTOhKH9Rj67F9U7lfpmFuZMPfVkD9SaN2PzQRe2ELAAg8T2Uv/NUaSC7
	vr8lgZJHZJrYXH3NDVc2nZ+ZKaUdrFO/uPCPV8MgTrawehRHRTNJuN+L7tM6/VEdtBSgEeqQNCI
	xPpjaOQhunvCHNp8CzvE0OiNGw/pCegIBmBUEYq4vER3RkjXCNqgSfBpi77eO2z9nl9FbHK9I1W
	aiExOCOOfpyiM0jCf3TBRyx56iaaV9kHVTRk=
X-Received: by 2002:a05:6a21:3a47:b0:3c4:46ca:334e with SMTP id adf61e73a8af0-3c92a99421dmr715585637.72.1785522208750;
        Fri, 31 Jul 2026 11:23:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a47:b0:3c4:46ca:334e with SMTP id adf61e73a8af0-3c92a99421dmr715553637.72.1785522208292;
        Fri, 31 Jul 2026 11:23:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:27 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:24 +0530
Subject: [PATCH v2 09/12] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-9-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
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
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=4532;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=/gA087vWXx3cysR0t7T28Cc9plYicdv119MWMNJRVSU=;
 b=ZfRFhIFjfQBJoYr/Xb8PoF7aNBa6yE9F29xx5Lw3Pwy7Jwyj/dNrOULUcQzG+YspmuGw7Snjq
 aR3uKvBJuHKA1PvP88fTk3M1CjZpelvj3VLHUXtiUaqOJ6AQn8DiW+O
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfXwSrl9j9M3H/v
 JY2vKF9OB5MA8tcy531XH5kaSHjnr9aQkvqQZno4t2qcM/T391XajPF4UKWyJMMlm4q6WtfhNZN
 flCaccru/DPHYT4vu9OaX6Ecryms960=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6ce821 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=dye_ZhmbRBr0AdBEf-cA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX47i2h97CDVZb
 bc1tlpznjIj0QqoXCMLtT9DKjlCctzt5AF9T1RGBEu0x7DprrJzfjGCSKgHO0akLblSiVzFL49p
 lCAJbbGq4NBTigOw8qSKyYx3fUDr2k/SenRAphHp6HyzhJ4lisU5kFKBCdTZ9UTZf1bbJDc1sbO
 Ww5+bSwSrrnDRJD4TIgw1lpwDaavoikGb2bFxEwDqP8YSFLgOwBvcdOEjqo1x0c7HiaiFA/692X
 MWnVC4dya0YANr6niq+z4ETaWQ+hf5kQeKrzGGwUEZA+tAkPMjQTEWdPB/pTQxouzmUTKx54vyk
 wV0tpoYk1kv72t7yBvO42/L26N5PcCU4B11EAV9eKfCV2Dhg2Qw80EH117QOpf1nokmKIwoJfoM
 ysY3CGNYECN8omGbyTo33/VYI9e4gCNjTIHNinvL4BkphrS+/kB578RCnr7delVq/wSgwo5an3t
 ZwfouT5QOkqw3Rzs7dg==
X-Proofpoint-ORIG-GUID: lcBkZh3dWSjDMFGN-lmcqZ76E73lONXa
X-Proofpoint-GUID: lcBkZh3dWSjDMFGN-lmcqZ76E73lONXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer above 600 MB. Once an allocation lands below that
boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Describe the two streams as "non-pixel" and "pixel" subnodes so each gets
its own IOMMU domain, with stream 0x1940 becoming non-pixel and 0x1947
becoming pixel. Point the non-pixel subnode at a reserved-memory node
whose "iommu-addresses" covers [0, 0x25800000), which excludes the low
600 MB from that domain's IOVA allocator and keeps its allocations above
the boundary the stream can address. The reservation node carries no
"reg", so it is a pure IOVA carve-out rather than a memory mapping. The
pixel stream is left free to use the whole range.

qcs8550 discards the inherited reserved-memory node with /delete-node/,
so it needs its own copy of the reservation for the non-pixel subnode
phandle to resolve.

The video-codec node also gains '#address-cells' and '#size-cells' of 2,
which set the cell widths used to parse the "iommu-addresses" entry that
refers to the non-pixel subnode, and an empty "dma-ranges" declaring the
1:1 DMA translation into the parent. Both are described in the common
schema change.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi  | 19 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
index f0acdd0b1e9384e684a90f7f49cf63633cd70d53..db0f539bc3d0a2e83b58b3929a05f0e44d9d513f 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -158,5 +158,9 @@ mpss_dsm_mem: mpss-dsm-region@d4d00000 {
 			reg = <0x0 0xd4d00000 0x0 0x3300000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7599b7b7e645f389f817c2694317ba12998992a5..4c8ad7f026fe536fe6dd69b015f1e79edcbb60f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1087,6 +1087,10 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
 			reg = <0 0xff700000 0 0x100000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3690,10 +3694,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -3701,6 +3707,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

