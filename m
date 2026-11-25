Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577100;
	b=d2rJlqYQEAn0C7iJQzHJwTmkic8g1R6EMbCqUO6KPfsrO7LoTYubuBiGBjz+ShLBqyR5
	 Rl+2fHmWCrO4CqFufWpW5IDtHBp/W0b1/fpsy6ogfton83nhpBsxroG6J0diqSsakB1rz
	 dSR39sevL1W0crXajvRuGtBhEuIez9HOdAAVZDxz3bNNKGkStafzbdOLy+mXM6hrO/XpQ
	 VINEiFXMySjiixvFL4iladrAjUwEUzBjYQbtuS5BQ9Ku3Vc3WTsG2jpA8he3FVyyZMypQ
	 QlK1MCcDkyrZXaNQJsd7xs4AnXpGyqjyds2rTJZ+H5tAo0Gs95gTvR8Zn7aK0/gq+vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U/lLHAG9L55IesgzDJmUcBxHasnZ0LHm1rImvp+HR6I=;
	b=ZgWd1zx6BUXVvheZsWqun285/nmYow72V1wkFps369ev8LOFVAgsZiUTPfuV1gybfUDq
	 qWpxAa8FjXTB1GRZJXUtRX2ZNv4SN1d14ZSOq05LrBL8jQtqp7JxhJgNS1mZxxgxopz3n
	 csubbqvP5GSGNR9/c4AtMhDu8gy09ao4srFh3H+HsXh2svKb9K2baKiye8u3QdD6O8KPH
	 RKjjHRomBntQ7B7jN7d7jvEnJ7nzXlWB4UQAcSl+ywV34+XpqCgtQE0a2ngYw56Aq1EKD
	 BHVQKwQF9hOjO3uBJIA+jsaQ7yW5uhE18gQ1g0/mWxi+vws0q4rbbpQT/NTp8KhGnWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cwf5v+gs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbuIcCBv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55B606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E55B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cwf5v+gs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbuIcCBv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2AsDp3974087
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/lLHAG9L55IesgzDJmUcBxHasnZ0LHm1rImvp+HR6I=; b=Cwf5v+gsK6jYVmO+
	HJMSRR7+vmifr1VSsv6mX5G2ypFk+RtC9dPpdcB7hhdUBWjeVpa229//tgOK/MaY
	qXNiuPEZZ0Ye5qwW2Hrh+bh1HluEYE3sdwIKw+oDGGuiLlkIiw99PfiEqa3jBy0K
	MjkxCEMpItG+rzRE8V5IS6suVa2AH6CX9hpBJrvKrd++QLHqUUmXDW83O89VdkW4
	e2aD2uLVjW/JF+98dezAGEApYk+BVckfN1xcjdYMKYgEbF3BRxn9wTKXfuWM3Th/
	MRIeNq79tGWYVLVIRNCSa4Zcl5HWCAU9kpD78Al48uz4y+raiISWlqYj5SHNkhCf
	OzWFQg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rrghk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:24:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e05d31e54so3630277b3a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577099; x=1796181899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/lLHAG9L55IesgzDJmUcBxHasnZ0LHm1rImvp+HR6I=;
        b=bbuIcCBvn0MXXDGy/vF4wjJjMIj94hKsUyCMMhl4/pNPcTi33edyQKk5C+1001ZPRz
         JxlnECP4E1J5rF3OL6eEOF+awkv3JAQe/EsaaLvO+7HmlJQIPrsbNLcgEiVI5xV7hP5c
         7ZU6dI0Gzy0+BjS/6lnTD7zwfz69C4sHBAKDdxwBAaHlJXy80L5yq82r7ok7+oKb6oof
         J5bwbSB4y3lU0HH05Hd7x0lrxKMYcOEXbxZngGc5Bh4tggYHxvFQuMx0rhrTd6hT3XDk
         Mec/ViRgpMjYFBuCNQlDDmkDaiqwUtnTZ84BBOf06HdrR/iJONARbPkUwLnc0NiFKrbF
         sqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577099; x=1796181899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/lLHAG9L55IesgzDJmUcBxHasnZ0LHm1rImvp+HR6I=;
        b=xATvD0RdKMfBnWckemEYaKUFzip3xeFBnGQO53QJeB384mZw4YizY1W9rxCMDP8GOD
         4LkcSDNIJakgu1dS0hH9PgpmqkLp6LzdMURxeE2Dg0NQOcRW66dx4aoZ8Q1BV8kvhUZ3
         7P6ur1iCXX4r+aHnXvimd8RUxCADbk8pgCaqUU2pyKIIFaZ3Ko5lG56j5vOUl4q5vxRR
         CLJ3DQq0EwrDEI7rNwnmgIjGUbo0uk7t2/7KYcrSf6YGYbXA69YVd0JYIClEApdljyqL
         Wf6yoBMl70fM3uwLHVdAu2oEkEDX2GAPs5uQRVJMlAMOHPBWtz6tb3/8merJv8r3wcpz
         wSIg==
X-Forwarded-Encrypted: i=1; AL+hErFOJbLJLXpdYvbHbk8JOU0Fu3R52nv4KlOQOidxhYSvMDkcu03PwGKm1qSVyrq90eyhaoTWDtZyw+iWlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eLCaYWLyyfl1c7JjKIeSvPHSypa8MeRNQsbwDf3KvdH+h7HVa
	EYLpYlJXsCaCXe5c/vxhpxQBfZBm3PNN36h7Uo23Zc7Ye7xS1m/CMnA5rLnkQ0HgoZ/ThWQzjhE
	QXRyeSFv+RYcoZAwzrZo1RdkxyDl1rVwh9pXpdhldxn31YrHbLWQ7inTS9+skKYXSxw==
X-Gm-Gg: AZFdTZf1EoeXMHM4ox2qye5DxOy/UOjJziLXKtrIccmhrvgVfiafZ+nrzdaJpCGrtXr
	RM2nmVBYnH1Cmu/zeb5WwZdtsP7B5DSlCorDzJtiZCfieQdzwUgOHz6pZzExa4mhWNbaog7r3q9
	oEFJYBSjVcma8jC4AXke5FS0rQS8xj5QPfYHBmFpmn8OpbHqydegTD079Uj2WNRpXzuyFeYYbt1
	Q3h6Gf9OirZANVxQt1Im7RmLBv9w981PX9Wxy70mGJvfblUPVoe7dvUfNjoN59cLpmMjaJvNX1b
	7oQVugVE4O0KjDhEE6PFtWI1ILSiE7tMLNs1qHSEeuJFekl0jezJKFd2tSPqJIxxOaKJZ9tJ0xY
	MeXWeBqWe3xtK16Co5nIGQE7IM7DRMDnSgPgddEMJ0XCxoJnGkhVW3T2V44CiR2e5W8BN/ks5GE
	H8MR82VYA=
X-Received: by 2002:a05:6a00:f8a:b0:8a0:20e0:b11f with SMTP id d2e1a72fcca58-8c87bac549fmr12678576b3a.20.1795577099000;
        Tue, 24 Nov 2026 19:24:59 -0800 (PST)
X-Received: by 2002:a05:6a00:f8a:b0:8a0:20e0:b11f with SMTP id d2e1a72fcca58-8c87bac549fmr12678564b3a.20.1795577098531;
        Tue, 24 Nov 2026 19:24:58 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:24:58 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:08 +0530
Subject: [PATCH v12 1/9] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
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
Message-Id: <20261125-glymur-v12-1-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=10072;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ujN05qv+l6TqatJsM3ww30Ll5RqgXo1HPijIqiykUgc=;
 b=TOkXF6RnbxMeSfKsBfmXcbBnTxd1cheNQ3rAP5NWNJprQ6Sdh1cBVOaEi60bU/bg1VAnty71W
 G77spvQ0dJYDlhdXy9L0Cm9IfAUc6/Ulsq3vj7RComAGqni52k1f3NW
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXwAfI19rm14xg
 4/F0dNUWdyVMMKiL9Z+AiBk2oDr9ADaNDlUlCdM7Bo6tG2bfNrdoZD3JGuKfYPM7IZ95Mjx8xk8
 35BS1ALwGTjCR7BKckbp1l60XPKn7pUOD6WPHVz9TdMVF/uMtXP8QQDdI4kiw5XC5uYHDHabQJP
 NmcXr3ccPVdKAJKqc1RhzaWcL5/v7KF510DkrQUUeNNumxu8jkWyLHAk5oaRgntHvxtH9fKNqrh
 5ebkCT8PHa76eV8KaG6uWKJeIlyAN7YA1+X/gXzSFt1+3H7XbXx/p0oR/Oc3rf1DnJGmt7vmI2a
 k73JYCzFZ/AqNW/Sof2I1V4ffPaPMRFQhJMRhkkcVapgaEuLrNDkSmbiijd1x83baEP77FrP6P0
 cmbyXWCE9uceZcPQ48fLyIX3VDLpurdvbDo6z6t/MoEvukdam7t6lr8Wg7jparek5IVRYMoFlXZ
 XJ6kS5jC86A3EFN8hDA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06550b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=dj5hHLeW_VTS2ukcrJ0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Nu_87XKu4Hj3hGDpxKMUoeoe8BoLih4Y
X-Proofpoint-ORIG-GUID: Nu_87XKu4Hj3hGDpxKMUoeoe8BoLih4Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXwW4hrFeR2Bn8
 Yxs+tAr6TfKAy/U6vTs3dwxG7b2m2NgVo8V3KIgShd/7E8iBpBOtDEqtWu7ythg2UHtPzZzA1Rq
 XwA/HDVTJHrXFTiU+EgaWx+4DMP71mA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence. The
current maxItems constraints for clocks, power-domains and non-pixel
iommus in the common venus schema were sized for platforms available at
the time of authoring. The glymur platform introduces a dual core
architecture that requires more clocks and power domains, exceeding these
limits. Raise maxItems for clocks, clock-names, power-domains,
power-domain-names and non-pixel iommus to accommodate glymur platform.
The glymur platform specific schema have fixed constraints for these
properties, so the common schema only acts as an upper bound. Since the
common schema now only acts as an upper bound, add explicit maxItems
overrides for the non-pixel iommus in the qcom,sm8550-iris and
qcom,sm8750-iris schemas to keep the fixed constraints as before.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 215 +++++++++++++++++++++
 .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
 .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
 .../bindings/media/qcom,venus-common.yaml          |  11 +-
 4 files changed, 233 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..9c34829a451b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,215 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec1_iface
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 3
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec1_bus
+      - const: vcodec1_core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec1_iface",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec1_bus",
+                      "vcodec1_core";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffe00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            iommu-ranges = <0x25800000 0xda600000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0000>;
+        };
+
+        video-firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 6ee9d23554cf..81d35be565f9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -81,6 +81,12 @@ properties:
   iommus:
     maxItems: 2
 
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 1
+
   dma-coherent: true
 
   memory-region:
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index b6d5ded1aae6..6c1ed1b9fdde 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -43,6 +43,12 @@ properties:
   iommus:
     maxItems: 2
 
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 1
+
   operating-points-v2: true
   opp-table:
     type: object
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 6c205077bea4..2283a5112e1e 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   firmware-name:
     maxItems: 1
@@ -44,11 +44,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   '#address-cells':
     const: 1
@@ -67,7 +67,8 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
         maxItems: 1
     required:

-- 
2.34.1

