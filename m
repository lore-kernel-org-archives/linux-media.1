Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768180;
	b=nDL2oWBnF4hP07OKRlDfrFEMtJrHURggqLHfSK8MosYGO3WBGvaOFPr4yJn30DrH0AKj
	 kBe0Kou4O7onwpR6uD0iSH6N45Jz1MG72bfLr2sOux8CS3r/GdHKyyUNv7juSWCNjLk5w
	 6pXmfQsTgEJ0QMUaHldHysDjtpPpcR76gCDdf7f5FEOF+KPmoyl1MDPXkQDNwUzA23I4W
	 3BrCeYe737jt5V7jmXg50bzhqzXDgkxhnfrmLNDfe+CnFMXRoyDxIK02QNXCnYFKyd2+a
	 bJy5cQBPbhAlRKf4gPazwyL51f3qnjs3LCuz+YMiHzG7ip63Kv6zCsV93MABrolYhLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=AGSne5n/p41/d81ouNi1YrxGj+NSVhiANPNMtUeUregA7YPw6c7urdevdqf3slZgs7Yw
	 89hmzWSAMJIOWyZE/IJHqCE0pYWgzEjmhrcWxaT1+ltX8rvtBinV8FkZsho8IjtfgpNdW
	 bsWsDsEk2ygO3oBJcr0iewZ/sGP1aQlzLCQi9UkvWqyytxZTGRAs3/dLQFhRfou64Wmum
	 2pFeAJGnsZ3dSV7TlMIHb+8yUBsEYmJoFhdnO5Jl+R5rhUgYo7RLlVVIo7UxxYR99GMU1
	 HgkHWAGlcIqYgvp7H3viCYZRyfTm9Tg88B+MOBG3zCbAzDLrkC183EAEMZVQ0sXVHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZGBaYEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e6YrW8XB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23034606A325
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23034606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZGBaYEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e6YrW8XB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Iaq3557694
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=NZGBaYEIXE0N1yD1
	D2c0Z9sI5DPzXOPxazuibbY3cewSAgRt3Z2XcH8HuLNR9IWzayhD3kYeY1PMNk7x
	rn7G0PMp+Jk2FIUpHSZIx1V2GdfleFpEoRisY7M3Jess6mFtjzA+OVC60ulJ1qMK
	T2mHfIZZNu+Vt+TB80uaW4FZ90aLZZwryB11ZIqUx658pbmKjWSYMrB51pImh9CH
	FiP6ZTqorHJHE4rsVHJX7iDJxhADRvnQB6m7A3bZAlnMu8LPZe0pwmiZJcCUgA9J
	E+OB6rv93zZ0dMyEhTJirgiN4+FOXK2yEmyFV/VIyNnQspqAwArp4VlG71p/MKqw
	//t9Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjc935-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so132671585a.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768178; x=1793372978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=e6YrW8XBLzztTWtNFawQUtE6I5GotyiaTGqKVZUACA2LZrmCBy/pfKBQVsnGSD/7cA
         pIbXVukXwXML/myQ/h1a09nzYgW+rYgtfkphk/9gYn5fiAB58e2f6DRHTrsDWgXmqg+U
         ikWQ0OZmBdjJw50p1NDz5Su6ITCaRs8ttSuddYwHvQLE2HggCPV1P5T+pcKdJzquSzNE
         N0B+HdLwwrcJ253+Jt/jxZzAyJ33jkmOjNc2t7mVdQVbpmIry5K7OLjZS2CYJIkhmAKa
         0HetEB/rWuHym2B8u6yRtCFBzfKsbad9XtyPnFHYf1gz99EzdIxRiWHxa8qFvKmamjhI
         ITBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768178; x=1793372978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=CgtMe4hWbAxpZmXslWUwHiofbwJEwZqKl+rdoNcUvkkn4XuTxJNadmdPVLyKuMd66P
         fKe4Of5ypqNAH2Oyo5q4/FVqe/2GhDvkM7mvfh80BaFxfp7nh4a2KU3MVgX6mfLkdNMX
         e8uIlduJmG25yjAX+l72yGti1gojcWNhWjk4+mOZVLnKF6pwkDYX6HyjPqFzWY5cPZJd
         /3kZNsgg7rJK1FE0U3FzLgyCJMxW03Ma0aLKG0x+iWjC71gCWqAr+naLxngpjIyocsQ7
         XAVlpDNSxBa7NEds6UN4IjWJgjQy6+8qn37UkwCAUMjTvpz7jhm6IlbcHxlAqMk2sFjK
         6r2Q==
X-Gm-Message-State: AFq9FYLvgyYRwhcsU3p53yAooAvQ9DxXZC+P/8psYAhq+PoJuT5a2jhO
	/L0fN1dOXFSEBQVvsfKXlv7wGgTsDXFUsEoc0FDCZ8szGdoFd5Bixw1lx/TMk/P+7csY+3Vub0+
	WnoY0r7LabgrorXjk6vxhFDLkiFRtkW/VfCEZVgU7yiin7eplhd2zh+K64Ekvd7yUyA==
X-Gm-Gg: AYBFou2u/1srfnGKEmYhwAzq1gyEdyZxFxK33SQ4FzqIohJ6T0J3VzGl6OjCWpZJgG0
	Lu4U8P3EFrXlplIuN7apT7vCaYuglKbEKQQ4MQbSS/Yggt3PJbemPndayxKVTJTg9+jOhQsLzuP
	v6DJRHgV6tD85XVxDuVwQRaLK80VdUmiqYgaEcAZeGozVvcb55I6p+2N8y4NLIOKmFd/mnOL5IS
	kAZfmMx6T9GKwtrSukmxTlXHXRY+HkAucvPAxIFke07LYgdC3eoRDhrRIs93hm1LMQKrpvsTGKv
	05Taxbs23Dq6kiTsSIhvHJ2nJUn2WSSKUCqrVFhpXnfHbNvH+DrHsLLzJQ5oBFLluu8Qbh6TfDZ
	W2mxz08vcDFquk6pF8s+c+KYzyqjVgrXlLDXsDF58N9flLp/83LjrB5jTXuHyyqJWvWRo7E+bVR
	e5TjxJkxpmy6qHz5G+3XhbWtHjoPi6rqkcgbQrM+cPO1TeC5iMyJA=
X-Received: by 2002:a05:620a:4712:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f6f9a2222mr463352585a.50.1792768178243;
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f6f9a2222mr463341585a.50.1792768177528;
        Fri, 23 Oct 2026 08:09:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:13 +0200
Subject: [PATCH v11 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261023-camss-isp-ope-v11-2-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: y54TCMstrWQSlOazrdv_3h-NBMj7SYme
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb78b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX129qkXT7cUXl
 dRWMaNajl2+TVLIPMYf55qyCY1NOtoZ07YApvZXkl5AyFLlQd8UKAuWFE2iX/ca+UNd6Mx1oq25
 AjzUE3wxFMEPHiXfT3iROYtC0VBtL9M=
X-Proofpoint-ORIG-GUID: y54TCMstrWQSlOazrdv_3h-NBMj7SYme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX7SkturHKMhgk
 byJZhPrLUqJuH+mAtbbxIsZ0yS2EgVaA1nS0OgdmqO4vWyIF5MKr1BrroPIURqYEYhxgUj0Pe8T
 XtOvsmuXfmk+PY6vlh3rKML5DOJiTsAtLLbIQSD1hV8Gsu9ECuzPW5JyGpFtj/1V8EM1eRxn9oK
 AUWWDc/8nCeIGbMkUrbFdLaphEdnJa/Q5SeJIUq8wwxOADcbf0LO3AElDQmcxmuKn3p4snsxA+k
 RMYkgugyyPDeU0zZADvX4hNPgiP62aiI46uQTDVQyB7dkNmUx8bciwht+SRjWJhHyPXkNDPIFcY
 dVyu0Sy1knlj52kkC88ZRl1FvdodWY6kbyleKf+MJLNiSnzumSYcHl8NLrVAtykqdUQ7BBc4BvT
 /HkB+ikRc9hlPSNfxx4Vl2LTqHVpBITW38p0rUBgTcCNN5w7AaeoYfXygQnlfKGPA7ukjpx+ICL
 aWT6/5UKf0OiCjrPK8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

