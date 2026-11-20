Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173081;
	b=5sOaz2Zrl5N6jkrTxAElnx4Fay3bTgKg4h1Iu4PhankZ1HTlfWGaVDkRrXHaGLOdd5TY
	 DYY2V/iajBlaBYLdfqpXgCxgVoDf8xqP1Cil0aQ6tjf0SMv1OL6QZCbU9rm9pCHvOmDlw
	 AuvvCE3p8l878Jh0nz0i6IpCNJFtJV0dsg5gKBOHfpaRTtXhCvLnKtEBW5IqhSnBo/Es/
	 O4+MP8Kw3MaURc4Z/7W4Mr1oNdDZKFMCcUKhx8W260LsbK6zbhTILTh1JqPaKK91+liSs
	 HIN31veL/Ijuw6xFqlDVOcLDm5OE5BoSsP5qFl+6eI+xtVybZWR5CU2UozfXyrwtoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
	b=xAjtEK/dfwLCq22FztuBB6H9ubvAyGS4z2p3Tmk4n4fqe8XE3qvgjjpklTYKtytV2+LP
	 BfjFEAdDf6a9jYRQY69vA043Wtq5jIoT7qSYpjpGcyqyUbALqSiH9GAgDmbUJ1PLJOPMn
	 fanUxeQb/gkFtScpE1Tfh8SJQ5XMr4HkF+xvd7qjW8ES56Mp6IkhUy8P/yuScWfKj4yKu
	 PRfmIbmzCUF/CvAYRUs/mk7jE4r7qi4UHs7U7hL8MrEiWfOhPZAfFw9BNQWuDolQhQXH5
	 jX1vaS2Ofv7Je9lON0b98L5TWptfYbyxzG6vD44rUPS8p2fCOy7XUdzszoxP18mSstw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5bp0PDy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF13160A2638
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF13160A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5bp0PDy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjuV71168921
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=; b=X1oYaXskRqLrHtKS
	jZFVxJ5WvyU4KXJ+1gjhmAknfTU+k5PyevW8wn8wOaPl7iag3PK/xVsH87A4/7iE
	65U9JRvP5cW4UhbgXHYcMS0+YbT99DENl0eCQMtTZebInC7tJvto1V5+i9uPpBmy
	/AMwV6sGcf9XkmRfKqBvL38DTUmTmMau3v7icRyyI4p+YXbP/9V/1yGf3QBSrxur
	XT3NuFXwXKHel+gWLwpIKiFVzBO8ghO9u57ApNXUrnVtrErBVO5ShkNBMuXGSOFh
	42ooTx/Pq/NgGXiWWwz7mqMgF5awSKOrSLsF9pjm2gs9PhhIOJO6Fm04g0bVFRKN
	nGBa4w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5ude0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso811030eec.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173075; x=1795777875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=g5bp0PDyoxAsAvSDqzlAC1T/v5zznKfOcRkQTJwvBfwknhUEgS6PIh0P0F5LSDLW7A
         9HUWZGbqW02+6cL/wfk9QzANnQV/giEMDVZhmNFjXvHDErw7+sQTRlZSHdKtHDqmA7tp
         yOIbpBqoyCOdZ+RfZQOGX2bi0TFKlvvICTxe8e/xAHuFqL/FyVl61WcNA8yK8V5fSPlm
         oWxa2vzOA8S0iCRM/nqQOivxIsEJEPArbK9oyuffpzu9R4l4pJ4dlUvGdtVjeYFWE4ZR
         5w8X8ToLgDC7uD0iSM3XohZw/noV5QsTFlpzpmKWakdjgYQI43iSviP2Cto1oVn+emxG
         ywBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173075; x=1795777875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=KNVxJ6eChWElN8uFtsI/fwpwHebbqfaxs7sCBfM5OVWziyLBk0kaV5iFL5CbMCSoaE
         EvH++J3Eu2ReWOW/GNvNra9/JE61NfDW68oIPXB21VvjYnJ50lDsdb3q4vsUB5ZX41NK
         cz0+E1rzqDp8F2rTA5Qh0zSm6fThmVNz0DdBtyU2LVrDxqW2zk1EOj4WNuvjeMURZ3Ch
         3+oi1t4Xwd45XvHP3yeR9f56YnpL310B8ewUpwVfJKDHERDIXowOmcqc0jFnIlbIMV+c
         G42roGLvX9mSHpJZs1iz9wPBCB96GdRsxvT+GG7cm3rkc0tYtUQN1lomEJbk8Il/GIjE
         DHpg==
X-Gm-Message-State: APuU4Z9lt3Rmg7mbiRg/fgMTtmOx1hoqtAH54CDDpexu+YNOXWTJWU7j
	L8vXDu8kVX+8/jIiYcFAh9gjbxkUGe8teHmHU9vEgQBX9v0v7SXalLQm8GpgWH0WV93Ricw5zC0
	o9JJ6d15qDdFvPE3B65ujB3grtG1w5j+c/GEX0FttENZvwZxK3lwzk2JlwN5t22Tm8Q==
X-Gm-Gg: AYBFou19xJkRIBXTW11y9I1pTo7ShV4D70t3TY2qS4ozzSbDwGGmJ7dRsigfJFCukuo
	1mwujOntOGKNxoDACkpwDzyGm7nm8G8kwI6X5NJjbv9Dha6AjKVz4ZdXTVa/MJ60HGtFQzmI6tp
	r/Z+SpzLdAPMc7/cJx4gWt7B4G8uNeUBkSc13dzTTNCkR8AC17DCMlwxTsU+48ZhC88gEcz0r6T
	89KPp0CMRkO+tGyAwwj3K+SlRY6t/IoaUcr5zMBx7duZwRzcUn5pQH467AWY7a/8+QnKiBPAp0y
	V6QY7fkNtqsw0+St7waOVJcS0Je0XXQLOLqEawvlosL9mdxuyo19+45KItofVVJu+p8Mo3h1aO7
	nGo1KL/6HU1ryaZXedQqgYxH873ZJ28MmQ8g3Ve0V0JiGzyVPsn0IUgfYVNA3PbrvYeYjrdX4Yb
	U/j4xYvZV9
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747985c88.22.1795173074375;
        Fri, 20 Nov 2026 03:11:14 -0800 (PST)
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747925c88.22.1795173073491;
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:51 +0530
Subject: [PATCH v7 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-1-25a771235a7f@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=6195;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QubAncHhhvP95+8S4/Hf0daptJaGxx+rk0qFwJM9cSE=;
 b=GJLLVLvJZg3eRglS4gj6HNYf/ZtzmRLyhRLdgszhX5eCa0sG3R2ydlGO59TBrF5FWLgpPzopR
 Z40gp3lH4ovDs6X+3Sv0JmZKHzYk/KLjzY1qXaEdHofU6gLNa3fkDae
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/8L9lVTV32QY
 JROcTu4zlGWutJ6dbO8THCWO7BXDG8F8YCYcgtkvnKhCbDSXuWscoQf3l4BWrzdA6Smqs9aVf2s
 FzcXEnr10Gamt3gYSI1jmXW/R+liVrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX23jTlVobYCDA
 AcL8zTg+VSECZ7BTxA8tHp2/9wfuwpJ2fbbPhc7IdWTEyjS+XDrTGQhoNqNbI224HDuocZ8tPRk
 aSl8XHe1dSkz5N/flSxRIPdU9QQ+7TGgzwrlvAAJhl5katD0yye8kYRFw+HrLDR9AmGp+k6ozpi
 lYYG8tDwoBhq4t2aLr6/9F5y06qtU75ockSLqAfCXINCoHYkhd6yE6LSaaSgrtDa9QEYg6xHQ9f
 dA/rp01C86PWeNB9MSGWUHtDd0lXpDwUONTbQpV2c5pZBrjuAyQLeDA3twhJdAK1dRZJTmz4pDL
 slskxjEWKkscMKUlz1lsIo5+WjxFnkNIepHXm6u+wnkCvPX1ELVhZp5tdjV3PDI96S4Ier58BAX
 +vNfO33RB2DWDH3tA93WPLyD7wuVn3okt1W0omrE1AzUnnHUkfZrzoXuLPrMGdV+0OK68bS9c6X
 9dgMlfKDm322JmCpniQ==
X-Proofpoint-GUID: MuWIlCX23Ft_A-5OTjGgrhSP-hewoWTl
X-Proofpoint-ORIG-GUID: MuWIlCX23Ft_A-5OTjGgrhSP-hewoWTl
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002ad3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=voxwdBqwZatJwGYNWigA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
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

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 0be2f9119e78233928d23af86836ac294aa769ee..6c205077bea4d729335d7a5690a57bc1bb43ed9f 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -50,6 +50,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -58,4 +145,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

