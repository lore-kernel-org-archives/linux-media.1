Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C333C1F5B
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488080; cv=none; b=mRHTU47jBdCMGkADkH1ndMMWh6KXLoQemJoWeRLmP2B5AB/vbAqjYSRVvw5P61avp7S92htzujTXZndZmAgiD11Hcz0F5rf4I7tA4PpL2vYF6RX7XJ8XsLMWcy45YYzHvjDYTmu66wgjXoHwisVu2wTs5w7c+2DXFhLN64oe7Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488080; c=relaxed/simple;
	bh=jFCuLE4LsfhfNWu++iTm4fV/bAnY2OwbXlZEwmijgJg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qDEEmI02QwMI36ulixd6+QsaSj2Gbr2LlnzZYtkdDg4zoRdCQHam68BPEWpljkWudOGtrnpAfFMxWSwK7AJMytb3qxJ8KMi7/0FWzR1jb8jMkKsl0iIVKy6LvSXn6TkiNy4vOtX9kw2BBrIq058P9L4JkhJC5e52az0wTr0FxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMS/ixjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhGWRXr+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMS/ixjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhGWRXr+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8ZDG63292875
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I2ITMiw8r1IZx8m/6M07SG
	17DbHbbJ9hdAKNTY02Ej4=; b=CMS/ixjloqdXcdi5nz4togJbWpbuhI442/t9jS
	Bn6gafhr5n6lJ2elN7rYgnFpwor8Wzv+QY896nHkngv4Mdo/It8QojE6VJV9z+8y
	f9Z/LksgLsmYEBDGeuXQ3K1WAPmbX0MmwbTOaiZ1xr4EFzmP3TxT93V06uaooSt6
	57VQRGdNrg8K6tg4EPdCB1hb8M/vqINdMyuThfYtrI2yFJxxydsnFlE6+9hLTX8B
	s25DJc1wciu5Q3RJLlgZl/hJw104tONPEbbKu3F9rQjAG56742QBurGNy5jUHIYE
	nC4b7xo58RI3s6nIK2FcJkYcqE+iKDrfCAq1sfetgvcS4/DQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrayg2f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efad04d884so16117626d6.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785488077; x=1786092877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I2ITMiw8r1IZx8m/6M07SG17DbHbbJ9hdAKNTY02Ej4=;
        b=EhGWRXr+yDUJssgIfyiAgSw+s7Ep7eDppm8bIw8rglV2O/F8oZqZVLRXadWkGltkW8
         uIGFZBS7dYgK4F/wO2qD68UHtcq15gHWtr3oqCTkKB25vLWf/IvpPKfnx14IBcCU4c8q
         de/0zFB8YSRFS+rOEiakdcpzKcTNWo/puf1J49pub4I1aJEuBnJ5Ubqu3Ikg8VWdBZ7Q
         Odc7gccRIw+r8NXCD33MaigdNB2x8p289nSoQZT8qxJb9znXYk0wrLyDmIq/2X34cUFL
         sfNk7IcsHicBdJ+dgASPbVUE5V19tUZkZnjUMbLjLiZh9o9OE1G27qWGZkOJejk+XCVH
         eRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488077; x=1786092877;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I2ITMiw8r1IZx8m/6M07SG17DbHbbJ9hdAKNTY02Ej4=;
        b=Ps8PNumFOIF8ikWecPBm/OkhKdYkm6263hmTj/9qlZHDlwE6BiBk8UgbTOYIc61KTv
         CQTIhzBhBAfyqVhKosLy8U/4G31cDVZ5HgYC7RCBWhrgre8RZj1g+V1b0zlnWn7cN5Dh
         uYu42IYmOnltFSM48MGfAExlFzTCBSsXcjqbwFRfuVPYXEpd99JxzRsYf2HjbKmIV64F
         quVCeFAdIL/yymayXPpcuWppbQ69NRXfwxb/xDn/BUtY7fZxU4i15xzX+rwf9KnwAeZw
         29tM5/ZIrAt01V50Q2wfMZjfwzwe4lmoiW56iuhntFEvopT4GLIQlSZcZNKyGz+NbQUY
         47lg==
X-Gm-Message-State: AOJu0YzOqf4s2opOcPAIRwezCf8G2nwaD3kOCvzf8BClXuQR/JT8nLos
	3ZB+CgLA4eXV1NTpW2W1B22HueEFjqy6d8++gv3K4y0VoHsSdPki102LbrNapUrRStS1huF1ARQ
	GpqOjke5Q5qHNuhNee9sjFZ8AGL9/h4ITDl/9gXa+oYnL2ySdPMBoE23jDH7XL19VKw==
X-Gm-Gg: AR+sD10odkqd7QpO9DM8N82CaFwyLRD9ptl3c3+SlD1pda53lymcU9yLXLiwSyZgvGQ
	TRSL0j0FxBuehFVjUw14UgQGUUwFtKqyMfBjrgSIgHOjCdAyj+mHBTH2pZuk0azbaT0sNzYxu/e
	v4Qgs8xe9Canj02EkYt/FJd4Vjy2rKnJV2h0fLPeJPxgT1m0GDs2f38MeGoWMTVeAlRzi2mHheg
	t846Z5Kib1GKYs1LpXklG1ssFTiT4zb8rX4Q+rIW9bYTHEtlBW+lJ0koq5FBp+2GeWqJw02/QJp
	WcpEnjTNUu0NgD0JiuiGH1iWONjeHwFo/vFpPOGMigQBRsOTS2+MoyFYXibIqGazBnzJOZgCXAF
	0x36bgAa1Xo4dJR83ftkJl2LUzdtYu4aRGAPTnpVYguXll/bnAepY2x5vrTaectgNo80w3DrqZt
	dsjoBoG5mbFARzcSLSyx+4Tt5Uf8JpDGlDrFCOPPcxBozJVfNtdy5m
X-Received: by 2002:a05:622a:6093:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52b4af3d7c8mr14362261cf.7.1785488077144;
        Fri, 31 Jul 2026 01:54:37 -0700 (PDT)
X-Received: by 2002:a05:622a:6093:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52b4af3d7c8mr14362001cf.7.1785488076753;
        Fri, 31 Jul 2026 01:54:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm61899366b.43.2026.07.31.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:54:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/4] media: qcom: camss: Report CAMSS hardware version
 via media controller
Date: Fri, 31 Jul 2026 10:54:33 +0200
Message-Id: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMlibGoC/3XOSw6CMBAG4KuQri1py6u48h7GxUin0kRAO9poC
 He3sCJENpP88/gyIyP0Dokdk5F5DI7c0MeQHxLWtNDfkDsTM1NClaKSFW+gI+IB/bzJQSOU0lj
 AwrB48/Bo3WfxzpeYW0evwX8XPsi5uycFyQWv0FTSItQF6tNAlD7fcG+GrktjYTMY1ApRcouoi
 FxVngtT10IXsINkKyQTWySbP8lBx5EyprZ/kGmafpm20L47AQAA
X-Change-ID: 20260717-camss-version-a8ea61dfae5d
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 7LCjtWl4OgHoMdNOEzA0wuXuODYPPXIf
X-Authority-Analysis: v=2.4 cv=Y9fIdBeN c=1 sm=1 tr=0 ts=6a6c62ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MrhWIHkXN22OVaadGZ4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 7LCjtWl4OgHoMdNOEzA0wuXuODYPPXIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX6aKeTVPH3B3P
 A0UGoPzddFNfJRR+q0YTaPqbTQMstYQtNF43YElW/jUbmw9pspnvO4PjihfuBlRg9UbHYFRhsfg
 OYA9DdFn9i5AGTHOb7GNifr47IQCD42srym7q9Er6cSwAOMwz7XJsD1QAbkhs+/tB37gA3RB5Hn
 zgD8TCZpIfRThfKUn+UOXNi+zEg7Z7+sEM7N9zmsHyvccxqv3elpLA19syPCh2kh2EOomnZxTR6
 h8Ku8c+HRCJuYVXRvkj7DetjK8yN3ie8fJi4cOVD2GjWpDVOyNdyNIaAcNyCUEHV0uciXP8T94/
 VVzfX5DXSoshlXsZepixJ6FWJ8cSaI7VUKAwradLpRYHud3CssJTR6rD/Qlp0snRuyYYKHzgd7C
 BElK9AeYYqvpSS5YVsR5omXiOTNYBlKqZM5GdB+L+PKXcv9qn1meXUYZN2n+HrkT+nY3S1UKUkg
 NxQX0lrLVtdH59PP5VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX+3uKg7cd438f
 LyLipLHyr5a0jCyDjCWr8fAdtaHLoNHDHfetbxIP5UjzX103jJUY6epzB+RucUn8K2+OwfxlLk3
 Xl6QiZmIyxJdzOyhecxhMO2x+YcriyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310064

This series lets user space discover the exact CAMSS hardware variant by
reporting the top-level CAMSS hardware version register through the media
controller (media_dev.hw_revision), queryable via media-ctl -p or
MEDIA_IOC_DEVICE_INFO. This helps identify the platform variant and adapt
behaviour accordingly, for example allowing libcamera to apply quirks or
enable features that cannot be discovered through standard V4L2 or
media-controller APIs.

The version register is exposed by some platforms through the top-level
"top" (or "cpas-top") reg region at offset 0. Accessing it requires the
AHB bus to be clocked. To make this possible at probe time, the series
first moves the shared CAMSS clocks (top_ahb, ahb, axi on QCM2290) into
the PM clock framework, so they are managed by runtime PM at the CAMSS
instance level rather than by each individual sub-block (VFE, CSID, ...).

For now, only Agatti is supported. But support for other platforms like
TITAN-based ones will be introduced in a follow-up series.

Reported media info on Agatti/CM2290 (Spectra 520):
Media Driver Info:
        Driver name      : qcom-camss
        Model            : Qualcomm Camera Subsystem
        Bus info         : platform:5c11000.camss
        Hardware revision: 0x00050200 (328192)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com

Changes in v3:
- Guard the pm_clk_suspend()/pm_clk_resume() calls with CONFIG_PM_CLK
- Link to v2: https://lore.kernel.org/r/20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com

Changes in v2:
- PM clock support: propagate pm_clk_add() failures (Bryan)
- make camss_read_version() return an int and propagate (Bryan)
- use pm_runtime_put() instead of pm_runtime_put_sync() (Konrad)
- Link to v1: https://lore.kernel.org/r/20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com

---
Loic Poulain (4):
      media: qcom: camss: Add PM clock support and integrate with runtime PM
      media: qcom: camss: Add PM clock definitions for QCM2290
      media: qcom: camss: Drop top_ahb/ahb/axi from QCM2290 subdevice clocks
      media: qcom: camss: Report hardware version via media controller

 drivers/media/platform/qcom/camss/camss.c | 128 ++++++++++++++++++++++++------
 drivers/media/platform/qcom/camss/camss.h |   2 +
 2 files changed, 104 insertions(+), 26 deletions(-)
---
base-commit: 8c7fc7de3b6cc89e68f115ee5ffe28cb93d99e5b
change-id: 20260717-camss-version-a8ea61dfae5d

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

