Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C43B3C17
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459873; cv=none; b=BxYTygf8BUhbhA3rvzrP4D/9YoXE2bzTUl/c1gyGnV/nu1oKEU6IysHi9QQ+DyL6K3ldJgNnmETZncOmm1DKvXcK5vPxpY1nWyusN8SVvdOYtfx+ukplGgVlgv6iB1eQx1ndCZGfTBdFsTHNiTLxn584rWw0tJ48QRaWi19dYQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459873; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDPN4giAMq5oas31hw3TWLGSIMb+zgJfq25Ut+LN5oTRtrYW0DkCvfe8DfTdGvSO9WVzuUnFBejbBfxDDup9SYP7IlsHVzy3lybOW73QzDtLrDDpljKGFe0/Xt+TSrmLg/YGQn66350bjb6oxU+Qj5Pg40xg/2F2bKhNtx7lhcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKX10Ys+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLSAJ5rv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKX10Ys+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLSAJ5rv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZeMU3126422
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=nKX10Ys+WXtgZEky
	aNm0qUs3q2jb0QImk6qA67WoHx/eMre6W0OmGTWzYbxHP7xdAd7Pz7X084aeHVDy
	VwbiCbjAiGTov3Rdv12DM+i9kWk3EI47KxEKBGZGcmRr+eCyR8DFlx6Vsuzu/ecz
	XJ2yTr95W14fKJZS2UJQqUilJzszsrVumUxxo1qL+CAGQxumMuTIafDIS+Vz7kRf
	9KTArW2Wbq4SUIZyR+DpF77TXfH/BmrMIMGE5hd9ih/grNpr24iaDJLOkUj4Yjg0
	v1JP+vNFrBdjfvzgsOqmY4dWeaxmCKJhH8PKybuYjFvEmY3wXCsjBGu7w8VamypJ
	4MNQdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9uavf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso329043685a.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459870; x=1790064670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=gLSAJ5rvmwIglFD9EG1hYthmJuXIjIboO7q7QS2PQURmTv95Ckd9t/1OTzh/ri47Zo
         CbDBwF0i2BOUJU6mSt8bcN6h6DWPsh3hOLDhvn+OQ7WOsM+OdXn3njUYO268JVG3j1Q+
         HKCSkZVoJ/I+PLsWZ0pcJqK9bJRwYZvyJLGd+w0Pa13ZrFvwL3OKGcdKYwxFJ99F3VAt
         dEAaTBdwP+5X0ANmpFILR8e2VqJT3/GWs+JtfUfQlUs41FhuSHUaF7gdS7Iak+lSc4RN
         Li7yB+Etnh4V0mkuFV/UdCJV8Focxl+CWS/ZoRG8VAWjjqT72VRSownPFSr5mACLdwDf
         JzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459870; x=1790064670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=R8JLfUJaEvx7tr3JxyHLz9SbR8yXCku04686hsaRJU+NOypeMbxDTcSpTC0LC0jO3f
         ub5mDvDVhA9+zFOZqfZRXmceu1SWY947NT3+65PV6hhO+iz3AaHZStV9M0SqTPQOmFgT
         goR5MA4g8Df4a346PALTOie5Bf79tpCQcHZ84nPfsuu7P7jlCdwU8/btkL/Z23oCOL6j
         8lLQqYrUD/b7DtkWRbU+CKVHSVa/DB/jEssWu0G6mJyo/unNqg/2fs9gT+PPuK2xQmue
         22JIT/7WrW+pCyobaKIB/oKGf3SzfCeY+QW9Ip9vs8jLnbpG0kBbTX5+ANvHbyEmkmB+
         aqqw==
X-Gm-Message-State: AFuF++kUWGglUd1qPlnkXchJNylOhnNm/tcGl8YqenkKUUSFDgdjAREW
	3jXE9CTBQs+FqJGSFinvehkz1ht9UdWCm3xu2geJnsr3/W10WGAnz9TW0PPZv4ax29sTcXsL/Pd
	Fc4+Rrkne4lvIvOyKizr57aYo2EGJQ59kRStQWBrJpprd+LvYJs54SXXtA39S8f4sndxjmHK5yv
	Ri
X-Gm-Gg: AYBFou0FN5rTDtJn7ocDfy0JdZ8DS6udr+8C6LCbKtW6LUVqNCsxSpTWL+2XD9lec8z
	Q27jHMUyrh4eVMp4kbouKw2qATrWk73a6aqu+M7ZnSUxoz/JdpAPX2FByFklDlYG4YFasRcAYlH
	HqPbu58sRvLMHk1uTsa773/PmDHMPrmSkO1B2811MjYmx4ta7QXQ8VcIuYGsWQOscfwnEeVAgof
	4vMHqRN0RljisFzy86FfvlE4t5nlZhmKzb2rHkicI9pYUrtCRciQ0EyoW4X0tYsQ77c2sytfS8J
	sb1q6VHTXXE3KLEJ3K2fsEVKOHaZ/qiwBAqExIPCereWD6uBMs6lw8lEXz8OyX4vB+4jzegMPe+
	toue2BPhMUWjjEqwDEZ1qhS3m5RNUZgA+MWOd8WL5TNxsIHJvfOY/0UWX8G1EEAbeqSCcZZT89i
	ipp4CHKEPMiO8n5ctCmaT5jQkj/9jJJ6jXJNsl1TS/r9b4p5rNgtg=
X-Received: by 2002:a05:620a:4481:b0:937:675e:2903 with SMTP id af79cd13be357-93a29839ca8mr908875085a.14.1789459870011;
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:937:675e:2903 with SMTP id af79cd13be357-93a29839ca8mr908871185a.14.1789459869528;
        Tue, 15 Sep 2026 01:11:09 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:05 +0200
Subject: [PATCH v7 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-2-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8fd9e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXxZahUhE/nepK
 oP6LN+6cPoJ91Rygs852o4zXnE656PVEAKbAnHvg6L/hIyf6fQze8D9JoNzYTiTGSgRn5gfG5Ua
 Ol2/Yp0oULeSPZu5XhAgUDQlANyijJwuTF8w/7mh2tDYL0hhWEQTHEDhO9T2VC+4r2AVgLgMtXz
 bRFJ0lLNmqVNvVaHYaqmutFhxhx5EVnf/F8rDeNAFYFd0CStpHJofmMljWFUkIV0yhxRvZ/FMhp
 THtlHmK1pIFLLdCNiprVKf+/z1Lpz+u9g2GPo/T+P+tSJ7Ei3HZjvxyKSvG3V8zqzUGLypRBcv1
 ihIma5x5mWXN7/6UNv0l/cbs7ZHF6ov8ZXjHjZ98bEs1ytmpsj2Ib2cKqB5g7QJgyLBjNg9RJpR
 677K6QCHMoOTDWzL7BUg0wJXIuPW9zZMCBtUv3H6rsMPNBCzZLBvR67yMWUGsI49rMi9KY85Uf6
 M5NILjqaOdMtxxDJCKQ==
X-Proofpoint-GUID: WOR6Dql3fA1gKgTDsGOqsfEv6S-cvJ0k
X-Proofpoint-ORIG-GUID: WOR6Dql3fA1gKgTDsGOqsfEv6S-cvJ0k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX84ny0JnT0CrN
 ufkgpVCYHxs2Vtlvu2O/Dca1dhg+Yq/ZOB7/zumyYEc5x4B74gIG91wh9wjRF1f+yjajCQx4hAI
 xMQ8A9+VnEJtxbp+WDrWwIKwrcFz3tI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

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

