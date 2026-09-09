Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3657ED8C
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965869; cv=none; b=taHTXVN2F8fSxKwEFYyQ0fQOJZa7P93l0AkenYggtfUBkeSmlfMmPf/sR72LI/sg6xB4jIWN6U19y0j7lW+38vfeg8hEoDB3F7JxLXCSLlXsZ5G5ibNRUgJTS4iHAwUicpgiZUI2Dr5IE6rXEJYRiMuvjdbIvn/noctXo39BeLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965869; c=relaxed/simple;
	bh=rBSCWNkR0ZpYrQr0eAPLkf2cHifsomeJt8xFTUOnFYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFJJaGHPRrJbqfzf0S1BUEwx9Jf7fhi9Zy0u3PtRrrLp0pdTYFI+Nia7xh1m8U+ILPpjfb4i6Rj4EM3tn0+c3eYtvSYPsJDDDtDnd2TqXAqyzsT7pAxbQJ/xxyBu7xpgbW5PI23IuTuykMwKf+I2P0WTyNgR3MtobsSHx5budFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YI4ZdUmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LupoDbVk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YI4ZdUmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LupoDbVk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFYK1810365
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 14:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq8iT09hiZxF4vzzjyqQsnMZxDnWxS0zZs1RV46mdTs=; b=YI4ZdUmP40rsW5Ks
	NJcWgtAg2QJNOOTyu/ENwjhwqJt1nv1iOEHlNGZn5B6YQ+DJZMfihlIwNqU7Rr7x
	SHMYu89s4hNLlIqP8ZNJO0rYn4j0jXYRzu49szplusxFwoHWlac4sMz8162cIuWG
	HPIVMHPcCvrWWeiE9Xky9ZnfuaiG3mr2JDC9tr4YQvBcT3VuFufiG1pHTwSv/b9o
	/sgB5spSLIFe0a91ZH2qDAxQYs4R6IxvV021cdPz2+I/83R/Yo/Uhz+d9743VG8j
	scGkCZ/NLE38OW3yIrBWrq7/W/BuG0dMCni3SA+RqmmeU0psf7dgwrZrr1ftnF9w
	X6voXg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj19c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 14:57:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so10697872a91.2
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965865; x=1789570665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq8iT09hiZxF4vzzjyqQsnMZxDnWxS0zZs1RV46mdTs=;
        b=LupoDbVk5MwAgMZQfQYdFF5QMmkw0aCDjQYDQxGM/etp3bT+OgvXxrctUuKAiCjsvG
         gKAJGcrz9Y3045UVe0nAHfo0Gofcts/MGLcBRQ5aoNVwBlNbnfMMJeTtXvffabq8NINz
         R5F0ynK/yuLMlQs7rMPjqfaW4xVLt1FZmnhyARf6jA/Yng2Ly85IJugoe/iYZVe1Iko2
         Exc4jj3FCAhVMkpZg1nx7y9Ls67THQZriEYxBKKnLtQn/xA0BRpLXXWaslay8kzLLu/l
         7eM6h5jl6EFzzkvnS52WJDenUd0yXcDfSzptoTnlNOpRSmn7m5QATaaxjt3WBjyLlXB8
         Lf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965865; x=1789570665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fq8iT09hiZxF4vzzjyqQsnMZxDnWxS0zZs1RV46mdTs=;
        b=MIGUtAdH+S+Gqz6Ilati15VepR2PWGsy82I/EjpPrBeVLPsvkLU3R+Vmpijq0oCOry
         F91BcwSWWylVhjyo6swGC7o33vJ99Jrn7Qj0fwcSAX8oS4LW32vRcgBfuS4lUurDGsV+
         qyWelxMxkSpsVWGaEIekJMvzLc17XaRMbSTf/TGf+ZanmozsF3HEsiylbyVD+PdaWt4r
         erbyEMTlGzjjVgXbmStX8TGO8XRoM2T+cGCl1eCcWJKhh5UKKY3u8MkWS6jWMNPlzg3q
         DlGHLSa4e9VMMFwgty3bqVkreTix1D4HLmyaIKLEDP0asr5pIVlczcsBJzHoBQeDkdOG
         uvxg==
X-Gm-Message-State: AFuF++kGRxRG3Qiwb3Rwq7iw0QfKawoxeYBFWysYnqwq0bUm3SR3xjVS
	AJdtv/eYuwIdgQIQxIwuY849z0oJsnNaX36YmFoFwlnYSofmEs/Pz7jlM/R3dyHIk7rYJp/gQWy
	oD5XGTR1mfNEeesbc0CdKFdF1WPrQ2UxS3lBnvdBrD0CeQXBURXr24rvQkYvNvfltCQ==
X-Gm-Gg: AYBFou1q1p/lay+ZA2TdHYXF3m+LE+tad4g82Ka3cnuDSXHCUqxBgsxV8KPIotNrQ0b
	ywIezbq4l+G79KC3/gmTOGRw9yvedO3i/mh3BBTEYODnyo1hcz05zCW0ChXREX6ji/mx2T3WNmf
	yjnFx1PggWiNNy+nnCuOSBYatXChJPJmqMS06HyMkwpN/uikGLiN5nbp4EC+PAjVMWWAFYSOjnX
	OxN0JVgE96pzFRFWxoajtuqhxe1boaIv7cYh6gNw5MPWQr5MX0UyxX6nNCvzjwIzrYCtwXHE44W
	BqDuO8EMqlhP0ew081CFoAYGS9OQLcPmBpSHoQDDm4FfzvqENRnPAs5RGHMF7lprmwj7jPkKfT4
	IoLNH5E36q4mtk7ljHVkp27xZYnVoJlqvijQ=
X-Received: by 2002:a17:90a:d647:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39b261074camr51442584a91.6.1788965865257;
        Wed, 09 Sep 2026 07:57:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d647:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39b261074camr51442504a91.6.1788965864683;
        Wed, 09 Sep 2026 07:57:44 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:44 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:09 +0530
Subject: [PATCH v3 02/13] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=8764;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=rBSCWNkR0ZpYrQr0eAPLkf2cHifsomeJt8xFTUOnFYM=;
 b=K/Lj7YG24W3fzZU+9ctu2PVyyOlhpVXcLlRgV4BJGXaZOZa6OjTmf9wU0GWHcVgFLtYGDIC55
 wjhOBL2Zb5pC3Ym1yctIKv8FXKVY+SV1wK1kVSKLqFRxO88R6wdcKXv
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX4tVrh0cB9dom
 zCHd4D/QmAwa8rJTF2o1JMA/vfTJp4+mBA5SHmY1/e1JQvGts6Qpk/I2K1iTDYI2rn1APiA7eTx
 VmgD5jdF/Ioqghyf/AoXyrOpVnO4Z2E=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa173ea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8
 a=EUspDBNiAAAA:8 a=r1hn0TSvdY8t6IrHqhQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: bJxVU6pHA8M-1JIl2l53ExwlWuD0mIHF
X-Proofpoint-GUID: bJxVU6pHA8M-1JIl2l53ExwlWuD0mIHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX5PlTyFc2GLgz
 ySSkHNiTmvtvHlfTdxDi0CzyOOAV0o7S8CSImWH5tUBDTLSdw1VFr/0Z5qeh6pl1juy4nfsZMXx
 tGe2KBN6QfZO1+xwX42pfEsaZW/E/ompBgFTcOe6mTV03UM+hlLCBddJuOKzUhR/mDOUJCXDyfe
 ijzJdRIRz87wDDh5WNYGd2LCr3/iX333NDH/TEkqFEcNhaJbm0bB/kxPLk4ktKs3oOriuINO5kz
 ojbhvu0pH+SHOgsKD2PSpJ8R2MB6XUOH/GpJTJ50KxNaKwHt0VEgTAM7DVhOCPcmhxfdf/rddwL
 I+TLDAKMXL3ZVtvYvqvzFCu+jsNxKB0vGIv5RfW0Oy6shzuB8ymt7dKt80M9q/VCg9c1rmv7ILD
 gt9TNGeR/BVuAusl4+QEq6rxIFVN5rNKommuF3TImK4cUmullR6Z2phaFd4cKS0wJwhgy4G4OqZ
 Y7fa9+2L3gNCo2p/LmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
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

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent. Given a soc
with address-cells and size-cells as 2, update the video-codec "reg"
accordingly.

This patch depends-on:
https://github.com/devicetree-org/dt-schema/pull/207

Tested-by: Daniel J Blueman <daniel@quora.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 118 ++++++++++++---------
 1 file changed, 67 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..dd80526838f1193f4c9105793ae4bf4fe0755ec2 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -150,70 +150,86 @@ examples:
     #include <dt-bindings/power/qcom-rpmpd.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
 
-    video-codec@aa00000 {
-        compatible = "qcom,sm8550-iris";
-        reg = <0x0aa00000 0xf0000>;
-        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
 
-        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
-                        <&videocc VIDEO_CC_MVS0_GDSC>,
-                        <&rpmhpd RPMHPD_MXC>,
-                        <&rpmhpd RPMHPD_MMCX>;
-        power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+        video-codec@aa00000 {
+            compatible = "qcom,sm8550-iris";
+            reg = <0x0 0x0aa00000 0x0 0xf0000>;
+            interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 
-        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
-                 <&videocc VIDEO_CC_MVS0C_CLK>,
-                 <&videocc VIDEO_CC_MVS0_CLK>;
-        clock-names = "iface", "core", "vcodec0_core";
+            power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                            <&videocc VIDEO_CC_MVS0_GDSC>,
+                            <&rpmhpd RPMHPD_MXC>,
+                            <&rpmhpd RPMHPD_MMCX>;
+            power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
 
-        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
-                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
-                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-        interconnect-names = "cpu-cfg", "video-mem";
+            clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                     <&videocc VIDEO_CC_MVS0C_CLK>,
+                     <&videocc VIDEO_CC_MVS0_CLK>;
+            clock-names = "iface", "core", "vcodec0_core";
 
-        memory-region = <&video_mem>;
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+                             &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "cpu-cfg", "video-mem";
 
-        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
-        reset-names = "bus";
+            memory-region = <&video_mem>;
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
-        dma-coherent;
+            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+            reset-names = "bus";
 
-        operating-points-v2 = <&iris_opp_table>;
+            dma-coherent;
 
-        iris_opp_table: opp-table {
-            compatible = "operating-points-v2";
+            operating-points-v2 = <&iris_opp_table>;
 
-            opp-240000000 {
-                opp-hz = /bits/ 64 <240000000>;
-                required-opps = <&rpmhpd_opp_svs>,
-                                <&rpmhpd_opp_low_svs>;
-            };
-
-            opp-338000000 {
-                opp-hz = /bits/ 64 <338000000>;
-                required-opps = <&rpmhpd_opp_svs>,
-                                <&rpmhpd_opp_svs>;
-            };
+            #address-cells = <1>;
+            #size-cells = <1>;
+            dma-ranges = <0x0 0x0 0x0 0xe0000000>;
 
-            opp-366000000 {
-                opp-hz = /bits/ 64 <366000000>;
-                required-opps = <&rpmhpd_opp_svs_l1>,
-                                <&rpmhpd_opp_svs_l1>;
+            non-pixel {
+                iommus = <&apps_smmu 0x1940 0x0>;
+                iommu-ranges = <0x25800000 0xba800000>;
             };
 
-            opp-444000000 {
-                opp-hz = /bits/ 64 <444000000>;
-                required-opps = <&rpmhpd_opp_turbo>,
-                                <&rpmhpd_opp_turbo>;
+            pixel {
+                iommus = <&apps_smmu 0x1947 0x0>;
             };
 
-            opp-533333334 {
-                opp-hz = /bits/ 64 <533333334>;
-                required-opps = <&rpmhpd_opp_turbo_l1>,
-                                <&rpmhpd_opp_turbo_l1>;
+            iris_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-240000000 {
+                    opp-hz = /bits/ 64 <240000000>;
+                    required-opps = <&rpmhpd_opp_svs>,
+                                    <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-338000000 {
+                    opp-hz = /bits/ 64 <338000000>;
+                    required-opps = <&rpmhpd_opp_svs>,
+                                    <&rpmhpd_opp_svs>;
+                };
+
+                opp-366000000 {
+                    opp-hz = /bits/ 64 <366000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>,
+                                    <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-444000000 {
+                    opp-hz = /bits/ 64 <444000000>;
+                    required-opps = <&rpmhpd_opp_turbo>,
+                                    <&rpmhpd_opp_turbo>;
+                };
+
+                opp-533333334 {
+                    opp-hz = /bits/ 64 <533333334>;
+                    required-opps = <&rpmhpd_opp_turbo_l1>,
+                                    <&rpmhpd_opp_turbo_l1>;
+                };
             };
         };
     };

-- 
2.34.1

