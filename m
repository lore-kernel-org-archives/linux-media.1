Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596199;
	b=ifLVpfKdlyjrOjB78lCh9XQZ8OxfL1b+6c//OzM4eFjIEcuoIYfW3BDBsLa+mGa3EEu/
	 +Fz4Br0+oEOoTCwM/9wM+ZiKvoWu1zPXcLRFhDUYhl+jQb2VbV8ajqzXDApVIa/MtHFJA
	 9HC+Sm3BnNxD3ZHubDr/kNsiZf1kWl10eV4UnbHQH80XSPVtIFZcDcLy2rZElwFL1O8+A
	 klnHRhiHjmYPP2UtGTMr5f/KtEX4yrHy9w08Rk3k8AL8jQICbvmxigARZLm3AL0mnjvda
	 ZhFB+2j4ceePf4mceiZa+l32s3R4b1jX+4vQh4Jsgl5FtxzTHmDWvFE4ITxQduYSHcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
	b=iTyoBvOCnTJBCbluGy0oTwxU9YSIaNRY5FlDBtQL5lBbEAJktgqYWQqaKar9TqIlFrJd
	 AUWaTBIveJP4RjAtX9twBan/KkXPA8k3/xgfbr6QdGrWdrh0hDxLFAKs7P2meO0gwbjys
	 E20EHcf9dzUsEVXK/8w1V8NuyLMkWlcpQ9gtbZQULaahF8JDrsu41FRZoWhxy/ftdzzoY
	 Rh6MncmczvO4g6ZxblDHp5o2FawYSr/vSfEY6XlTJmfAkhn9lhlQFfPqDaBIgiksiyRMu
	 dlZQPxyvkHszeMYIgCy266njsIRAU8urIhsq7J8DqiJzR2HIXg8Jl0jC7RaLpS78fSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IvJgwvEW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WW4eQTj/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E5606A698
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8E5606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IvJgwvEW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WW4eQTj/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69wVv1006423
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=; b=IvJgwvEWmDKQb5uE
	y5MSPHvwoHpTH4HHfw/wXeFAwnqvrMoCa3nJSGDO1qYY2hh9I9DFZpp4ptw9ha/o
	TdfGVYSyuUr3OaSmszRQpc7xvXgNYCJLskd4geXkD9nM2PSzIYpDvkgU5383iocG
	mSmfN4ob2KXA9L9K9DtVjaum49yfA5E5rYLaKf48XS1LLElL4f+nhmbv725IDBto
	tt1H5xIcqYzMiEW7yo39aFRVaGsf6g5E3dCnC0VJiAiQUDrEl30u1tjmLh4aYz38
	Hofo5caSr3nY2M7zQsd1g9Pq5NsqRqZ/LOIT11RyZOgT8Q1MYVCUi+TF92QYJ4MG
	KsJZzQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa2997n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:18 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso5755646c88.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596197; x=1796200997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
        b=WW4eQTj/Zf4JZGnMP4tAcmYseP5YYWrrJoMFpnSwQhdyXf5zU7VnZK3OTUfQV7Ykg3
         RAxL2ug/96vP6X0b88+A8MxN9cw44f69NWsF6Fb7Pl+Tvro9SUCxGFG9DxdSWJsdD4gL
         9fYtc48dSw+7TKAwzlKNESjsx8//6J+Pjl6nU/O9ab+LONQykH/mykKf15ZfqA0D0egS
         WXoXh9Jw6PH4U2TisjosfXthdq7noKbAbFu5qtRRGI+qEEuI/NTDD8IZw4n939w0dIvg
         XqEDyPdYrFe+oWyTGESwLh6yYt/VWDAI7SCdTMta7p2u12PIG2Z0T9T+MxOhJ2EIxOMp
         fX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596197; x=1796200997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
        b=LmclFf712xTW71PB5dNxy2TzehFfDMzks4DO/FGlavEUznw7LICFafxCPv4NgZRZJN
         FX0YYZEFdcV0ADmxuwB8kiYlkcoFM3zDMKb9eyfOZMVNrTtd1WIFDdx8pttF3mKUbt5y
         EwjZ43PVWcdqLj2sRLALLK442xy/EphXJgdcrn0sBFNvzG3dYQkgo5QIv08nPVc9qXKf
         uKqp02lH3a2wCFrOffVgf15wztvcGeT5jPZytr2igHzVHnEGtNRHt0uZA9zJzYa64J7/
         zmdohgzt/A2JWlP8fm3HKz9kiJKb7cHj5k1DdWJkP/dwJU3scEKZ+Glr8sH/5YKqSaBa
         bS8g==
X-Forwarded-Encrypted: i=1; AL+hErFYdefdJ9MayBzcMEbuS2W0OO4wpkxIb4TVAwHNRy46VX1JkC0ffCKHQIJ7b8ZmzPhLuzotCt4y74fN1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9x2rL4/CtdVdFQwDMx0NiMq0FDU6yPRLcQZV5d+Z2f/cFrjcva
	Dfp/kcToWGWP/Va3NPm4eHY5rmHkzqMXs6IvRIFCZmeuH4LDE8TtYNdiorf5WhA5O03nfqSiC1+
	PXdgsrKSyqmMfUie+mbnES1V5dB6BI/+UpnmkDiHQjZbNAvxHU6GAwU1Uc3d6dC1frA==
X-Gm-Gg: AZFdTZeEpdRQ+hnDaEiKxImczw4qejSnRPJruR6U4ZBR2Dgodm+z7E7fASmgfMU8RB9
	q0HKkSSGWv9CuffAlLC/px3cvJ3B+5DXrRyGIFXRM5y5CyulN1Ua/2+HuWYQ+DbLpJAcG5IHN3C
	bKns6YizH/lX49pBbcIqrL+2SVmebItFDD9jEsz3MCDCzWcd0itwAuHIPcsz5OOEB/QmX+SLwjG
	DqZfgURgutRIPaZphHWeHZmdT+l6IfeaX0MmpnlLkM0RZaL77977ZkNC1sYxsrQxyZZmmyh4fA1
	TRIuzbeFtPE7MwL/3aBUnD12Bpu4sLSnvhlf2IVbHvgp2fkduQesSKwl0xVlXwkDWsBWl/y8erC
	evltGN2XtxL3nIRvk2KNYZR93v92/ESadXu2wtBf/VosjFXcRTWJMmFNkmdUKJMIyLP3Cc4Nbkc
	FtFOC6
X-Received: by 2002:a05:7022:c8d:b0:1b3:b3de:9228 with SMTP id a92af1059eb24-1b5568a4f37mr16029419c88.8.1795596196961;
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
X-Received: by 2002:a05:7022:c8d:b0:1b3:b3de:9228 with SMTP id a92af1059eb24-1b5568a4f37mr16029391c88.8.1795596196431;
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:13:00 +0530
Subject: [PATCH v5 1/3] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
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
Message-Id: <20261125-hawi-camss-v5-1-d48c4feb1c2e@oss.qualcomm.com>
References: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=11612;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=UMXZdSAtzUtWtGtRt6fPvenn0fAcrgy7s5Zjj+fIsBk=;
 b=3YLKGF4u/ernvP8zDM5rBqf9wVbs/XsJaHQyOy1uj/z1kB9olOa9bJ3etC0Us5W8ccIqZOP5O
 dDhHkUKJfe/DjNlmy0kH8e1c3uW+tVq9SX3/nQ6AEIrpcJIBRRsvI4N
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: LwYkyz2UoEzS1147hF-dzAGEfAT4LxGm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXz1I4YbUjNUxZ
 fVaxeYZq/KI1Z78+kN2vM5o/ttbLBP5jg8HH7pDw1aHlkUAE/nfgypix7NAt0xijjhU0TOlx8G0
 MJ6LVapB0do+53I7uw1IwgqDHAfZKDE=
X-Proofpoint-GUID: LwYkyz2UoEzS1147hF-dzAGEfAT4LxGm
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b069fa6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CXfGsmi0X-KHezRtte0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX5pe5G3bxIyfZ
 mx2pAg7xUIG8ks3qwpn410lLjCSNMf+iRtgIS4eyRmMOOxrWQd5uLA0cPq4FIYTsznbT74BhmtQ
 835U84C1k9Noa2Vn5MM8C5y6nf4D7GZDLWLERhP5nTuTBm3vox5OGKOVA3w6TYNLYOVCuCRmOMM
 7/l4GOkjTEv4ohMUqoDhHAP1c34PScVWPfUjfvPgVMqwRZDX0HuVRsG2V0C3fdZjFYB04ushl+m
 UH0US7wQVmS/WWM4aBrjlsaUaKTj9QDQ/oiLe4dqK+a89KdH4VphHBbBi4oR4MiZrkTcckUHAUZ
 3sjimvs2p2QRmcXZkKfhV/NrvcqDHf1W6HWQQqprMjweMhfWE3GMe0YmFabzxguaHxNJ/LYWS/F
 teEWhEXWGMn9VA7xek1k0pwNwK0uiHqcf5iIP8ImwljOOoDgh/EeILN2gDkrN/QAyzpyCDkpxad
 g6XtxlQP7Lac7iOQyiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.

The Hawi platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 317 +++++++++++++++++++++
 1 file changed, 317 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..22629064ed7132cd19b7b0521ebd7c33d79a1417
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
@@ -0,0 +1,317 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,hawi-camss
+      - items:
+          - const: qcom,maili-camss
+          - const: qcom,hawi-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 26
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_dcd_xo
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_mnoc_hf
+      - const: cpas_mnoc_sf
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
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
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan GDSC - Global Distributed Switch Controller for the entire camss.
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
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input ports for receiving CSI data on CSIPHY 0-5.
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
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,hawi-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@900b000 {
+            compatible = "qcom,hawi-camss";
+
+            reg = <0x0 0x0900b000 0x0 0x1000>,
+                  <0x0 0x09253000 0x0 0x5e80>,
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
+                  <0x0 0x092dc000 0x0 0x6800>,
+                  <0x0 0x092f0000 0x0 0x6800>;
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_DCD_XO_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_HF_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_SF_CLK>,
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
+                          "camnoc_dcd_xo",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_mnoc_hf",
+                          "cpas_mnoc_sf",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
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
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1800 0x00>;
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
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

