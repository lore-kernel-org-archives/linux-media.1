Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625769;
	b=qhLKdduAKnWYFBIr3nROwnhBhJL7mGwJbB/qpLXOk9Nj3QoZpotJ6sLOEGp9Mv07WfhN
	 XcA40ss6jtU/oot22dCf2WTK+waFI2ZxnfDL6LSMti3bpWjWxn7aFryx7yqoeBoFSTk6L
	 rdalE1cUkJMdnM+gtkje9jaqni2Wd5SL7y1FBmRyb8iQ+NHKpfmtJckCtrih7bzncBPfA
	 CHMVWUyuQ2mzPQBwJXoDnDD2ZOiF0DpOLCxr8RGWRBe+dDcSr89orAW52K4aflCrc/XRt
	 MU+9C6sOaOAjXu2tgxyF4r2v6ZVgdKjcMtPyGr5B//v36HChVB+3z/lNZVKR1K3IpNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=;
	b=qGS/DPinxCNbSqYUbeGlAi6kr0e4O2YSXsKkZ1oAVFESgoN1DMou8cppObW634/mDX7X
	 O2yMK0Y4DIZZ40bQDO9HoPuqwk8zs6NfBFFPzKIQyObG80a0cWVjcLiAlJFFMk5Oxo4GG
	 oryCfugGY/NCE65vjQl6sJdMgWTTW3bA0RtMjqPWjGiHEqz4B6WaDSLCE3XinixvDg9A9
	 59zUI8tKiJtnbcwfQw4H2cGqQxwDGzyYA0xYpgvLBeCknNZsMf31xLoPhoc8Ka33SzemB
	 iaJyFqp0jshnc0jAeG3hlZSVUpTzYdQiv3YqqMNyUCtO247hyzVMLZNX3tWzZF/VqNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Gpgx/5de";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsP0Bvga;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E1606A335
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2E1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gpgx/5de;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsP0Bvga
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE1xuE8728050
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=; b=Gpgx/5deT6sc66H2
	g5aVCbVEaLOcFWgFsHQP6RBShReg4tDo+pUI+au8P8p/9imWP8WufBCOitCEUKZZ
	tpu1FkGLCPzX0UCIckCRBZLIUXWGD90M3e4BEeC8UbA9RyRgL0ZKm7uqf2YCYjS1
	c4Bw9w66VDUXNUV5ft75GYrXSCilS0aAzdIvH8hX2feBmtOiAP6qU6CkT5UQ3Unr
	oiFMt82fX/4jhFTjoqviOLLOvFHoi9gr80ZjCRzDLQjo05TT6LnPUk4qoEpIG24K
	YZSIPZtumqZ9277CAX7eAWRFpGOpLrFgJlvjgEgXAFeCnsSolhwNlSdv8gK1uUys
	iDBk9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nrcbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:09:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36db182e57dso157893eec.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625766; x=1795230566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=;
        b=CsP0BvgayrarpvEUZ5wUeO4F5hq+YlSDQZKCEAqCwCrAhcXRLkHfzUxzCRc+o3HB8R
         M531rbtK7wnuENryh5aTapEnFKhGGVkC1bkTT43XGUB7kTE3vCSjw/KODOF65dmN773Q
         T8WQgDBrj7518CotiORFAixsY9yMpEZ0NHqEp1xZj5xcGA1oovrrFY7T7d/PkMXJ5+3X
         j0ySZOyKZQbzmzdJrmaKbGYVhhUValdPezv4VjoZnVrdHN8zIZl+epPSgzlctozdFiT4
         5st3yzeomYmuV7mZhFGyIjY6qtI9YZuspnCmczK8gT8zOmiz1Qf+PjTKSLQ1cgcemxEM
         5/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625766; x=1795230566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovOu2UP++2nSHdhlpPmqnhrYxMyicygp65UamHq1Lco=;
        b=HAUZPLToa6ZLTAbMPakJdme0gw4R0y1AxTNarDCijTeawUuxJvjInFfa8NRVZ4/brF
         jvVLpaHa6fqZy9Qs+/wJNtbV2sri398WfUCLcrdj7skJiANFviyZwOpQ1r8eRlgC1HRW
         ivQ6Utdx/t2mDxO0h5cmI/SuuajxOqJ/al5fX/Aa9vQQNiEc4YntLpwgl6GzGliSwznY
         hUDqJlJ5YTNmrRADSYNOB6cSQWbjYXdLYKil98WzHLsDC/e/MFGXWBYaK56eeWLLtdQ2
         dIXWYC7Rivi6/xVDUYfRpn3d76dj6b3HyW65KaSbKEDevTlHVVsqwW4jiCAI1evhbjkO
         g+Dg==
X-Gm-Message-State: APuU4Z9aitQlRRNyEB6qVPq/UjGDjtxzkR58oQu/yxZhWkiifqcul2pN
	pNU7BHnbGJG0I29DOojAvpCQdxSwqnyea8lhivd/nnW4xVeXJnu+/KmupsrxKXpIDAuJFll0Xe/
	UBkdSvpEVWlSurZlQVronCrhAHlBSFtCZaIq6RIA6SrFwkXdTLmagZ/0k6hQOZaFvww==
X-Gm-Gg: AYBFou1TNoLG4z3U5vWrUgZgxekSgoDMiRFmR3xPF+hNH2pxgATIBLjoqhY/6QnOTUN
	uzUNmqjPZMXteUN4Xv1hxTDy2tYsXBG1r15eB9qh42naK3Zdzy33R2FqbLu4mOcVybwfJfbQ+in
	/zfeepqUHzsc87sZ6IZ7pJQrh5F7mP/JQfKQsqn+1Nk6L9b4ByBQ3Nezf5aBvfr1lRvB5jGY+iZ
	t5WzsCu0GYUzPM2zeIkrJEG+LO/nk4a9Bde1volduO/lv18D0aOPNu6cmzL2Xc+AAydjxkJbPEQ
	yDevn7oyonqY3+BpB0zxohhSlOctpb+rLdLyQsmSbty6KnxUGV+TVEL6TSXAVM7QhmNM5R7B9R9
	njFGUbAdhAjijRo7qS8BtI93zowsZYfoXtlU/wdu+bpf3snGbpSyPT3JrMLdhcs71wJtaM4V9aD
	XeVkCt5MuNzxiobuVySwWZH42On9vMb9pP
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr5891080eec.0.1794625766266;
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr5891024eec.0.1794625765633;
        Fri, 13 Nov 2026 19:09:25 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:25 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 19:09:22 -0800
Subject: [PATCH 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua video
 codec
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
Message-Id: <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=7265;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ghTHXTCvd7eOk6uSjXl1tAvTuMYTkm8SazpMstLCBLo=;
 b=57XtPUPg+8LSdf9vmav4lku38gwgL24/w45tpdryzJQPlMvVCMjnV7JGInf8+TVuk6X3Lp55j
 KSYQCDzXuV2BIbej0CTAVlwn2Ajzxyf276N81PJfoGj8f8ERfrdxzPA
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX+HbON6Dx+J3t
 S9mUk5NdWGZaDyU2taJVSU6XgSG1Pwrge2IFp1r/H8wMrJYeA3qwXzUv1u44mmbKcCIrhUeyrgk
 HmBRFAngn/gunIJRqX25Ix20h1mThX8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX87H0kbDz7a1s
 eJCL0vOXbh2IXI1y8z/GQ1ii9s5le9I/gTTaBUIwZ64EbCyTRzDY0MrtA5afZ6695B0J+zhvS4d
 N0jSO8xJBYbMXAanG3QN941/qGAUfU62Kvh5gWfujktT6BHTBJaSdgBKtxVIWlZNGE1rOAeRqi7
 EOUltmE28T29/OH7SuqjWDP+6tV9eVuaBUD97H0sU8N1U7TX508mge8zC8mbuU8X5J7dBZNtk2O
 tzqVgrls9ILR8MxuGr+e2MZ4BxDodXfIx5qimDmxseCSO50kYu1cQhDtMECXia4RJLf+HcQffQv
 YYUIjGdP91f9EQ14rB083/1cSg8JPuSfToQd4m1jvIdAmWuz4hiIwdIDQAjas2GVwuNFYDzGtdO
 c37zd17weIxtNrhPtLoIQIFXOuaTVk7gUXYjTLIKSzuLw8GpBt5Lf6kE2ZOcsL0D+x2psqt4gr4
 izJv2/wbtidvR0kRnmQ==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7d0e7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=wyAc8u2O2XHP32wH8dUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Xfa_iqINKY2G6swa82gXhFTFNcBMBoV2
X-Proofpoint-GUID: Xfa_iqINKY2G6swa82gXhFTFNcBMBoV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140012

Add a devicetree binding for the Iris3.9 video encoder and decoder block
found on the Qualcomm Mahua SoC. This is a single core derivative,
leveraging most of Glymur data with the clks, resets present only
for vcodec0 core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cbae6bddf7fd4b67330ce47033874f3d349e5a3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
@@ -0,0 +1,243 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Mahua SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qcom,mahua-iris
+          - const: qcom,glymur-iris
+      - const: qcom,mahua-iris
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
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
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
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
+        compatible = "qcom,mahua-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
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
+
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core";
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
+        firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };

-- 
2.34.1

