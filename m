Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173084;
	b=in27mn811CHDSj6MTGakLAWuc63/9xOSNc1UVDql7+7ABpenMd+Riq2WiRRtvfjxI2kF
	 XUgTxvDZXnTDapc5y3gqJI4ME9/pvTL7npQ6HuiBehN/VNzCtkxmZ/Q+UIGIzjrdDeiIK
	 8Y7mF1/1+MVzmQzi/aUHyseG9QKZte0vbbH9sXktp5i18aneVZQGjzm42sV8okjLJlelS
	 UWEmgpNJChVwtJMRgzAKcnp2Y0WZLq+DAJWktnmKX0wdzdQh7j4j4MnbIrpn/w8wA3MA4
	 joE6Spy8COlS8FzdzpqIo24Y7f+bIBuinrpx4YFIPdx3f79JROLwD2v9kqzy4DJvCYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
	b=YUoFSSpL+0Bu+GQEuV8+C7UlMJY7z+wYmhQgRGUsNiGS61JSh+jYtKAUYjEeOkGkgqob
	 Zwy/KxFJ/l5oTqFoAuMME0ryzj3fezgyEY/aGyqcTYOSLcf/JYATt5iuaLau79EtPrzgA
	 V6dmEGmHf94PmBMN97gFaLpx3mnr0VX6af/Er23RdidHyTQnmS4gc/dTrpTXsOm58OCKp
	 8HF+A5+yY9PIsRz8iAGs0FgmtBzx64STUqCwuEQ8qTknM1yqDzubMAfl52DWI3vTmqx2C
	 WNb6EwSXR7/tPweVPuRNsKHb0kmzYYiMSpU+SUk1AuaEkW9Xkhzx6S3jMubUC8OjOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYJMzjAX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnHJCqLg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C90C60A2639
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C90C60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYJMzjAX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnHJCqLg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0Jn1168978
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=; b=IYJMzjAXjQDdXhMo
	JFNnYNr6qoT847WlEzi9l6jA6SZ6KA5IBonxTjmGrbIvWObGXDfpRVtnAhY5anIZ
	0N7f+07R47Vd8HqyQo/7Vtr876y1dPWuVp8vuCf+DDWppbQazuimGcDPr4nyb+P9
	t3WPIBwjbsxhqTlZLWhltG1gb/5VZypuuKQ7A9NkR4W36UKnXgR+CG2ifoybZd+1
	pLK0hQ5NVdbpGXX26z7T8vwh5ga0VUNokWl4UwVrgufSYfUfBxiiT+rcjxdzypey
	Zu2t1Vdks4YiaVXBYsR3mnn7AmGoKzGl44uEt2JWDLWedjze1eyM0nL7xkRqNEq0
	OD/K8w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5udef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so2157791c88.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173081; x=1795777881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
        b=cnHJCqLgJP6w8DxTtmKITxlX6uYJyR4alaWwqHtM4Ugh5z9H4h/5CGz64Twe8H/kQ8
         vTr6fCk6fOULJZvuQTdRAfOqR7oDHAyhe/7Aq1jK6naIaLtp8rSrMCF7c4Y5T5WHrI8I
         KqVNaHvDpY/qBhSslkEhaxy/4j4IoKTvvwz/kpqeicRtHAGbOL4b/C4oI+U4qX28O3PX
         D8IWGyPuRDB2882DZ9i7gwpIVWWTfpr45weB4/oxCQj+e+aE7KmSHc25SQ7OKsLu5lpR
         Qk1Lk4Ct4C455mSoxg95gakpnKWS0Xjm0vXWyh4JS5NRgZAppEwdiKsFQ/kasg9m0GeK
         nltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173081; x=1795777881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
        b=j40yfCeOVsTpGfjMNIcsuhVwPDXZ2c+RQktvvVJZVxV9Pe/b+SGPNMzsRDtIlaKP0T
         8PnvxZVfNfYpeO/9GToNOYpG5rVJ/fohjbCoXnieNgaDB1q9RDMbr21owII9ZdD+4hgG
         TYrF13PctVmPRL+c6Mb9ZuXTUOQYLDaDp+IjDP9rZHciGv27ues0nv+FiQbJGiZkM6sa
         U3XW4OSCEIufIWF8zBXWucFImOnge/8eYakKtPG3e/U6yKCPJhMs8GNQIm8vxIz50Sjo
         dJ6E+j6vnL2XumHGz+Sh9jHfUJoD+ExZ9Az/2iPjU/psB72suCbuF/QRbFS7IOnTaDEM
         NqIQ==
X-Gm-Message-State: APuU4Z/e8asw3SedyzcYqW9JX5vUpLQ8uiKcQMkk/tXqJ7Cjc+JJ+O9F
	wgNW5InXhKY/5yBjWwuBX9p+CzMy+syCylBMj9JvRqpmb2euIUHfv3NLAGK/ujbCKxfKQ4VFqnp
	JgHgqx4C67oPJPQn3uF7EfOkUIaXzTvOn+KyP8FH5X93zJjdvPLSo6fihvkKUUgnXYg==
X-Gm-Gg: AYBFou0ebxxstdXOn0025wwU+jHmvzlggPz58npmvS0SyPGUhexCj+Ov3mUu60mIFgY
	COl15NzT0vfU0dRKpDTzojn9MfgpWqwffw94DhKk3rSufRJBjvb2UYt/RfW+jmYT2dUr5NGB4Ex
	0H+IFmwDK2egCj07CPERMF3i6obRMBFC2PKMLWpgDjKNGY/RB3LZ7wlNPw3ivws3qlgmWVKlvwi
	5MHO3oNEnOG9/9wYaQik/bCdzY7Kc2lR/5aYN7Sp61E7MkBlBZDe0fP/5WlVRRk0o2egcH+ZXbn
	iDVzf7KKoVkFuCh+HLni/yIc+3Va3Sqy+yBLa2sHsoiWl484Ttwxjww+x9OZGfw+hBOnP2vrqkL
	3iijVPanU73KlC6mjJfJk8LW5Ac9WA7G0SLmoF7M9zzJ6sjmDHKK9cZnSxL7fYqG/0wBAIOvSaB
	FLt1cLY64e
X-Received: by 2002:a05:7022:b044:10b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b5568a12e7mr2761780c88.10.1795173080135;
        Fri, 20 Nov 2026 03:11:20 -0800 (PST)
X-Received: by 2002:a05:7022:b044:10b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b5568a12e7mr2761762c88.10.1795173079649;
        Fri, 20 Nov 2026 03:11:19 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:19 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:52 +0530
Subject: [PATCH v7 02/12] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-2-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3839;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=GV25gcoT1/60Yt0829YKr8Shzic4HV1Zb1QglfVRCeA=;
 b=1u5RGNteMTKbZ/UU6Vn/pdRAMK66SmM8h2jU2dbxio/X6GEBfclR5+JlVnhaHg3mNY4u8AZiI
 k4NhbpMgcC9CcLp0IxUHtTrszlCPjDsWJY5XC8ZFoHTy8QlRIWoG3hO
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9oMW+4MgGzj1
 0MnOPLi/QGdCXqNRaeVpX2sPzWWahTH1/tpRbcbzbhBPJto4kanmGyFDnF01W6hmpdioHHHOkWO
 0Grnh5nNrOpWG3zb974Bs5xAAI7NN4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxHLqH5sbDsaA
 t/WhfAZ8AtBenuIcJZRFH3kNkiK8XQbXRznpOl16QJY0tc910vg423VYWJ4xgcUV6PCOL8cq/c8
 OHzJ+MxIvJsnznZ2CZ84ZUakKEpYHJ9834MHR2eEpuIN1nrLX8sGNJdblORgifGVcLWLnUnCuRt
 ZGEOZrnPP7YO0aQQ4beDExAD4kCyFhm3ymJUAGTOVucs8DgKaMsS2PonHjcn7v+fE0J9u1PQ3P4
 HwzABrkbYnNaXWMvHGrfvO7z0xu5QWkyoRmpRnZud+iXi77nFNS8zeElkgQSAgsxoLN+8DAWKcv
 BQV8rb/jpdANdmaeFz1lyiUc5MRK1smwSN3aV52B6PzJFbSW9PPDdHf7tR8rUwivAKRNHQrIqDi
 YoBdENUn+fvpw+PhywVq3jKPEtTQB9mcGKPoy7LCPPieVI0ZBMv0jXi816yi68ho+Wu4VCdMfVU
 rmzkeDTkhwyZNmQrjYw==
X-Proofpoint-GUID: 2-sX-UHAUYt3k3x7SjcYhTFAl1lFYWTb
X-Proofpoint-ORIG-GUID: 2-sX-UHAUYt3k3x7SjcYhTFAl1lFYWTb
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002ad9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w7pRem5UOBajBC5HA0sA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..6ee9d23554cffb30c92017ef99de15c2493455ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -177,12 +177,23 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

