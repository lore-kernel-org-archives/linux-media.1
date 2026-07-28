Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E007372661
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218581; cv=none; b=J32zi58d1UqIULorYZH6oO1nGNMPWh/sHRIc+7o7YnL0vlDkswAst6uFBQouh0UnmMaBPnOY5ntIteqN5xrklljTnmCSvCuNuuk+5/5PPzBimDNZnHAxtMakoPs33Pjo57n/cB4PQUDsZBNeuioeXwfteiygn5s1UPWPw2duArw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218581; c=relaxed/simple;
	bh=uQ9yMGhz9mkg9ECVwNuYdfL9E+Zt5HjwkMYUwJ1/bM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=c4ws/ZcOiFPXhurSLIDoCIk1e1giWH3mcc8T5WgtNxazq/oBCuYCv7M2r0VvVU3j81ZPCTvljmh6UNHSpWovANT9wAR+t8qP+VtIGW5qMQtLyYdw4W9vydM67tVurmZvLML4RD9j9nEpcqdrvTNl+0vT+7lmFpZytlzbT2vRxKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PI4v+d7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLAhNZKO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PI4v+d7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLAhNZKO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3avVu1673595
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wg2gIsUHehB5P5TyyUD9VXFz2LO/l2lMUhozcTFpWk=; b=PI4v+d7WspcIF+oX
	Bj9OEsRmVdLh7f7k5HB4Z1QuyhIj7VUVZSpt7rftMTZSuYL+RXXPRZ49/Wq2bGbj
	uohxVYJd36ESTx8o+xisMIj597esfhPz0r2X0mupLxUP86YTKavuYdqoy98yawmv
	YEem+K/Ps9FXshHDM9zHv+NoeuOAmEJKgZSMO6srOYKZguUU6BSiJJ7nfV8pL07f
	PF4kFKUqetpxPZOjAnltX1YOZWiRyD2IbbolO8fclFOhMT7jBhXlBTlkRjEpoAsH
	cl0DChmlFrAnfatNNzpUPz15hFS+B0hlH/78iIKI62drxw93O/S3wyMoEnmeEBtz
	SBZm9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrstmgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:02:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so1242085b3a.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 23:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785218578; x=1785823378; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wg2gIsUHehB5P5TyyUD9VXFz2LO/l2lMUhozcTFpWk=;
        b=QLAhNZKOYEs3WwlfqnnBHRLkL2UHjfvq7VSKMM/WJLhgE2OuosAnCn95ch8uP+ydne
         iFV5cZB+YHghuAz9bbqmLEGFwPTcrEaO+FwXpCfPpXqieNuKzOqrJKebxlOn2YaAXWTK
         Jbs35aQHYkQzMcMR7YtFXd2qIFzU+QaAUwzb0c0jQZ3z6bSennIdyF5sNYCI1vTcohAV
         hOGCH0gVdDiJB9aYV0ATxgxZOgH6TeMp5R2FbFJwRp+TYNJ77sB2CZsM0sZ/TvjPuIt1
         FtBtbxdxvGLD+k/kv2bkqqDmU9OAgJ6pHfyhkPevFm3nOrEFTrmIEWtqagKiRpdOLUdI
         S0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218578; x=1785823378;
        h=cc:to:references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wg2gIsUHehB5P5TyyUD9VXFz2LO/l2lMUhozcTFpWk=;
        b=aSXZWx+BJ0cePcAhlTBSZ5BKejdynTEaas35X1PGIzQRTtSsb+M9YpFwTRZbDYJZ/G
         0vi2xmGyrsA1gKENTD6e47OOtLJ/NVNzz9OnQW9SMYjoeE+xYAUIld3KHgiNC9feSnho
         b+u/MlyFlVZ6UwIh3Cshs3AK4Lljku9pHs/lrm+BoXY3dzM+3f75ypOZqRRqbUo24N3B
         /gbKWMko+ia92ZJkdV2eK964Orrk9aO532emBu/6h/Gh3kdWY7CrCXqGR2oNUoRdkUSe
         H9kjXBgAYv8p5A0JGD+0iJr+pnWylO2kNuCSjXZWJMeYZO07g8sq4UHkVmUEGpVmTw2b
         9jtg==
X-Gm-Message-State: AOJu0YxbscKbAEXG95opsb3o3WyqFt1/V7HlIUAUSiFhSkUz29ad8m70
	l5WTUZ/ofZf1KPOYtuUPzm5oFI5XQmCoNyuiC10SOryz1pT1mGDJyTboRH0UJataXjL+lJ7FwKy
	5oNCxQxPpb1WGswvG5urPrIyM+HPakp7/gvFeLB/ZFjGqTGFE4VVFIn4j2XUYoidh3Q==
X-Gm-Gg: AR+sD11N/eAA5HpeeafAC6qy8DskLh1KCeTAP4Jr3ucs3XqLFdcWkuo56Ew0SXFtMkO
	TlOm9TN4CBBfpyMviRP8KuqpyPOBaVDWLhIvlonZCq6fflP0p02eNpoKPTYoGHsNX8l4PGanL1h
	BRNgBI4GgTFzgQSAnZdVOhzFCkXuuxhaNXir/V2+2BD0NYsYGkHqUlgjrIOxAchNpzk6gMUYfbI
	TGDgGoDPy/z99jBzzlhfHGANYEk+Q9VaNp7TYmRYtlP8wG4PvUugv2JmXRWU9wtwQypgN11fpWl
	3oUip5XQNJDKypEYl2DhHE5LNyXRefGCvtSNwEL+RiNmPf7WIUbiuTx6lFlGqI03NxPhlIhBhE7
	diEvr9X+dkBCeYFg8LgAieMTWrdUUl90=
X-Received: by 2002:a05:6a00:27a5:b0:846:169c:d81e with SMTP id d2e1a72fcca58-84e93320858mr933004b3a.56.1785218577649;
        Mon, 27 Jul 2026 23:02:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a5:b0:846:169c:d81e with SMTP id d2e1a72fcca58-84e93320858mr932962b3a.56.1785218577131;
        Mon, 27 Jul 2026 23:02:57 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm3980421b3a.28.2026.07.27.23.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 23:02:56 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v8 0/3] media: qcom: iris: add multi slice support
Date: Tue, 28 Jul 2026 11:32:43 +0530
Message-Id: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARGaGoC/53S32rDIBQG8FcpuZ7F/8Yyxt5jlKLmuApJ02oaV
 krffSZhLNCEwW6Ec+Hv+OF3LxLEAKnYbe5FhD6k0J7yUL5sCnc0p09AocpzQTGVWBGJQgzp0Fz
 rLhxSHRwgIbmipTJaSFbka+cIPnyN5Mc+zz62DeqOEcwvxGn5DPUEEaSpY1RJosH69zal7eVqa
 tc2zTYfAx9OKMK5vqGu/X0XFQucQhhZzqRwXDPsYZE7htS18Tbm7+nw5p+oaoGkmdRCYEs8WKb
 tMzkk7tnMoWTBYdkxlZPEyFKBghWHzx224PDscOGxYR6Ud2uOmDt8wRGD463QrKLacr7iyL8cO
 eTSuiISO8upWXHU3Pnf1+0fU9UiXK65tN3Ut6KBlMxY2t3mdVqA9bgAmShw3U22ksbrquIV8fL
 Jfsv44xvINdsSGQMAAA==
X-Change-ID: 20260716-iris_multi_slice-5647287a9563
In-Reply-To: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
References: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
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
        20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785218571; l=7398;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=uQ9yMGhz9mkg9ECVwNuYdfL9E+Zt5HjwkMYUwJ1/bM8=;
 b=y638GQ99ILsN+9iGyfJptjFW0KU57wr80c3Ggi4aLnU4IHD83Ot14QR3q15yF9UpFK5Bror47
 Cgs1ZIx3GD2ChYICbvHaZ4veA5cPNIg/g8sDH+JKCvv4zhtXz6BD9is
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfX8w96COiuNzj8
 VMiETYaioMhX4vHAE7h++w322103qqovOcbKlealSRqEka8rHp0xEPGCoAXVv5LENdaAkc/eWvP
 +aFSyLVbH87fSCN1ggxeKHeH2jxHMPuL/EWdFsk29434W138TmB7Asi+tLsClt9pkiIU+Gw9BKB
 SI0j/nWyX6NHQCLSscCYksxwODxvhhlsOxPn6Z+Y0Fv3mbsBZNDw4V55D/ZRCFws4JbMqFLNFy0
 yI5co/bRrYBCluZ40uGcB7cFj4ZqrSD2EKESb4AUDgvuwZkYXZV6L6Mnt3MwWAOQC1p70V/x8ZX
 1JR1qdNQVnmG6o7v70iSxuptMXZi/JyKF6Yzx5H5sil3sMuU3ZYwGHSJEZVXEzPQ7M75tdqQVcu
 ynP4GL5enFT38n0V8ZlixYTxsdCFIna+yeUzQaU7uDiYNUMnAWGcYJV5R+eiICam+j8XGBHOKct
 RiFmWFLsJ7nKKYjBRLA==
X-Proofpoint-ORIG-GUID: RmNmsuRsucF05qQt8bhbGwFzjNNRKa1R
X-Proofpoint-GUID: RmNmsuRsucF05qQt8bhbGwFzjNNRKa1R
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a684612 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T8lcpxUem0FCnaQ_rB4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfX1Jk5HLW7MW1h
 9UtzklMd4ZdEb/w/AesVFQyj7W6/9fZ3ML5Pr2khJPN3cjkwFbro0EXZNowDgtpHraxo7FO+fJr
 OvbcZFcjry6l/FpuRoMaUZ/F4uv1hnQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280053

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

Depends-on: message-id: 20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com

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

hanges in v3:
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
base-commit: 2ba8bf550753c4ca46c708a5038a6e1690762d0f
change-id: 20260716-iris_multi_slice-5647287a9563
prerequisite-message-id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

