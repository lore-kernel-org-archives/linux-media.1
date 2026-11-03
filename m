Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736368;
	b=ELqWigvS80/5xNWuKcNYBoHWTOHeJZwP43l20uwI8K70j2WrpSqic1/LpTX6wNOXth0H
	 5tIeOeBwH1j5NfHOKW6cQ4lsiXt/eTD5Dm9fh6Zv8KgC2Ff3WIQO+lFkBg6Aubvhfc7a4
	 2ZaCaXxSCU3PIVQXBJUelZ2lnX7kowrMl4sCfKdk9LurLK/f1ioJgcqEIJRos4nLj2HG6
	 ttEXQ3bntCfYunCdQ5zFEpDWryuYCR6QeQIrjKkps0X/7AZ3w6SPSqCU2OfX7K5BmDFFj
	 CoxPtRrN4sQ2Ing7UG0B1q0ISDWJfPDLIREBYTGbttIj2thwY/fuQ1JLr0/buB9GUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=uqw1fcI7dlFW+b3fm+jdlhXVLOEyw4IiDAOKh7/Nt7QWPeN5XisFIWhvPv0XqzhsdVL1
	 +ZlsM5cXrDYMPrHHWM7o3na9Ysw3Dun8LTBay4nGqvzPC5ynGSRiL5honTrOyEXa2X7vw
	 NdERp1uNwx+DrTsEcBAkQgMTxgV22ZJ0zZ1vhaQNDnNnwcvBHgrdZGNioYQp8Hd2q1eL6
	 F34AuxWJCjTZ8MB/BhaPMH2ZgXoUQdcFuF4tfyjuqH8tWFVsIuPGs/gdfAu9CN4rOuVvX
	 lXAKVgDfxK+xVadoEY9Bg7Vur6+9Z7y9QBhQwDRBL8Ke87ra0tcf18MfTWw6ob36w1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGdEkNDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGUUTUKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0A606A32E
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F0A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGdEkNDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGUUTUKR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IYwSW445310
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 20:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=JGdEkNDHLQfE3n05
	rV1gXVqqthXZL0g63tjtvD8mQDaOjhtSC4DqhHtws2l1rzoH5Lf2GwZuSEgyNIJd
	EGBofOiK4F5+U+zyVidg/hlyJqFVjN5MJ4xdGZJWQK6zIPg52N+iLaeJ++dXRRw/
	H8JO2yJ6Do/QI9i//nNhb18WjdrPB0F/7wV+1dX9wD6RDFWjAsqf5J3PO1xnlYKr
	KzlC8AjMViZf898NaXkZVl9RD1jMa2Qvig4VHnqRHN7rJBmu+FX52iJeR8dEJhXq
	SqcCbqkE8UtQ5KlBgKXccx+q76B6+chIGutG3uppRiB/iKWoZKi4rbtyyqOuCiQF
	B7j//Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pgmnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 20:05:56 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99859876e19so141138241.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736355; x=1794341155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=NGUUTUKRZNBf3dSdVwi7rT2zYA8bL8+42INiMbI/SZG/dn/CBmajUP9zOcHkP46oiH
         RiqjW8gc33t0mBQ0lhmVAtDDjtVz5Pq6c3AlqI/AmGfLTvch4TnQZzdzaa1Flc5RzvZc
         BVCQjPHtXApz/IrXf/EuD5ojwIsWhaFGr8kmCxvSDmPdCHm4E3V0xB0SAKYK32YdMWsx
         /IF8qM5O/kBOB2lpUCI1iOUJJSyJo4OTZlEV1b2RWAzewNMPh16uUOWEwBAsz1doICSE
         KIbubIehKU2qmZWeKik1iyYf7hhRpppgn7lNCS8Aja4Oe+w0j1FaCq45T9ReycQHKAlw
         s3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736355; x=1794341155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=rtTh+FWWUwfSU7dNYeXjc9/O5aO6dfgMP3dlWTePZeMPZWew6qGn2mtxTifpRxxuEe
         oXscZ/5WdIeScl/zm+iG6mc/aHljll/XE4ZkWy01TsOxoq/R+Sf8QL5a2R0wcpg84lCo
         WZdXu3o5+UjjTy0tQEolE6duWSavBBuvm8T15NsR6UyAL90pNNkoziTR9KpDUOS6PfkJ
         uWwybVPYYd9mfttfKcqLKJtbTR9xJndG3ovvEXhAW0OH3kWB0ItLUdt7zkm7vwOWZs1f
         szLIW6Z6ou+U8dhvRBfTwkAt6eSXpenVrmnvLKT+bBQjab4K89l0da59sVRsLYDkg4nq
         PMFw==
X-Gm-Message-State: APuU4Z/dUuRcHHs+YP9wKxLRcg7mEIqSjZgUcMYF5fdFegBvAkdvN/Og
	QOF//ATW5lmxW7N2zJID/hphfVReaOevhspJdPQWPyfGigBaLcY7jZVzau5YZSH2XKzSVp4x6BQ
	QE3I8+/broWJtcQYB2pXTiRp4aRMcvAOwZZWQrbOiiRiB8mL9sGjcSU2r/29iUZIkVQ==
X-Gm-Gg: AYBFou3aNk6dl5AS6rJG/QJH9JgFCchDv3nyOzR45xGbJxvLsEI4BRaiZdR+1T0mOaX
	+E0WJVN2TNiXUi98M/GYhXz4umuskUYLfrvoesTCndbraqWpo8dWPjHQCmPKV9B+7SjkSUZ9PNp
	w97GyOX1kbZd76rhzGoCBSR6rE53spyu3SJBX8MZzju/PGaJCE4kaluYgUnF4ovYtP8jmp9qQoA
	MHU/ognkOn5dlM9iOjbRyIacXfq4+//ZIFcZ14dgAE7OLFb4EmZ/WC4lfURMiJG1EhfzhF2BAkp
	a/pyh4w5RDkDWcBLquxcbIibGMtsFHprfiqIjp7i1AC/WpDInr/WY9xjg6G5RrwkHudLZq2Jg4W
	jnAx2A5r/aPhj67SFFI1Lb9k5sZ/7s6Wwaq3IgmnVwUOLHZc2Aaz7g9RxJ+omgugtDECeMr5LSm
	SS4O4LKaEqvA/r4Dw4BlTieydk+u35Cysh7+pvnOnPQdYgob/Dm4xTJ+7380G/RGntrXRJ5VEcE
	jvUMYLRzeOdUpqM8umJcSdDizzv
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr5124542137.1.1793736355065;
        Tue, 03 Nov 2026 12:05:55 -0800 (PST)
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr5124518137.1.1793736354436;
        Tue, 03 Nov 2026 12:05:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:46 +0100
Subject: [PATCH v13 2/9] dt-bindings: media: qcom: Add CAMSS Offline
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
Message-Id: <20261103-camss-isp-ope-v13-2-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXzST3K52NsHaL
 oKBKCnDdhJr0G+oOqdtNM9o1vXpxbt2PBxqlVTLfIazeKtVLxYuZPnfisgQAKR7fkW/EFkI5tTu
 y9j6bIlvFCFV/wh+ZX5nWIcxgLqDdBs+A1E4+XYKRbM4JuCb9AGJwzCDlt0WoGc/fwN6QxC9+02
 cmogatC9C63VhmUBiUH5UzerpS+GXrtS5lKoE+VP2i6Go6mMj+UcSqmSLt8kG1RwqThB+JhRVEX
 LwMutUoBID983hC7wMrbkapMAjsVvpImkkW16X0SLqRJjXs5d8kwXbLAHAp/Ou1lcRF+FF11AQj
 otWOE+hMQmzx5kaO85adI74Rm01+TW1FplIh70L8bdAS94tAU3gmyFUsyRttEd3aMjQ4WdZSGlN
 Kbb4rrNIJ+dtmITXiSkeiXTZi65syyKMlaQLFrPky2O32b8clec9KkcurgWJEMDex53J9JqgQnn
 YobxG9G1QzX+CnCrHMA==
X-Proofpoint-GUID: YDYnldFwBSOuv2EFmwmBqxD90R6kGb7S
X-Proofpoint-ORIG-GUID: YDYnldFwBSOuv2EFmwmBqxD90R6kGb7S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXzRT0ZCwvrMD4
 HKgTTVabTycZiMurGBzSVX8nNO3bivg4ObukZHWtSkOjuIIoMd/nYYvmaZ6uLV/ngAyG0LGJMy7
 wLyKtvEsz13Z3IiZAcnnMHlfkYBaBrw=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aea3ea4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

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

