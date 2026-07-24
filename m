Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C77421257
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889362; cv=none; b=segVgFKwr6Y5NbZIL2e53rqZvvyVTIJgds+ZTB0NTKS2lrbU6mwVMJULkyZINmyL6E7t0DkEryy34U1KgUkgIJr2siFJgrelTdYYa0RC4hu+YS+SMu5PiG2wyvHMe6wN9WcMGPPmvpOdmgznKKicAhzUkP45C+/EqQy8eTHZkTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889362; c=relaxed/simple;
	bh=CvB9YvUBIkQH9BcIh+3hUBKOEZT/PvTTwrkmHJauE2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VyVmouif6NH18svIZLrhhMKgjjjd8K7ZsfP1KCZcxI8xSuiBhqj1+CPufH87tyxXFaS9wLYPAUmTnR9DU3NIqste8mbGmMFYK+iFkUjlr6cBU6ZQYmMNDU8Jj1JbK7FDS1QRDlkPQl8hYJ36RIX0Tr77SWqP1P7GY+5WeJL3Y4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6lCvAGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEeXhuv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6lCvAGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEeXhuv/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADdjE2720909
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CAptM4MQ5Q2YfJ/h+CqLee
	LfiQB5bwOrYf6+13We8oA=; b=U6lCvAGCAQWP5Aq2n3uRaQ3r61/4pYuMNXMmWf
	tOx6ShMpOox062H4IALsXeVjqRYyouR0G9IaTZz28oG6Y6AI7JEmOsyAZgR/keZ4
	WSsz9gACmw3IrhmtNflVumbYjtkwM31xnlUBlNRkw+e3Us0sA7DeVjUVJZbxW6qs
	88jusBkYwZyrSW59qP8YHdu4P8R0+/XZtQxFGH1/d+9Rd/E00GGrGqnCJL5s7O0G
	KBW8HMh2PEJ/zT8U7ZcwzCqccIUIQ74jhEREEiofSJkzsJNX/qBSGQ/lmlegcAUL
	2ji5FJzaVLzAzc/XFaZEHBGAbUTFgvCKpM0MMaYkYEHZz6kg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag3xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:35:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso6928265ad.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889357; x=1785494157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CAptM4MQ5Q2YfJ/h+CqLeeLfiQB5bwOrYf6+13We8oA=;
        b=TEeXhuv/X9oIRNUaJ1FVeT1W8hlPMAGiDopZxpveWx7+xbMXbi4lt2O27t46h1AlTR
         zUQYJ6VbjW7d2PB0Lofs707axS36a1U+AlgXXUO7cqY96tUpI1rmW6ZuRM3quEWfY2YO
         B+ruRUhjX82z7Xw1veYvMjjugMlzG4HSrDVpN1A4D/T7eJVRt4+PSph29Thmo0pjiKZg
         gR4l9+yWELNs5OqyKMFZj1/hZ+kqR0OuuL0SDxlVudycVwiOGPoUUTX+k7r44wbeNuzx
         ZLIjZEVts1ZZO/kYNpOXumN1d/usGMyCT44ATV2CjqqXK9VuK8maZ/KM4Rs+mH3P/dn0
         y1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889357; x=1785494157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CAptM4MQ5Q2YfJ/h+CqLeeLfiQB5bwOrYf6+13We8oA=;
        b=S+FZ70ZCk18a3P/1F5flzvGSjQs3xvQT6pINs9qM8c7CSMnaSN8OIQzY+ArV1dQZCa
         BDkwrUc6bXKjGIzSQI1o8JzeZ5grjDROJvMi66+XihnUJd93MUgddmEUU3Yg9krcwYux
         xlEJahPVFUkl0CEJeXvYmPvGY3/87msFUg2wGU/zd3ohhW6TFgfGXbE6oW5LvWSZ8Qel
         JVcor//PDLppfHCyjp+e7WMH/jye1jB5eAo9K+e74Gd5Q7mC5y+FBVpbrUKw+Hh0yp6h
         aYmsiHWd2prYpKJjrh+vgZUg9uYOKJJQ9mbDRlYSBGTD6KW87EyJDIKYvXjKbQfcFyz+
         2zlg==
X-Gm-Message-State: AOJu0YxRYMs2cZ/DTvmfHeZGvEK/qDG+9DuFTrs2ghFIZI0cvrXAU43S
	BTv7Qlgy4i1DzcyMLEV508L+9yORSOPdCbYSDK0j8Uf4V/4ddj5mMTWpp75yWXGtMWN3LdS1Jva
	siPYg6fA6WpMf2dKFxKPw591LkapGmJ1SoqScHVGvZ57tsdcwEbC3npvK23UymlrHibMEIXKLuw
	==
X-Gm-Gg: AR+sD12corqaG2oswRDUnbPBvM87URx7GMMzOcYvDWhKmWw6vvQCNqPXtO2IVEb9ave
	r/JIB8ioD1bze02fusICMBb+iaTwRhYPXUTfLGgROt8Ck7aHg7sOovm65qPQHC/C4GvHNxXOrl0
	hbeSYl7ZrZKAyThTGK2p2qTwcvSPGV3qkE3+j0MWYdQP3pf0Od+Ah9uRBJ1mLYy7dbJYefUd7fI
	1uQx67FkfYmTWMhSUZIx8ndoy+onBCW9SZAqK1HdAJMHygLRsFsXeENdNAv5HKumNHY66eFgtra
	4MRAQ3zdciXSZdbmt8ksaz5GmPv/xQGPzXq3ftzqVKpgr0/GiDeYWq0l0DO2Q2H/b+fagC17LkK
	mzLxA0msumQlKIWaDKjsRDlpUMJGjeAs=
X-Received: by 2002:a17:90b:49:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-38ec63e7d3fmr7193023a91.4.1784889357521;
        Fri, 24 Jul 2026 03:35:57 -0700 (PDT)
X-Received: by 2002:a17:90b:49:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-38ec63e7d3fmr7192985a91.4.1784889357012;
        Fri, 24 Jul 2026 03:35:57 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm1228657a91.5.2026.07.24.03.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:35:56 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v6 0/3] media: qcom: iris: add multi slice support
Date: Fri, 24 Jul 2026 16:05:49 +0530
Message-Id: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVAY2oC/3XOTWrDMBAF4KsEraugf1lZ9R6lBEke1QI7aiXHt
 ATfvXKg1BBlM/AW8713QwVyhIJOhxvKsMQS06UG9XJAfrCXD8CxrxkxwhTRVOGYYzlP13GO5zJ
 GD1gqoVmnrZGKo/r2mSHE7zv59l5zyGnC85DB/kOCdY/QQjHFhnnOtKIGXHhNpRy/rnb0aZqO9
 Wz8EMuc8s998MK2kr9tukEyTLCRkjgawHHjHslt4sJ3DqMNh1fH9l5RqzoNGp44Yu/whiOqI2Q
 glgfQwT9z5N4RDUduTnDS8J4ZJ0TDWdf1Fzq/++TeAQAA
X-Change-ID: 20260716-iris_multi_slice-5647287a9563
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784889352; l=4854;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=CvB9YvUBIkQH9BcIh+3hUBKOEZT/PvTTwrkmHJauE2A=;
 b=EipOyTAK/VrGWhkVFsbeG+4IdMzcpGjOQ/ZsFPasfOckoKclCJKL1CrnE03Mau+O5ABzzFEm4
 O9/wuMmS3ugBrg61/dLuj1EA/xDxlWBLEnE5u+NtLjmRJ6p1p6Pr/UN
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXyIBT98GHrLHN
 HXoTDAwGWM/Z/PdKFmwDvDsU1PDua/AgjZQAiu6ThOzwLsY9s39MHHM5RrUFjau9BBkbKdBzr6Q
 TjHVPbvLaihTzBK+2yo2Ghu+W6TKKEc=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a63400e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Z090XU5ozNHmVG9x8gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0bVe7RFU5a23JxFSsP0kHyttdEnk0dmn
X-Proofpoint-ORIG-GUID: 0bVe7RFU5a23JxFSsP0kHyttdEnk0dmn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX4255rsp6Gme1
 JRQ3CixUBUnpbpRk5VWNmCm/LlGDmXb/NUoMD1kzjIX04KMNU9InbOXOmy00FZV+FqQJ9eoX5Yn
 LkrVz+lWrE3UcBV7cp9S/z3AlDyjvIAno4PJzPbKHDpBfXpVYwXhx0cZpY7d/gI6A+cjrTLCbSY
 aI1qOdaroauF/WD0c8XwdAdQXjwWgvM7/O9x6hHwa8kqRXBEF+Sb4vxDh+DE50VDvjK+NWB8biy
 gUMVjqohcImOPOQG2AsGntYJ+Jk3NbE559KW+w49l1A9rT+46TMbxKJRTZ7a9zC6wPwteE6XDhS
 eYKszzdqY1ae41TfcmQiSIVUgjDt3NSpY9Xa8mLneIgSRGX7hl01IShhbNaDTHX4NK+B+SQ9gl9
 Oy+bq+0HCctDHwJgpdq9O43lxkYLt2lvwHr+aelcGVh27E7HBYsd5xQzOzw9ZJJr2MOZ/vYUAtn
 5ybe4xBqTm/cBZIjZvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240096

This series adds support for multi-slice encoding in the Qualcomm Iris
driver.

Multi-slice mode allows encoding a single frame into multiple slices,
which can improve error resilience and enable parallel processing.
The feature supports two slice modes:
- MAX_MB mode: slices are created based on macroblock count, controlled
  via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
- MAX_BYTES mode: slices are created based on byte size, controlled via
  V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES

Clients can enable slice mode using the V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control.

Patch 1 is a prerequisite fix: iris_set_stage() computes a work_mode
but never caches it back into inst->fw_caps[STAGE].value, leaving
buffer-size and clock-frequency calculations based on a stale value.

Patch 2 is another prerequisite fix: iris_set_stage() currently always
selects STAGE_2 work mode for encoder sessions, but CBR rate control
requires STAGE_1. This is fixed by forcing STAGE_1 when BITRATE_MODE is
set to CBR.

Patch 3 adds the multi-slice support itself for Iris HFI Gen2 based
targets (qcs8300, sm8550 and other SM8550-derived targets).
Support for HFI Gen1 targets will be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
! filesink location=/opt/test_enc.h264

Changes in v6:
- Reordered local variable declarations in iris_set_slice_count() to
  follow reverse Christmas tree style.
- Renamed default_slice_caps_vpu3x to slice_caps_vpu3x.
- Link to v5: https://lore.kernel.org/r/20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com

Changes in v5:
- Fixed unbounded slice count under RC_OFF in iris_set_slice_count()
  for the MAX_BYTES use case.
- Addressed remaining coding-style review comments.
- Link to v4: https://lore.kernel.org/r/20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com

Changes in v4:
- Split out a new prerequisite patch (patch 1) to cache the computed
  work_mode into inst->fw_caps[STAGE].value in iris_set_stage(), since
  this fixes a pre-existing bug independent of the CBR change and
  needed its own Fixes tag.
- Deduplicated the per-target slice capability limits that were
  previously repeated identically across platform_inst_cap_qcs8300 and
  platform_inst_cap_sm8550. Introduced struct platform_inst_slice_caps
  and moved it to iris_platform_data (one level up from
  platform_inst_caps), since all Iris HFI Gen2 targets share the same
  encoder capability table and hence the same slice limits; a single
  default_slice_caps_vpu3x instance is now referenced by all Gen2
  platforms.
- Link to v3: https://lore.kernel.org/r/20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com

Changes in v3:
- Patch 1 (force stage 1 work mode for CBR RC): cache the computed
  work_mode into inst->fw_caps[STAGE].value so buffer-size and
  clock-frequency calculations stay consistent with what is actually
  configured on firmware.
- Patch 2 (multi-slice support):
  - Use inst->hfi_rc_type instead of the raw V4L2 BITRATE_MODE value
    when validating/deriving slice parameters, avoiding a mismatch
    between V4L2 and firmware rate-control enums.
  - Round up (instead of truncate) when computing the minimum
    MAX_MB and MAX_BYTES slice size floors, so the hardware's
    max-slices-per-frame limit is never exceeded.

Changes in v2:
- Added a prerequisite patch to force STAGE_1 work mode for CBR rate
  control on the encoder, required for multi-slice encoding to work
  correctly.
- Addressed review comments on the multi-slice patch (updated commit
  subject and description).

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (3):
      media: iris: cache work mode after computing it in iris_set_stage
      media: iris: force stage 1 work mode for CBR RC on encoder
      media: iris: add support for multi_slice in iris encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 91 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 16 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 17 ++++
 6 files changed, 159 insertions(+), 1 deletion(-)
---
base-commit: 42f83a32259a82c4481d3cccf560c3bfeb32c892
change-id: 20260716-iris_multi_slice-5647287a9563

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

