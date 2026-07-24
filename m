Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF53ED5DA
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884167; cv=none; b=gAunA3Bxu1MJAy7pMy2w+yg04Oyb8h/IXHmQYUZyFU39Yq5uicTSu6gltPHXU3kJ53z15HW6kOaTdb8xXw+vjjqFuUPtbiZoD5rEsJ7nt9AetjiNQvAvIUaWEnN48K8t+D8UF/oCoo3ooM0k+C+vE+BGB8hCpLbHdYa/tbc0qwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884167; c=relaxed/simple;
	bh=zSsQTGU3yBodb3nqyOJi46T+bw48KjoVmqMOtg0C99M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kNefCYlMSZ7md4OdLSrLxwXlwAtG04CRrea8etWWybCV6QfFayob9SqfjJWgmp4WFbl5UQdGaG04wpXaG6O2LO7QwofcuGFCahpeEK27IroF7NSW4DmReJFlmvsD4yR+7QlpEFQ+qWusDPDRr4PidDPIfC0UbLW2hLuTgi8i9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YewQwwuW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwsHIvfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YewQwwuW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwsHIvfj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lHRf1992168
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RFJcZaDEe4JHD73fI4XNB5
	eSQ+x00a0vAOBqLtx2CUA=; b=YewQwwuWzvP7xpEMMOzGyqPWi7BwQ/zRJTDuh9
	WrmBihcWpxaEjMTpJELc1m/7/LIbeT4BI1Rrp+402I5pvfVGBvpqCyZU1YK/bmQw
	OILxk/yOWjZ/76Q8rO2lWuyofxMMzgEP9eVBVOtnwb4qXd+iDZAgVk7L7TX+1ZMh
	Qpa82sQ4IWvKmxBPlaqLgzErzpc5Md84UHHbRFGPN5LMvPmSxPNlmVrvuubiKsmd
	x8oKhxeiFucDfyJDSzn7a00x2ZCoiQPc4cbK7WpKlzwm25pybUH3e9jqiTY80YzI
	2ijetQsjwbcFHYMbdDYMexjDdIvhwBI51RodUbuZPIFWFkvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p511fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so278948a12.2
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884163; x=1785488963; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RFJcZaDEe4JHD73fI4XNB5eSQ+x00a0vAOBqLtx2CUA=;
        b=KwsHIvfjQt1myMaSKun2MdkOWetLBxfJCU/01QrpOUVJI8POPEOqTLmHnZQ38elCOV
         zkMcJl/+pOQoSPIjCkktKXn0AiJMsq+sAvAjUxd6vFwaN7hYX/umqd5XvRqtWICKrwj9
         ttpWutZNQk5OwAdqmZMmCvvEfNP162MaK44PDeHL02oMZrsDsDQuGi+ocxLQoJYPFUYa
         xdthhFIrttU1m4YQvfPBoT5dpHs/HQwITd3dtf2uEP82wSYJin14mBCuf/Rf6/Kyw6v3
         cxcMTGimLopmRmkZVfVMow6jjKTLwKDbZGc/ajBQGSxwqHt/j/spcqsqgAfbZvMDejBH
         +Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884163; x=1785488963;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFJcZaDEe4JHD73fI4XNB5eSQ+x00a0vAOBqLtx2CUA=;
        b=AcNO0DsHgGVDPfZthtJTzHZ4CVtRzu3CVRSJ+PG/yOUPpr/dp6CJOzvVzPdCIGm6ED
         0mrCGeQ/XAFWO/rmmVRYXBnXZ2jNLBk8+HehJvxx728EfWyUkvSEQbpvuEAlswjcj4LR
         vToSOv0UTdEyYoRnnoaJKsCGD6kqPjLatADJTwE0FSQt72y5INtZA0DzS5Vl/zRelykn
         gymB+GbLILIRf8nDjA1hCNkmFeeuYX5sls+JZbYdv+EOPe+ig4D64Y5rqL/+Vr0J9iiH
         Gq6imEklcLPk+H65ibp4yvy4XBMxn3Hs4I42lxnsXHyl+STW7kgDSvK97ig5TffpcV1J
         rtWQ==
X-Gm-Message-State: AOJu0YzcI4abi8WTCltD9JjFdtERKty8E7+zarsAt+xar9VVTtGZvxdN
	MdebOrlhG++QtOlMghi1gI6AN6nBObJn2Rkx+lL19v9VeaujdAEFOdQwoe2iAC7P27U5RaAWVqC
	jWm8U+Vhw/BrJwX/LZzOVszPMuzv2GHYaLmu+zJ3PgvBE0v3XnbUiipHK6MfY5Xv9IA==
X-Gm-Gg: AR+sD121AOOzMF61L06L5FFUk0fj6ON4f4032DfJwzegYmlqjwidoi2hjePJi+pdrAc
	4yPHawy9el/31iRFX6TSDmsVR483dzks1U8CX93c0P7U9wvcL3lv/plyBNiIjD/cmeRBALZtLDy
	JA5/l2sVm2P3WcEfnOuCvGnJQdFxhAU9zpaiGorwohMSkKmymKYEsJJFCnjZsYaEcsXt+AAz5x7
	AooKcqxpn6aIJmxfQ86/uxCylDGFOP11jkk6l/a/vNJ15y/6otwlH2fE3t9reo9PYBxqXeXZYds
	wbQOVmyQNc5FCrtOjHw4Yr1/MWlt293eC55WUIRhjIPG3G+CQXluxJSEpJ0wWdn1lAm4KpXhS2P
	bPY889lxgD9GokEEIkYAlfaH4Axtsl6o=
X-Received: by 2002:a05:6a21:3383:b0:3bf:983d:e9b4 with SMTP id adf61e73a8af0-3c44b05d00dmr8034947637.33.1784884163468;
        Fri, 24 Jul 2026 02:09:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3bf:983d:e9b4 with SMTP id adf61e73a8af0-3c44b05d00dmr8034899637.33.1784884163003;
        Fri, 24 Jul 2026 02:09:23 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm27170719eec.6.2026.07.24.02.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:09:22 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v5 0/3] media: qcom: iris: add multi slice support
Date: Fri, 24 Jul 2026 14:38:56 +0530
Message-Id: <20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgrY2oC/3XO3YrCMBAF4FeRXG8k/2m82vcQkTROtgOtcZNad
 pG+u6kgK9i9GTgX851zIwUyQiG7zY1kmLBgOtegPzYkdP78BRRPNRPBhGGWG4oZy3G49iMeS48
 BqDbKisZ6p40k9e2SIeLPg9wfao45DXTsMvg/SInmHZo45dSJIIU13EEbP1Mp2++r70Mahm09C
 99hGVP+fQyexFLy3GZXSEEZdVqzlkdopWvfyWXiJF8cwVccWR1/CoZ701iw8I+jXh254qjqKB2
 ZlxFsDGvOPM93wUqww5YBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884158; l=4567;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=zSsQTGU3yBodb3nqyOJi46T+bw48KjoVmqMOtg0C99M=;
 b=T5VDqpRsmHoVA4l4hjQTZjJrm9cq922wNPrUryrycDO+B08Wm6ooGCKku3ndNwKF3orkJ2P2k
 qyNOtqrvbOGDrCl2lI0tVfDIDQBaLc4gL9pYHomIM5aOWNuTs+a3Pas
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a632bc4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Z090XU5ozNHmVG9x8gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: EQQ88Jj8V2aelK9-j9ev14W9fN1jY5k_
X-Proofpoint-ORIG-GUID: EQQ88Jj8V2aelK9-j9ev14W9fN1jY5k_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX50ZOc0niKgKU
 NZDI1zRMJRw+sEL5osfBqveqNTzCYzcmuS1luBC16Mo2B/61SHkJ77TLnNJgPsXQ+pnhdM61eHd
 E+aC1ucY/VAXWdVn2BDMhkNQIlRzn0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX8SIW4NhCvbj6
 l9FjiQXJxBInryCpauUbJWlmzUrDvaNiShhOo6K2S7nnl8ba2T4m55AQjsialaMMjg0WqJ4hYup
 f6rQCEy+aEFhQ4MwJEwYkWjRlHGP+3aY1HfJVSCUmhXlU5Qiom5caRGydmIZlYBv8w8r75qg0Xo
 8hl+5mClPRs/1OAwklrirrmq8RdH1ObNYBBlZ/a/0MdzIz5ZKSiy7HKhlmZCIRRFfenJABZF7Lo
 N81L0ydkvh8kCCFOYCSkBVdy3bkRtJgp5e3D2hxkkZvWnd/gNVbKul13OJm6SlK5QEoUyXpy/XE
 oWiNhsvMjEz4QbMWR1GCMbJUhOQDBz31epwsAzZknCJq7G00J2NbCBQAuURIi4iuOu+AikVilGc
 jWEmdgW7uzMkjat+O5hvb5XjD7wVai+/AO4ay8L8hxd+P3avby0NdUDjWd4YmQolF9d/Sw+LN3X
 MZl53q2uq+G+7z9V+vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240083

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

