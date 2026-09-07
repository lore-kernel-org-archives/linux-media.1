Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724B46AEFE
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778283; cv=none; b=A8nX/Qg++pn3LEB5RM7Tlk85NzfigOWzxcdfW7MSxRBrDFRyUT5ZYqgTJXN7ZrEZsXnxar7wI6Ypo0q5UpYzAxTknU/E+lLN+XHBCu0RZXTvRacLxJhexjJphjmf8eBNeSzBd4Qn56UhCaqUHyQV8BhuDfrRW8/c5CebyCSqliM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778283; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yw1O/8++yZOYFwA5gBFFu92rx7lzll7zenBgNQXbPzvNwV5EVcHsXhP/xA2Ixs/+1BMLBE4U2ZTVeAKzfqn4Dfhe7yJWjntNL4YyuFbP460T0xjQ6DKOYYwonJQlhpPIH5Dqv6tIe7jlOuinQOy//F3kifauouqkID5w8qwZ9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqIjxAaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgF8DxEG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqIjxAaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgF8DxEG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnI9U4064466
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 10:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=RqIjxAaVyu0vhOgV
	eurjYWtZr3w2xwh1l/JtY5O9Y0cmYp8sqND7+WD5rDHQXbK2KD4Hra2Wd4v5Bj0r
	+rm4+dJotfcg+nHTdwnLrHitv3Dh7wPlvUm3S8lVDdgZY/+WjVxxH7/b+1RKjoe9
	mbB9ag+xKvAyl6ybIMS1QWR3tzZkfcUHuv+AZF9cSOWaChaDwenTCAzrACgZTODQ
	OBJLNs3tUO1ns0Eko6Dnr2+R2rGQeZCvOnuOhunOpZ2cQRZIdTuh6IKkjd+NBO5R
	ce+pUZ53816zKou9ZKOzXbfa9TUFV5MAIx5uZMtpkc5y/kZ2j83ukD4T5F7/24Bt
	LhUSMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86rtet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:51:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso733964785a.0
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778279; x=1789383079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=EgF8DxEGRPnb2fSt3hlDjD+NB35I3RgYj7ZHgSIN7Qm8V7maqttL7MQSc/m02hA3x0
         HohngSSu7KxRFxhI4oWhVatt0bB57mVOD3Ud9Jj34KLtvyCJB6MECpXFYoIEriYSVhZ8
         bKmNVXTHeBtncf53VPFTmy8Rd68Fm3DEagtwd3CQXrXmXRG04vVCWtTwcg4ns924MB9b
         fl0hOanNHLKmRi4RNpe89EoUTte6EJL5diVaJY0yCDM6avRnJmR3Vs1Xt0WoPpFvCxUs
         6sOrB1y1AcY4egU+Eiqbp0mMH86//pfCCrYQ/ASSeQaQ2uw8JJ8cTd6QEbGU1wyfZxTA
         NUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778279; x=1789383079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=fTsfXJqUAdImj/wFr4j6gzZUHMQwjeF/ZxzFGdO1vwgMP2ZpzVgsLEwXS5aOHp7hWF
         vZz6q5fHO5qLzzeASF4FNDYRKpOyfGTWC227lNBEZ9tPVborXuyJYqFNnPiAIMm+5j9G
         561Nt3E1MUCxRRC7vP1rus6mnJ550RU5UAKeDsDoaOvBTIRB9Drm2TdrYEGwJOxpg/nR
         ofembWbXZas3FEuRukZuDZ0VefxSZeC+xMkSn9NUCNJKudv/HDi9U8nWY3HAp3HsLMai
         HBDnfNLiwXcXRjV1jovdutefQiceHo52vqusdylz1vdyVfbnihwn6gUZLZOUPqL/k+9T
         qIsg==
X-Gm-Message-State: AFuF++nEFO6hUWLG/pK4UMHMfO6e179FNISdXdaeg92oA5xYdhIA/fZ1
	BWvBSt80osq0B/dlva+/NHlnS0+kyfKDpIbo1Ic0Mfzzx5Srfor34xpwYeyemJ/VSs17m80wvNL
	NLReARuagFHfSOgoMmQuha21uUCDqXqxKYfHQNOArQWE2zF7a2Wd3eAbfFoPfxCON5g==
X-Gm-Gg: AYBFou0adD7wLbaZvJXkV4q2AiUDsoyhy3O8+AWTDcE72DqDyBJuQqHSDqpjHoh5lw3
	ctzve35KAbzSyt9GV7s1UnCKiT42Jy9xVDjDz92oJhU3aqlAOH39y9nts/nagTvuKTt8+3MArmo
	R72MN3ecDSRKw98zIL7EqVM47Rf8qH1W2pkHkjDyhnhFwYzyqVYM15kTJyvGk98Mage9aIqAYe6
	42FiufCQNRosq7oXTnwmeE6A7okp+HXItp6PxffZ1eOARC+MIu2O3BEZvvGXYrcxSVKuOmem3pa
	soFD6WJT8GLLkSfUWrxxBkgxNxRiFpirJ5dEdNhpxdNwQi3rnbzvIHkORGfKahCRgsa4hUG9fy8
	sFEaWAOIV5O84tNYoFXkzIDgpqExGEl1JnEdKTtlig8RZJWvvU3V8QyHBVP0YZd0UTWZ4qqmrpN
	U2mGigguEANMoA5UfuJxiNwFBPKWDPygLCrLu8H1BSrKZt8bBn2qE=
X-Received: by 2002:a05:620a:199f:b0:939:b057:daf2 with SMTP id af79cd13be357-939b057e4ecmr278972285a.45.1788778278536;
        Mon, 07 Sep 2026 03:51:18 -0700 (PDT)
X-Received: by 2002:a05:620a:199f:b0:939:b057:daf2 with SMTP id af79cd13be357-939b057e4ecmr278967185a.45.1788778278010;
        Mon, 07 Sep 2026 03:51:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:12 +0200
Subject: [PATCH v6 2/8] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-2-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
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
X-Proofpoint-GUID: kM3EkSznN2ukewOV3GACn74MWvw3D53M
X-Proofpoint-ORIG-GUID: kM3EkSznN2ukewOV3GACn74MWvw3D53M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXwP7pa+z0nopt
 MoSwvS3vpk5YuBRpGZoNzHQXPIa8qSXJKD7YKUHCqUoK/6cfqbXUm2kUFboG06BKIJ5Rq4irp0m
 20+weJYzl7tJkUZf1kpzf+iZbvKml5A=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e9727 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX5gO/42Ui7Y8W
 b2yfGGhjvYbqsv5iKYpcgEQYbvrUhvD0XGDLsXT08DRpTppHkpruALBZpdFOpbPvspI7CWTGcT+
 ZpdepXCgpSF9r31xls0Hd+3oKSpX0qsPzHpr/P+vSxurJyjai0NyHy2X22DWM7AEuDTwEenSraK
 7ZJ2P2n2KwJ8/v5IbWBA270xTAtuahH6qIHx6KQDS2tIiENSgbc9+e8LKLmtwGomA0dttr0tOgB
 lwq4NKGU5hBcPHgqiWVz6s9mh3rBWD9JKzAWaBlZn90+ageZGEF/7f4mw6XY1yY+jkCxtitdC5V
 Fy78MMUe9iMl8Hdv/E1fzkWKQGbnaAD/jSak4fGmhsA+XP/InzL+zsYmi6OZK0Tyiyzdzna5TbI
 2K649p8Scjmlg8MERFG68TSMX1wwksdJI7JJEEdZFrVF5MR5Wg6sTVkun4yIXi3DXB1Vq42v0yt
 N13FrSk9K1lrx7Pi5DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

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

