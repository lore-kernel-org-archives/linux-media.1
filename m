Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10353B2FF8
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271175; cv=none; b=BH0MLgAQ/gBIGeeXqNPsnqHu+8nKkogpsuo16Uw68r3f9iK3yZ2O9l7We6ja3ylXKISl2FjW8DWUIbdwveo2mw+ilxvOaPIEwSCNLuTnnhZQMG2MyMAQKopiyiaydOP1rr3VTwSnqMg4wcLnwXmfDNriUskiDpI0LnrEbiKNNFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271175; c=relaxed/simple;
	bh=Q+TOHXsToQub8NlMkN8CaDGAJy3c2iReLuURCfB6wQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WBw2IVrSU++uCfPR6wXlSraEQi0TlC3VHiOwttKCGRI3JE0eBOs7Q553hbXKWh57T4cTjeQyUzeNfFPPIUHy3lknnEVDSypBxLgypAGFhyRfotZnRNB4cQG2j/JznJrDsgbnDiuGSdMi2UxcgLIpwGfo9aHVI2vpAbIytNMg/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daDyvAr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=holM1kLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daDyvAr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="holM1kLY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ckRE1093257
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fQFQIdc1G6cXPZtnLJil3C
	nJ/uYl/+ZjtDzxtSC+s6I=; b=daDyvAr/p404kuXz33LkvNaft8zDSUvetCdO6h
	+0I/LZynSZsvKsc4jwHShcRTeBucOcgahVGgzLUNDShQ6RukLQ6WvxcLyLoLg3fH
	Z11WaniokJ8EMr7P/wk65y7CzfWsxz8fcQJ4SeBP9LKOZj9xVwVlVRvzqKw6/1jP
	4I8K6GrztsaMj4JbppAMd3qJ/O2C+L3h7v2KiNZmFctasXmYX+UK7fjAlZ/s3vUw
	fvbZiTr++N4Zo0leDcyyvekBUUCE/JlUF6h2CzcrToS+6Ti06DBwdDFANJ2IzNWF
	6kM/24xoc99tz18rJGaOF5b/kE+I5xidM5ckl8iIYBQQ7hAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urbu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:52:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84877b362f6so2626810b3a.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 23:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784271171; x=1784875971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fQFQIdc1G6cXPZtnLJil3CnJ/uYl/+ZjtDzxtSC+s6I=;
        b=holM1kLYg9HQAYPSlSsDEPz6+GUhSWGmAjno0N6F+wFX6mejwre3K87H+xIila/FjT
         AEHdSKjVF7M0SU0GhHMGVhN5UJ96CUyWrbH+bsuOarUX0CVjLsSCcoOOEf6nhjToiEg4
         ylfi8z11VvBSzs6Vh0SQVM4qyJEYXt0yPIh4+xRdXKdwvkAXcgRDx8smOn4GKojlRGi3
         a5fLWVfJLYRkep2uyUoMkdebu1gIJQ/uaJMGci4+sGVQJt705zPcN5VOZ6NlQcRhouw0
         xBKZNvxJnDQBcRIUXSTPSEOROHogpFMoTLlpUyidI2UaeOhDuojJ42dtRGIhrjHTh1lw
         KjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271171; x=1784875971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fQFQIdc1G6cXPZtnLJil3CnJ/uYl/+ZjtDzxtSC+s6I=;
        b=LehQa5kF00k6SyQS+KtJA8b+x85JxhinTht08TqC4yNz+A8XrVs8ZpGTB9NkaCM6pq
         3ml2JWTPjHUbPxv+y/DCtAO3aqcsdkL6CnFFqRmtg5NpMU9IukEpYK+IEZhK5/CY4p/F
         O/BApZPwPjZchQICHhKhyanmLop9ORnedi9/LOuBFCjNasKt/9QLSNonlWRFwakHZTi6
         D8dkidWuDPralUqGy1nXNS2yNpdCmA3NtQTEQK3BYHgUDzgUo88OwL7otvsIIbSUrXBC
         WV5v8RJp44LYyIbwT3VsUfLMx+u/XQJRe5VfzATYPw3oAwcGuSOm5o3IdCoa67n53Iwc
         DQyw==
X-Gm-Message-State: AOJu0YyN9RQp+iGKzU7yc9tIEj9WtxOhQOio9dfp237wAruV0MDCQZUF
	AxQw192W1xuNVQmIoCJvvCaEDkQ7Y5nWk7asODP478D8nAhFI++vtLGEaU04Miu3+ySTICkgO2d
	J2SdmMPqV7LXgfozvDh5SAhDfNshYi89bWKsk4+PAPU5spPibSnDTWMHKE3HKAsbtqrB9FQoD/Q
	==
X-Gm-Gg: AfdE7ck8UGBcxgdXAIBIgoxaIXlB09PH6bHKM+8jlh4rQBwsf6vMZuHT4QIoL4Lgwmn
	A9v3L5CPB+4Y9DP4B77CwzNkhRLjgJx1FZQTbUINf1dfCzriElCHazGRe6qUcJ/ixjyoxy/Es59
	nuRcUPK0tj2amgfgy/MH2X/U7hnlsbfOxwHTMmdgwnyAynV7gORJ7QKg0iiBJJGNXPmu1OTGNmj
	MhA+Soyg39+b1tx33KhF4mn3qaOaF2aVRu8Ai5UO01ga/vl4HiF0oQVRpJw9c+xeapM3i40q5HC
	JaVKPpw607LzllWFK3sNpbdDYd7VHFhGzRMZNaw7/tmuhv0h/g6HJxK9D1kYIBLZOODNuICv/8w
	/qv6gY1xumPb/27HBRlFr75mlyjAD+RQ=
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr1324432b3a.36.1784271171079;
        Thu, 16 Jul 2026 23:52:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:400f:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84c29487c9amr1324405b3a.36.1784271170622;
        Thu, 16 Jul 2026 23:52:50 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm437651b3a.15.2026.07.16.23.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:52:50 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: iris: add multi slice support
Date: Fri, 17 Jul 2026 12:21:43 +0530
Message-Id: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/QWWoC/2XMQQ6CMBCF4auQri2hA7TAynsYQ2odZBJKtQPEh
 HB3Gzcu3LzkW7x/F4yRkEWX7SLiRkxhToBTJtxo5wdKuicLKEAXRmlJkbj367RQzxM5lLWuDDT
 GtrUuRbo9Iw70/iYv1+QhBi+XMaL9hSpo/kObkkq24EowWrV4G86BOX+tdnLB+zyNOI4PGNJIj
 rEAAAA=
X-Change-ID: 20260716-iris_multi_slice-5647287a9563
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784271167; l=2636;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Q+TOHXsToQub8NlMkN8CaDGAJy3c2iReLuURCfB6wQs=;
 b=/UYV4CdNnR1nFuMe4wNTvxgZDoV+O4ZjaMMCJwbHbgQc68cSQT3WerSxKRezUM2ms8ppdQlJt
 qf7k+HghVAtD1uWG3zbdd/Wfr9+hLbtvbuZzwbc5fu4MlEeb5gt1U9j
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59d144 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=b6dZZY6aNiEbEsjWt0cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA2NyBTYWx0ZWRfX4jWx1y1oTfJI
 lGdlvsZVX885Gt6HDhRXAl7mmZScCP7Jc0sM5miArjw+/0pz7SbEKw0OxlgxuSiRVfTNv8Z/cXE
 YCZiKnt3IAIJRPZ9MS1lVqp3P2XLUAH8YInMJ2Z1fWY9eDZi8W1X3OvTz9tgcWqw/X18Il1yZRC
 gYZTlgedwqSbZR9ARbKqsooPDncczFugPCaxJfhCpaP2XQLpl3YmPIMX4FzWX9IWBe5X4lyQjoq
 FhSYFdsSzWAIaCH2QVeULEE7m4if+Q99w2KUaBQl+Ktlk7o8UKfqh4QN//THMYBREG8sYRMRStT
 hidahXNL9GnSykFO6iAc9Nfzxtv79FRVetlOuwAinzbZSNmDkdSyfNtytwo4v2H4ogYEZKxuW0V
 sl9Semt03kMxdXGiYncILGjfFMrr7BDB4xdFEyhpH/13WEphW8lDBaIk4s3VMILzvAVBDiFPyB1
 wLhvgq67UHRPk/KMLOg==
X-Proofpoint-ORIG-GUID: DHUwXdJn03XuNmhPkhakZw9iMvbelfny
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA2NyBTYWx0ZWRfX55CclzM+uIVP
 kw6ooDa6z3yymPC4MmkFvr5+97sfbjL1iWJqQpALSLuqsQ5VhLAQnZF13nDHEDsqP1vzVX20sAH
 VdKhvqgIIMc2X8Rryi4zczvumUptmCY=
X-Proofpoint-GUID: DHUwXdJn03XuNmhPkhakZw9iMvbelfny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170067

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

Patch 1 is a prerequisite fix: iris_set_stage() currently always selects
STAGE_2 work mode for encoder sessions, but CBR rate control requires
STAGE_1. This is fixed by forcing STAGE_1 when BITRATE_MODE is set to
CBR.

Patch 2 adds the multi-slice support itself for Iris HFI Gen2 based
targets (qcs8300, sm8550 and other SM8550-derived targets).
Support for HFI Gen1 targets will be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
! filesink location=/opt/test_enc.h264

Changes in v2:
- Added a prerequisite patch to force STAGE_1 work mode for CBR rate
  control on the encoder, required for multi-slice encoding to work
  correctly.
- Addressed review comments on the multi-slice patch (updated commit
  subject and description).

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (2):
      media: iris: force stage 1 work mode for CBR RC on encoder
      media: iris: add support for multi_slice in iris encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 84 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 12 ++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
 8 files changed, 158 insertions(+), 1 deletion(-)
---
base-commit: 42f83a32259a82c4481d3cccf560c3bfeb32c892
change-id: 20260716-iris_multi_slice-5647287a9563

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

