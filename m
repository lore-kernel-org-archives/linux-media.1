Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8AC43B3D1
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802089; cv=none; b=kJT/NHtXTzPceXfxEpUPg41YfziVn1Jv+bityUlkBXJU6OJrqfp4fxyYhpkVAmPWBb7zwsVWEw/RlMOIGodzKuuca/k0z7+4mVw9cZaev0t9NC6TMFXZFlLSoNgEh8nVQIKYNbLZj/713JL/d+5hNkMLqQ9IHFB+d/RrnyiYiqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802089; c=relaxed/simple;
	bh=dR2BsPw2pnsRHBOo/jlv8TkOF1+nIU4AoH874uso198=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RYQFrbOPLRRA5WnKEGyfefoYYibrPKpl5gKrtP0EbmeD6qP86nAd7QYJmdk4gcYoUPxjdkoY5Z80x8Br2NAfYti8RD8WQHGzQzhNMQ48RmJCqW4PNtVbtsib9tbaUbZ58oCdrbkMzgi+cCS5cRKdLTWTp0onBvc2o39jKdCShC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsByqtiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtJoOIaB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsByqtiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtJoOIaB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbmg3648731
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PSKeXsV8dg+pg/ChCFA5YK
	vPuaHbAUxkAi9j/OrnR/8=; b=bsByqtiVThLhd+hGYlOoLQUAiWmVcZNEoCfnPq
	a+9SQBcKXhRgKheMfuxqoEor5CKlP6jnlGNPsWlKJx52S65ZHH/NTOtJFcyH6YQf
	35ihviVLNMW3Ka9yrw2pY4JWKlopBoe5etGnnyQe2nRzsPdTlT2eFVAJ0mgEc4C/
	KRG4fh7n14MElvHLg0aszxV9TEjsjj5UUDWU+/4kWoKFkHfmjugOb0PcdeB52xPn
	8KCI3AxLwUZuijhX4dhISvkGkAO0WLSnRdBrTGyXoh1JxDBPcMZH0B3GT/vDIwqc
	AfB9Bmm7SiuzgKVZu8QghRv/mvax6VAV9RjmMwwL53Zjmefg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jgqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso665883b3a.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802087; x=1785406887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PSKeXsV8dg+pg/ChCFA5YKvPuaHbAUxkAi9j/OrnR/8=;
        b=ZtJoOIaB8ODIM0aUhCmRuJ9Pl72Vb9zUjKfJhxXXdBszkltE6f3IduopVzd2VWKHqz
         k8CE92v6JjTeBZea8O1ZsP2T6S5olECWyVNXIAfrny3G5RZU9rPtzE5+e9aA7gqvl58h
         J3cgoVMF8vxJB0s+TwByDdiUHClYPHPZ/g8Y1c6FTiudKhovJ/W6fLHNdFmTJnpC/1WP
         umqIpP0T575qFPC25NaC57SOOJEVCQKAB1cwQwJEmvjfymBOsy4xiTFmAATRw/acUwJm
         LcIPkK2oCX4NW9XymHzasNTovAlD/B18dZKOyMlxvjZPN/ZcBb3VjS4O9lkw+2eJjtE8
         SRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802087; x=1785406887;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PSKeXsV8dg+pg/ChCFA5YKvPuaHbAUxkAi9j/OrnR/8=;
        b=UT2VGxI6R08e80PjmygDqvl2aPseGhbkdHlHTkXw6UrMb6udSQ+QokevQeXfZotaH4
         Hszd7rVwykLEa81Tg0X2ApapffrHzcpqCStbHB+JtDcsq5ffsraRdhGtQeq5g74q4Dl5
         hOv58CHxUydj4+0dB69BRZsP/tlmbGEQm+ULQSPAe0aUUeaNZY4ou6YN21d2UPw9SB/L
         8mNxcxzT9/ABj0ow3anfGr9SvXjDlct3kcx+wfOtYyo7JO73KRtbh7kTThh6qWLZh7eH
         BgyGOUPFjTtYDPG/NjxDquLCB+qjmgy5rXk7vv8GFxgHisnxhxLNrADe2+QrZI9a8g58
         2rlA==
X-Gm-Message-State: AOJu0YxZRiymdBkev3qrGSrElVodrwpkjHN/sSACIPRdo6pIb0ArqZYA
	pD/qy0yM8kzeNYRahayIkCUBwEzefsVHqg7i2RGEcGvlgHIZL7VLT59331oi7u8zYLvw/6LBl0O
	R7e4KcpP4kteTSz0ygesrFCltfxNCYQGFMVukm00hO5ZQqMOD3mD1agSt4mFZJtBrnA==
X-Gm-Gg: AR+sD11Jio1tc+eOPxQoqFZXBLvwccQ3PjCo5BDE4KPVwK4/UIGb10OPLZLKbREvrim
	zQJYisQ3cohpLYE1qCcPuw4h5mKRBvVrwcBwKSMTUozRvKSGtB++jiw1RsP0vK9FK1TOCSQBETh
	XterHLMvETuAzN1Nj+kO0Um6Jg8Tfi2E7Csjospm90AKXd3anMCBXACDVdbNnQSlnbLZ0fcayeN
	4aVPG1Moe6Pc7cEIJGlOyFWaOLlE6Y670wHSNUj+HEr7ldoU6tow+xcDG1J9BDbIQljsbAjS3lh
	wZbgN09ZfWPyV9gbtK04BGgacJVxtyvC764c/ZytpTrMEG8mp5sHUiHcu+yyVqA0fYOlyOZLmkk
	Nnn5+A/dWV6zsYqyvMfCXrrCcJlV7HpM=
X-Received: by 2002:a05:6a00:bc10:b0:847:95a6:eb7b with SMTP id d2e1a72fcca58-84e2b8b37e9mr2919503b3a.33.1784802086690;
        Thu, 23 Jul 2026 03:21:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc10:b0:847:95a6:eb7b with SMTP id d2e1a72fcca58-84e2b8b37e9mr2919473b3a.33.1784802086224;
        Thu, 23 Jul 2026 03:21:26 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17285662sm2781395b3a.20.2026.07.23.03.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:21:25 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: qcom: iris: add multi slice support
Date: Thu, 23 Jul 2026 15:51:12 +0530
Message-Id: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjrYWoC/23OQQrCMBAF0KtI1kaaSZs0rryHiKRxagfaRpNaF
 OndTQVRsJuBv5j3/5NFDISRbVdPFnCkSL5PIV+vmGtsf0ZOp5QZZKAyLRSnQPHY3dqBjrElh7x
 QuYZSW1MoydLbJWBN9ze5P6RcB9/xoQlov1AO5T80Ci64ASdBK2Gwqnc+xs31Zlvnu26Tzsw3F
 AcfHu/BI8wln216gQSecVMUWSVqrKSp/sl54ih/HBALjkyOPTklrCo1alxwpml6AVnZd0JOAQA
 A
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802081; l=4296;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=dR2BsPw2pnsRHBOo/jlv8TkOF1+nIU4AoH874uso198=;
 b=H4EFLcyC1E7ecOBPP8dUHHwx9uP89f74rJd5DvWYWLqjOEtGa8Q/OsULW5jcE5P9HCyEI76T2
 lIcuCk1A18QBlFf62cXiIlkBZklXg1YHFDVJn5UqoCsOxHpFJLWr3cj
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: vZmL4UkPxKfyHbLbKZbgp4HIs70xTkKl
X-Proofpoint-ORIG-GUID: vZmL4UkPxKfyHbLbKZbgp4HIs70xTkKl
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61eb27 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Z090XU5ozNHmVG9x8gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX6CI1kW6ZWivu
 8tYBuVcGkAcKWNEFU6Ca2MpkSW1kkrwdxzwBaAR4uFAV2/NTl+s2Rs1z5GSFHZm2sXH6iindfxE
 9aJZwbdaElujvx7liz0dEVLVPEiN0r4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX2j4ylPn7QCS6
 lbLXAhR+nPSqJcfLSdf0v8YidikdUMI3od7OcOBXFCD2+oZEUDfjHNnFUEKdkjsq5uD7//eOfTi
 ZMHUzdkIPqfVQW4pbTq/Ii5NsurrDwZbXv8F+yLooJVosg5A7mzAu7tCNYA0RETcBGeDadd52aY
 b2WB6/9CMqqeYlsQby/OhaU4PZTt2OJcAdalognsf9MvGMU26rxDOYfHPTd5KIYIkfqyKOGzAfZ
 Jf88z+7jRz7JbIo0/pnLw0/xnf4gGq8K7yk7pip2hs32phsu6eFSXjXjTKckebohf63trlFiOkZ
 8nnFPaFCJn/80bXX1uyg53AHzFKhYwoP4FS9NU9D1xpgvaREG6dQpc+swzybVZctps5U+5cfTUf
 w927GHRjl6G37OtXdKoIWoRCwdFr3I+Keg9Hf2ICFGcKkbbi0sXfUq6KR9TI3n/V5SXJAukefr7
 TA54XR5QMxNY7Lz37cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230101

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

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 84 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 16 +++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 17 +++++
 6 files changed, 152 insertions(+), 1 deletion(-)
---
base-commit: 42f83a32259a82c4481d3cccf560c3bfeb32c892
change-id: 20260716-iris_multi_slice-5647287a9563

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

