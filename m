Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF4560AAF
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965878; cv=none; b=mgV/E8vDUs/ztZD8Yxk4AispnRiEbG/HouD2jeVLwq7MOcR/3rgBO6IHy5NO6sbixN3ZpC8wmiT+vmwSJPsA3xs13B9JWgjcV7I5vjTDDtnrQg64JI9z135T0eB+gCE0eqEiBXNpjhdVBpsUfACNLovuih8FYItxqgWAXuW6yPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965878; c=relaxed/simple;
	bh=7baRWPtsYeoomfoQ8Y6a+HLrwsbvQXalHqJXcSV2Ywo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9o+2a4PrYnYANRcfSWbeA1A9aIRmuSvlXrB63JSttyjYzcVoMUiwunm11zllkLtxeNgn15kvKSShF29NYlLhq0+HtK33eje5FVbcUdc7eyM2OTAp/bKlepA6+kwTl4yZG7dN9asX7q1Z+2HQxn/nGkSO+O7vjiRmLtSPkhCusg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ip2gGDTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0fvmH3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ip2gGDTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0fvmH3S"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU59J2019247
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 14:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9qEpNa8CHpShSLw8mXVHMyc74jKi920RkbKw5rTbvA=; b=ip2gGDTvFinRy6jC
	tqU5BsQjhlqU5sRwGHel8JhaqTfgt5Kroe8aMNGStHvBI329n++95SvybCY/Owa7
	N4/dnStnFcv1ABgKgUyG1LzCHtmu5yV+M2QRjTjLQJOr2FsEKXhwdMFYskHHzJGH
	fLV+bAbayAQGdIkAiHQipQVjl9KmAzrxdqTvL23ojo4EgfAewbIGNS5CfxpuMPtl
	dKmsg09ipoYUBqSngewmtzdsJBJC7MC5hESkAQNvo1kKahHF3Uk5vhjaLPRrH5Te
	C+HRZ/HNw2h3Yy7CZ3mg0WaU+KfqylbKQC5UdQwxNdT8qAEYv955uKrdrPpbwJ11
	E+gu4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8ysc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 14:57:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399311947f6so10162237a91.0
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965874; x=1789570674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9qEpNa8CHpShSLw8mXVHMyc74jKi920RkbKw5rTbvA=;
        b=a0fvmH3S+S6nu1PtNh9aWb1wCmQ9d2bTRJO04i5fKoSNA8Xmf6M2nn1idpRQbBKTf8
         o+qFkAwNLQEb/nWpsV4L1SpK7P3s2mKZMyEBHFXqtDJaxtBRyEeFqLNnhXXbNgqzdHB1
         Rox9YPL0qG/3kkHh+00yC/4gsU697E7KNHRDbvL0L6/yPIxPPiW5uxePc5Zy7PkZ3lVw
         FO6AzT8fXb8Upla2ksw7/UK5U1S36eXgPaaLPL3daXB48k8cFP1RwCKM+P42FNiT2hd/
         vSrarY0stowLryPKOAoFL4KdUZ8JF3T2KGQPqKXTkZfwtJIwP9/XJcRTM57i9nzA7Wu4
         I5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965874; x=1789570674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9qEpNa8CHpShSLw8mXVHMyc74jKi920RkbKw5rTbvA=;
        b=WU0RbKbkggUArLx0nFhX2BqGQZqpjubBPC8Awf5T9NoxcNkdIHrFI+jsII4as0VtWE
         +JGh8F4kAUkCOqRS8uR41O15k9FN+k+zesemTTE3OZBtBvIZUGIxMJQ9cGPHvj0tBaE5
         ylHv3fIzUEDaIGtJqvqZCGhKpmPRSAr4wmBYKeb1Yg6SWqbZm9xzrFu78jx9QkBNUufI
         6wGRckid2Ql98lU/t3kk+uNq8kPP16K4+7vapwYtIh1SeIV1xFN7QPCE9z2Ve1VE7VWc
         vNjr8EQ7IsrRgcMIqe7EK+ZYSph7qgHMkmtpYZnYaoUh/DNijgzw1cwDxxpLbRIG79nV
         vfaA==
X-Gm-Message-State: AFuF++mN64cuCMr3ecBuDbu4tVBY33hYmgO6tPF4/hlZuBOVKQfoT+Lx
	ONw09qBg4VxWYdh8+X0L2sLOLKuuAo+cCDlOu0a0M279TWIGjVbajnVNo+BnV3QW63aeU4h9EL3
	JuUcGTapqrT8nWLzphjWCQVySvrKATHHJwJbE8tToz3CDXaMPzt+k/HjDysHWllyTXg==
X-Gm-Gg: AYBFou3Dq+mSfo92iIzaw9Ng7cM6ytUiPic5n95jQFhd9v3xjN9ICdEtovz55kAz1GR
	cWJk/Pbk40a3p0JyI8zv+u2l8ZbqNUSdQxFJtVNhcHf0wPPvL3KN34ITu019m96SxTNqtpB3ukC
	TawKNXD9UvfXGFl7Bv0ST7OqCvX1TgdSXP32SMSbvU9HHsElII66h0apbVo5LD3e4M0AcjP7C4D
	O1JR4E4+xAUYL3pOsoF+3NiEjqQhLxiSnn1U/jCJtfcvaQwqG5mj7SDxqsLXwmF7ww5DYvOxdwb
	SgzqHZer7/7AoFtZDZHooA32NBkheVGGoYHCRypb7VgbB0WIHKooewREWdY7SyhZ1rSMMF0jgFW
	7zqt/K/Alflzl9DQiT34JfByR73SGfjxezWU=
X-Received: by 2002:a17:90b:1c8b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39b26214502mr49656970a91.19.1788965873614;
        Wed, 09 Sep 2026 07:57:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39b26214502mr49656870a91.19.1788965872743;
        Wed, 09 Sep 2026 07:57:52 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:51 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:10 +0530
Subject: [PATCH v3 03/13] dt-bindings: media: qcom,sm8750-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-3-2fe43ae45495@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=10560;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=7baRWPtsYeoomfoQ8Y6a+HLrwsbvQXalHqJXcSV2Ywo=;
 b=wMPqHjQStGdq3SxFx4FiOXY/hk/KpHO4stFT21e0LrwZ8n8wbdZp5elE0r8zgcnBy50JGCv6F
 q/lUKU845ZyCA0ZowVM+1LvrCwvY2T6yKi5QnoIJ/rBmCg3L0oNlgfM
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX6pUhRxy2id8x
 t0mkrBgkSss8vUId5wQrilNAekdXIVvcNDbW6ZqYqaAXeHFqvkSnXo7CBFUXuZNpmCKhPDTmz13
 5QqavoVIaawHEpBBYIdMVxhRrbjCThk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX0bGCc0OV9gH2
 Fdmv1wBOb+0UzlIyGDnW+RUdAwdo4vp6BsRsdPBTxAAioY8ZjAbcVsbZjRyz7cjD7WC/PnHqXIy
 P4FDYyAjLzL4n2zhnaL7roYZ5zwuZ9Aeeyq/SVttgLbg0VsdEi/JzYW29wd/2s+BguIsTvrqwQk
 tSp7IRq0T5aumHUpL1OgA8yJxTw7KeJs0+gVzWECHT+Faw5W7f0l6C6yzrAlKHTzu9MGKLYZpxc
 tTC+56O32KoxUA4bzGYZVADURm874YVENbeRZR6WLbgJHJAxHsiGMGy6hN0zMWaGzXQbYenmZyO
 ZL1fMge68aPhp7noTsM8A3XVeE+E4HGNPdgslr9/EcgeuMw6915P35iLekuWEyItGP1McElB52/
 AIDscY6Bn1R0MAhTyNcByja5wJOVLJdpbJ7qC8S27nk2V5WPVBCxGO1WnMmMVqZXRXXRKBe6RJf
 x78ZcEhlqTxGWi5M4Kw==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa173f2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=X0Cxp8Bg5y9jhwFTGxEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: HITYrqW6FjCcp9_SjHtZkxq1FCFBck--
X-Proofpoint-GUID: HITYrqW6FjCcp9_SjHtZkxq1FCFBck--
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

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent. Given a soc
with address-cells and size-cells as 2, update the video-codec "reg"
accordingly.

This patch depends-on:
https://github.com/devicetree-org/dt-schema/pull/207

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8750-iris.yaml           | 187 +++++++++++----------
 1 file changed, 101 insertions(+), 86 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index c42d3470bdac796cc878090e65becf6b62bd80ca..eafd8654092468e4422de65c12fae8606babbd32 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -72,7 +72,6 @@ required:
   - dma-coherent
   - interconnects
   - interconnect-names
-  - iommus
   - power-domain-names
   - resets
   - reset-names
@@ -92,95 +91,111 @@ examples:
     #include <dt-bindings/power/qcom-rpmpd.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
 
-    video-codec@aa00000 {
-        compatible = "qcom,sm8750-iris";
-        reg = <0x0aa00000 0xf0000>;
-
-        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
-                 <&videocc_mvs0c_clk>,
-                 <&videocc_mvs0_clk>,
-                 <&gcc GCC_VIDEO_AXI1_CLK>,
-                 <&videocc_mvs0c_freerun_clk>,
-                 <&videocc_mvs0_freerun_clk>;
-        clock-names = "iface",
-                      "core",
-                      "vcodec0_core",
-                      "iface1",
-                      "core_freerun",
-                      "vcodec0_core_freerun";
-
-        dma-coherent;
-        iommus = <&apps_smmu 0x1940 0>,
-                 <&apps_smmu 0x1947 0>;
-
-        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
-                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
-                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
-                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-        interconnect-names = "cpu-cfg",
-                             "video-mem";
-
-        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-
-        operating-points-v2 = <&iris_opp_table>;
-
-        memory-region = <&video_mem>;
-
-        power-domains = <&videocc_mvs0c_gdsc>,
-                        <&videocc_mvs0_gdsc>,
-                        <&rpmhpd RPMHPD_MXC>,
-                        <&rpmhpd RPMHPD_MMCX>;
-        power-domain-names = "venus",
-                             "vcodec0",
-                             "mxc",
-                             "mmcx";
-
-        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
-                 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
-                 <&videocc_mvs0c_freerun_clk_ares>,
-                 <&videocc_mvs0_freerun_clk_ares>;
-        reset-names = "bus0",
-                      "bus1",
-                      "core",
-                      "vcodec0_core";
-
-        iris_opp_table: opp-table {
-            compatible = "operating-points-v2";
-
-            opp-240000000 {
-                opp-hz = /bits/ 64 <240000000>;
-                required-opps = <&rpmhpd_opp_low_svs_d1>,
-                                <&rpmhpd_opp_low_svs_d1>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-codec@aa00000 {
+            compatible = "qcom,sm8750-iris";
+            reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+            clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                     <&videocc_mvs0c_clk>,
+                     <&videocc_mvs0_clk>,
+                     <&gcc GCC_VIDEO_AXI1_CLK>,
+                     <&videocc_mvs0c_freerun_clk>,
+                     <&videocc_mvs0_freerun_clk>;
+            clock-names = "iface",
+                          "core",
+                          "vcodec0_core",
+                          "iface1",
+                          "core_freerun",
+                          "vcodec0_core_freerun";
+
+            dma-coherent;
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "cpu-cfg",
+                                "video-mem";
+
+            interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+            operating-points-v2 = <&iris_opp_table>;
+
+            memory-region = <&video_mem>;
+
+            power-domains = <&videocc_mvs0c_gdsc>,
+                            <&videocc_mvs0_gdsc>,
+                            <&rpmhpd RPMHPD_MXC>,
+                            <&rpmhpd RPMHPD_MMCX>;
+            power-domain-names = "venus",
+                                 "vcodec0",
+                                 "mxc",
+                                 "mmcx";
+
+            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                     <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+                     <&videocc_mvs0c_freerun_clk_ares>,
+                     <&videocc_mvs0_freerun_clk_ares>;
+            reset-names = "bus0",
+                          "bus1",
+                          "core",
+                          "vcodec0_core";
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+            dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+            non-pixel {
+                iommus = <&apps_smmu 0x1940 0x0>;
+                iommu-ranges = <0x25800000 0xba800000>;
             };
 
-            opp-338000000 {
-                opp-hz = /bits/ 64 <338000000>;
-                required-opps = <&rpmhpd_opp_low_svs>,
-                                <&rpmhpd_opp_low_svs>;
+            pixel {
+                iommus = <&apps_smmu 0x1947 0x0>;
             };
 
-            opp-420000000 {
-                opp-hz = /bits/ 64 <420000000>;
-                required-opps = <&rpmhpd_opp_svs>,
-                                <&rpmhpd_opp_svs>;
-            };
-
-            opp-444000000 {
-                opp-hz = /bits/ 64 <444000000>;
-                required-opps = <&rpmhpd_opp_svs_l1>,
-                                <&rpmhpd_opp_svs_l1>;
-            };
-
-            opp-533333334 {
-                opp-hz = /bits/ 64 <533333334>;
-                required-opps = <&rpmhpd_opp_nom>,
-                                <&rpmhpd_opp_nom>;
-            };
-
-            opp-630000000 {
-                opp-hz = /bits/ 64 <630000000>;
-                required-opps = <&rpmhpd_opp_turbo>,
-                                <&rpmhpd_opp_turbo>;
+            iris_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-240000000 {
+                    opp-hz = /bits/ 64 <240000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                    <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-338000000 {
+                    opp-hz = /bits/ 64 <338000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>,
+                                    <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-420000000 {
+                    opp-hz = /bits/ 64 <420000000>;
+                    required-opps = <&rpmhpd_opp_svs>,
+                                    <&rpmhpd_opp_svs>;
+                };
+
+                opp-444000000 {
+                    opp-hz = /bits/ 64 <444000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>,
+                                    <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-533333334 {
+                    opp-hz = /bits/ 64 <533333334>;
+                    required-opps = <&rpmhpd_opp_nom>,
+                                    <&rpmhpd_opp_nom>;
+                };
+
+                opp-630000000 {
+                    opp-hz = /bits/ 64 <630000000>;
+                    required-opps = <&rpmhpd_opp_turbo>,
+                                    <&rpmhpd_opp_turbo>;
+                };
             };
         };
     };

-- 
2.34.1

