Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973331;
	b=iBq4SxhJtxzWy7qjxaCyybdDLGhpPMnbkpKecnoM43LS8fnl/fMmDNnPAgxUkEvujNEt
	 ap1cL+c1gs5kSLR/WfYyL8F0ZwgApVm/jMa8UOAhL0b5EX8uedFpMcgYZK9CnggMQ8CU8
	 5yaE5qMx9+aMtOV6h6uyP3G1nB8e6rQMgLhDajgRJ2rniBHsLcG7ONSNRXfwzgbNkL62r
	 rrQvlwqQy3VJ0AX6Om718R7pPKOvlmLqc6xA38RwJnOdRkTekiu/vodyeqTlfZRsMEXxt
	 h8unvWnexZMZlf2+vGm4qQ2qPuPu7HiilFayy2qUWCB6vHuw8fhTlADk0P6ZvguZI+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=oiRC3O2MOM8JnrmjNLW375bL5u5dZn8F+JxG17uGfuTsvORhuzY+fn5bz/wxqoc1XzGN
	 ylnJf9sJ1ECta0StvEPs5rG4S1LWdhNHIa1SxSg3RpAR2S3C+SlwwVtsI0kKJGXYN0LTn
	 Vm1XfptIk1ukq2bstL2J6hisrenepZf0xrTl3ynmeAKUnMdaqsldSKYBOuexBCNIxAW7B
	 8dSw2KDrqgRIxuKZAtxMGoUmJSK4cXcxS0/ul4n8NZqgQkKhEmK59DjMRHIDpmWftOHss
	 XrBOy+95H8bIbymAZwQneCVPN3iVz+7ZxLdV+RFmYbaZKfFG8SsHWHU6ujXNKhApV3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TyR/YEPk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6A5606A332
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6A5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TyR/YEPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Dochv3035142
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=TyR/YEPkABFsBr+u
	aYp+YS+zHOEzOqBrFp4xlfFnX26NdZV+QDRcY37O8XhvmSWSvl7PVp2ZkCHkvFFA
	dTG6galMukQhos82vKXl9KscbZWvr9hrXXE624QMJGBzIYzvWQYQp3929hI7xrdX
	78UKsZmSx6o5uL6km85urCeQpnUPMp21inEyNP9cWyzDmMICwADxPoE4rMz3dPZC
	Z5qeJBuZwA04kdC+PDte4Nd7QJmMcmTEwt2w1nyUvDSMZ9HUcxFv2OY6Ra7TuTgS
	Dp5o5RiukhKvhBU0GIVp0bo0J7gWhBSU2cDMbf8LzXrSaG6fnB0xpU3ydHkdkccN
	1gWkKg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paayh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:55:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso43340241.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973330; x=1794578130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=kGFcS52A5/ZURsI0i1bYzDCWqq4AB6l03GptD0yz7HdiSAT+ejj86XUGdePOUM8MGt
         FGXQaYAro48+EwmTPhb2Fci1TAsc7/5VO9YKiQFngfIlcS8Ldf1bV6P0p4xadEb2rwQm
         nqi4rqE1SBz0ncUnUSw2TK4KEKhrev9LiSyHOinbr41dwq0lpIfdjaAPsoxhx7J3z/9x
         yIAXxQl9lDRo6g+liZHmi1XMUoa9TArcQiMy99E/rUn6X16O1qlCejSSdCo+t9JGw6U/
         sRWklFCoFT1MFK0QmiFSyXWL9MHK8kMdxD/qschYlPF8t7E85wExaxPyBHSmEtnSMUgb
         EcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973330; x=1794578130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=dTQQnlHIHPtuSvrwSlaRt98dWaN4h3U2i53KD2ERX084g7oD813HlnHwo8FVmQpM+W
         avy3Mx+BA5gDNgETMrvIwYUzjv+M0rXeh9OS3q+1rxLs2DU7fE2GjfbYmVLJ1E8CCFJw
         t8fUyLIjSAAV16hBzmkWBlAnwTbT9bGUNcOC/8hK8JPPcqdt4WZPlXOs2eTUd7ydOS+A
         hofUIQ3t1ikJmwBh23M22qrrYSwKLkssqPeTkNmTWcTqH4akiC6Yr04cyHaPYet6tJzd
         aCRuq+8fB6MmIUeit6Mudz6rXjditK9TNvrFgN9wYZ3YzCHVR5Akmvas04JQzvCKvEvC
         Wmxg==
X-Gm-Message-State: APuU4Z/4NGowl+Fw8AJ0itiR0uQ4jol9NN76R9RHK8RQypht4Pc9TMof
	fHwQGVM5qGUUYTTlJTfsIQ00fXMObZJHMBFWP2ngRGNqZ1vhrTPZnxpw84x5IHX3XY2iIEkJZvV
	qSc5dwyz1TXrHDKlfmTm7+oAN8jVvQ8ucTCG3+QFiOoky2XK/uwX/vZasvtz4u+Qh7g==
X-Gm-Gg: AYBFou2DIZEXtCr9kdbeA7NJ6bYUN3z7lqoDB3tcxAoJWeTljONXzIzN9o25u4i2eI7
	QqE4aCvSStQ4EAQ2xMktrDRSvWVbAdOYK9Q2sUzGU4a9edzhafV/oEN2iz6rW1rEFH8f0ZYo7gO
	xS/AGtJV1ej/gDitgd4JLKgDf/2o/KWIdkMehfcxvxnKjbl4iIvsHFHC6s3atgVJvrbRUkAz54p
	gAPgGjqFxMOYU3n7oG4NPN+M4lJUr9KOQrfTwoaCYy1GD4De3iT3Y9B0TTieKcNeLjKpSzKDJd4
	QRIleoFN2vKbknQOCxxKzHcKvVTp2n95nbWudR1gpRlAHP1DCmX0J/Lqe9yXAWpRM+1MtUK3noD
	k6hX3SWhACthd8TUJHfC2DeizXO27236g+SLvzW1SDdO5QLf4lg0FCnfNcNMrsdsVKuKn+R/9JW
	DRWCoVG+An/QT6foU4o+EK778UMNkXNMHnXnXgEydRai6koAabGqsT+t7modsO9k/Ck2bvaxJvP
	NBTnEsLiBALV/UXaUCisLfudvWs
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200754137.7.1793973329593;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200734137.7.1793973329028;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:18 +0100
Subject: [PATCH v14 2/9] dt-bindings: media: qcom: Add CAMSS Offline
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
Message-Id: <20261106-camss-isp-ope-v14-2-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: A1AV2ia9wm2zeF7JuKDexwt3HIxVx326
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX9yq9DYd2x8TC
 DgNWFK4yLeuJrWItlAB8+PmEn7KviOQP8DUdDrZmVxILe20MeAkE84rfZIe9rTRpzrX/k0EkwZj
 4aVvRUr42WCNj/gVUd2QL2e4VbaQYpV88yEpmfwZuVRyRmIS5Ty482oZGeBz+X9t+izzNHXHCzY
 2+Di4ctzm05mjs5Kezo6EHLl5pzdfo7R6G8N15OfpObIWIB8ZW8Q/+XxdUpClJThIs5CejlYyMq
 aQs4dyVfVign5aRlry638uVAPlUENaMVFnWgBD6yVXI0TnyXNEJmq2H0qEkqNWVOSJ7gCKp09nF
 ZrtcrbKWosiVCGaK6zvk3GzdPrTCo2RVoxA0522Oy4Wp0VOTd6HyiA73C2McPrjqQINBctnuRAS
 ELqZ41uYL4ER4QKtaZmHQhmg4WTGsDWXt+cAdWjg31jQRdOJOc6fXrDUfJjIXpeaA8dlmLrsLES
 AaLQgH79szLOFEOK6lg==
X-Proofpoint-ORIG-GUID: A1AV2ia9wm2zeF7JuKDexwt3HIxVx326
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aeddc52 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX7g4bPELaO3u3
 SBK2h7+uwwLLYkFbVZSBDCT7iP3dBoxm8ZlvPP3peFW0RlxnK2ZwzfyLYHXn1xWvzZ82jRz2pPF
 9dkEtm3BGUKjx2EgcdTLuAoLqlYQDDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

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

