Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28373F9A0D
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227162; cv=none; b=m/D+tCWFlpOdlMEfWsqc0mM3hbJK4Spoky0NR5i7TejCWuu1nMcxUdB2SMFaBt6drEaJ/G2FpD3JE7LJezBHlkv2BrLf2Hni1USbS9hZ80XsKs2E9krh45wmqvhDaLqx0UUWbgRK04IJdK5rAPkI/2X4qZM0Us1bibtjY789wek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227162; c=relaxed/simple;
	bh=6evu3aesdSZyxyQpr8UnWBSTusJ88s7x832RblxrRpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rGG9tUABet+VTS/EAhHiLF5i5FvCgmRWhAb07nIfrgwOEz07d33MGr38x3/moyEsFsdPGIvYgqproIALgUJuJavt8mafiYGOZ87TU4hmu/ICSwysbEsmCPv6/AAL7SPiDHTz12eCk0YrZvH+Q2kzPizdKEzjiaWy3uSgPEdP/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OapyYx5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1ABVFBo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OapyYx5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1ABVFBo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82CZB2480090
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SPz7u/BMzMP
	ZviDAEkDgcv8666LLO11YQMLJEjnTIYI=; b=OapyYx5QpMQ/B9k3Mm1qFF30DU8
	wDcFXCsfZuS2mJl35orLQpfy0iYiHGaVfbIrIekxsZh1nMYPUI2c/RSigfr0J/mJ
	lkGhSLif6FCE1GuKw0U2fMs+5/xh8VRV4/1tlEFLqDfg6JWo/SvF5eoieQZXiYnX
	nq743W+hIA0XJuzE/AIjTDCKHVNyP6mkkBxJ4MGC5ymB2gGezx7ZXAXNJHHoIFmS
	5Nfl33LuvyhhDFPCBhERP7Y0sU8cOotFNQg4SYwEZjtmXOGQEwN8G6kL1hmE1bpV
	1TqOuzu9yEk45l2YRZvXT1Zw0jWPk06k298bJYZibnBk7ESG1BlL0f2G5bg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy10ygp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:25:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ea75996387so86144236d6.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785227158; x=1785831958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPz7u/BMzMPZviDAEkDgcv8666LLO11YQMLJEjnTIYI=;
        b=D1ABVFBobCKxwYS7bC4AK6QbQRB3sSwBJskSSvQzdOOubratft6/KLAbuRInbWE/AE
         tRRQfU2FVwSoBxsDaO9iKNhbXVeOlO/jjw291UjcGnerxQVt2gf1llzxovnV7F496Ao5
         EsuEqqbI5DuJ7BrUsQgDrFgcnlGfi4EBBWM1Nibe08ZHuODtxzFMJM+6VM7BERcuvj1U
         6Z4H2xz5VmNMkz2xsprJzfVVDkrwHoIVnU+YqZHi93kJdbv0pfB5951oGI+fjs7zd+fR
         8ToBgjVw2ITq2UQS5gi3DRSF/j0HTw4lEqSXWLkwllsntoUJSv25kSazuIMYpXKWVXjs
         rh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227158; x=1785831958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPz7u/BMzMPZviDAEkDgcv8666LLO11YQMLJEjnTIYI=;
        b=pYJm8FUpKT3D2Kxtaqt69ol7RYSknMpkRBWVKEXaK1mf5amgy3fYi32ouUHV0NbeJV
         K8KRtKc7h3affrNa8QEAy1oNGFuKQujSzA212AjP7/VTCWmQb6VQC02wvbnn8Z6dEv/P
         kN+Ja7BgZws6mx5+Z/jJ4M6IZDJu/TDDc0kJhEBCdX6Dpvst5/iObZgC08Kq27qZya4h
         wR1e1AU/5Omi/g6sSL7nFXeTtfD7qFTxHr9osdUTiDFeQAsyZLucRDbGYFVn2TitP35m
         PY/ax6Lc+iao0ugZiTNdTwyN+eHgm5Ma3R357V5EzlU1bLsqiRge2S4NpBy75zNnGU2f
         QTMg==
X-Gm-Message-State: AOJu0YyNj+JaUSCtMeB8smPs81Q2MPe1kTLpq4iY6NuPDiQ2+GS533R7
	oofsVpr9I4uwgtB5eObDaZ1HlX8ud2cO0oM1LJTr1tFSWeDAXWKymkjJ98r7U+oloBUYwC7iyvz
	85Ow2zz4Ilmh5bAPfeyYEwURauVna4IiRGEflvuJRFmIEQYtFAITi5DBmjBNYNKfRrbpn+WB+E3
	gN
X-Gm-Gg: AR+sD13RUUSZZVHOdHQ8rk1wGdlwh8gnkx1Y1+vok3Us55065zkHVJ5Em4ck7Gq/VRF
	QSjAM62riZGekX4yWaaoPVVy0wb0Es8FhDvc9Ely1WxJ0PIX0+46gPVdj3aK6WKjnpiCfBaymAo
	0bhzgo/aDoa7ax0EMJypN4T6n2ftlxeYIP2Dn2hdmBD2jiWLpAsJuhbOCueSLyHKItNGEIRqGZR
	KF+EqaoOMPielJWkXcUSGlHvRidnngB7lCylBzp2l5B8VY1ZzQq5Svpz731S7iqgLRsbErLuO8b
	h/vkICuIz3CVeTH3uxdByOjm2fXuOXyr6EUNCypMM7EvfMfzmRX5QXDx9CKcZhapUkAfZUaXZ7U
	oOVwSxZHxHK3uAOAnp7GHyNwh
X-Received: by 2002:a05:622a:1805:b0:51f:798:cf27 with SMTP id d75a77b69052e-529d714ac4fmr9809971cf.67.1785227157813;
        Tue, 28 Jul 2026 01:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1805:b0:51f:798:cf27 with SMTP id d75a77b69052e-529d714ac4fmr9809781cf.67.1785227157353;
        Tue, 28 Jul 2026 01:25:57 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3585484a12.15.2026.07.28.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:25:56 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 28 Jul 2026 11:25:46 +0300
Message-Id: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KOjl1YhzXev0xLhBMSGLnzep4Jt6VK7k
X-Proofpoint-ORIG-GUID: KOjl1YhzXev0xLhBMSGLnzep4Jt6VK7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfXynWk3Fq0VO3q
 btb3ODB0T2nh0L7mm5GZzZPzpIKtgy9afRs38erSvL5s4bd4EwtBMspuZUWYhuG8GULtdg8HEwZ
 SwmdceAq4P9VvcZReYdW6PDEgsX2UXk7kNGbQAENE1uJOaXiGqMNmGPdOiq1lLabICMshKY7TTV
 cb6oITY7CohYun9X3uNzTEwx6/kmDc0Yq5Dvk1//GnHEb31LSwSvqcYV5BCKBo/vpbGOXQEek5+
 QJs7IjQYT1FCaElpc9L7m5dOm4r74D1LBiTic0s5dgfQ5OQWOIC3SzCv4FDpV2VT8Izkc7svGXO
 1wQcQi57NR4jho48yS0+4uTo8Y+NC+NIe+hIPr3nF0iYxU8tMSa5Wbi/thPMdFIx+PGSrBzgx7D
 yEQHxzH1NSzxd44zXSA1HUvOOttPVpD2l9mF2eCUNzLfCVJU/Tuvj3SHMRssZJ0Zf6QbK5S5/IE
 QrTk7oZ3b8Jgfx/ikfg==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a686797 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfXyYt/F3miFIlq
 GgykTUkDTKPm/3nx3IZofhl5xGTHKiWQ9ZyCQojGyBUUK/t6ZN9YcScjDN4JOyd1iEg8zEb8S2l
 U/WS5TWL7a4rza+S71CLL9YANw2wMsU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280071

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 000000000000..6aa2613bbf3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,154 @@
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
+  - Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: hf_axi
+      - const: sf_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cnoc_axi
+      - const: jpeg
+
+  power-domains:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: hf-mnoc
+      - const: sf-mnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
+      for the JPEG core engine on SM8250.
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
+  - interconnects
+  - interconnect-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
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
+        power-domains = <&camcc TITAN_TOP_GDSC>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "hf_axi",
+                      "sf_axi",
+                      "core_ahb",
+                      "cpas_ahb",
+                      "cnoc_axi",
+                      "jpeg";
+
+        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "hf-mnoc",
+                             "sf-mnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <100000000>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <400000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <480000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <600000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
-- 
2.34.1

