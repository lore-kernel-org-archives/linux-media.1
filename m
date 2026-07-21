Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF23546EC
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640078; cv=none; b=nVdOsFF87ZjIWH92cgR/MOQzYVmvuY7p6pGj3zrQIZbw+YXAR5C6wRnS7AppazCuYbPBSfMBzJottCxetfN7HloqmVBFyW5kxe9GjUe5sGN91zjP0Vm2cx1fOoKGCi8g/ouxHUoqRiqSP9Dt8lgQP3KNs0O28M2VLZ+kieo+2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640078; c=relaxed/simple;
	bh=uWOMXeaD7MK1c8npIECmu0+72rBlgBlf7ZnWFnrji/g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CP3+TAjQ9ILaazt6uajixBxdsyfg7SHAqlu70tFFrALfsr8DsbtGSNo1/Hj+DaNUODbXDegkwmBttMwo8mxYCCytdPXqmoFAmc/UWolbdCVRYBqn3Caut3WfC7LGLvcliq1JV4wx27W6hlrKkdUd2iUo8GmchBcbvasEZup8Y74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5VKWZZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRtrem0M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5VKWZZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRtrem0M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR2ji2502773
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1B1bpITxNj0fdko2dvptB/
	+3xeAM2PNOaCl1+gbFVDU=; b=R5VKWZZfTL4rVH9MDfSGglvMpCrVisrhEMLSto
	52OYgEPgIdX5G/TvtA4Vcc2naYx5BjyKAKp1BgbZLNYoMsnxUyJEIoW2m+zHa1/v
	wabbmRl8TtbDRA96pPpNAaqYZKOXMaNtKkC5z+GTtbaB9YbpuuDWZ8RKR1Ayv3VF
	Q7hRwZnsDfpl9/nQ7oLJKtc4aOw+4W8gpXYPiBKI6A2Lc2geFOq8gfwrKJ665qrM
	kqzcpSk+nrlSl/hjOIuD8WrZN7MWhJWiKXM84Z5Ky8fV7c7DhduwuFKokadIb/g2
	AiN0Ly+zXsEZ8WBS6O4EHExR6P704/qhOLVnjG5d9Y9AoVPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsrxqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso3285291cf.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640072; x=1785244872; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1B1bpITxNj0fdko2dvptB/+3xeAM2PNOaCl1+gbFVDU=;
        b=MRtrem0MfRhhaKPVzHpxRS82HHfmwszcrLCOyGMo5D2ESBVY0sH1FMHSJgqzMP/T+s
         qZE4hvvNXWBV2SsiOmBGjdyvstD67SIJR2C9j4swu9Gnd+kEdNxCm/+4382nlX/K712u
         VkNufc6Ea7fdGFmecZn194uxFLSW3zbg5PYXgUHWpxVmRWKIDBjy3l+mLsBUw67LuXmm
         zRCiCDaNwc9lNFXrBqzV3PCvPY8YZcdIaHh9yIvlPoXVVqaWxr9UaETb+tx+o+3pVHZy
         Gxw9/rd7YnNMpfXYTqx40wrao48MBU7OuTA15H5JQjv8KHeo6Zlr/TIDdCL6nh0kicUG
         LwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640072; x=1785244872;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1B1bpITxNj0fdko2dvptB/+3xeAM2PNOaCl1+gbFVDU=;
        b=FUYpgsBFe/mKy73UUSpDn0L7i4z22NRP7WSeLraSdh2c1Niep1BMjO3ktkzOt+xyQq
         jdvuShijRXJg8mvb3NQBJ6utjQcsfj14ZtcWRDfbHDsjgiDC1VqQOLYrclqJmi/a8i3X
         x1qYJaaXxZmvHwxE9sDbWBNk3ZhL5Muwi1oWgFcbYzg3TmcpUgIEd0WacCBSXOwLuj+s
         XN4jYd9jGiX5Xo2ZYCsRQr52uh+91i/fqOUCSLlXmm8yAwS2TyO/047b78q9Zb5zN5FB
         wokibyaWFspiX0lODOgavWVu6nRvU8EDlUIhoahh4t8vwLy+pvVgu/HVGk91npOoYKDo
         Tttw==
X-Gm-Message-State: AOJu0Yxa+9HvlV7UHtq2IH3zoBXCgj5oBcrOPsV8nKpMoyHhj/L5l9Qu
	XZSTLWFeNiFECuD6fVX0ohmQM7+I4RqXDgjAYAOHGko7QVaJNUFJNc3jROhhYxjvbmLyT5x+BsA
	raLpuCAs8RO0BlGGZGMnibzrpv1X4Z3CNvsK19JGILFFkfmXuFK4NXPlJGEPOBQ5i1g==
X-Gm-Gg: AfdE7cmKkN/gdtGks1qTdDv07GlaXg2sDM2qCCAZkFSiY3BPFF5Ew7F4SB7tA6XQnJ7
	N8jmc+kwRqfiJvtgP8ebFtBU9UNieEEGlgCALDuU4iAsBqoiuebZpBkfvFl+rzxegz12MNrLMom
	6ol3imQ9htB3efA476JMk9PaAo+PUBa3wZ5esRD4aDlSW2XyMotGGrI8MpNVa9jND+74kBk+RgD
	PaVFrJ3fl+nQD5Qc9Z4e+0ha584GOrwUu2MVR4M1INQaFympUT07t8Yi54rTvUewI8aCHfMRA6D
	YngeORCtHutY9avCqzfcsa2MDkKnlqM/KX6QboRI23LyZDvlH8aHm/8HjJFeG33105rVoLuDx9M
	iATPJ1P3JVKu8OuAusYvya3HnfOBdCPOOBjB8hEDe2lDDAueUwXGBWHy1ADvbcHTu7WsgAO/K47
	yH7+WFMR+57wyEiXaAFm4kZ8DAln11SePhhH9o9/bGzwKIb0fspCE=
X-Received: by 2002:a05:622a:95:b0:51c:11aa:1cd with SMTP id d75a77b69052e-5213e28fc2fmr176835251cf.50.1784640071462;
        Tue, 21 Jul 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:51c:11aa:1cd with SMTP id d75a77b69052e-5213e28fc2fmr176834491cf.50.1784640070586;
        Tue, 21 Jul 2026 06:21:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/4] media: qcom: camss: Report CAMSS hardware version
 via media controller
Date: Tue, 21 Jul 2026 15:21:07 +0200
Message-Id: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENyX2oC/3WMwQrCMBBEf6Xs2ZQk0KZ68j9KD0uytQHTaFaDU
 vLvpr17GXjDzNuAKXliuDQbJMqefVwr6FMDdsH1RsK7yqCl7qVRRlgMzCJT2pcCB8JeuRmpc1A
 /j0Sz/xy+caq8eH7F9D30We3tP1NWQgpDzqiZ8NzRcI3M7fONdxtDaGvAVEr5AXs6XxixAAAA
X-Change-ID: 20260717-camss-version-a8ea61dfae5d
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 1q9qzi99oEoP3p2ohENIcMc_yjcWWslX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX3HDsDvRRtpEI
 oSD+pMmmkqWRmTRFisQ1JqBm8fq7zPVwYxJyOadUDMUsfY9bDi0gVodBUHgIeYyVjV2j7Ha14lB
 Ua5+OAajegylguBjzdFA9ccadHFutwc=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f7248 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MrhWIHkXN22OVaadGZ4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1q9qzi99oEoP3p2ohENIcMc_yjcWWslX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX/0jddculW88V
 ewLbrYsjHLyQUTLSDzyS65WLmkMhKq+bvKqsZiwAxNM+A1nrYNePiwZb9SePhyEw5Tb34UCJlNz
 ZLNm67JK08BehkdCy0iciUQsI/OrcwVe3Ed8Yti/pPdBgOFNpqOebF+0TzHqXpB5nQqCKniPTm2
 erHpWPcWuJnJkmGQuMWGIX1QVkdGN7ssL+f9uIK28gjG6iOlmYhIynUe33BqyBstmxJjeWrw4d4
 Y8hzUNo/UeJ0J9C43v3LZYKRskRjAJjEiC9dXHVDUqDai4Swr/xwqYn6pnIHxvq4bZU2aYYoeSH
 Uu6YsVS2isHmcTZuguW32JdZzB7TpsbkoTo9P4g534HsST9AEo051LteykcUCb2RIMS+n3HDpdv
 jz25dwjDg49Fm/AbmZhHdjDPhKt1KZ3nJ3s6GIg5Z8dn6wo15OR4t76p2cZRtTp9zGbyUWqfosP
 Y+wWprUwJHK15dMHCbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

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

 drivers/media/platform/qcom/camss/camss.c | 121 +++++++++++++++++++++++-------
 drivers/media/platform/qcom/camss/camss.h |   2 +
 2 files changed, 96 insertions(+), 27 deletions(-)
---
base-commit: 8c7fc7de3b6cc89e68f115ee5ffe28cb93d99e5b
change-id: 20260717-camss-version-a8ea61dfae5d

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

