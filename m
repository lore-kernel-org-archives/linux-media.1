Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6443C05B
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312292; cv=none; b=olZADYpFbEmDi6A/6CxxSq93h7hCijSOkvtzGkMR3kwq9o7S83itvVBLRBcYPCabsgGLkUKiwsqdsUSD1I9hx20mYb3QRo0qc/Jq0rR5Xx9l08vfHxmYl0acPVtISX/Y7IdfZKGELXIpCxEJ/YqlZyW+2F+/47s+w8KMNmQYHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312292; c=relaxed/simple;
	bh=PouABadX/+Jt1AOVhbgCCNEjQ6ajOIWLp3o+AuDQzdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rkf/7hOYK2OaOg5dLZsoiKvzEjMkeo1lkpHH6zr+UVPFKclztKskQVATlhuohjCLPVtaxRuiXtXX2Q1Wh+q1zDxAWyvsLWKlwbAMEFLOmSF8BcKtgJGLVkKYgp6MfVGMERDDbMGwgYTpXg7cZYLWTMWFkMUBL0/TZgtDHDRzDvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0VJ6m6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QuNnrvF2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0VJ6m6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QuNnrvF2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f1NT1340746
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=em10awCLWennKk9O2Kkk8V
	F01q0fuL2yHIQrnTtggE4=; b=E0VJ6m6IbDNhcex3Acfb+WPyE4deYJPLHeM/gp
	bM8zCMbMtvrDBgBZc7XcD6pO0zptHFtJQWUn4RHYXACOY1jc2qN38A40QEXx+HVI
	uVUEVqREOCDqWFVsc59AYAQhazq86KUqEZs2TxRwLWvFKKSEQO6LPqGsegAuQEhc
	4cdmziHsKCdEHPEafYW8JdPy42daCAj3eRlqCGRjIYLZQuc/9PpgekcxWDS4M9Bb
	vR7+iToZhMQpM9EtxiVidrfdNSRhEzR8jT2kdWneW7gdeSXehUhrHAuMSzOLWi3x
	zJBRTAli19tPsZSRlG/WRdGLzF9OVB0c7pBroDWXzpuuzibQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6txvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so5814691cf.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312287; x=1785917087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=em10awCLWennKk9O2Kkk8VF01q0fuL2yHIQrnTtggE4=;
        b=QuNnrvF27Y6f++knJBl7gQtnsLaIoWAHLrISoWv+tTVq7P8lVa1fhLKUmEimSMQKm+
         5POblY2iDOjnOWoWx8nNFkjRiVK+CMak7FQn11uHXP04LaK4PsJeT0drBStaj4wh4FyX
         EPwQolVgNU1w1Jwnh6eTqEriMAddS+/ULia+PJhrhLcGGAqDnfcQWV/M5Z7BoQFSko0Y
         oovJX6S6cjF76obJVFEJMMeBxd8BG8koHgvVfKqiF4YI7m/yyhU8/ZaGEZkl6k1HXxeb
         VyBiqYFdXo0n74RC/+Wk8Neng+IxeQVQHW49oVfVn3Ln5fbG8XwTn1SQiYoeyXtqAyQk
         qdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312287; x=1785917087;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=em10awCLWennKk9O2Kkk8VF01q0fuL2yHIQrnTtggE4=;
        b=Ho+Lbjxf0RhZFYl+0hgK86ocRqWmCXixeW4ivKwuJB/oosbg+Kc8lsnUI+M/gHoJfO
         6+6fz3BI5yTLqWaFlyIkjg/Tn3KQWKecmM3XuGK3m5nnzvaKuFCR1k/mJZmS4CP+JUKQ
         /GowV4by7huIonu+/xmtmWkmcab8CrlPzFDIFbaUhE9jDNAqB/d2jv5m0Cn6/dEw7X3w
         84xeMPxubuf35fRyzXorlfMtiLxt6539VJZl0HIETMSBJ7ktpFqlMetYbd+Cq26KmnJT
         L5UeiFBN4Yp1Vta3rHN0qK73ddMOOgvIvrPe2fOVFSEZiICHKBCh6E56SUJZ6rT9PEJF
         nTMQ==
X-Gm-Message-State: AOJu0YznTiVmcjXmvMFaIpmNfInwTSG51o6ilN++bIkY0AL5NvFRhDkw
	FFeu4PjYCJHk3DqJ3NJbAb5LND85u7bhl3jegK/E+2o7S/D1XbKo227KdoqulJhZcu4HOeF1V+T
	uH7n4PmHDhz1o2k6hZFfBAenDJymOrLZ41oFuQgbwlc8uDP4FNW53JXABhBDepMQSNQ==
X-Gm-Gg: AR+sD10P/9P7vB4XvxPQEuN6+3Nl754Gt34XweHCIMClcbPT3p2iTSTKNE5yMPo6EX8
	cpfqfBy+iBtaZ+avnTFSU4/H11sQcaXUSAtFjGkWY38FnF9epu955be1T/d6f3aSTcu7bp9khzP
	y5Oc1uZA26GWH4d3OyfSc2oqUbnn7KYV0Yz3fBJGkst60Kz2luBrjJ+nUh8kWZB3G+cNblHMhth
	Zw8MQR3btqn2K/IvJCqU6GDdswPPzTxaL+fODyEKURwBrwRED2IvVnHc1PHBjPJ83Bzqdq5mtDV
	2iiP2eQGAqsujY4pI7ocW7NdibBKiK/eEejSVwBAlT8fE5eTZ/J9CGZsgESjhHMrTnL3+t35hfI
	2Mkgw9DiR1hqT+mo/0PjsfUr6Y6b6eLfLVYgx7QARFJiunRVlsYEASZFN8nJX5QNmDsl1
X-Received: by 2002:a05:622a:89:b0:517:8a18:7624 with SMTP id d75a77b69052e-529d709e52cmr51651741cf.3.1785312287467;
        Wed, 29 Jul 2026 01:04:47 -0700 (PDT)
X-Received: by 2002:a05:622a:89:b0:517:8a18:7624 with SMTP id d75a77b69052e-529d709e52cmr51651481cf.3.1785312287044;
        Wed, 29 Jul 2026 01:04:47 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30f2a96sm13772631cf.28.2026.07.29.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:04:46 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/4] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Wed, 29 Jul 2026 16:04:29 +0800
Message-Id: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA20aWoC/3WNyw6CMBBFf4V0bcn0BejK/zAuplCgiVhttdEQ/
 t3CBhJ1M8md3HPuSILx1gRyyEbiTbTBumsKcpeRusdrZ6htUiYceAEFq6jrICLTVCmtW1Gj1mB
 Iat+8ae1rMZ3OKfc2PJx/L+LI5u+3IzIKtGmwZFpXAmB/dCHk9ydeajcMeTpkVkW+4iXwFecJB
 yiZlLxG5PgHF1t8sy7mdVMZKaVSKPkPfJqmD8F/dHUjAQAA
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785312282; l=2064;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PouABadX/+Jt1AOVhbgCCNEjQ6ajOIWLp3o+AuDQzdw=;
 b=qVbptrfAZUXO8jWSnGHsHwrbNpwyQlxwhKKOnE8oiPBW04C0a+geC1quP2CXKEIEF7EaXRlYP
 6bOhWpuEl+NCD/XRSJFVeeyK2BTMCHBmW2KbR3vxWil4LaVRgXiqZBQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: wcxHWTtO9oN-E7WKpfs1NIzzboXuEoPn
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a69b420 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QHcE8raJy8psccEy0TIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wcxHWTtO9oN-E7WKpfs1NIzzboXuEoPn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX1YCKEudNzqQm
 1ISGIVuoSd0x1OQFKZ8ieKqvpCxM9R4scYmV6kGwXwSginVUz4JUZfZ55CJ9nnwLO3De7hW0l57
 smcqg5MDF0+7lz6ASKPcFMy4OksHSFw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX3nARTogJ4534
 8dW0Gcd551Yxd89lwxvPw3E+8Eo/+1tfR+uM3txaLxYnilol/n+On948cP+V7Bjcv4EanNBWgzh
 OAZS+3aPw7auV/k+4sZRH2f66CUx1+yvtEtgiwiBsHIFi9qNTcY+RHg6AkMa/LPBOspJPRFkqtB
 zSozKsa14Ren+t/rr0GFdKlpXt9RizCwlV/0AUdS4sNEb5HA5kTBxj0zZaurfueUDJc2rl7Oi/N
 bbn85xQWjmlWO5P/ILSS1kgU3cwbRPFJnVPJdU4SjTgiERulSVrvWTOOWpxGbD58mtrCFIzPMdq
 +2PYCsSHBYx1gjOQKc2viWfQMH+MLLzuhQkc79uHCgBXvDMfHM2t13RBOsUoe+w2Nl8fvLqzV9s
 Z/+hsVrXravqBnF7DpaKMpKCENiYLoK3DxwiF3QMYU6tzK2Kujcc3d0PwA/qelOFcdSjVGJgqRi
 LpBI/QQBzUYZhvxfhuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290064

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v4:
- Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them 
more accurate. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com

Changes in v3:
- Generalise the binding title and description for both sensors. -- Vladimir
- Keep the cached pre_isp read so the OG0VE1B test pattern still works,
select it via a per-sensor callback. -- Bryan, Vladimir
- Rename the "sensor" field to "data", drop bpp (derive from code) and
add og0ve1b_pixel_rate(). -- Vladimir
- Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
og0va1b_data first. -- Vladimir
- Expose all four OG0VA1B test patterns instead of one.
- Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com

Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (4):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 377 ++++++++++++++++++---
 2 files changed, 345 insertions(+), 47 deletions(-)
---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

