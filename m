Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578393B71D7
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609490; cv=none; b=I2Hbz3VpUkI1sV8P3afo34RSs7SuiEinuq6lNCs1NSFiyG8JIhsTICqBCyMxi7Xj45PdMUywsoveR7FsWEdlkCNXxwTTlOUNzJmz5lWuSxj7JaE0UjIJd4lm0kp6peg7wLyG91l49zpj0vqZoFG2gZKpN21zi2CY0tLuy7yQFNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609490; c=relaxed/simple;
	bh=vQcI98mHW5cpbxMk3nl1iD96Gz0JI+QLDeYvamLfbjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6waNFAlpVap6z4OZaOubkA53X4Yi6k5IEPZuW3x+U6Lv5GQ/Hp2YEB4LIVFe8gF+0VlMOcCxcmwSXPwQZqr+r5ZHCH6CCYrH0/l/C/pJpEwEAbVmQXhzo0ZBJKkSNJaHpJgNVkRs3a8GGcAj09iubWz9MA6OzJSvi1sb7zC4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6AUwZYZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/1PizNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6AUwZYZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/1PizNm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L46KqE038450
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5M+3OBo3lDOzvFXZtZCLnYZlkZ4hNRkyNp+GIw+KXZk=; b=W6AUwZYZDV48GpjB
	ODq7v3HEZJ2FkKcGR9avAgu6CzJq0s64KOTAqk8nNmgDY2eEpVwagRSV+DHbHm4+
	73fRqcH3rgydXrGVt7mFg3ccaBfVbwsLvqPrCCWMoBES85MJGJi66m90HX8k93Y+
	54NPRw3uMUxAvq+FRJZEPGyNxaGsLHBwlgbqSvDVR1YWn4Egc2W9eMba6BF437wF
	dbtf9RziEePz5DRTOhl9aRldjVtSOOvsCjw2QA6I5zju5xGjunzRf9iMvqEv494Z
	Ave5g3UgCIZQvVz2JTIjQz9BtnXSvxkHeCgdE8oA2WLBD/+F06GDv+TBjIo4Ssi6
	ngIXLA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es04g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb733fc5024so2896131a12.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609484; x=1785214284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5M+3OBo3lDOzvFXZtZCLnYZlkZ4hNRkyNp+GIw+KXZk=;
        b=L/1PizNmIrKF6hZDLM28Alb+b4YoiVgJPBU8TCsAeALi0IP2nZh8J+QRBdW7OEy/KL
         kbfPvKTzSgrQE9NdugZeQ+Wvb0zdeRbHeOndk9V4rFEPNXJe+uyOh8T6xCCxbHmjtvCc
         HDtMCysAQeVsXO0y6PVbUW7SPslP/DgmSsEbSr/MlK/pO621qqW25s6oImVpewbE28xZ
         xRrH2wSH37j74H4FnwSyRDzu0lfJ2EmPG445W77u8ZT1txeCRc/JMX7tk9JEnzvAwoIV
         F/zn6xdS528Fa3Kq6ctvGtLbEZ1X+m35cbM1imIoAGtKS72SSxwJQXSAZNJWLnrF11DC
         lBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609484; x=1785214284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5M+3OBo3lDOzvFXZtZCLnYZlkZ4hNRkyNp+GIw+KXZk=;
        b=PPMLX+rMvtWWrEOmjMzVG9hYVpomEcGNVlMsGfI+39WXpmnBSTKqSPyrzc8008hzPz
         AK/5QJCiGZbjdFNh9DvJ8d+5vVxPfPCDUulz8ZsOsNMvQ/78ONwY823Wuq660WDtGxSi
         0XaywRhiXDjckLLJP8t9Ybrj04HOWHp6/NPOigZewLI2189rx3IAc3jo6h+MAMRRdyWC
         h221XS903rjJaNPl6Lref8P2q+QX7SRosGGCh8ax/1Qplq2rbTu9tqca8NvVSKObkO3F
         WU4aBP0RXmdXjNHtoa4hIOiAU52BZpEIjy/+K3vNI3iSgbl+aPvLc2pmtPOzzazV2Qkf
         lWQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCs23o79FvTIdU5b16w7PWmcDzn7m/EaQPVKbKuXnebKXB52yLKbok9is8yiz2Ic0nI3aPtTia/uZ0Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEh5BXtwGO3lrGnt337IWmaSl6HeVlHpdAYZaBgU2jYyVe98q
	HWN/txR8/tQYASOpQoMWRi3/lRz5kGZ/e3vSgsbbX+fHtB3uZKvHZs5vzUCwyQkNXWKsQASzi75
	IqrqZB9WgecSNEimLNV0iG74WmWvYjnwgPfRlQWt8S5k/ic86u4Yo0VUt4HeX8Zqsmw==
X-Gm-Gg: AfdE7cnk7Ad9znI5BehEsHvsX0godBSOOe6y34bDIfkwRMFY+CwSRlMhzmDU5dP0wrw
	UahR+JwNZW0D0sfVWbB6+13h1xdzVrRLvgLO0e7r2WrpDzG3KMAHFO9ai+8Ju7DUWVZfGOdCSVq
	WNucRrhzmTJ6Zrgr/tZhLej9yjDjA7R0pxXacmktgx/wJK/qab7N9/FwlBRFsuKqSU7yVCaxVGI
	+uz0DzCZJ4mSulEEJdAmcXfWsKgDdgfN5dedLmaiW9uqFbtinHfSI2yyKy7jDlSyeOXAioa5qhG
	IpiqXI0wD4mFoIOb5yVafhmBuWix3HktjpC0AYv+blDxi4DyjHb02NrDqQTXu9xpGJt4W7ek9GX
	kI4mQetmYgosAR/Pr3Fdcq1cFBRN2/Nxi7Tph0J5Z06olbzfW/VRzy1Q=
X-Received: by 2002:a05:6a21:9206:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c3ad807e3dmr17366870637.32.1784609483733;
        Mon, 20 Jul 2026 21:51:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c3ad807e3dmr17366842637.32.1784609483174;
        Mon, 20 Jul 2026 21:51:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:21 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:35 -0700
Subject: [PATCH v15 2/8] media: dt-bindings: Add CAMSS device for Kaanapali
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5efacc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7Lj6VqmjGphfb2gh5wsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mNSRC0yfuP4720O0kjvJdFglJo5JQzJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX9EDOicGjxFdj
 Io/uXezcebv2G+ztT14ICO/wUddNnqKiXeUm5NXbf6xTfnfY/7tGQ8xDT4Oa5w5idGYXc1OgyqX
 sPz0ciz4dDxgmWWUABr2VzKufXJ5ruoQP1NT6sMxbkZm4LPvtd+4ErCbFzjAFpPFDFgNxkVVpPf
 V7XCTlFd5gN7S+ALL8jzHzGkDKhByNFVo+HvIPALITlHlspo05alaBM722q3bOFTb6xAXs5xgtJ
 21gHZhg/F373UkOtQWQads2H0rs2LYxSxNY+SU76GhHL8tyZn3+m2IQiGpkppJEKv5nJniA2r0u
 RH34jXgdENa89JuA+1oOi8qCCUHR8/hbcdlINoH0xcVCOVZPKB0BAIbIXAnxCdsWOYWKPz8HAo0
 lekT+ENGBASH6+jKTXZvR60zQrtOKTzAnIkeQRba0CbPE0AifwZtV3KTn7+pxgH5V7B31EKs9Uv
 5fFky4s93PVoy04jH6Q==
X-Proofpoint-ORIG-GUID: mNSRC0yfuP4720O0kjvJdFglJo5JQzJP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXw6CmLAs+NBcp
 QawVxbZg9K9KfwWI1zPvTvq0bd7LiChzw7At7GbkLu4buHi1zzH+r0ZmBdFS9kQl75o5BQEw9Te
 70HDgrhNeg22S69huppPdw1ZNlJDq8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

The Kaanapali platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 426 +++++++++++++++++++++
 1 file changed, 426 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..57f57a16d477
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,426 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  reg:
+    maxItems: 13
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 23
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  phys:
+    maxItems: 6
+    description: CSIPHY 0-5 PHYs used by the CSID controllers.
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description:
+          IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description:
+          IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description:
+          IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description:
+          Titan GDSC - Global Distributed Switch Controller for the entire camss.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports, one per CSID. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+    unevaluatedProperties: false
+    description:
+      CSIPHY blocks decoding the incoming MIPI CSI2 sensor streams.
+
+  "^opp-table(-.*)?$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@9253000 {
+            compatible = "qcom,kaanapali-camss";
+
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            reg = <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_NRT_ICP_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            phys = <&csiphy0 PHY_TYPE_DPHY>,
+                   <&csiphy1 PHY_TYPE_DPHY>,
+                   <&csiphy2 PHY_TYPE_DPHY>,
+                   <&csiphy3 PHY_TYPE_DPHY>,
+                   <&csiphy4 PHY_TYPE_DPHY>,
+                   <&csiphy5 PHY_TYPE_DPHY>;
+            phy-names = "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    camss_csiphy0_inep0: endpoint@0 {
+                        reg = <0>;
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+
+            csiphy0: phy@9523000 {
+                compatible = "qcom,kaanapali-csi2-phy";
+                reg = <0x0 0x09523000 0x0 0x2000>;
+
+                clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                         <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                         <&camcc CAM_CC_CORE_AHB_CLK>;
+                clock-names = "core",
+                              "timer",
+                              "ahb";
+
+                interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+                operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+                power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+                                <&rpmhpd RPMHPD_MMCX>,
+                                <&rpmhpd RPMHPD_MXC>;
+                power-domain-names = "top",
+                                     "mmcx",
+                                     "mx";
+
+                vdda-0p9-supply = <&vreg_0p9_supply>;
+                vdda-1p2-supply = <&vreg_1p2_supply>;
+
+                #phy-cells = <1>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        csiphy0_in: endpoint {
+                            data-lanes = <0 1 2 3>;
+                            clock-lanes = <7>;
+                            remote-endpoint = <&sensor_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        csiphy0_out: endpoint {
+                            remote-endpoint = <&camss_csiphy0_inep0>;
+                        };
+                    };
+                };
+
+                csiphy_mxc_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-300000000 {
+                        opp-hz = /bits/ 64 <300000000>;
+                        required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                        <&rpmhpd_opp_low_svs_d1>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

