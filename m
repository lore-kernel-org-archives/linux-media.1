Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328760;
	b=1n4D0UMlMmo3dsey7kJZ6jWaE/+htxy+N+DCilAh4LwJJcvoMuoELmfujweK7BBbksSd
	 MYiFlC/6NZme3tMUSt8sKA/+KCmr4aRW6V5HxyV6o7ROZU7OztXBR6YqkgVn5jYznPrQd
	 9pAtVNJYX/djCCNCa9HOOYuhOlM+aO4s1GLji3hByjeZH5Lgv32qzGwqxTkwvrFMfXfEa
	 t2NrWf/VMQI4vCkbJjVjAecxflXCqIJil5rDgYBWx9p55tZLZYFkpogKm5eBpJca9reDg
	 wIx+LYGgqUk1JzebXHJ0ZwkFdpGQJdFK1d3oR2DzISQ8DONvAH6D0ANVsRCsy1VihjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
	b=or+SsvWACg40I/rd1Q55hF/Lz5a5BShdMpiR2ikGVUCq6jbgulCA91YJMS6sVrJg+msK
	 Bomt+ZaMd/lJO8/3SC+Hb044ovDtMmhxESr3XEbkXQ5CK9ygJGr12e9avpkR8/eovcEBd
	 zDOTfP9yIZ34TxPlwWRc0xzKe7fAC5IcGIJNl0ojf+fXTFU2LRswtn3ZzzXqFujKLQKFn
	 Rg6Oi6JbnCnuy88St4F4klxBMXrowE/O9pDW+pQpAVwkoByTcB8X4rCHhea9SgXAADjBa
	 vP/UzxCl5m20TWohkG72fVpcG0aSulxw8DsxPp2n9iDztunrjoVYXsABbDOVdGf+JMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1091606A323
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1091606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF1hpN2098108
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OTjfUEF9zyB
	1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=; b=LdG1wONloFJ3yDPFOfHzrDhmiPP
	x0mOVAulupDhxkhMim1C2ueTSZbASbj/7Z3AA3U/yBMK3iXJexUVhDE2PBEM/YUg
	32lKZzziSPzUQldzoy0lwtdjkSbdgFH4sdKzVDZIwiyIqYuyob3uGJbGaMns5iyQ
	lzyhScHJJrOPB6ahoE9rXIMwJfULZbXT5dMqd5YtfjognIA4f/vCUqznq4pjKdMm
	vwNHlKKXJsnG7x91hL8TzZWSqV5rCwwWiAVnVBOCczH/HJDWyCp6AZTgXOPCsyg3
	fmdaM8SVEg+DYr7ViUgTVfCPil8AyaMAfVlQetFZ8vw97KceSNK6KgEfMwA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4b1ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99062be02ddso362926241.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328755; x=1794933555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=bDOzzW3YqodKZb/51Nn8mDdDpIP0CRjEYSKscVJZ/HrnPlMWqSfzRxGgBP0beIDHki
         ZmV79PNBx6twmC15MsuX54brrVBA/3c/mdlN2TZnjK9AQaf8vSCc6rzt2ldxs9UiJjjv
         9a0d3GUZ/ciUutk/7tJZyUEK5LLaHTTDCa72MTBKUp1ZGOVeKUOTPyNJWFSYDjJLSh3u
         tdBVjbBfkhbt6A7Qg7RUhYpjru4YTZZJ8vivZmzadf5sSjBQVjaQRS8uWHCtJH9JtAHk
         idQcRuSqla2nhiQVHOGGOB6lhRKCvPb+r544zXG8sDUA4GUD+EQ0bj/+rj9GF1274vAp
         65Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328755; x=1794933555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=iWp6bGuDFoeAfsS7ngKrbEPRqo1hX8IZ2lP6YXtcx+4t6aqDbaBMzFbxOkwzaLY8Ru
         dWIdPKuq8/rWy922lazSp5gUFi2CdKdO5I4UWEQunmO0BbuUUR4IMo7sAa28kFCgjWjq
         fgZG/72uqghL6nejX0T4h2FE4mtvaZMpjNmhFB6l7SWIBIvqy0Oo/dl5eS1FIbQexAfP
         ETmxBGCGbSB69T3gMmAuOdsyoi2eq9dvuy5vClK5JfQp99zBXA6aegNmS49jziMr174c
         kmVh8fEF5lqEr7/wAQRohvkdWwgPW+CEpmJMB7BYaHPwNTvckLfkJA2IYwsg7ZsRZzbq
         QJbA==
X-Gm-Message-State: APuU4Z/a6Kn06A30UGvScdV2X/xvw6E4AGJpVGktdShXCOTCJgR+wI42
	MytvuQ5zry1LyTOZOI2wLG4+Hq5DpC2p4qnTTBnMigvsnTPi/Jf6j1CEkUu34jluZkZ3Qji06DJ
	dfqQkrqvHSUj5zUgyvLQfYMfL6aysDhv2NDsT9o1Id8ze9u7ZIlJwL13SihX9C6UKJO4Iw85b3R
	Lh
X-Gm-Gg: AYBFou2odht+C5Kq6VRTbaTkkYPmSZ/bu/DNJT8R0cJvK85DdSlhfjWS7aIqv5Fdprg
	TL0YW8uogV/BDFYAdWYsHhzwB3MycvP/pwMN3t69HbLj3nGLCEDrxEgW8SK5fqbKLrF5Dnu0QXr
	1lUxbfRZyLJJBWM5myUP0RcvxmiVy6C27f9MCBGo0PIl83zJTnyzomUquBfxx6LGaQgQxZy8qn2
	njVQsaDYbcUIsugDnWxw/qMGbn+F3z+C9/UCgvGtdlD5wlU2/QYYDRvUjW7Rk8jPwCh8+vfjOI3
	mAUCaelbUkj4EUIgTHdEjjkj2XSBUJsOOroD8pzpqSm5/6sgYnytESfZHb/1RP8yklnz4YPaEmj
	xyWteiiOaAeF2BxJ0fDjnQpUEU2l/ovQVRxzgJREU1pZkm0t/jUTSajnqPvBZG8xXO98NZIqa6g
	==
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202059137.0.1794328754936;
        Tue, 10 Nov 2026 08:39:14 -0800 (PST)
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202039137.0.1794328754273;
        Tue, 10 Nov 2026 08:39:14 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:13 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 18:39:02 +0200
Message-Id: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXz5Evr8G3BSCM
 gqcxb0oIsncSB8F2u+zKE60sBCcqTH8jUX3lDNK0GWGy3cRuIQDismBNYaA4+3tBtZYZ662YoRB
 TRd8mH36LDQZFVMyVy31psZmAUCaMnY=
X-Proofpoint-ORIG-GUID: KgjJDWGwOY1fXtDHAfmuXz_71iwJ1kir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX0NRd3p5bUl/C
 S85X5CIeBA7vFYNKUmk6Zlso5i9sNxikodtwTzGrA49ro+yXcr1bAmhEeRXDv41TL2K6U0OUWa6
 k7BGpQKutvfnGCKpVDa7eZhRHaQ1yw2gJC1UD9KL6rCvx6N82r3cmTRy1KVRyqgvIFwpOcy188+
 XAV9SVkofw4R9TKPba4KGvmMugvZ7BMI1k73BugS8NEX6YZlsr3dI9QzgrlOm6wPAl7DMXKpuiV
 9N1lrfjRaC2jgS8RiwF3pRwJ7/1ZJOF/4p0DqyHzZmylOYbcHg+ess2zsfm+YYuKjdZQ0EXT4RA
 covmvKC4QoFqmlD1LhurU6Z4k1rimrT37WQ4DYxz4HMOj9RPpdZ/78e9SzwLxFk9v5Gy0AQ0pTi
 UtP3+aWEyJMIqf2mr11slkdAsXvllnMkKV0Mh/+pxMecKq7w+G+IOG2pnMMzvMPqcU7pS+/c/tX
 SzQ1F9BGLVoOM27m1Ig==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af348b7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=1WsBpfsz9X-RYQiigVTh:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: KgjJDWGwOY1fXtDHAfmuXz_71iwJ1kir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domains, IOMMU stream, and interconnect path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 0000000000000..112580f3df10b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-jpeg-enc
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+      - const: config
+      - const: cpas
+      - const: camnoc_axi
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: camnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware.
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - operating-points-v2
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: MX power domain
+            - description: MMCX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: mx
+            - const: mmcx
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jpeg-enc";
+        reg = <0x0ac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "titan_top", "mx", "mmcx";
+
+        clocks = <&camcc CAM_CC_JPEG_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+        clock-names = "core",
+                      "bus",
+                      "config",
+                      "cpas",
+                      "camnoc_axi";
+
+        interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names = "camnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-peak-kBps = <262560>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-peak-kBps = <524760>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-peak-kBps = <978600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <480000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };
-- 
2.34.1

