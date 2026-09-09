Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1D563FBB
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965860; cv=none; b=JJwI17MyE3ZrIdT2KcEzGZ/pmfdm3Y1zXC7Ls05H6QMmfrGaW/G6EUC2wt6nETq+1pYyxXyhP5u2NfenENHann9sgejlYS2/T2N4+cNrgH43OCjoRKQu61u9rVd/7QZBaSyJY1AnQjyahisU1f86enggC+HgLUFc2xbWF8PRu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965860; c=relaxed/simple;
	bh=ClN1HxPqioNiIjlqriHYURWSJ/USriPE6SkA+Pha1Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGDQa9JweN82VX/wK8AEuOs/RAEE1858+exGqIIffQzgALE++P8QfkQw4PByL0AtbxR8o7/Wc2Ojt2IaAMemNYyjBN1tdBjrc01YViW1L4Y7mhQNCVtFNavgepi6tIjOWHPTY0gK8ikJpHBrgekUkCu6HZ3KRACZH9AVmayUiFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7cpT5/+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYrwvcwn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7cpT5/+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYrwvcwn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7aY599840
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 14:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3824liDhpxEGBtUO3K6ahqQxpsQoUAznRXV0ie19fc=; b=R7cpT5/+Yc7NrvIL
	JJW2TMN97rsPWYV93VoCeucS7uxtzd22TBT7OWVU/XIEqs2O8JEcfQdbcnwP5mWE
	L1kcv236rmJapkN1jg+ZsOUg4d2Bx080EJitVd6JxneT3AYgHderVwuLysYAoEpg
	Nx7UXfihkk2tgUjvLR7xmfqDQmSjRF5xASYM1t5AAm49AQQULVWW08rxn30nQnZE
	W037BLYfJ9tlAbyhCwSieluh5Sa1+Momf846Rk+HDPkD2XDHZ6ynN5zDxs6M3p9b
	wDVOaTw5PtxiYTXfhr+ByrRj1vjkov8345PJoDILUMy50EjvJCftAu3SbNCh0cVC
	+gwEKg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2ycj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 14:57:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so6903648a12.1
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965857; x=1789570657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3824liDhpxEGBtUO3K6ahqQxpsQoUAznRXV0ie19fc=;
        b=KYrwvcwnsMLJIUjx3MgyYA2xHU0iNqTSfGB0e33gCuT5aPl8IRrfp/3S66WnHAhvER
         npmhugz2qIWCf7Pnd7INxZMH8i7NI/eHKp0B0ctVce6rLKhwiITHenT+/uwKgp4KM8Ee
         71hb6CUGZdgaRYnUlVYzNvFQSSlvcTAkpl8dobFFtK7u39gH9LA2xhVKIPwcDOEY4ppB
         80Qkwd4lkhDqG6IjBcuAU/R5f6zuXRRwoaRI23Jmc4sjS4vFhPUcDuYTxENw/M7xNzDl
         1ZjCB+VHSwYP/dTOQVSWlbbofSVl45Y7XtwExR6qnrpAT43nX+5jIvaYAz/MFEo40RT1
         1Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965857; x=1789570657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3824liDhpxEGBtUO3K6ahqQxpsQoUAznRXV0ie19fc=;
        b=h9ykr55P2o6psXg9YSZr1/V0LyVQ+gQvWcLCwXjHmfnc8RE8k7aXaQGIUar0Bv1KxA
         e5bFH3TeDaAGclzKyJCwR+BMnNA9E03azz+X7ktCBbQfDp5VRxjCT5kjmjHP25HMnwhV
         OEq35Scb35Xil+DnBzE6QOhp/S4zL2gjPBhgWCsQ0F5Feyip2CYB1RZpstCRFWPur71/
         xUUrzcSdWxP9PHqdh3vnknWzDPMsZJpk2awRtwZRMAC33kDy37N/tBxC7S6xuK4BET28
         zGmz0hOoyBp8Pmm/wiMODfK5zY1u8ZjDMszWcFf01bMm8xF51dMk5nuwBwvkzsqU4fU+
         uw7A==
X-Gm-Message-State: AFuF++mYYXhYw7MHZSk+h463RRxua0qtrldMkrLCXj9vXI0xcpC+elWF
	tFGhGFnBCngeA02hNoQG+x2BO9oI5enP6MGFZ3NqGjqohn7rCT6Vx+9PR4IflPtjt2voX+Q+sul
	ZYB6WGCE0znMF3aQPLM6js3WWguuNgYAtcESe3sc/aOYaErAw4YNPwy0Ww/uE7OiaFA==
X-Gm-Gg: AYBFou25c6CqGuaLuM+FyDDTOH+B3396mEnR8jmA2HyJGjFnbS9U2iEY9h3wQQvwAOy
	CWAo83ZDWi7arl61QVhV7BwKXch7FeTchcI1jJoHwkxKbOw+X1JU2aV+vFepVtRUQ7c5kA+BLlO
	pxTbFc9KgPeHq6mJ4ZRr+DAVIZHzs9JhPQqFafX8kp9SWOz8G36ZqvgpK+H81GYI6CvLhtXCEfg
	fydE8m1RO6BGDMC13y7a56uPGvmUWapysxvg/uoGv6XpCYPC/Q71HkbN0fvT9MMvfcaHo5ZPQhz
	NCOXhOVryW1gNbyh6XR8I6mHvCWV3z7RqU6Yj6wctsnyIBnm1PpEcnwRAZu6a0r6Q6HSgBTuhuH
	IdoL0eh8iHTsfUK56V+k0S2TKKRBifWc65oA=
X-Received: by 2002:a05:6a20:72a6:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3da39b3a6b3mr50443075637.1.1788965857335;
        Wed, 09 Sep 2026 07:57:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a6:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3da39b3a6b3mr50442961637.1.1788965856678;
        Wed, 09 Sep 2026 07:57:36 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:36 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:08 +0530
Subject: [PATCH v3 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-1-2fe43ae45495@oss.qualcomm.com>
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
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=6191;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ClN1HxPqioNiIjlqriHYURWSJ/USriPE6SkA+Pha1Kk=;
 b=b74xqKaGQeMMbMBnkJ6h6gZyHbLoxYz6ltfwWDTDCXK3NsNerz6TlxLTZVJlMPf8JHcFz39DK
 uH23C55c/I+DczAHj7JXx0Du/xr3KzDUA5jr8rPleYKS3BLYvIens4M
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa173e2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8
 a=EUspDBNiAAAA:8 a=weiu3rfF03DHpAy_C5IA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXwA1IigzqI5mt
 /QFf5PBSZFSShi5PNnqBNCF66Mp9t8cj5wVZLKmkv9gPJbkJPuTBvINrnUPlGT3U8M7jjJK6Rqn
 8i/yJwUnfZ1YzVvf4Uldw3FoP+8DtT796Q9XVyV4lSQY1l0oVAm8QYdGpKtVi9snNtn7pQiqfJd
 aW8ORCUbZiVzpdxqaEgOjrLnwPp0mi5APHQZsjcguAoG2AJDexgBmL/fkanJLX5AOdqFaR4NGM1
 6bqRP4IN5hN1Q2azlv0ceBm2Ia7YwpPL9ypgaYZAoguRU/nk7LLTwQsJv6c7HLCEcJhJytFFwca
 hnQhU8v+DBqlnmtjtubDlAfFp+E7nZWbKON+oGVj+7v3NuWBI9qiUFZI2GNVxyYARt1UvejTBC1
 GSbn8c7ncAWSMkMMIo0ZSOHrME1pLKL9YIt7LH1k2cdffHubh5RJJmkB8FUGU+QraWSLp7rVFAT
 SwMuyx8GLCi/Lu97KYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX4xaH1SPAQJD0
 s/KAS5aanfQSJL7Vg8dGHsbbFKdaJiv+qlRImZ77ffn0EFonArGNmoyjrfKPGPKVAOnG1wI5t2Y
 GDisMXSdeHUNxc3EfZjZCFGprhKk62U=
X-Proofpoint-ORIG-GUID: UztF03xLe6Ce8f-uvi6CpKclB8NzOYzb
X-Proofpoint-GUID: UztF03xLe6Ce8f-uvi6CpKclB8NzOYzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
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
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

This patch depends-on:
https://github.com/devicetree-org/dt-schema/pull/207

 Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72cd5ae6815ba5c82 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,6 +47,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -55,4 +142,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

