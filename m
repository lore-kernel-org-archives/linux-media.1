Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A1039A7FD
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179692; cv=none; b=bVqp9OejxjgYHaqlV2n4Pr9yRDMd8kF3rtCfytjHS5R1Y+7uInrtbl0ySgcSeg+1NgYEVH0lqlcX2KrBQNNT/3Y1/oqwkz/rrDalnTqgHYQ5m0r0CLroqnPEtG6P8jPNYmbAiYkqjAHqxPCr9J5meaiz2iU8pPs+2SszvL/3zN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179692; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L34rhFjZCOI9Hj2Fav3REMjXv067NEijyDRLP2kBvLMkMa20IK0Pkw3cgxCvp9AIfkK2LH1p/zYYQmx1641xsOLRfjNkn1oU10rRoCPSQmX1T1ebxszt45RC30ryqguBY5Xg/o7zaIZ5EYR41aqU4DOZDHrZXsKZf/rAZAtn8yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVMi0vfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhtFDnXS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVMi0vfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhtFDnXS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbfK23028214
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=SVMi0vfpY6ftJGib
	Whf6TEHNuVhV8IJYYsM/inzioIIOF7WeZkw7gsOnAjM3iu5C9DKb645316JYMJxO
	kRptwVMxGyUbdqH6YGtSRx9qGZVp+dPYZOPNfgODKXMbM3tSx0vZtOfm0Odxm7Ak
	8XC4pGt5OVLHZSijuDMiIdXjKYtnQXFBSRs8cuh52CGuxQmNo7YLPZ0oyA0qTyMA
	tpoLYwGWAuttawCw71QKwtinjTGZ+0trXXzrUM2KhmZNl81zTBHAcASxfa4h0UwD
	ZSFRYFySCmA5aClXvKC6MvmNXabBZauDxujWonNQUnj1l6+x9bBFdtF2qzyzUPPC
	/WmUIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwass62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:08:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so18133271cf.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179689; x=1790784489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=EhtFDnXSv0d5D9yqQ0do6L/5lF+vsXNjRjF/tud7W5ORJdLheA9I895EBIW55U4dP5
         yZbPU3CHfJ/wSpWquDMq8I3/Z6GllOiwZOs7W+qZ3ZO+llb2COXYR4zpSIaYC56hFzRm
         eOqBg+D6BUw7ryHAF6vqxYB7LgjSy05KO2gBEk1D7ol+uCcvetE22opwgemU8iT/wfT7
         D1ZVG2/C3pTDHc4TLr/QDMNeHG1sburP/Ysz1NWk2MbTzHfdhQr7saUzaTdgssd2VKAR
         oPD/lwAKPD8sTZexvcjCXsolCtT2IMx1n1yQo0C3hOI7V4jx7hZBy+xLgrOqlo0HQ6rL
         Ttfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179689; x=1790784489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=1l4Dtj3esIbs3d+YCeqnUaBeZ9lEggSFztyQKVETWKad3cTeOV5q/6KNbWyQ3F+HuA
         yApV4C26wIGwQSqQYAvlmfk7SOju3wOzKzUqletOO7vgWwSafVo9B0lER7mk+aMRyxHi
         s0dLgFxvGJDJu5/VQfuFFXvYFdHj9UTZ53n8eCaoXUNaaDinyN/h35t8AoHLLRi7SQNW
         bFqeuY9/9Yvyc0/33NLbK3Rj/QwhMfg9Qxin+nOPIDpeek0gA4DB1LzSDlSj2eAvf3Sh
         GK6jNyJqL1KoRMsW7kEq485DICegpWFV4YNQFBRz9osFo8ZgiO4Id3NKA3MT90+GUmZV
         EUBw==
X-Gm-Message-State: AFuF++lwOHc49evzGFOssy/CxLFfe7hJuNrC4Piti4vzoNf9a4bz2K//
	pkPHxpKbDDK5Cjr79zJcPrPjP+1QxwXlUmvTctHBy/NOqrWEKYKQyXDD9qwemNdasW+BLdJg4g4
	OJNrU0PKmPPid3QP3NYM6F7QiyH+JOkvxxRYNEAOWsLTsOxNU5OPdEMq4AAbo3D7eQQAY686/Hg
	==
X-Gm-Gg: AYBFou0BHgvpuHi7fyAC2lLdg7BjtmyRnEVzOJSkjZju+lMzBzsh6b3H2SmjmGU88kV
	wlQ7GfzQfqLtl/g1/fdyX2F47G/EZQGXo8J8VJEe3gUt7TbnGfEiag54Pj3jQeaGHREmnBoZt0d
	kYNwrkJlNf5KeHFvPn/7GZMzjU2Obgw2vJdIxXF0BY2nAJ+NY+rX/oHT06H4fhdk69gULBajGp1
	cS0g1GTt/ws7OBa7QnpoSZgorFVHetVhD6tnbT27sLxyGKzeqYybdZ1EVXJoijjQMUjXVuX7Qbf
	uiZJ/hTiUem9qR1rQ5LUe3cSQcbbJ/2wHK1wXYFT5x0HL4uihXQzosuT4TZYnTvt9ZPft/76fU+
	iUVGzvoDMfbUVGoKxQyVKeOT6MuEKhrlrYhjr8P4VVRexzsKNwyptjsENXlduFuYrdNuKeCjcqV
	LiD2Sg5/vQVbK2eB3XWgaZ1svLALVUlxQr1R6puISBrr2+9KQ0rjY=
X-Received: by 2002:a05:622a:8e:b0:530:e5f8:7f59 with SMTP id d75a77b69052e-532eacf13f1mr48054491cf.30.1790179688682;
        Wed, 23 Sep 2026 09:08:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3a14:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5c9f16bb4e2mr3557461e0c.22.1790179233095;
        Wed, 23 Sep 2026 09:00:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:23 +0200
Subject: [PATCH v9 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-2-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX5VguhTc9bfb7
 g+e/5W6M2EQ3/8TXQ4eJlVkU9RAJ/I/uAoYL3ukePLI4bPafOXdGI6Gk6A/8WdBiuJMZenq4Xtb
 91LIUeSscfkUKHKduxD31CMeuTTyhzzdk846MU2KUkMKrvXXWNntsykMYFZVn/DQq59c4dALqSy
 reVbrbyG+OqHkE3Gopk0uqX9QieDQLA7Qlnep9UpTMfjMvi19Wqo54VVCbuLz2RyUEZEWe9j4go
 wMUZ6SnUQ56pQ1skDLod1NHyLfwXN1I9vvxPAmQ9ywnrUInfCPR1i8t2PBoAJ++/yePuccEPQvx
 rOIvIN4FIjKm8HE6OIlN/BvSXpitp9OcPNi37G6tVbrmc/d2gWNETRpzBVwD1PNxJFNyT+tOQDf
 fmfZaWoQr2WSHdYLULd+JHpD20bSraNvW96l/tUq0mrX0bFNE1KBbF9was+cMHvnJprjPJ8SAiJ
 1Q0Cc9L/RVT7bTqNiXw==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3f969 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: y6ng8LhyhnRq6kjJfyvt5VX6O1Iu68S1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfXx/Y64yfrVVtU
 sQceuRSGdPcMesONpdoWniAw3OgPiIgwpnEz47OMMpv9RZ0ny11m858BPE+lbh7XRlBL7PHyDng
 ILur6qBtt7WrkaeBQDCyI/5lGVBhlzo=
X-Proofpoint-ORIG-GUID: y6ng8LhyhnRq6kjJfyvt5VX6O1Iu68S1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230064

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

