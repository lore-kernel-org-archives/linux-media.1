Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019C457E61
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984306; cv=none; b=cLWIBsm8Yhr98Y9N42x7DHfHMj2oUUeeW8CameHd76FLkq7NZBBdwvel+Jfn7ZQs9tOs+KdnTMIrORJ4PwWmcgix7v6WmasBdLIAuEKEOfVam8BriKrCLOpZH2HDuDB+RX6AxCbX+6jBFDgZt7bv8+MwZ37Qzi3onbkVEZUDe0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984306; c=relaxed/simple;
	bh=NiCAFRxh6ufkCFDFp7mRRvVwAvnQqvM01Vy4s1lcPeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MTP9gfwzFakzuIshNt6xBQNn7mm2lsOxcIV56Ke5IHl7BM/GdYhsHdAnCQbtvaD9wmLvEkBt3vgQSyxvNkI54FodsFfr2qH2VeS3h6H1BsOFCbSi9h11aRIjOSIPGyxVI/CUgu7rF3yEa57sgzMXDM1ibmn/R41oMu+izlHsMRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9QITqDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm/0n/pG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9QITqDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm/0n/pG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79w4i1624394
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IsA0Atzw4xv+gWSF4hd/B6
	YiaWom8ca5sKXkxg9X1nk=; b=H9QITqDEijHFaPvG1ISRdC465FMpJseZRXPqdR
	BQzidVx8mQjl8o40KlkRVnxtCAAuedb68r6a45M4rnenbQRfOY7Ju1tSIQlPXzax
	NEvXOI1DLzLVNdg+x+v2/Z7fOBWWKnrE2Uu7MV9xO7uM/MkuI5QtGO3hBxDv6PY3
	ICXXJ/CVD8QkWyoIkeiQmVg30tV5XYkyCFX9BGUtcB5XXxQm67+Q5o9WOb5K0xdD
	r2U7boJ5l0ckZOxnz3WEXJdUa0PsKPAwQfJbDENfaKvlU0ErkOYC/4iJY7ThM9Rt
	Ok5mz0nn1y00Riu5HP3vOUbDFeXT8stC4nvFWLB38pZFVG9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsrek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso3647735a12.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 02:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984303; x=1790589103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IsA0Atzw4xv+gWSF4hd/B6YiaWom8ca5sKXkxg9X1nk=;
        b=Qm/0n/pGp97d+q0q+pGpUZIjG+7Ms3L/T/5iEaD5M3AvhQI/sCouWSPVIJTH5Hn3b/
         YFPTXej1M2Z4cv0VQmiN5E8Au1qSSeCOfNXmtsFOaI/lekvUDMy9Pns84AoIvUAfzwRn
         oY7Xj51deAEFmN6nau9UXZLUBhmMs6RMwsmDWwv/BBFjDXZ7QzeMtOIFFYUQ1wEz0XW6
         tNnegG03/oYerdkWHxEXrDmc3pixmR+BYsdE6vpjFNpzcFPFHK07yeJpuzADLQA+RG4I
         2m+5bovZF7Q+t1w+ZxBAnG1Rvr7CZCckLRyzsx5FRhGzT0Q45ifpxr5vvQGfYdSOJapC
         q5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984303; x=1790589103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IsA0Atzw4xv+gWSF4hd/B6YiaWom8ca5sKXkxg9X1nk=;
        b=jBbRjv7u3tbkdlznXH/IUCpLb4mic4p8SrkTN3c9GAlHGUTgeVhbuhut13fsFWE2sM
         kSMekajOb4d5I4ENpr/H+R9j9ezh/zlNifjW59HykkIH8m5ItYKQdxfXsE3mb4spIe3p
         rLqu56wfYCrumg8Rzs+7XBCt7Q3Q1V0RKG2N6l8xvqWL3WL0C5hNs9OO7jtn7oaQ0IOL
         Q3iLbwVK/aHPaBvbOwgIfWzGt6gA/EtpPwAc47/c9s2V6Lar3oyjqTxbvhZhj2XRYkXN
         bxtpRo61vNjahXphmZlz6jn20MzajJ/rfdUw3I52bzpmhUB+XqA/Tj/QCOvCXjU0zZOw
         Zsqg==
X-Forwarded-Encrypted: i=1; AKwUvBz7GThrYdCdl4tKj1P4rmLbOd/F/6Gizm2gLHHDpPukZdqd6qYdLTugGsgsPg7XhWwMtV/e09kydKlBZA==@vger.kernel.org
X-Gm-Message-State: AFuF++mZmdczJh+ahbDL90wGkts3jwoCFOgsZCc57nDwvooAHMU61Q/g
	Fc8FNo7NtPN0HmqdQh9lxgR4uwOTpRCt9KPmbrbEPnUd53jO7BVD7/5qP8gXAIGFJFHFYJeU0d/
	L6T9ajsFpxzerxeAJVK8YmL8DOlssGNwH2KDo3ixMTMKb2uL+5Yq3HFB+N83yc4wBPA==
X-Gm-Gg: AYBFou2+BrJDPqdkQfQCyQlGABnzNa16yrDcc8hnOsUiN1dcOA89DXgwFnSL0oUyrkX
	9yufm46NZutdL/xkKjjHISEGttSEyPEO/+xmZvxx+6y/5fcn36aDhFRgqae2mIFfrJVFzwlMab/
	qQZfNszT/6dFAQzYi7T35c46rtgjdsEMJrOh7mEYZAd09ea9Na1E3mBgP/I3BwmHljHDNSBxczN
	0DWuLqTD9gKBfRaOzDtW9Pf26EfK8ETxXIyzrUNdv2UZODndTmIsGwQTEIybCFo3udt9CaGxj0Q
	1XCgKU4Jf3FzpWmuhVnTivQo20utxAw2A5CW8mu0TUobV/bd9dSoahApxPKGFXXhkMunyN+zl1H
	V2xFb2R4R8PZqQbyaiyR70J/PNlZ4gQUvDJUqT0jg5M3iHzB0qbNHWg6MlYcOaemg25RMfTVZIw
	==
X-Received: by 2002:a17:903:1a2d:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2ddb2101d53mr107626715ad.4.1789984303319;
        Mon, 21 Sep 2026 02:51:43 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2ddb2101d53mr107626595ad.4.1789984302886;
        Mon, 21 Sep 2026 02:51:42 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:42 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: iris: Enable Iris video codec on Eliza
Date: Mon, 21 Sep 2026 17:51:33 +0800
Message-Id: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACX+sGoC/32Q22rDMAyGXyX4ei6OYydWr/oeYwQfW0EOrZ2Yb
 SXvPidld2M3gl+gT5/0JMlH9ImcqyeJPmPCeSqBv1XE3vR09RRdyYQz3jKoBdXO9Rgx9WGOvR/
 wW1MbtGhYAxq6lpTBe/QBPw/o+8crR/9YC3t5NYnRyVM7jyMu56oJXHAZpJHGGOcAaqvBuuCkZ
 Ny3yikFEkDt6NGnpA+p4virlO9rjwW216z7ou0GnK40C8ooGGCd0F1jRX2ZUzo9Vj3sq0+lkF3
 vhmmZ49fxglwffv9dm+tC9cpaB0bZ0Ok/qNu2/QC3QkXqWgEAAA==
X-Change-ID: 20260914-add_iris_for_eliza-cfa43039a976
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=2726;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=NiCAFRxh6ufkCFDFp7mRRvVwAvnQqvM01Vy4s1lcPeg=;
 b=PHjxf9LjnDRKOlCUlirjnpR2r4qPivwUf+WlM6Fjkl4a5paSbOiKsnlkYfch7UUEGNZcQ8x+6
 8Euf7UzHrzVBU6SkaDS1g9CBdD0+JH6iKsxCGg8CHAm1evIyL5fnj+V
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX+xDxakoLPDuI
 8AbpEVzBoyrIiWLZM+a2vnES6dQdHXGwRxmuj+jtXZh+fmBz5pdqNC+8aPDdPyANu8r/gNVNlgh
 JhzPpu/XCPUenMW+Bv/AP6NA3oyICktCOFKDiNhbEUBpZep132GXNFcOo2+zRIare6cn9KFGJod
 flqWhlLiqfb3xPXc82oIwCs9JNprFRjE8h7l6BI+SSwh+q7SQeRssTddAqGncPUdJSS5Cj1Ttag
 5AFaYWVq2AoSiOO+QCVjukExFPFPwb96kDGWpw72PZjp9xRB755ui0IsKFilTq3rc/3ZPqJ5wS3
 ZUwNr+ymmjrZm6Gkuz2AgOeUaoM8fxS7wrZ6Kk8rVPllv51N+j0yzc10qdSlRqEKLGxfM16MLDz
 t9WA+HR28xSni17mHc4e5haOHOIiBc6irhSlsLUxTW8IU1GTqtAmAvanRi667IrwxK8t6CzW+4S
 aj6xxSUxJYzJ2GaZ6TQ==
X-Proofpoint-ORIG-GUID: wD6msqKjsnBgFQsZ1hQVVbbuJQzYyfPn
X-Proofpoint-GUID: wD6msqKjsnBgFQsZ1hQVVbbuJQzYyfPn
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0fe30 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N-TFuj4FxbnEaaYKstYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX+QSfJiEowKFr
 E8zsyKtsq2D/vNxxexd/9kDv+t0h+lNYKWUoCjRCXJZoK1d6ES2Uhf/YqIUBcvA7r/Z0sMdKUYv
 KRG+b9QNqkVI397MdkWiMWI5VG9lLhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

This series enables the Iris video codec on Eliza, allowing Eliza to
use hardware-accelerated video encoding and decoding.

The Iris codec on Eliza is based on the VPU3.3 hardware, sharing the
Compared to SM8650, Eliza has:
- 2 VPP pipes instead of 4, limiting the maximum supported resolution
  to 4K.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 225/305 tests successfully

Dependency:
https://lore.kernel.org/linux-media/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v2:
- Enable iris on eliza-evk.(Abel Vesa)
- Link to v1: https://lore.kernel.org/r/20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Document Eliza IRIS accelerator
      media: iris: Add support for Eliza
      arm64: dts: qcom: eliza: Add iris video codec node
      arm64: dts: qcom: eliza-mtp: Enable iris video codec
      arm64: dts: qcom: eliza-evk: Enable iris video codec

 .../bindings/media/qcom,sm8550-iris.yaml           |  2 +
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  4 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  4 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 98 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 7 files changed, 158 insertions(+)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260914-add_iris_for_eliza-cfa43039a976
prerequisite-message-id: 20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

