Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529943B3F5
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327400; cv=none; b=ZmYZBFIV+bO0dVNZYpEzDPWytqYK63v3Z5hSJxiHDFLtZL04IykRRe4udcF3SZDhJxyk+fXJTPE9kvYwzw3Vczk8g251k7CWkBWKj4EugKlEhOQEmPkvs2IukiY2+RsfHUMwK9KNHglpS1re71egC4+9Oif97+DtteNDR/99L8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327400; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lFvCDqVHB0BVE8aKqfIDU5CPVyZAsCQQTo1yYHeFfUq7GEzT03VpFZkz0tIY8rBuXbrFl42Qej3hsXcpyjLhwr+66DTzMLiqxF4fsDxwnjWhM0SmuzIFo9Dcx1ceS9jKv8G8bKFURYFxqV/6/1j5heBRNZdj3fWHrxSKgByv+rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W50s/3to; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8ma6WjG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W50s/3to";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8ma6WjG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YwJ44103023
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=W50s/3toqVcpZ5Ad
	9LvlZgFauYpjQzpDm7D7Y0sdy9A2Cs8FzD4i59NAvmxV5dBLX84bQ0AL2WxeqSkj
	ZkgWnS4/960Qcd1T+OwYv6K1Q/OLbydaRx0x38D08NbeP+/j5cMpbdpwT7V8B53R
	jscgHTt2CDueZx8HquauNx7GPrjbNVZAcCGNT01aE8nQ1963/2h3AhRaslz92KoZ
	iNaoE3sP5hqWvQDpk+EXNwxTIUb7CtV+Pe+VNNfc/ntjJ5BghWa8RPkBr/p4Pq25
	rzjVkHKxIdxcTo1hq/LhZqgSNY7gaGEBqYyU3bKEE9+FRv+6jS2gTR5HrI4ZpwSJ
	NxktIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8un9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:09:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so195689185a.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327396; x=1790932196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=I8ma6WjG2HgpnvxSc0uEB3SJLUN31itF/TRAl4tECFH3ei1mjyEqOYf39p5WjZvP4T
         MPYhx97FdcHX1LGq337w8OspIV6hnJ1uyTNRDEp+37viZ/H4loFwe6YUeL3aKi4sKGOg
         8/0PuiEB30vMBz0ZMTZZ/dw8ktirIvW/fH1Xj0/+Xqse2LePkM+bKw07qf//CpfkOIIJ
         yaxsEChDXUXZrkMuhkc/6ShMqQCn56vSleiVfqS+uOLR8AJNVaHxmr1MRd7cKu3Q9lHY
         nXPf+MR9sMtM8xSlp5nHjmPiA4oG3lVKtlS6EfTYRa4gNphNauu7E3TTRCkjvnXVVBuy
         Dtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327396; x=1790932196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=m8xsJgjgxOqOjXYnqQuBk2ixj07AJ/3ATngneutNEr0T6l7GuiYBRNVbLmvzDW4bSW
         HzzH5+rWOOiv6N0/wrTZgYW1YqErheziYO8Y8VqY9M4XfPGcjqbERA8bEOEgJa36di6q
         +ztR1SNjy0BdxEYcR/7u+E/k651kuk2fuoXr6FjNY6whysXIvitfmNGnEnOe/8WkwAd6
         Tw2+ezW+mza4w2TGbT0ckBjlwirx7BfIgcZAyFm6wi7AYlMtmPEAx0wrOtIQ0C03t8Hy
         MRK2yFIQh3L7dKroku5mSo1DO5FlGAI8DYggivfVZ+zHlTVpuYqOWiDlIlClytU1qSrF
         W7Ew==
X-Gm-Message-State: AFuF++n6FS0YhlY2KbzW+WMJ94w7H0bQvXVFZ0Yr0OGFihK4Fdg6ovrg
	RHEIPOhTCuNxWRGN0chBvK8bbrHu8HFfyWuSsndcnaoq+DhoZmEFaIJBthRsy1thp54uAOXv8N9
	jEeNphqZVN0vo9mqOsSdq4CZtTGdIyHgXuc0iPBtRfAEpk7+XVOnbNGOyJQVqaczCQA==
X-Gm-Gg: AYBFou3nuAGfHXVwOzuQZaBk6eE6RT18zdMC8ULgTowi74LrvOq7neHi8r2VMozjOB9
	JOv9TPtploOs9c15qoOVUOnyYX2nV0kJ5RkZ9qLJguI4sD0JjRBLKLIxUS8HokANPjZb3mW/M5e
	OvNoafSSzqP2160qnRkSVKJE1xPstF5jc+wkQYNYk0fTwtacoGbF36B7S7G68+JupLvnd0ie83G
	jgr0dztmdCYrZ6JQrObW45YGcJ9lYpjV/YIj9GV8/l48yu+m2ejMrtnr4SF4z0xE8kDo02VDZr3
	8tbey125YUCkkgppnt8uAiZP1jXqMzAxf4z7bdxIasgBkGW0blmZtO1oZx6tcQEMJ0BE2OHSGBC
	tUebTxp1U8Or1jiaAzMePfK4nAAvmgNAT/JeWaIpo5l5cAXekO1RtXURuHqpWK7//OgT+6q3AGF
	b4nAZj0mfNLd9qMnwUuwpIE6quHYAM7jy3HoevgoJMuMyK31LPHS8=
X-Received: by 2002:a05:620a:1d05:b0:93c:739:dd5c with SMTP id af79cd13be357-93c4738b2e3mr205794585a.25.1790327395977;
        Fri, 25 Sep 2026 02:09:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1d05:b0:93c:739:dd5c with SMTP id af79cd13be357-93c4738b2e3mr205791985a.25.1790327395548;
        Fri, 25 Sep 2026 02:09:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:54 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:49 +0200
Subject: [PATCH v10 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-2-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX4B+nP9mtmJwz
 D30cEBMLFJ1U1z81HgEdnWIyZEPTVavjhcA0rJfXYCBEne/YKPBIucp4MuqjrvI6w76Rgx6fm2D
 +ZNRslyVfYFy0oa4fEYrfUcOTGR1t7U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX7DiEJQdYKBv+
 0POFsTO+W8tRxP5XnrZHwU5XH4hrew+VBuL32eM+vJ5T1UrFwFoW6vk6r/F8eymtiQ4nIvgx8pF
 cPnMw59dFCQ9iH7Ihi015bjvLwposSlBJNY8dIFeiVHj+Jb4PvPSVQvJuEFQEy5nLLOnmwHY/5l
 tv95uMRKJxVxiuNynZE4wkzo02rVSB00Wivn8r7Eit5za+gdZSAST45FTgBam+jrV36iiRZECny
 9BF/ZoHqAB8I79vwwUGIAwqniiHZhOVQfL9uGdUrBxaJ6s7KsGxADiyGMhJB5e1u+9DFnvGNwXj
 X1EuCltULtjbIiwByttVRC2GIcmHpN0og0mhiqR2eBM6tbrMtTBhGtzrmU3VBzcBcIFFq58gwmZ
 3Y/l5EXSu0BISNKDtKDWnunxr8q1rLjGm2dzEtNwvJt26WzWXEBi9+2KYBh9N+IdQsRSqyqYPOo
 iliRvPTf2swg0fDq9zg==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab63a64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 5Ivz61Ok2bUe4YA3QfQk6yyV1I1JKJxP
X-Proofpoint-ORIG-GUID: 5Ivz61Ok2bUe4YA3QfQk6yyV1I1JKJxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

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

