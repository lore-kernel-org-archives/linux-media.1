Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA2410D32
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403457; cv=none; b=uWxwsKuqX5Q6T5ipd6/en+lNiZD69puWOpOZBxcEWjhE1khkcTQRn6oSaGWF5d8LyUPDa2JLdlQIUfCoqUcC7R6usl4CpbN6DJ9p3ms6ey97LlzHHzbNMsBckx+P4R/c/ADpRMijpCH3UpStzXhZLS7qrj1JgzNKhReOJ9JBJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403457; c=relaxed/simple;
	bh=2uqy+Jlf+js15yH0Rm76q5J6YIskFQZHP5GZoqWMWkw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hqw2Rf6tUscNmQN/xniEUfs8kEa9DuZDwowpu5gUrzHe1d10PN0nX/0GiUTT2H0NhkOo5r/TYYilp2XQo9qxZV+4GFUCTTlDjDIKANkVmCeZR4ux4/ZnNQwwdfMGBOkvAzzWjBaXMZT/utnUXiIkHTIK+kHYn+/V0Mp8ypyKeLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4Swvh2J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4PBQ3eg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4Swvh2J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4PBQ3eg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8sl01338407
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+JrRRzxWhfNkjeBZAz6GbF
	2Bsf4ds/N9+PS6qR+boNw=; b=Q4Swvh2JkMwtFjxa11okDnvsNheKidyj96A2Qs
	tFl0Mz0IqIq8FK5M2Cd2utB2KO7p5/Bxg/rNbb+0Q7AXMp76KFIpbmsFO2ynqToB
	YZ0sg19UFQ5OR7cZ77ncwc432CUsyuBy1ZnsdvxrNuHtxrLCiJTzj9ROp782f4Yi
	Tl6nuTyYqOLXTF54A1BGIffcwLnNckH8Dg3ZUJwEaVXCz6WmO7bvDdcOsGzCJ+CS
	46Z6tPzF4RAK0MEKmVsbHPOzr3XXQDeFcrqDe4FzPuTo/JViyYf+NIlLQMeFbNcg
	sRTCk4rQbA9TOREZp7hStbzvBq/jIwQmAVO4LEG2bO6rQaFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3h4r4s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-529ae8e96e8so20613661cf.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403453; x=1786008253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+JrRRzxWhfNkjeBZAz6GbF2Bsf4ds/N9+PS6qR+boNw=;
        b=R4PBQ3eg0rq+d2eBAh2vo6fvDWygSVq8qXJle46/65m1B3Op2KbCaLMD3cm2zyPlpZ
         GOESPpjlm/LI39dkP2osFT3SnXMvkLOgN2QJTzSsSy2lndZcwCqdr3q6cbqoNFgj8ryG
         t3n/r69JA1VFODFWUAdNtobJyDChcYr12HdWKyK1H4pX4cBwMMYn9T8WcO3iBOI3aJry
         jVq7Dk74wM8XBfc81xexsCHNTjpuBRS4oVU+qrIhEUbSG9qQjrhHjUlgGYHPmP1gjc9U
         f2ld40h8chYcd70YstlK+M1bv5iRmtmzpw1brLHhG00dfQMi64Tr8tlMHGuSOYNiXiDP
         1TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403453; x=1786008253;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+JrRRzxWhfNkjeBZAz6GbF2Bsf4ds/N9+PS6qR+boNw=;
        b=U5fkUAuWIauYoyiVWj+hzC9W+GEWQNpIdf5S45jq67QN8bryzzqbWMhFJ+tLB3XkSD
         mOWQ/w0JdQZds50IUIIWsrK0G4ryJ2l4AALkjhItnMmcKNkpkAeWe3lkjW2hHh3j16QQ
         C/TtqfGcuAumMOfGy2mymUFgkDAdSBz5tYgDfITsgKiKxgdhkZEMtGUtDGhfrkdgDP6W
         BvQ4DDTNhb3ZUnWIBeARRCltoLQYSc/Fz3qFCvFMejbjD6Qr6oxdca8HwB3mGr6UXD4X
         V3y6OkvmoBPx0StCaQbxrk7150MlezytD7w8q3Qmc5vh7AxZs59KLCyGM0EGId0Z+TYz
         VG1w==
X-Gm-Message-State: AOJu0Yzw6qwgxTT5tSKSfzPzifDRUUdXjPvpsP6xxzpjfmfxJxFIjagP
	jV63xOeA+Y0A1WyoQO1n9ra1B4rpVWifvT0jQYj2m37zIUx4b8+Z29qjt/89bBYjmTHapGAy43Q
	NwgX2n2wi1ZJ1S133/RIXN1SrJoTRk4soyEnxid5BrXC0pyMcW4wEhA8ith1mQ5m9C3FU0wBLUw
	==
X-Gm-Gg: AR+sD12COLN4F2xxps/rpkeD6SBmzbGjZuNjOS66A9SZvUZuV/1VfRj6EZ5GZZg9qb5
	WRB04rP/TVlvSt1FjJPCpRSqJ1etBmNT7iXwARRJVFERX/mfygT2A7pipo8l0tZK5x4LZAcgClz
	YuXbxSQjURbF0nxWQ3+gwwJW9yxwvWPmappxfCRat2U5q2uwUD5kt/WK9Qzo32QLkRsxhuSQHgQ
	UP38IcP5oOJOzpKwU/r85dER7u2RMEfRqcAKcIrc8vmQLy5ILnPb1b8sC/XJ/c+Y+hJ9W8TstmP
	Omq18D2ejykHqHOzZn+Y/znMo2jAs46Csyh1x0qoCqkYQTWZHKR8pfVT81Iix65AFmWx18hElIb
	AuGtzh2InlfNAoQsyxlDecK3wtfxHwB/YJj24N+7V96vhou/6m9FnjcRqghmhBUBIf5nj/Ekpb0
	jJGzTHJpCaycdUmOPQleEL04h8NQztKV1TesUT/E5SXDxaj6qseg62
X-Received: by 2002:a05:622a:15ce:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-52b38671964mr19924831cf.41.1785403452627;
        Thu, 30 Jul 2026 02:24:12 -0700 (PDT)
X-Received: by 2002:a05:622a:15ce:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-52b38671964mr19924601cf.41.1785403452170;
        Thu, 30 Jul 2026 02:24:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831basm411483a12.15.2026.07.30.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:24:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/4] media: qcom: camss: Report CAMSS hardware version
 via media controller
Date: Thu, 30 Jul 2026 11:24:08 +0200
Message-Id: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgYa2oC/3XMwQ6CMAyA4VchPTuyTWDgyfcwHiorskSYrrpoC
 O/u4GSMXpr8TftNwBQcMeyyCQJFx86PKbabDNoexzMJZ1ODlrqSRhnR4sAsIoXlUmBNWCnbIZU
 W0s81UOeeq3c4pu4d3314rXxUy/afFJWQwpA1qiNsSqr3njm/PfDS+mHI04AFjPoD0eob0Qk56
 aKQtmlkXeIPZJ7nN86CVBb2AAAA
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
X-Proofpoint-GUID: 109-NRbP5nxVL31DI0Yckak0WPOpZqYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX38wu8H+KGl7L
 lFNDDC/IVp5tD+GJ+uaeUXeItx3/5rcDfAFfmk0V54RGIkMVQuhkzG7qSGRUFDa+RH5fXpNp5Ll
 im/4Vxv//2VNE3uGYrdCnK2HfLc25B7v8Z3wQ88IABzlBxT8ZSHntZqi9A/4qhi9FmoCqmqvE5z
 eG/4HtES+dQynVbDRABrgTeK940aleI9KgGMczLcEMHFZMiuMvROgKhWVKehUpZIBu/j22e5Asi
 UqPg8/5Xduvw6Bmp4TI7uMP6/J/HAMT0zbQy18DuW6eDdAs5ehP0MNWPCEF24zmnBKJ3VgczzmF
 kLSSCyxWcYDcteO/46r3lDsXDtitAWFX7Uftp0wr4xq9MZp81tvdRDyGlIhTtoXQ33MMuCknvkG
 6k3CYyGmgJFezD+wYPruRtJnTimsurUWvVwGlT1DHBkkONqzeapXKqRWZ2FuC3UysWWUT4x58T6
 UWGECw8awaTS+eO1+2g==
X-Authority-Analysis: v=2.4 cv=bq18wkai c=1 sm=1 tr=0 ts=6a6b183d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MrhWIHkXN22OVaadGZ4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfXxcIxnZt3JeMF
 GUvk7v1fC6Qk3MJBkS+1fcdwaJau/MY3k0/oOJDVEBfu1G+eexuDtJE9uoDgACEiYjJXzsHcvcJ
 wemWldS56ySMN08K1XaT9fkjYMMgwbA=
X-Proofpoint-ORIG-GUID: 109-NRbP5nxVL31DI0Yckak0WPOpZqYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

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

 drivers/media/platform/qcom/camss/camss.c | 125 +++++++++++++++++++++++-------
 drivers/media/platform/qcom/camss/camss.h |   2 +
 2 files changed, 101 insertions(+), 26 deletions(-)
---
base-commit: 8c7fc7de3b6cc89e68f115ee5ffe28cb93d99e5b
change-id: 20260717-camss-version-a8ea61dfae5d

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

