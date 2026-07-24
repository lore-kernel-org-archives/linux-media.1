Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319F433039
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896943; cv=none; b=owJtIW8MpVtgeiywgwnKkM+AdPnFFL15622txK8zrWuw6NdZt0magddtiKIhfHpBg56IoBDub3A+3JBlo9WfdiPl8xJfB0wYb4O+hae56h9HNq8/uJsr3cweDhYRlCp5ezKWUYn3epK9JRyq95fT9dHGx6nh2b0EZzTQbbv84GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896943; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rkowfuhja+vWnP++p5l9exDMjNI/tQdjYteYxCHs5GfooXGbYPexm0YDuIcua1zfLUagc8Q3HqY+MGYpLVShMg1n3rWx4djoggHbL8GlmuBmrMFj7gmaWrmpDfppb1psGLa1CpziUU7uiPFuBGys3x9msLbNOBGr07l2RLo3uIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm5PBhZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0pMphmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm5PBhZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0pMphmr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADrJU2742608
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 12:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=jm5PBhZ0GDj2IwPS
	RFAL81r20fKzNEh2nr3RWuK78sA643vgkXGu0EO6Ace8Jv6cMX5OPxUmq4QyGWtM
	ydGQlaok0LQ9FqrD3V4DBXc42893bWQaAc7C65ffF6Z/rBfdclIxciZ94fkGUCTj
	ZhuLOnbPq2HGBLNTrPYfn9PPjd+FlzSXi0lOIbSZAgw87KQLiA4NfrwTpnSfjcoe
	UL5ubf97/goRho4QeIV11h4VmB3+X+pbTJnDkVW4SaobjzyQHqbovmLNdEJDbdBE
	jQlC4coSAVhYpUvp4miAywEluRnFQ3dQMx2b0oqz+M2feeMKNkk8uoiWM2f1PIoq
	sG8zxw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51sgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 12:42:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so6303271cf.2
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784896940; x=1785501740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=B0pMphmrVkkP0PErOVMecdRwv65XvguNq4ZHSOitTy3S0dAU41OFX02fsuTj/8KeWw
         520EpotXQvgMlYISjMxNAFwV5r7/qJtxRiG6OsB0mbci6jLsnRrQa4FK14PDks4QB4gv
         FuN48xOK2zVcZ0Erj/Xk6nLyhOpXI9B08IRM1H9hPPiqxow3hW0EjfzNU9Orx4oAnHB3
         loHFqVYFiW/9HTZdGMoVsMMD5vNir3bvK2pgoWJV0IZ6kXZc8INGF7MwVDz0CYwc3U5a
         DhEWdoQcN6XhhcYVBc1KzhYXmMnOkVIhBsxOXJe0dLY9qOkLiFOPtmGFYwEJmXHJJXIh
         BpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896940; x=1785501740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=dTIkKq31KdoSSkSLpeNkAHa7YjSbbm6EyR3vEyHKT2lPviDZoEtwpf34oSevNuCEkL
         hFl2Mh92ONoL32XdlPK//31VGmTcPpY6tGu2jktOxY6u9HtMu4D4TpBNI/tMe8ES2Ybt
         KYuHRQjd5xUdYzdU6Nynfrd/1ajUrETAE9TEoG0YraYS6Bp12uzycz9CKVJBMEAv8Csx
         l26dmrqjGt1oZc7FbbxOX9fB8dZ56QoZX33WAp6U76Cles/7Pu29CxbJizwrCP/QA8LT
         LkUCqghOiG+fav1fdWY0Ujc2luvxYLApxUTLP2MswOh8Coub+9150ko7iyl1x3vQCgfm
         eMPw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2tOhbVctlhxUm7dlPNhSYf5a7+UKfyW3S3vWoebEK/73qLVXyhIHZg48gY5bcCBjwCqW4bmXGjzXjrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2olgHAq+/fLRG8/mnfr6m8Pwnqrl9CW7v7J2VOadDKIgLrbNh
	dCzOUz03aHMsV/AwM0Dtec+Ds4A8EvlKK2n8rfaZDGjclSHsNhYHDDaYW0C6dxjttw+1+rA8SRl
	LNssBnYjczS0S1DobZLCXCYSFqLgFEfHl/PChIadrcPLaUItaWkItz9okNHKNm8Ifug==
X-Gm-Gg: AR+sD12C865XRfwfqF5H4Cd4d/tMwImDVJbp2F90XpMYViFmzk0PyUejHHSaxj3m1rx
	uimsgKOWcLVM//A8Ps4+f3IFjEefNitm7jtzOyyQKfsTrloFfRqkDYgYSTYOiVBHpMHb3rir2Ey
	SerGQnfYIha4azgi1h9D3aQ5lmvepVTRK/oKkMlMmpsEI8q9xfkJQkACczWp9wLnEC88tkvyFiX
	NqqzLr1n3nHsiRezZ1E7P66pBlz4xahpsghQmrjpfN0aC6tvXuQrwx9Lv0fXlN06UYOZ8AjHTHy
	h4DGphUR9iILmWUMC4pzwd4iQ/UCJUL487JmaxmQBQjoaDRsgw2TSPVUjCqp0Zrr8upvM84XyY9
	UYui+0UKP2i/jEKkv5/QP10s3UneVuTieoEMIzz0j4i2z1a0+pE2qwISdRv5KYe69pbJ0myfxdi
	LsvqEKfq4qxAoozHZ6sct741y95/N0XJQOT6WobLSdS84fKMzgPQ==
X-Received: by 2002:ac8:5807:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-5283e0041e9mr62363471cf.78.1784896940192;
        Fri, 24 Jul 2026 05:42:20 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-5283e0041e9mr62363131cf.78.1784896939715;
        Fri, 24 Jul 2026 05:42:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm352591166b.43.2026.07.24.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:42:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:42:10 +0200
Subject: [PATCH v5 2/5] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-camss-isp-ope-v5-2-e70ad4fa39ce@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a635dac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: M45w5HmnaG1uUEjBsZbrZgtzksGWBsZc
X-Proofpoint-ORIG-GUID: M45w5HmnaG1uUEjBsZbrZgtzksGWBsZc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfXzc9LChJ6DObN
 EQUIN8DLrWjK2Ft+iIdTdGeFlyHb2nGOu+BxTenssvPkbqmM5BNvAJiiI7EoKr9Lgc0BY2AWRrp
 CDGn1iB9ptyHCTGHbqDOuZ8+nn+Mj0U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX64Okg982JlHU
 TRk8Vwy9L4H+ObR4PqCunrUlKxu3BBF6RbBxmKaxXGnkMv0+QjsL8uZZKTmfEYRYz6sO8ivjTvK
 tLaKMI67k27sd/FL6X+nD5luwpjGoKWuwlwsA9pfjBnML6rpf0lNV6NHwpbZ4SB4F/mHabNDTDO
 IF1fwmwvgWytAIzECijezw/iWXZqzvh/bLLs4QWs/N+014QuDdFfHndc8vN8QU+gHWRaJHLyQ84
 l1e1QbENXERi0hVA+10OUSryvzaPeVsQCSzimu4vpzWlyGbfW6S4JWz0wHLlVg9p8R04+q3NAdT
 4Vsz/4dwB5LY1I/yrIWLZ12rpyFezrultsRQbEUTublR3N4QaU9NHI+IB709+qqEhxzoHYwGL/m
 5TmIaqwEsCYf6c4AQe6/lFR8mwQLmIgKluQiI1ROvuKgSWRV9L3giiIVk9/Ra5gOXjM3kOSBje/
 A8/kJwBW8t2GoQ41QDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240115

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

