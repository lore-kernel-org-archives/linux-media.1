Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAC7386C22
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785566703; cv=none; b=gw8lYSbp4aM/OjcOf3IdpZmTJcklb2dgjzEYpgkdOOxt5/SLFaIk/ujJV8BpYgkiNoQWlUp5SZlgPZxbMqfiJ4aH6bYTjgmbioM63ObpwxHUmRNOhltyqDtGLWRTz1ZBs1LH2GG32y98tjzJn2QAUqD0vzb6fg6jCjxbqBnYLX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785566703; c=relaxed/simple;
	bh=bu8Z4vw7yCArmYfRZxkMAPJT/o9xfi+bqiymwdKIC34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=IExj8oOCBwV/5cvyNmalwSK81KbncxpMyutCuuUhkG1Pg0VgSVBTkPUFyqkwFLNIi+vuZOsvwlyWzDIqD7Rv89dBf6XiPAPNwwodkHl4AYLN6dgCc33+wtzrHIUuJUT1X6ZgxwwIT1gXouYiXZvOkSoSPa/2RSjAozAMD0+6sO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI0Mq64a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ojqgf8Kv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI0Mq64a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ojqgf8Kv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713FjTo1759110
	for <linux-media@vger.kernel.org>; Sat, 1 Aug 2026 06:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vQN+Rc8ZpgObLyYJrV52E4d++M/9CtJzl6cQs//2CI=; b=MI0Mq64azaPuQ1/a
	fYqy0xkbJFD2AvAni2gkkzMSrBzcsrp5qzn6xu70JmYb/emwNn2DJ0KItFr/RFjo
	2thXutcEQw8FkWsgj1uXK28IYz31wE6mgREh6RkT6tLzyvZPmtS1MRAnECQ8pTN0
	w8gjSaH7Yy78GsadEXMJg2w7khqJh5CiYWyIeLROcrqD0uSOrri1NPnjzJxEe5iI
	aa8KpWbjfrOw+1x4kixjcBSlfzZq9eh1bDu8us6CUEuP5ztu70MCLLMCecco9KDa
	gHWO1aJtHWPi1qVbS76+bWyC8ZgqoE6PTBk5P0Eyq8+tyfqQy+GmtHbtZ2nFCrZa
	VPjQjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6gd15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 06:45:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e048a801dso2468627b3a.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 23:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785566699; x=1786171499; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vQN+Rc8ZpgObLyYJrV52E4d++M/9CtJzl6cQs//2CI=;
        b=Ojqgf8KvWSVGL4OcapleGXuL4fRpTSbcEfchbOQq7u2AX4hFcwph9PNsQa4xXq76ZR
         h9c8pYzaA/klja1pT5L1w/lS4lO5GxwZtJLd7K6sRXSc3FMotQ7FDu29lGWGP4/5NFSP
         dQAmeDpo+r2qWjqkXHi0byillP8dCF27FCPxrcouzbkDySvSlTnHZDR/y8yHWARIF6tV
         FZJTqv3EnrBgg1TE6JqnEfUrenF1HF3RxmnPEkvZ0Rrl4TjZn51jfmxMfsDTjsWNCjdx
         kYzP6H4aCRJHfZgby2pRsUvNmrbRSjYiHXDfqFEzKj8gkFLUqZ40vlCk6pkyUzldJhu7
         bQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566699; x=1786171499;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vQN+Rc8ZpgObLyYJrV52E4d++M/9CtJzl6cQs//2CI=;
        b=eBrOcsAwp7G++gUrs7+ZVRWFGjiKE352j+pSae8llcQKb00uxQkxX6UTQlK3WR7mAb
         mpL4HgYq345EXLAq/dVHZOBQl7GjPNRiGbFKASXBhM0iyMUcKGX51qWQRD8SCoP100HR
         GFFbbkELQNpS/hpr6HcYdeIOodu4UKJNMudzs+gL2oO0syNRGj1iOMjboaxkTubEvpst
         jIm3igP+1AvuN3yi2GSyn6NDBy0AUyPSTC4H06PUsltstin7Ll2iOt2pJMmwJB9lNO95
         SobWG/1QGIAhsahZz3YcsLHto11xLZDpt4FjOOvPYvr9H9HRI86Xgb6rO1cfNR2xwCwQ
         Rm9A==
X-Gm-Message-State: AOJu0YxVJRCEErb8fR7cIjUlj3jXHJFmPVUg3GHbpexDg7m5BlUdeD1f
	gK/foU+45v7hwgPORu2vJ5tWiRIvobBjanGG8962zyieWg0PAjA6aD0LJjzinIcEWWa5XYgS7c7
	nsIn3BLBG3xWF/kjmSUCz06DNVLGf+b4oZr5/saVnaa4tybzQKn2S7vKFwyBJ9/515Q==
X-Gm-Gg: AR+sD11leS0qUpE2kb/nGE22fJU5dxrrGWD8Z825Pirg22sqw7JbWu94xBDEF6ELQhO
	CGGj9dB04tVAu/2rvPInYV8MkK/YHKWiZKUA3hl22wQ9MWOXYo/fIQDC4apPgv9iTwpMC9KT6P/
	DYoTxMRplGeewwEuI7xNmYYb06RngAHcLNpODRlGhcU6vuBSyoarKHpebVCxAdndTbZUZiEc3Fx
	FFMOUCTwwAYDjf0avpgU55crriScq4s7Seu/mRolRGnTjUwOAwUt/K6yRNxSbzFHJxFpvdfoHn2
	tU1UQ1ZgoR3Cu1CFdXqZb8+wTkW7UF8HqD27o0BLjzZbYNSAUGjc9jCTjyhh+8I3bw6z7jwlasU
	3fup5F2eIX1FmLZBsD2BrVMevuKzWcXw=
X-Received: by 2002:a05:6a20:93a0:b0:3c3:bbe6:95b1 with SMTP id adf61e73a8af0-3c92a5d6d57mr2458545637.24.1785566699276;
        Fri, 31 Jul 2026 23:44:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:93a0:b0:3c3:bbe6:95b1 with SMTP id adf61e73a8af0-3c92a5d6d57mr2458516637.24.1785566698844;
        Fri, 31 Jul 2026 23:44:58 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm16863759eec.13.2026.07.31.23.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:44:57 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v9 0/3] media: qcom: iris: add multi slice support
Date: Sat, 01 Aug 2026 12:14:47 +0530
Message-Id: <20260801-iris_multi_slice-v9-0-bddf1449c280@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+VbWoC/53SXWvCMBQG4L8ivV4k3x8yxv7HEEnSkxlorSa1T
 MT/vlQZK9gy2E3gXOTJecl7rTKkCLnarK5VgiHm2B3KYF5Wld/bwyegWJe5ophKrIhEMcW8a89
 NH3e5iR6QkFxRrawRklXl2jFBiF938mNb5pC6FvX7BPYX4lQ/QwNBBBnqGVWSGHDhvct5fTrbx
 ndtuy7HyMcDSnBsLqjvfvea5TTCCBzRwciAodaz3D7mvkuXe/6Bjjv/RFUzJC2kEQI7EsAx457
 JMfHAJg4lMw4rjq29JFZqBQoWHD512IzDi8NFwJYFUMEvOWLq8BlHjE5wwrCaGsf5giP/cuSYy
 5iaSOwdp3bBUVNHzDiqOI4zKTw3DIelXHrq/K8C29ujsglO51L+/tHbqoWc7b38m9Xr4wH2+Eh
 kk8BNjwZT7FoRqzTFmHj8ZL8V/PYNUW+zvmEDAAA=
X-Change-ID: 20260716-iris_multi_slice-5647287a9563
In-Reply-To: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
References: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785566693; l=7724;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=bu8Z4vw7yCArmYfRZxkMAPJT/o9xfi+bqiymwdKIC34=;
 b=bz1o3rHUbNYIhEjplrPgs38BpDLB4Zwi6FxszQpIfPRQ3uZ5ZyVNGlAXR5HJUBPwcQUt1wnoV
 xU+I6VQRwGNC6KLSA3LnoLBTrXM5FocGMhzTJDy+UiUnA3vUr3GnC2I
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfXyf2EOZektuqL
 qUUoarIwZwyygh6ntrFN079TFamic/tgCpwvwVSY9vPmXsBdOOlDKCxWTljvnB0Cmd4AMZBxjIm
 sMqQP6DIP1ppWlX5ATg5P6Ohh1yoBVY=
X-Proofpoint-GUID: DlHe_1VUxOnPO4lnCtYJz_iBhRoIkN89
X-Proofpoint-ORIG-GUID: DlHe_1VUxOnPO4lnCtYJz_iBhRoIkN89
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfXzzdLbPSqJwhF
 rDPgeCKWhzba+IC0PtzhH8tkR6cWoebmCTKVJc935kW1lBO15znNERyQ14xRO40JXQg2TI2S1DG
 1l4o/GramqF3CrY2MzP5ozGqBdLqbqrhpaK40kM3/PdZ6m9/tHimuzR8XLeK7cCpIPuXFVh0h3p
 XzaIR+cFgjhTZcnxPEq40PpMVCWpmIuFaVjfCRzW2Od/eduUByX201SE4623xV7fXMMbBArSZR5
 8daVUIbBy9dgOqaTmdnf7VxGGItSsm+1w0A/K/0A+8fMAd8jEzpFFFu0zwoh/eHtCI4P+xc7PZe
 tJ27WmK+29RK2E5EwdQU1tnOsH0d+syWfuiHvZe0sdOsaNaY576AAUtLjn//QPmEXIqkyCoyQKs
 aApj/pd10C+UzuUCFMKbLhycE+nFbfr/jims+E/iRJviNfTNq+9Ea8SU8b4DxvdV1UT1h4jaoFT
 GVbmo7Ui+XwCrOnrHkA==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6d95ec cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T8lcpxUem0FCnaQ_rB4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010045

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
targets (qcm2290, sc7280, qcs8300, sm8550 and other SM8550-derived targets).
Support for HFI Gen1 targets will be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
! filesink location=/opt/test_enc.h264

Depends-on: message-id: 20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com

Changes in v9:
- Rebased on top of AR50_LT enablement series v9
  (https://lore.kernel.org/all/20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com/)
- Link to v8: https://lore.kernel.org/r/20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com

Changes in v8:
- Rebased on top of AR50_LT enablement series
  (https://lore.kernel.org/all/20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com/)
- Extend multi-slice support to VPU2 (sc7280) and AR50LT (qcm2290)
  platforms, in addition to the existing VPU3x platforms.
- Rename the shared slice_caps instance from slice_caps_vpu3x to
  iris_vpu2_vpu3x_slice_caps to reflect that it is now shared across
  VPU2 and VPU3x platforms, and wire it into sc7280_data.
- Add a new iris_ar50lt_slice_caps instance for the AR50LT platform,
  and wire it into qcm2290_data.
- Link to v7: https://lore.kernel.org/r/20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com

Changes in v7:
- Moved slice_caps_vpu3x from a static const in iris_platform_vpu3x.c
  to a real definition in iris_hfi_gen2.c, extern-declared in
  iris_platform_common.h (same pattern as iris_hfi_gen2_data), so it
  no longer has to sit between #include lines to satisfy ordering.
- Link to v6: https://lore.kernel.org/r/20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com

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
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 86 ++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 18 +++++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  5 ++
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 +
 8 files changed, 205 insertions(+)
---
base-commit: a4e49d59acd3ebbe00d252a5ca14c5c4c981bd60
change-id: 20260716-iris_multi_slice-5647287a9563
prerequisite-message-id: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
prerequisite-patch-id: 564b79f382140b898543358f7f4fa87dd138d509
prerequisite-patch-id: 8dbbaedb2f9b45ab480ca7971172e2db2b51b323
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
prerequisite-patch-id: 6198a3555246c62bc989161894bdd7d799e6885b
prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
prerequisite-patch-id: 6f98157cee1161d27a8bcf1b9003f57ef7730921
prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
prerequisite-patch-id: 200af0b22740dcc006b6de6d4e0744da5e6a745a
prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

