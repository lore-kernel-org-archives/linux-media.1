Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848760;
	b=YQeGuW2FIpUFWOjTAE1SiCqz+46UErGMIu0C/h/jjuSHVhgsk1NCGy6Ms6vt22V1Zu3D
	 XEi1gLs2fADpVzfjzFjVhC2pj06zdrHXkNmznGjcE30nekeuS390mq8aQ4/PM/8Oo+cTL
	 b+CjD0PZKXfPk3CIvEWABvY78xPjf0zJniKCzddKyq9blXUDocdKA938UD1ZMcSF93cnC
	 OEWD+tS/PCVCqIn0oEeu7k/d/wdYHd0fR8PYM8Nrg7/2/Apk1uhf3ZDOjLcRzPZoq6Di7
	 /3crJxGWUby1Vy37OCscIsZxX+3tr9/AWLaTKM2ayk1PpDXbV5G2QzCWlTc8ETtxhdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
	b=Qy07UR1d/YB4uUwvIt8UInMXrClFRxnziZeWBRb85Cx0Zov6feOQv4n1gfnH6yrVwRTu
	 SvJoQ27umeca+1yQFy+te5nZE9RGaOwtLNhNfnRgssc3NpCBhuy/75RiZw1kBw7NPNThD
	 SBqGEuOM1mstOhI1tt2YpKFFkunb/7NSlsIlZ58XK/6Nvj0exK0jw3hD5iOM0oNH/rQhU
	 1KrO+Oa97edRLE0rZUjRKjQibGXf7B/l32xkm8LHYuD7c01ZGaWCAA54kYm2LhblnGPDx
	 igWWBBYw6esZmFRCPOJ2QT3d1Tk2wyuvSMM1K07NdR/I5TfRm/xGk2hA0WZ6nUxi2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUI6iQxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1nMPmQO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D596606A329
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D596606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUI6iQxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1nMPmQO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGK7pG3692989
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2u37bdBOIMSumc6z0AyNM
	M8YbxXxPAGRGo7HKUvAh8=; b=AUI6iQxohVwkic0DVI6EyvNoE9bsG6285AHq++
	TNGV9oTmfejgf2czQsrFcKdscjcooedkaLXwQA1S99lyB6EL3ILJSJ77qPOCDqWN
	ViMYJpAnGIJtBj9HJikw7MWIrxvbudz4YEI1Xl0k1r+1NIBHIodsivKEqIfD+U8X
	RmImLoGE7+3CC5vDv5j4wmhwfpUAwNiXf0zmWTXpyCRFd5+a425Z4UO1FoYpx3s7
	TwOInDynATp2Zt+qL4CWzkjq0ROvp3c6t+xSxADSZ60QjsofsbwR8Q5qaWQXnx4F
	pqOdy1Zo6nmRMua5VucQAqBFKf9TDHRALIIV7u/qopoKGDig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f815wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:05:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so1424312a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848758; x=1795453558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
        b=e1nMPmQOg9qVc7XbxrAFvyJx8bC+6feB99BuoW1qizX4hLRgbPlZE4z1U9tCjLDVBk
         lFrkJVvF2uE1yzEMHIw+HyhjB1UMLv4jDUJjuQn4DjDtqUWtyzkUXBjazpX2B/dQHklk
         pnoNo05gQs15qTTqpJtsaaQqmGKgOcbgSWCmj4tef8R4cZ9x3AeHBQFTl1EipTjdSLvM
         Bbll1wcOCxxwiIY5vqyvTLlIv1wGAzxKeIW82Uywg3OxU0AEI47EhyLBOnicB1ed1zEb
         WB9UuZ0EwiZrfnYPsAhZU8ViMymtATUF51WVCt6lUE0Xuo0oJ8w54fwgZneTbLCn9PvC
         itkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848758; x=1795453558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
        b=1hZK37vAkXGe6zRbqGdnrgeNLGY3cXVdVnmgmyWpYRzmKisl0mT222JcJtzdQK9tOn
         vlD8zjJR1uxCyn75MMVrPoOsF6vgfw4Zl5vJiYE0jAdBP9nu/hsH/FIif8FDpsgDplue
         TbTAO7OJjzLqPUeQKjYv3Uc7BXbVKmBEZEzZiIXcLb6MaQV/LFTW/cFTeIdZ6ZxwvSoV
         boo0/Qax0bBVr3XKZG84+PiB85Yx92/isNBbuVSfyJ+jxCTkOj3HOR8rkSD15A96y1fu
         qEudIwDFUWaS13x6up1kC/5r6VF45R+Rq5UNPFNS7zR/49HjNk8ZaL7mA0TwDZj9yDn7
         mplw==
X-Gm-Message-State: APuU4Z/1E687Xo0rcuvabuemd8YHCFGCYWrag4ZM4gB9Vj/iizrh8IKm
	FgfsKhau6RO0d2Idwg3PbznjwKNOZ/MYxZLcpWhm5hYknBsmg5cfV9TQDcR9blSUzK6BHxOKfFp
	MSkaJ6xRLhtCT/AQR8+7jA4hKEKydZ9zVJ1m9ctYYUiJCS24u6VW1F0B/w3NKCOXIWQ==
X-Gm-Gg: AZFdTZe0GgXcjV5iYdH5nZT79iXw1CXJ+WosFXHLYg/amSpYJ6NhdTFf4lnJpAOgHaO
	zLTlS7Df4Pat6h2adVCk4gHIfN7nIZhe9iwvUB+ZNoR44/AkDSZ1OC6INKXSTW/jvpLXnOKoCbb
	A6gmeP36n8nqI1KyXC2Hetw2BVe+3mi1mimgrM112MA6MReEy3G9/rAIFo7pAGAcd8CskDzWyvE
	L3VE/rTVWgetj9ugIaqvybWLpFNXA2AtI/WhA49AXcpQrB75LLw6RLOz2U8ul+24BJjpG/EuEZw
	FLT0CW9FTt/XeXMiN4MU/3V4fSJe9d0yfefL+KmtmaxrfhAV98MzKV24arJX5fU8b1y2LyvSZ5e
	CFhnIHDWnnPsFGslmKbCbQvdp9fm/zlygTrISMEoBCMFabDVzv+pIVZTTqUXBIxjaqZ2LBt330n
	HzPRNd
X-Received: by 2002:a17:903:26cf:b0:2ef:d087:8251 with SMTP id d9443c01a7336-2efd08784a6mr10824485ad.45.1794848757846;
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
X-Received: by 2002:a17:903:26cf:b0:2ef:d087:8251 with SMTP id d9443c01a7336-2efd08784a6mr10824195ad.45.1794848757358;
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v4 0/3] add MBR type rate control for encoder
Date: Mon, 16 Nov 2026 22:35:50 +0530
Message-Id: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAO43+2oC/23N3QqCMBTA8VeRXTfZzpybXfUeETL3kYPU2moU4
 rs3Dbry5sD/wPmdGUUbvI3oWMwo2OSjn8Yc1aFAulfj1WJvciMgUBOggLsKK2PaqAVI0g5dwLw
 RSteUdw2jKN/dg3X+vZnnS+7ex+cUPtuLBOv2pwkgO1oCTLECJWtXM+K4OE0xlo+XuulpGMo80
 Iom9ocoYbsQwwRLp4zWUrCGsx1oWZYvVmhrIAIBAAA=
X-Change-ID: 20260212-b4-add_sc7280_mbr-597ac615b931
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=3191;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Zshta7LH1VkHwO4akPrN2bcY3bKQ/gUTFR3uTB+MhkA=;
 b=IHX2knwrWnP/VA0x9geISH7mkjO9MR/GHCTOlxkUKVlhV+qWPr2BDnC2DCnD/sK9dczd6f59k
 aYuo7bNSrSdBMpC5y4VsMOxVyfv+SsHlLTBXcaNPFaKsEIMI3dYq2GW
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXwXa8vvH0c0Nd
 AkK7boY1DosyCD0tuSj7yBW8gLJabj/jZivxdaxVCWt5wSa+RQQraBglEAyISB4CD3At5yh+Fm6
 lj3iZ9+jiszpHFvkZhjyROAsj8PAq2Vil5inAN2FNTqag7CF0TSP4bt500jMC4FyKIcJOc80fjj
 SUtdbWvY8YDmpW1KAjQD12VJHQQMjEhmS3SlFTm6/dynAQE4O3dyQaCysFjPCTg5h2S8O6GxW7U
 T4Wrqz/rov8LYGW1OTywtqcTts9BbBTg8sjdaLQgVYQueOcf/3Mdo1qEUZMyQIEXso1IpSoeuWf
 j9KNh2hFxuVpyai75fRCZBwuLSmX9quO7Gn/0RW7zbCcLW1KUiRtHotINvXjI6VRuh/TwOqVEsR
 dlIYyG4a/x1FPV0wgH6wcCRirPUDZIDghL+f8rSJNFMSEeUR5r17qeAbsg8VO8ukhPTrN0i5PfY
 bDR0BxwJxOpZvj/EPGg==
X-Proofpoint-GUID: d9EhtARxH0yikh0kGbjnvxqo9uMjK0Ja
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXw6BoUDJQfkdC
 TUThTVd0ncChP2ykb3th0yiwj+k2sqB8pGpYMLyB2yNsiDUthv5A8pBxRn5lBT9IvS2lDNxMQNj
 SJsKwNG0sIsS8rENdlG8/CQPKzbHXrI=
X-Proofpoint-ORIG-GUID: d9EhtARxH0yikh0kGbjnvxqo9uMjK0Ja
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb37f7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QU3Qso9P9l-aNNcEKg8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068

This series adds support for the MBR rate-control mode in the Iris driver.

Patch 1 reserves a control range for the iris driver in
v4l2-controls.h.
Patch 2 adds the control to a new uapi header,
include/uapi/linux/media/qcom/iris-config.h, and documents it in
Documentation/userspace-api/media/drivers/qcom-iris.rst.
Patch 3 implements the control in the driver. MBR is currently supported on
sc7280 only.

Changes in v4:
- Move V4L2_CID_QCOM_MBR_RATE_CONTROL from the driver to a new uapi
  header, include/uapi/linux/media/qcom/iris-config.h, so userspace
  can use it.
- Ignore MBR when frame-level rate control is disabled.
- Don't program the peak bitrate when MBR is enabled.
- Link to v3: https://lore.kernel.org/r/20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com

Changes in v3:
- Split into two patches: add V4L2_CID_USER_QCOM_IRIS_BASE to
  v4l2-controls.h (patch 1), and base V4L2_CID_QCOM_MBR_RATE_CONTROL
  on it (patch 2).
- Reserve 64 controls for the iris control base instead of 16, to
  leave room for future iris encoder controls.
- Link to v2: https://lore.kernel.org/r/20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com

Changes in v2:
- Per upstream review feedback, convert MBR enablement from the
  generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
  Qualcomm IRIS vendor-specific boolean control,
  V4L2_CID_QCOM_MBR_RATE_CONTROL.
- Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
  enum, its "Maximum Bitrate" menu string, and its documentation
  (previously sent as a separate patch 1/2).
- Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
  duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
  shared encoder cap table and layers in only the MBR-specific cap
  entry via the new mbr_rc_supported flag.
- Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (3):
      media: uapi: v4l2-controls: Add control base for Qualcomm iris driver
      media: uapi: Add Qualcomm iris MBR rate control
      media: iris: add new rate control type MBR for encoder

 .../userspace-api/media/drivers/index.rst          |   1 +
 .../userspace-api/media/drivers/qcom-iris.rst      |  28 ++++++
 MAINTAINERS                                        |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 108 +++++++++++++++++----
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 include/uapi/linux/media/qcom/iris-config.h        |  15 +++
 include/uapi/linux/v4l2-controls.h                 |   6 ++
 11 files changed, 147 insertions(+), 19 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260212-b4-add_sc7280_mbr-597ac615b931

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

