Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3ED296BC8
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045042; cv=none; b=Lp+Vzz/Ic/sraPa81UZDQzNBs1ntrsETe0W8YEDMre1rmyExC8mszOsxwP3vUhYI+S9fTeKJGf0XDYJ+SXkiK5relsVOUsm6p19jR2+n40+jyuPN7oY7VF8G5qZ+a7KAFIX29Z4PlKjxP/Xnxj4+4lDAY19ZfOjGowAbuKYQ5vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045042; c=relaxed/simple;
	bh=1LtcgFQre1URA/vBEgHnSf1Cl4CNgR+s5lXnrBq+ITw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOqDrYR31XYODINV6HxBILh1d3N3jONiyBE+KHZcyOC0jkoKSQEMRwyCx8hGqlu8lRoSCco4ON/hK0s/aH2laiXLjrvLZ7TxAqC8sM4Gskf0nFvDqyu5BjBKYQ/cVNaclk88fGE61I1dvOEAx8TfTjfDxvTKHOhVsrCTOnBsDjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8gOHMaO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDCOyFp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8gOHMaO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDCOyFp6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5SMVp4134281
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvynsP24NIPCCSbLPAo876X8cdGxa0GYKqGInuT+d7c=; b=R8gOHMaOcfqrUkW3
	3XnB3gubCqIzvMfvN1zx5fOVe+/YPDn0Yh4QjPg6QszNms8Ppxb4f9XQKjqd6Fxs
	ocJH4COsrmARHWKUXCskP188peCp7UYxe3e9REyU9h2w2wF9eInkgedCkCi7nV/x
	Fmtg/aWFkaRTUUA8Om4IIMfLXKLYHfBKrR/kXQFnnnXKgVt526ApMqdC4/Fss8Ec
	C/JhAVm8VNXSWQ+W72fWiZAMMprNTDqnzemYSFUYBv4GspwQdCGovMJleJh+P+aL
	ynl8om/cI3pGjhyNAf6q2P6Er/ZFZ8gDffQ9kAj82TTjSe4xZUb3teoHYWs94//n
	80sjtw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqyacp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6dd278512so1061543a12.3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045039; x=1785649839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvynsP24NIPCCSbLPAo876X8cdGxa0GYKqGInuT+d7c=;
        b=IDCOyFp676ngksUH6cfQS33mRCczpunx8XYoUi5BbpybfVoryD1o2KQypIyJlp96E5
         hSko4FB4S2/hyDE2BQx/8W3urSvq6gCyEV+ZKIttO7obk7nBkf5TCHdaWFDcIXj09GOH
         mT9NH3tI/FEpiiBc29dvEo66ZG7D3dnnAwGABEuPNahZr/8uYA4fabKdDu4JqM2FRUYH
         0AgdhhgeQA3mql7m8nNpDkFoTpmINpf6oLz0MQMoyB0g3CHLR5vxOUCLyTceISblNwoT
         VP20yPgdEiFxFV3WuE7Q7DDuHUYy3xVRWO4N5AebmjQmJ3mwg/jtqdlDd1G734kOA2rp
         LbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045039; x=1785649839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvynsP24NIPCCSbLPAo876X8cdGxa0GYKqGInuT+d7c=;
        b=jn7Hyq8/9Cq/X9Lh8iXnFx985Wchfutj8gLUCBwUSZceQWcV1yfUFDCrIrUm4y8zYh
         ISI2vpqTvIwCn42/yAA0PQz4UnvrGVj3o7iSEPAZcUkFFPmHXevdI48yfEf63a9zl89K
         udDtBcB1IUIp5KBzDndmiDlfN161tMjHWCxcJD0AsTJOJh3uLdWtJzqJNbgqIxaAQp3V
         l1V+79h3pv401KlVJ6KRgHrLsQP2hkHtAKFzETc9jDLoTWr4pmjS9AfVGCytt0eePA+d
         mByDOKLG8xgZKCBh7prtLM52pJJyevHehOfv+l+dYdCh/UzJjpPoK4RJz/h+hRxraYT2
         GSRw==
X-Forwarded-Encrypted: i=1; AHgh+RryuTHaknjIDYjNQffCdli4W7AE/DK76rgYi2siHdMRK7jxiJsALKo8IRObIgxnPq+Av3E4mQm8eRWMAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwBy5GcSdG8ZDqQS5TFpx544ofz5h1C6Vyu6n7zFWHFotZB3t
	V8ZcCG7WflVxOzT9sYll5/uP2lr8AJQwrxTFqJ6SULTcSuy5j4N25cUurBRuH3Fyrr7OfRWt/Py
	/hXMzg+bw8VxgRYzol0P8oTRKCSUrWbtAQIm0fVYKqmAAMw3Fl7yeKhk6IMv2FVD/Mg==
X-Gm-Gg: AR+sD13foXVUSK7MX1sM1rJ1bHnDHx/AW8u5PJdAmQLHsldi3AY/+B+8Mm3Q3xZ3NAm
	OdxV4aL5od8SEynhXEkfms92qISSA1PSDboI+6GcMuQdzInRBby65M6zK2Lcms2A9Wg9iEe22DV
	Pv9xsCi3SHtKWSUraDBzct7oZ9JiiyX1mGkMdgM7MjhEC92C4ZGa+8uuvafZsze9PZzbfkT5njs
	TJ3QaTuqF+ANld6f3zi/oYXsGKP4yaVatLEDpRZd+H+I/LJMSd7DEsubtagUCIcWrugoJioX/L1
	c5n/NbfPs3OLfCmkO4jdptJPZdT3cEjWK/0b04SstdatweHRW5hr5LFNF31/VTwPxaPo5SiHimV
	Jb96rz1lneO5RQOrW7gntXl+EKvwRVn6m5g==
X-Received: by 2002:a05:6a21:6494:b0:3c3:9aff:7a5b with SMTP id adf61e73a8af0-3c67df803fbmr3695649637.50.1785045039022;
        Sat, 25 Jul 2026 22:50:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:6494:b0:3c3:9aff:7a5b with SMTP id adf61e73a8af0-3c67df803fbmr3695635637.50.1785045038582;
        Sat, 25 Jul 2026 22:50:38 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:50:38 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:31 +0530
Subject: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045023; l=9324;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=1LtcgFQre1URA/vBEgHnSf1Cl4CNgR+s5lXnrBq+ITw=;
 b=/PDkKhZxgT9liBiidRBNV5AttNeBhUJPX4nae5uA3GwNiZrIbSytHG1HXtDBqpqVVBJxaYUTP
 7KkwOPJ41aDBNrQ4+VvfpbOyXqwg055ZxnvHSX44UwaYGsPxFkggjP6
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: BR29SNoqPMOvN6XGeWF7rSo8d3ENPMSh
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a65a030 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=o-YURiciIQWsX3ptiuUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: BR29SNoqPMOvN6XGeWF7rSo8d3ENPMSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX5jGpNujFf75+
 cGVvhBQ1HDB2++1tL0//8P1PxEVlXRBg3H0yusHv/LQv2V/wIh/JPK7jCE9Vet5Ew/DcI9tb6ig
 1R1GgYKwGPbTOQg/rLihS7H2s2mt99U9LTn8bVk3SSMYBFJMilDTXZwsEIGAtKYtQUcHmEy4MyS
 Jd3Hw2voMxgwFylT3xzb61JEV/me4MYloBkQzfhezTmI5Ec5UauSjBPOP/LOijzURPrfoFK9X6c
 Uc21s0Y5IgUkZ6acZRrQqJ+2q6FOj7Fi8bTDr5iH9z0rNM7koI3CidsL0iCWM+xlALAFuOIWVg7
 EMAGu+1zOLzB6/deXaZvVmZBZ/m7yyNCZobB/TSHDHVQgRSrl3qBAol58+XxMx3LuwAuJOsARlf
 DJ1gQ6je9QDQmadyDHJ59tOHWkBvB6C9HsZcK5BVUHOio9jAY9eRrDw8p3RI4gJdRAyYlp7iG0s
 iAAxv4qTiHbpeEjx1WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfXxOTYk3RcwDJr
 AXGTYiSQfKSw36mKpKNs3ETR6SKL0tqcBmbjb507IJrLbhCAjp5Yxw2pBHRwlPA2Ycx/a6HDYH6
 5PevVKjBqxNGQgnHixuYn+hrdi/7pE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260054

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.
The current maxItems constraints for clocks and power-domains in the
common venus schema were sized for platforms available at the time of
authoring. The glymur platform introduces a dual core architecture
that requires more clocks and power domains, exceeding these limits.
Raise maxItems for clocks, clock-names, power-domains and
power-domain-names to accommodate the glymur platform.
The glymur platform-specific schema have fixed constraints for these
properties, so the common schema only acts as an upper bound.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 257 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |   8 +-
 2 files changed, 261 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..1bb16206d859
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,257 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec1_iface
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    properties:
+      iommus:
+        maxItems: 3
+      memory-region:
+        maxItems: 1
+    required:
+      - iommus
+      - memory-region
+    additionalProperties: false
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec1_bus
+      - const: vcodec1_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - "#address-cells"
+  - "#size-cells"
+  - non-pixel
+  - pixel
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec1_iface",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec1_bus",
+                      "vcodec1_core";
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            memory-region = <&iris_resv>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0000>;
+        };
+
+        video-firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2..10716a93dd35 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
 required:
   - reg

-- 
2.34.1

