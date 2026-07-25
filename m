Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5442F5487
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002948; cv=none; b=Pkp4Z3tOzQSUwJdc53X5Zon70sm9DSFdjysag4cCVu7Vj8FN4UmUhDFJb+Tt+0FBW8q55n3RbCs8i/u+cVceYL7hy17mFg6/Wy3+dZ9mcMBe6qKXam0GN/GXa0zXBklhgis/EvRynufA3LH8oGXzuOHM1gS2KeJ6xPvk4tyRlJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002948; c=relaxed/simple;
	bh=lQNATwS4TK1zOQbat8v7UK4XuVBEGZ0E4OFwKRK2ThQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IBMM4jZhbRA+AtafztCoXHJXwBMTMban6vGlQQURYdvqQrBAO0jrpZ3p9JWCV0FcThrAEjIJnFIcVHDkNt/8Gxdbx73S9++BDLgUEBPTARqN2Cfgl0SQ3Mp7IPFcm+d7OQOVRmr52h/IYt3QmQCM7JQsc60fLiGpGA/2oD5Chyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwL2SJei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+2lHDGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwL2SJei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+2lHDGw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGvofV2613567
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 18:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bd4MKWdA520cLTve6BzqBN
	y+urwr/OgndOBQYTaqiPM=; b=MwL2SJeiWy7wxuoZZmibXiLKXc4UAAkoggjl1x
	nqHBSvnUqLmNJso5A7SnbzfUf8JfhNBU7IXuXnqZDTYZ8SYMqNLbMcdhm0usP+fC
	g9LFrrh1D3Ov9+w8kqWEe9Xu87i0xRA4KAGrFBJbZtw9A7rLBbW78oFU/DvTiYuA
	o0R82KpwwimdAN2Jnoa/jAhGutOzeUWyB7sTL4K4XbsjTgpat8nuuu7q4w4FVZ4T
	oGn6HpjUIFlM3Nu8zGNAua1/rs1wshnjX6dRYzj8ZLPqq2MmfisFNSHV5JcerpCg
	Ebf27AXL+y6g553M2K1fre8eLcgZbV8HxdzY9mze4CnRVKhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqy9g1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 18:09:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so21509285ad.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785002943; x=1785607743; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bd4MKWdA520cLTve6BzqBNy+urwr/OgndOBQYTaqiPM=;
        b=a+2lHDGwFs/1XMqW/mDmL/nbrJaWFZ81PzQDE72T6KdkBHxV3Toj3tMA/uLAz6DVxD
         OUUP04NrcTTIkf/5sLLwHo5q/9dRUdMWe4cDe0FlP/3lVP7ShxZSfmzYxHcgCH6oNd4r
         l6VSb1/8LkKqJ8cpIzwIiyCTz03ObtyTxSnMlbv++d0mEWoapLWz9wq/NiKuWrkBl7W8
         zD3lXqd+6s+K4G5/mNH5Vvm9TjHooymx9B3m/5TO5H1Drmi3asziDh9nA0BgKQ4CVKbb
         9rDpuQFXmX/bv6Pri0VYOIY+hRZxZfEOQp480EgfsOK4LIPQmkaEWaqShwo9+qudQcfk
         cvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002943; x=1785607743;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bd4MKWdA520cLTve6BzqBNy+urwr/OgndOBQYTaqiPM=;
        b=RtSiYUTfdlOwFJivjXI9Km3LhPB9VZL4AgYvQqxH27enBjncbCFyUvcp98mvK87ZUm
         c8RpIKZQMc4XZVUcSl/0LqPb2W/EyA/1Dwf69lRvNueN6Swto3WyrhU+QcEjsdEVDIv+
         lAJrichBTr3sFqQBP87FyCuaJQt895owPNUExlmsxkrcv1lpEtA5bWG+PUrZiVA5Roql
         q1LL37D2OLFOK2VdWvSkPr49WLUKQHwScZg9jGQJHvVf05DJtkQ9MczATJLzWt4PysNo
         9abWlyPhLuISTA3Bcq0M8SltOklAf1gS2P6g9ZOGjZsZexxa+gGUWBBCQUEXjDP4ov3t
         Yt8g==
X-Gm-Message-State: AOJu0YypNc9UretT8ul+c4XAwhcWc8h96ObTmFrnLDFfc00hSYaGNqN+
	74+Eeqhndkk5gKzudcCHNzk6+uXJGNBte1kWvoJw7r8T7RzyD9U/d7NYwMArwL5y8cQ55lula25
	gftIekPIJTc94TCwtdr2/7h8jxfTCNmCLk2fGZ6CDAeCCuLRj5GCAXhKnvmekWdeHkw==
X-Gm-Gg: AR+sD107MMoW64glW0dL2XagJwpTB6YhE3hR1eC/Zvq3Oi8Mu7uSiuIG3hjydDfxQ65
	8vHTjHUnJ2ISgjhd1l0oP9sXbN++YzlCjE0WVOhlF6Dij4A46ybeoPgCR5JLL6mlVXckBA/0l9p
	/E2EcICNLX5UpMwcaqfZIIq0sFkOOD2IEKL7P/ryExCSZgvWoEaYGw2Tsj/hBwABVaCGg+HZwqj
	OxkvufvIKsbkUCugSgKgy6U6SfyMOrGefdLV2T4akDc1dKkF+Ri89TWWtAM3e4q2CM7jtqyLo3o
	+RbVnzflR/bzsMpRezEluNtH68zBd+QxK1CzWouGr1qN0D/ajrtPK5E3fN6KX7rJY8z8BIMN/fV
	TTTj9JaoacutmE+i6XAuyoPlrrklJYLQ=
X-Received: by 2002:a17:902:eccd:b0:2cb:402:70cc with SMTP id d9443c01a7336-2cfd72a75d3mr48663065ad.28.1785002943002;
        Sat, 25 Jul 2026 11:09:03 -0700 (PDT)
X-Received: by 2002:a17:902:eccd:b0:2cb:402:70cc with SMTP id d9443c01a7336-2cfd72a75d3mr48662825ad.28.1785002942536;
        Sat, 25 Jul 2026 11:09:02 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm12592642eec.10.2026.07.25.11.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:09:01 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v7 0/3] media: qcom: iris: add multi slice support
Date: Sat, 25 Jul 2026 23:38:50 +0530
Message-Id: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALL7ZGoC/4XPTWrDMBAF4KsErasgjf6srnqPUoIkj2pBHLeSY
 1qC7145UGqITTcDbzHfvLmRgjlhIc+HG8k4pZKGSw3m6UBC5y7vSFNbMwEGmhmuacqpnPrreUy
 nck4BqdLSQGOcVVqQuvaRMaavO/n6VnPMQ0/HLqP7gyQ0j9DEKacWggCjuUUfX4ZSjp9Xdw5D3
 x/rWPgulXHI3/fCEyxHfruZDRIoo1Yp5nlEL6x/JJeKk1g5wDccUR3XBs2dbgwa3HHk2hEbjqy
 OVJE5EdHEsOeotSM3HLU40SsrWrBeyh1H/+fo5S9rW65Z8BLchjPP8w/eRrfnJgIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785002937; l=5247;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=lQNATwS4TK1zOQbat8v7UK4XuVBEGZ0E4OFwKRK2ThQ=;
 b=KQR2Fud9MIFDxI8UmD7K8SBwMeMEFkM0mJf+j9diW9cCE8Zs0XKSjuCGshuLdnmO8/Nnf7Wc5
 imKirrFrdklAWSVz+Vj+c/5rWwLIaw5wYaS+QwW8BP3tnikl2pmw708
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: us8N39OhgbyMooDGKIFx38S2R77CGx1S
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a64fbc0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h8JakwFr5Z21F7KgfLIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: us8N39OhgbyMooDGKIFx38S2R77CGx1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX+APRmpvibVH+
 d7c+B7OiEutWVETFdrjU1+git0p7bOw2+djgpUgGXNUI5ZabNdNt7fCWEM9Ftcu6xoUxIxw8P0f
 RLtVmFIQFgW/VgnFk6ubYiSiXPhaa9VguJQ4hUvyRMN1ovyM5klxd6dmAG8y3TVL2q8nCteZoxV
 dd8Wk8kjwpmaoyAzhDS3YFdX2ZcYpa8OrF7M2Si6qmkR/fWhELSTASDl/xP2vYHntiLYys9ExfL
 ZgZfQ7aI/5qilRJMESfCjZ3DEx0IDcche8RyLKAfEufNaXjYYL8T5TnS2qKWUmMxozB4bbkB89N
 GaOV9zPnV5OqODWyMj8ow4R6X64w+J/9iKjgWmgcYN18r8oJwpCrEf13nzKpLIcO170rkIZVsvC
 Zz5hBpUHEGvc5qOVd5z+5WyHDkEg4jvWC3tu2Qs+k/+mdsXUSZwY1HjfbDTeWqE6HsqDRwVwmWw
 p+56ZI4JVpGhFgxeCHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX2mfSehWqyzv9
 Gnb5mSgYBa+6C5Vy6O2QoWB2NUloCKGoBCWvOHGcA280H2vZFM/aaqfuI+wPayrKWjjO3AvD4lz
 U5kFa+BoFa6oLwEEU4bDdWt9hYYIIH4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607250172

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
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 45 ++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 17 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  5 ++
 6 files changed, 160 insertions(+), 1 deletion(-)
---
base-commit: 42f83a32259a82c4481d3cccf560c3bfeb32c892
change-id: 20260716-iris_multi_slice-5647287a9563

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

