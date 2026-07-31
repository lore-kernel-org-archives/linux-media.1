Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A01443A92
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522218; cv=none; b=pYOBDLTsXAvC9TQOxquMoF8ZsGsgHRgXjPwM6AsVhhAlCDW4iKIn/7LsMXWw1B8s+FZVNximaqSRTvooC3cJ59ubaDTdPM7Ilmfhisc0zL9FDPtQkLsg7KPgy7b8njFisoDFumWJLF1kMGvZgx3fw9+MaNupOSO8X0HjShX4J3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522218; c=relaxed/simple;
	bh=7GkakuOJdRkFPA+6OFBxCS58bYN0JjcZvMyXYPr9oPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osOpUDvHweoKGoJEtros+rvql0v9AuPt/uP7dxfp+8TZGaMrT3yLdASMbV0YHZMwb+ZX0b5b4UnhMtTMXFYrj20b7hiejMQkMZZE1mMv/HTjUvjT2xvbJrKzmgb2r/gYS8uiPxEm27+0DBtrsVlAgqmdIw5/72Z1AtGPl9UO+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c64u8vZt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTkqf7BV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c64u8vZt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTkqf7BV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOiJs404127
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7dnIguR/YDtVMUr63d5AvzOAzSf8l0wsEQYArBzVEY=; b=c64u8vZtcBDYrjrF
	F5L6L++omZoe7kwiThdPekQ4Kmf97qVNackrE//8aHodPrGnHx7P4oNGHRku/v0L
	+HOXvBLdwj/EbXR3I3XMZgPypsFyyl+t/VfxDnwht8UrSYL/Ssmi68HFYQqvRDvb
	JsDbov/WqsBqgFQ0KP33L1foA1QGzw0vbKk7/KeySWcsCx0L9la9pnBFuQumS130
	33q0pmoAc7u3j+07L5Fk6kXjp6GPjoKgF96Q/6T0dbcX2Q2E+K8FW5d0EKHIbRUN
	3orai0gPo+k5WbtemA9j+AM5cLTYWPNa2HjEgXUcpJxauyWEi0WbvP67F5U8uRc3
	8wS4nQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkhr4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1368293a91.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522216; x=1786127016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7dnIguR/YDtVMUr63d5AvzOAzSf8l0wsEQYArBzVEY=;
        b=KTkqf7BVs20bR+xNxIHh/B4ftL1T99xgEk57LeQ8LuQqcBFgYyyyKgnz2lggfTBiiu
         ZneHHUBBd7zVwCeWpYwKOagAF/UnXUq60fiS7zFnEdZ3s3uYX2ICO4JLHnIjw03vhKkr
         JrBf4FDf1XBRCj2c0df98EysALfm8jbCYdmyy235cgLZix8uTyGXmlBcaAExKWLSSJzj
         Lmp+xIwAcl8DkH0RyGE+gpzwq0ZAkoalaXqEohCe9mRWbKt/pMQSGMIEY98uOBoW9qKV
         93VeLp8DTfk6mGwwEcTns66AH4QbepMB2lNkG5xUJG9AeRfZLeqmO95QVmyYDUyXax0B
         mT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522216; x=1786127016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7dnIguR/YDtVMUr63d5AvzOAzSf8l0wsEQYArBzVEY=;
        b=DE9zQW27galXfjMvB39Tu2SlnouhpfBsd3QaeSH2z2gDtF35Yq9XeQk3pDqIpqJcTH
         zZAoEYn5Bhf+wcd6AXVrdfJTePH6fgbwP1d8Qfzmi8rZVNT4Q5YNSAGZw0cRZ/SwiLA7
         UKelHRSPWfaN4ntafCr1TdHRYmLu0DiDUjjCCppNUkWA6Ub8Yw1Kn5SFXzvRz85wVnC4
         jj9ya4VmSmtlzqVeAjxImn82mUzdKlP4EXQV3vXPSxeLvnnJ35oaWhiO/HDCk9Ertyx9
         Pm8tS1sihcZatJ8uXbaW/msP8PJVCoNRA6U/bPS+8V5/0u1QVc37EdmcBdCA8bD1EyXP
         7Bkw==
X-Gm-Message-State: AOJu0Yy5Kb3cAwZT2nQNi9B/4it7CtHkAxAo6Bu/zkWR/I/EpfevasPR
	2mipL/0pNF6qWj3mf7bcG/5iDX0Tgypgb3IV0RaTmt1/4O69meF9jvWR9PJQogQFXV2NElFOCfv
	lUU6ZmOmt8UKfcu1+nrX/Q+vQvd1qUG9KLiOsuYppqMAUpMvOR+dvBqxtuoP4PnBGXQ==
X-Gm-Gg: AR+sD10ik0vP/od1E5as7A0dmbui7m4f3GaIHbGFhXjcZllEElhhr8FvgwHXB24Ir3b
	fq61JyaP9WqLGhKYuZBp9bqwdFAFEVA1KgWH5DHU5NiUPTS1B2R7z7XAyRmYSAWBwsuEc+woKwY
	du0sY7UmWtZj7/MDaWMnxI7BD8XkxrF2GYd7tcDeCuejZr3VtCBLZUjuADPWd0eyL/gGc0c0ONF
	PI4Or8D20pfhJVxboTGqoB2Z6TN+5VgxGtRfkqvI3ruDtl9RDUMsNzwtgLdxK3cSeZK6zrA0JwG
	SOcxw4WmFOlWXkpaTBUgK/oq3Xgm3l7JN/1dLekv0M0iVlK4ungIGaVVWTI2hiHhZUznmr+E/Zu
	PHeRExJ9RlixVyuoR4JCiV92bbsSLZMHyZvY=
X-Received: by 2002:a17:90b:3a8e:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-38fbc3f09e8mr775546a91.5.1785522215800;
        Fri, 31 Jul 2026 11:23:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8e:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-38fbc3f09e8mr775492a91.5.1785522215295;
        Fri, 31 Jul 2026 11:23:35 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:34 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:25 +0530
Subject: [PATCH v2 10/12] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-10-da52b5228dbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=3592;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=7GkakuOJdRkFPA+6OFBxCS58bYN0JjcZvMyXYPr9oPA=;
 b=ELJdyea4TbuSk540Ro9ABACaFHRHZxUGqRkkqNYI3/a5remVsZDSEw8NnsH9GY+fJI8kEIXkI
 qMPVSeArpLrDFBCVVXmOMGdbVhAPBeEQiPuZsmMLTfYr3phpqnON2Xt
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX22aQ2AcYNs3l
 DufGi/2XrTd+1zr95M72edmlOjPE+hnd+JgqaNwsTRq1z6eAN+tTCiI680HUSKFee7rmXf3Zt/W
 C0T62vhDMzL4ywybVPx43NGA6Vr7vG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX6fg5qZJbF6Oi
 q3//chhDESvgLwVShbbGoGvRXt1g/QnNpSUTEY31QyhYMOHWyPY+DQpp7YOFJiJfWiST4txg9g2
 ADQficeBI3H2dEnv8PJvU34aDKTXnb3RrJT1hciD1YX5Rp2cR0uws3sfsUDEW0ZqgRLFI3Q9N+v
 X4gVQuJJQsGb/185yj+j8EdLuSCNAQatIYZ/qZMOq/7lhqrDRrYQK6YP/kePVgMwpAnJN3D8bEE
 9p6MMQBhhGdEYlpvgo5V3ZqvroLw5CUghIiLBeWXjVlC5sJJLHO3KsIu1ZGV007Jy8+T9snePEM
 XYwtdUYz8yoxKA68Dbadh/wZPq3RHMnp4otrMkFF37TSCB9koGGGxaAPKa6PEs65Pp3U1w4O0db
 Nc8hh8oc78cHJcX5zrwreKnsrUsqVhtQjWyOMdmY9pqg0ubUo8YStXHtc0qbSRSrooOjgb4Uve8
 L693pTlrpmAVYVAJnLQ==
X-Proofpoint-GUID: D-rwwgF9RSCXaYQKtjSyfd1ffQL7Wxr7
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6ce828 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=v0Z7u7uCyoCEKL_A5NIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: D-rwwgF9RSCXaYQKtjSyfd1ffQL7Wxr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
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
its own IOMMU domain, with stream 0x0880 becoming non-pixel and 0x0887
becoming pixel. Point the non-pixel subnode at a reserved-memory node
whose "iommu-addresses" covers [0, 0x25800000), which excludes the low
600 MB from that domain's IOVA allocator and keeps its allocations above
the boundary the stream can address. The reservation node carries no
"reg", so it is a pure IOVA carve-out rather than a memory mapping. The
pixel stream is left free to use the whole range.

The video-codec node also gains '#address-cells' and '#size-cells' of 2,
which set the cell widths used to parse the "iommu-addresses" entry that
refers to the non-pixel subnode, and an empty "dma-ranges" declaring the
1:1 DMA translation into the parent. Both are described in the common
schema change.

Fixes: 7bc95052c64f ("arm64: dts: qcom: sa8775p: add support for video node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b5192582e0bc9ea248f1c0382e05030..04cdaabc14881ac28edc11f7f872b3cc49f1efbd 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -861,6 +861,10 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 			reg = <0x0 0xdb200000 0x0 0x100000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -4961,12 +4965,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges;
+
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

