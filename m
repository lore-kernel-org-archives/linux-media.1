Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F63F9A1E
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325496; cv=none; b=u0k84GNCHq919vxVwgKPqVFCn0e6AmmI66UhxMAxm1MAN0FsIcGQUFd41fJ7Z93muND6T+o66hTw8Qh0GuMxKRvT6CalkYxo7LkV7GGPv+S64roOnglTJDJEcNNCVztfib5MBayv4WpIM5mjPCiLUZ665Y0xJ807wUbs2E5dGQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325496; c=relaxed/simple;
	bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGULmJowUBFxSLo8041Yro0yrb1rBAWs9seNYCQYE5CKED0ruPFJpuzCV4N0A+ADZ+HghAb3vpBwuhdooW2k0bdpaMD/+e2kp5aRskSvkOa+hq9y4V519IZJZwZGclkQ3RSL5JIJmCkR9ct5IsnjuFcoU4q7I/rdEtgB8XZ935s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAsOj25G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buKVnLmK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAsOj25G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buKVnLmK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2f9L3284739
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=; b=TAsOj25GPSVtV4cZ
	/HOAuRYeNMie3g7dc3xikFe5ZDW2CAiyHAw4p0icaxSyabynTTk33tA6b663XjV1
	e03lpPhk0qEHYGfRKcVYOZ2NyfqK/6OMbqQh48vZ9USwls4ASZl8rZ6l55ug3GDv
	O9KOGR8iUibadvxRxA5pmHjsap/iNDLppaGaXQgVj43OnVmrv21R4b9NzDsCzkCn
	VT9n2siWRZI6CmeSbOn97Aic+LrVpdD7XeWv/PFZlBOXDHXsYQf7uH3gVIY4E0QS
	qxaAKN/dfh1syEopLDv1eEt/sEIMOfRvfdoGVzA4fghCkeKLfqK8SCWqKTUaFx6o
	Td0P0g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cby91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:51:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2106712a12.1
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 11:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325489; x=1789930289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=buKVnLmK1g1UD7Q7mdUt5S2dCc8WivfxA7Y61Km1UDtn1bgNN5WxoHPdpSGPiUBVMu
         ZFleQdDWsAEPfvYvbvd8UAnWwEWNKFL6dCnll+wQGLXpO1A3minue0pfjNG2T3x6TlV0
         HgfUkUtx6IBCUjMY/vx2mpGBTEb8y/5S9A2kJuFbVLsPEbBNv+cHAuqRUmzQwHw3b+9J
         g4AgxTOXB/Fxb7mLu4r9TyhTKXMoe0suovegSjaCSYA3zemMGgz4FLOfR28JLzuHGOpi
         RDnWotQWyayDQhDk35CMOuG4EjzLtCJCGErApQHp4Zz1IICmpvRa8sp0fsAZcLi2xWeg
         bxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325489; x=1789930289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=paNy46HoXffwQe+IBNoZQJf1tG8CHIhRjVFTuvplJJODHrWcZYt9IEez4ZZU5VEIrr
         v26H0Fv4LGeE1ztCFws0iEr1+FEVFa7fTgM9GKtF2Sel0zyY8mI8KmVagqjdJn3oPeUa
         M4vqFg5A119fuQqDGGKBYB2my5WIaQW3VaVaLCqIIv/EUcB9AlfcZbxBiT8MuuzAn79E
         ebomN3fiP9kRFDlHNEKi8p65gdUhb2d2VJPyx9YLKDDR0GkspCawxQtRRDcfdWOZz8ne
         DOeLs4ASxTWiZkYF2ch+QT8jydWV/HIZ726V6f97dabOekEU+7DH5s33JHiDhoSS9TIm
         rVeA==
X-Gm-Message-State: AFuF++mD14P2zjEcGLFY7pmMn1tBpSaEg67maPihV7o9NIrHqwPdWyez
	xS4iFChWy/jOTu3oig8aiqI+AH7+dbJUdj4+Ntlhn7L3lFqQ0t2pPQyqHrq/8/pTfQ4MykL8sTs
	MTqp0+S1ThwR8gK9HS6dh05+PECb9jmp9eYAAUJ/2JNZMg2/3xroJ1mdCAuZaZQWQTg==
X-Gm-Gg: AYBFou0mv6pOR/d3vTDLM4Tr44lhwSj0wOzIxW7w/68rmJ0MLRD4R0PVOJaBAqUY0lM
	F438xpAjaAv8Th4W37P4BY+bLQvELvy/rppon1re0YV0cjN1LcYRe+DQJGmx7BYz2RdSmLTYx1z
	TnYwQ9TH7NIYsqwRK5LFUrmRMI1pU7aSJywo1sLhnxLGawXs46qt+LR88oXvbGQcageXDwVgbGp
	wvoFMjUroiUiftokJvl+yMirZAq+8gu5u0h1Ww/cgqTfb5JQpgD5/VZaEVP/L5rVa/nK9hj+CCl
	pZ66lFZbdwfKhTKCLsAhUFAu2faC0N2JIGnDC+LFEe1NqN5DIhTMWPhSkviDlqe/TaNkWbvu4oi
	bX379x5yKc54JacMS7hBpLOUfeiHv8wSYBzI=
X-Received: by 2002:a05:6a21:7e0b:b0:3da:f32e:b3bf with SMTP id adf61e73a8af0-3daf32eb452mr21465246637.17.1789325489125;
        Sun, 13 Sep 2026 11:51:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e0b:b0:3da:f32e:b3bf with SMTP id adf61e73a8af0-3daf32eb452mr21465215637.17.1789325488682;
        Sun, 13 Sep 2026 11:51:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:51:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:30 +0530
Subject: [PATCH v4 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-13-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3606;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
 b=Y4eeAu0k6A/PwtRusPc6pQKOgvqS3Nq4tR3EDHA8bebt+tl9fO5k0LCZEe/M4OlMMlya8km8d
 rDFwu/fzA7bA9mLcVEPilGt8+xCC5/GeMbmbLGH7nxkzQP7G9Vb/84k
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXy0e0nmQVy1bE
 I4IJjvVgwHhumgJ3+tOKaWvk6ylDL+KeBDoQHQZzdtavhyjZ2dhqXWnn6hXfLH5uvk3+rUyh5m1
 wfmNz/aJ9WWML/aJdOyxIkn0LEdyhVA=
X-Proofpoint-GUID: gaqXoaoqpx4U5x9XtQXcfmxVf-0wLE4d
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6f0b2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: gaqXoaoqpx4U5x9XtQXcfmxVf-0wLE4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXwFPJpKjlPZQ1
 BwpNyYY6fT/4aSLr4YfMq/B79MUdDRfx2IxDv/Veoz2RbAU8txa55mF0meQm4riqSU08FdO8gA2
 6elYVN7jiEzsxofoTKzKwhWbwxxlXdL6QK80513aKUm/KO4cFV9XFUURXKCyZN5JrQX2hqRKPDH
 SI/pNLGX57yD4WYxiGG8pJQSLgQjPJ1Yfp8DF07DpiMirVfrgqGTSzp+/wfroxw8GL8dhU1TarY
 IxBFUAoD5bttteQo6mbzAJb6l46DadGEqwv/fieQJP7gBOyNvoYTntsojp8lpTMit07FtCul///
 HC/hB0cVo9K7/nYJgZ6mJt2WgK1nRQ+zGjp3Otpj0/UvlszQQBMlkJ6Xo21MiKelWX/Nx6tUbb/
 4GuBI1hSjLI+44301of3PMyftvNMJDdp/xwL1gTiXgwFDtWUx7hAFqG0k79Vx5niPy7+RwKTKnR
 jAefZCue7IEsd7RQr/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d01413b8e86be3f6330354aad05f2..2e1e07eb5b6aa49850a7a5572ef9e755e298b799 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3025,8 +3025,6 @@ iris: video-codec@aa00000 {
 				      "vcodec0_core_freerun";
 
 			dma-coherent;
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -3059,6 +3057,10 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "core",
 				      "vcodec0_core";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable in boards where the proper signed firmware
@@ -3066,6 +3068,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

