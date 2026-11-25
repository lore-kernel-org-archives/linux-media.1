Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596194;
	b=n5Es9XPCbtnVFQFOhFBF74eGhfoZ/5668PpPoEc6RYpzWkX1DDYoH9bV4Hj6mLqpYlQH
	 Mw/psdmkbz9IBWSlZafCVBdKIc+vQIM5b1xkwGxPF/Qh+1+x0KNxonU5vVTAftnyHFG87
	 HR8qYgcZjVV+JLoedKnwdvSeZOy/MIaC/eKa6FQrlqD7G2SGVtH19OiMo6ye+RlAxmcum
	 CaIRPmUyMXGq1UoR7JpsWVlMF2qflz9+qks020mV1c7KfRzd8A1DOTnNihWgTT5N2MCN/
	 7c/sBFgiJ24xnsnrwdmcPM982ifS9lhriVDRXQOMvIcvFudYDgMWx4rwBGuNkU6BoKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
	b=K93KlLY63eBkPWXmyauS/Uca52KklOyU/ELFum+raFY3vnBU5bIlBW/fxMsgxhflQOv0
	 N6YWK7YsgQ+PnCzCT68/m4X/PElBf4xAr93NPMEI8AuGIq0po7C+VBOKkciDdtJngvtGh
	 0v4HiM4ycyA3NLummGJVJNe/nO2KIw8MoUeKZ8WDxSz0xM4mtJhOOl0vM5r3qL8MRARkd
	 X9nB3hfq/W27X8eHJG/hsc4mnnvSgJSfsgvYirwHVfNCrVsyV3S1TWAuYSbqq6DTMZgOi
	 zImXF0oRbx2osj1gj8drUP3ZwKxmfaU3UVoBzlgMJ6Iauol606Aag7WSDRKlOK88dOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHn4WBpT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QCXB/524";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB184606A327
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB184606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHn4WBpT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QCXB/524
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69tBE1006340
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mkMPx5pZu0MJCT37mBs5hD
	dYCQOlPFYux99EQPGEygU=; b=hHn4WBpTKIYyhJrG83QykBmEsm5R4JykuSSIOy
	GjV+jc7cAzz34j0Ays+Ze+k2HQdNssCFnPw8Dhp7lsIedL9EDcnAthVFlYlm0wyz
	TEo+5sZQteBlxukagmeZ2wo3K2IBR0s6xlB+Vh3ceqfCmE+3yEK5yA8dVJOffFwT
	kimRc8hg/Ih+tBggC/KglL53Q7SDyJj+bmzkDKPIcxhFf+cv1SUqZtktuTS4xJPO
	pqSCea6KFHqpEHKzESnrSt52Z9rUeHpQSFiBVBSynIDlseix7s7zXPRPxzozk+/8
	gMX4gpo1U2Kug5Sc3r1doKnBOjyIw9w+GRz77jl86gHN9yHA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29970-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so5973137c88.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596191; x=1796200991; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
        b=QCXB/524mIuA+e0qJQUHYvyZj7N2qfDYte8T5uvFOxjNGoOV0IjY7yegaCmW38hrnv
         lyv+tY4dQ8Wes+X5TRiHiAKSH5WumHIzFEmNdJfn9HAn2NyXKTtTnvOgiAjAOe3cw9UG
         eM+INvOwr4sRNbbAph2XUfZKGK1XjeLUHr6lemFKPhVm83jfUvuypJPrAOckqDTXHY9O
         XURiOaa5TRMXSf7ck4AMK/G9uEb6otUxrpRcijpK2If79vfGFg2LuFDxfBqUXN8T51Fl
         TzPz51j6dhQ6tAiz1ARlkDQzqWVANAaIA5ZreFfJAjqyOubvHgRo3GebxKIcJbLdmX8z
         jTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596191; x=1796200991;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
        b=YAZPVxgpmOSYnFUVtiDLOE8+xS83FwwdRu+fjAm3lfghGDa9QXiuGdRrxJ20lTkS2Q
         WZyb0Fxsi58dwUcpU4yIwFnV9xSkqvi1a+4FzE32v+Vi3OqTftjCMd4uYU2ef+RX0/RO
         phRKZ+eHDZLYc9wYoLbVC1cSE12tZY6QTxpXGRCyu+mc+D6URiARgH3B7bXBBHTYoQg6
         2El4Xh9jhF1mBorGQbhbnbxGVMlQaOAbI5EHn/RpwEkm7tsg3jaz62CxWxyQDXVu8RI7
         JDVKJGyH8TDRYhPnp8wyeA2oKKKu9Yt7foLMGS1VzMvFJVh8XrHDOi0We2HzaRCK/0LY
         rbNQ==
X-Forwarded-Encrypted: i=1; AL+hErFnHhOuqITd8IUXTC0Nw62WvIlrUkdqbFrNhMsd/hivkZ4mY64Cqgb/i9AlCqCa88ftmMcIzwWKNKTbcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9U/Vg40Xx0qk7vzwvRjdtSJQ06eXns5wBBK83ZBjRlLTW/X6gP
	h54H7dPY24xO9muwLAhPQwTmv2UcYVXzO5A9zQZRyvJo8DLrBVzXynUS/HLaIBjy49AZIRc4w+n
	lfd8ywbPctIRhoIgcAyEUjbVotUrkjjuhjAFsjRz1gkbyBro6JGQakf9/GcfmrVD/3BXfSimgQw
	==
X-Gm-Gg: AZFdTZcvE/FO4d95Cv7Tw+PUYYMg3gOKqOMfZ9s3kiZxcFoiXUWXL1BePEYKHi3bE5p
	zKHGKZlMxsOKBOJ9KMjkETdTA47Hb/o9kJZJ9ARFDbUcT4N2qS2/veRNS62iXUJmEMbNiBHplvo
	piyfqMhHpRiR/DtXw5hG/yGM9VJFVElkbns7VR25q2pPs2aMSaymVDGkxNuf/j5UBU/MNlD7/0+
	mYIpCpyN9PaZPOX7c35m07gXRE5DQ4pYJpzmIKDpeU040FenTkmrspiSqw+cUyRSiosg/4eSjWT
	tI3N4n+dF40AMQGAr+o0oDFH8CSbxHPTVDOEiqT10WOFnaQG6FYJ4GFzjnvMhjWLgCman61q7jU
	0MFpbZAXEtoAWujpWFz3f8tQ85B38DnpC+OnrHd483Q3O1tSZJcXlHsDMounG7m6stkWORtqGmd
	WVaRQb
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr15129853c88.39.1795596191359;
        Wed, 25 Nov 2026 00:43:11 -0800 (PST)
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr15129829c88.39.1795596190763;
        Wed, 25 Nov 2026 00:43:10 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:10 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add CAMSS support for Qualcomm Hawi and Maili
Date: Wed, 25 Nov 2026 14:12:59 +0530
Message-Id: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJOfBmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNT3YzE8kzd5MTc4mLdFAsDQwsT42RLsyRDJaCGgqLUtMwKsGHRsbW
 1AGkVK7dcAAAA
X-Change-ID: 20261125-hawi-camss-d801843c96b1
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=3216;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=LCKglgHmOSMp0gqQvoaScETsQ1eifl2GUqlrW/x1Vx8=;
 b=tLcDx46uoLSaMJ8XkdOrASfldBEIHBZ+IrJhE6+MpYoXiTCp7sKc1nUbWZ/Lj2EA/DGNUHN16
 NJQHWbJMdfPD9eYZx+P0owYssq1LnmYwbSxG0w96H/s8FMugrjp1iRl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: 216pJv__0keNGU6TQPwkS0NsqG7Qw1ts
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX3hASW5kVo7vc
 4Vmpq3PlMsutHfLCfAbAMBSlZ+Nmo+0PB2kg5PS+4nAmqU5YpQyzmhKpAWrOyQ/oxvnqQyw+tbT
 yfbxXhnl2bjLqEnyqIRdMwPlBM+pue0=
X-Proofpoint-GUID: 216pJv__0keNGU6TQPwkS0NsqG7Qw1ts
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b069fa0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=PSXh-a3-1L_3D_hhYzAA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXx/Dst30Gfijy
 NFfLEco/xbTQ1hm2MWPaHC3bW6Tu73BrIexfNNKv7FRjWobt/irIw715cKxKkFFCMqLD65dS7K/
 PbAKfZ7x0vHgQVBdvmYpOoplig2sBI9ZVdPC7URwRvK/OdS93U5PrEaNvVIQtrogn7UnSz78mnk
 DGDNOoLtGHkRiEqTXPgIHJNxmIp6OwLoZiBPMRc+J3vkDO/1TIVsdTb/KZBqpW9lR2v4kav97Qc
 I8dL+gnCUBdsnYFuI/Na47bFkotQbuwEW5dk3bm6g9G+KjrgPdG03dRhUcI/mxz9aUMPcUGhw1h
 wZRNvQuKSp1uiP0MvD9hmwImhA9rtChf72WZibKR2+JHiuRF9frdf0q6d6IAs7VqdFURi2luHV7
 S45ikp9p8iCbgh7/0t4DH8NUxKpNgmDDqmKx9qkAM47vhEew/SonRRIyQQqMgFWQbRI/eyK18rh
 Dm+JuXDbYBRMC89O8zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

This is the CAMSS/media part split from the previous combined v4 series.
The I2C CCI and CSI-2 PHY patches were posted separately as v5 because
they do not depend on the Kaanapali/KNP CAMSS media patches.

This series carries the CAMSS/media patches from the previous combined v4
series: patch 3/6 (CAMSS binding), patch 5/6 (CSID clock scaling) and
patch 6/6 (Hawi CAMSS support).

Link to combined v4:
https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Link to split I2C/PHY v5:
https://lore.kernel.org/all/20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com/

This series continues the CAMSS/media portion and applies against the
camss-next branch staging to linux-media/next.
Base Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

---
Changes in v5:
- Split out CAMSS/media patches 3/6, 5/6 and 6/6 from the previous combined v4 series.
- Drop the I2C/PHY patches; they were posted separately for I2C/PHY pickup.
- Base on Bryan's media tree where the required KNP CAMSS patches are picked.
- Link to v4: https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (2):
      dt-bindings: media: Add CAMSS device for Hawi and Maili
      media: qcom: camss: Add support for Hawi

Loic Poulain (1):
      media: qcom: camss: csid: Scale the clocks with the CSI-2 link rate

 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 317 ++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 417 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 208 ++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 217 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 228 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1354 insertions(+), 39 deletions(-)
---
base-commit: 2fe1b6509825b39a090d7ec055d094155af4e0cc
change-id: 20261125-hawi-camss-d801843c96b1

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

