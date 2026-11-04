Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810190;
	b=DPbW7YDqPOUM8e0adszQ9bIhNjh7bs4LcxO6XESHNrAjowvjqW/bR4SmWTHt5Jz4BfUt
	 15BR/pRJ9nUbVZpENWlK3GYuIX/pd/xE9fcaQQyVPcRIUDL9DYGnpCxygQ3FYtCcSXgdG
	 +daPPZl2X0b7LCwy5x6QW+1wV9LxFBEok86NWV1rXuet5xqCM1WoQl5yBswCu7eCowhQB
	 i2KZhWhu6ZWKlYZgfnVWUZ1g+YqQeC7aK9z06Fe2Sn8IxHFxxn/7DW5CLdw074x8saMh8
	 MjQOhwxif9lr48ZApqL7MsnBsNtVwzEwpuo6nWE0V0KmWOzFLLaYSzvC1l1zDBt/NmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
	b=PEYCr2qrcQaRHeEdvdEqC9g6n9viJIcl953ovOy+zlnoasqqxJf9N3876pZ4IcbS+ubE
	 tzSz7Zjar5KTcTc6cTSvOjX2dSV7x7XhScX0D7Y0eRH90rjr+qQ259ZHlmmmcAjKogngx
	 Jpu7V084hhBobK5jXC3mkOg2fVCPmPycPxezuZJsN8+YCj9pHpPQwySpWH68ww1BGfUd9
	 VQN0ZJNhpHU8dUOL/vbos++Ua8SBWHmS2FP17kaElfIH5Lc9E8DPhwbM2BAF7C0HaDV51
	 zntRwCujfzJFQz2F/B72m6LcjNSUYYH3vOx4t+O0lMzV641/qXfMfyLJpv/hFLctV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShPH+nR+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QS9OoZcb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83619606D80A
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83619606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ShPH+nR+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QS9OoZcb
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FikS43272712
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9Q97qnHrubmaTZHUF0bE0e
	dWN/XleOsKgIjXjH28YHU=; b=ShPH+nR++KomY5SgjajC/D5f0fxgie58a2bOjo
	6pmVBhKn4bC2VH5fuEZEfXJk08YRoO9VjBVceiXeaq97T977R5fBWqw8naocWcoG
	sJdwpdN5yFmHlJgvDnJoP/OyCcQsPyqUp95vkboN7jK7M/8EijXCt8PBSwVjpsZl
	8zbjodETeI2Y9FNHcs22jgvLOhF2+BN4F2gUmimH3yRaNRZmzcbGnIntrTibI/OK
	qr/Ky7dGBjp8RbU8deOUb78Ia5wg6q1L3kZqmCLefhe0J/8Mt7lMsw9qqmriv8so
	AfIX4aV3CVlebJKHjJ5jYzqsuEHg2y3bFfiud5v9oSLrysYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bngjdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:36:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so182891285a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810188; x=1794414988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
        b=QS9OoZcbUKfzoz0KZeSQc9vAALLeSzOSxI9XYULvY+sPjDHJn23/mNqHWEhg+Blv+j
         HCvrAVOzx2OUSBtgL9yjrAV/ZxD0d0+2/L1H7i/XClTLgGK3bh5acGgFNmksv3nx5Z3l
         ArCb4SHUtnzJBLcdrlu0ix2CcQJzV7YevG74y1Ihfu2AbVgpjXo3Q2n/hKZjKc5A8UeV
         ZZaYIprV/P4Jx4Qyx0KaO4IUYUZRG+8WGOuCfNIZz3PRqiEODePq4a+R1CCIfZZlzRcz
         lxGxYQ/OvQoCyiHlrUX+1/KcyYg4oMomdZxFOSdaQTmzepR1xnRpSaOXfKhhMER54WCa
         Hfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810188; x=1794414988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Q97qnHrubmaTZHUF0bE0edWN/XleOsKgIjXjH28YHU=;
        b=kXcoEG9KjsBSztL0f8WrcY1mUmprkfF39gTBRLkf2BVN1oKtfPZr7/vXmAZDc0ukRJ
         ZLZcqO16dvplh9NNzrS8RbDpM+eY0NbRC1UBHKo4RHipk9kgIBpYw+/y2KlDyRtt9MN1
         y65UahEd5o+xvkH/ObPZt0enOWXZSdgaWOp8ztHF1Vo1plVHhj8/57oI5YDjrdJ2A0Ag
         0NHb5qoV9L/tR0e8jy3OyH3gb45MFfJkPdwR0/dXXzWjE4BK2DXVF9ROfKYTVzNqKRvv
         QT6w0cFnLZXZ08jA6/hkf6K+/dmRFZBJYJ9MV8h1vDoNsVaXAP+Pj9xevc2F7vmDsohR
         sjlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPvhNjGqkNCTJ/0QOaSPQmxFR2IhZEEyNcW7pCwBL/C2+PCCoHYu0QbBZGTurkgYD5C/jLPAQ9EZWqaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/i8kW9qqIpMtaAO0wI7LIKokzkCygF6DfRuRJDVbdoSX3924FV
	1Mgu09wNAih6mZZWEm0EAapxrw60C+mw7OIXNy+oNAPwKYKOSs5I7NAG4A2kb3yk4ahN4E7g0Ef
	b0enBPiDr+QRi68hTNApPwniu8qtoCcfHfTS69AMFY/SGG7K7vVg18K784q8pDRVnEA==
X-Gm-Gg: AYBFou3R4LEtPvff5fSpeic+morfeBnPTyNRS3UNPOHiJhPbO1cTxJtGNcmeUdTSolM
	Tr86Eo3yfuLVHILHYpwfN4kORXPd02dfBmy9DsPNMTV/rsNylqq8rj/SYKt1DY1AXK8dOtEHRGw
	en9+bSzmvJ7q6bnRxjN2r4WrehHqnBcfm4B28euUgoBfOFu8RLdrVPjFCBS7pmz1QOsFgbTU666
	r7ox34lxSlK9YMcCh9omqOPNoFuO9Rla7hgPduzKmzCjsvZet+hRE92aR4ww86pDPjtjjkTIR2r
	MEPtmx+e6APmazEHuRuMiczT6FLEzg+cmz8hIVoJ9HbWLOqcieKUC02lwkBW6YxsZjYgwtq8Pp9
	mMEPQEaEeGjpZ9sUJdsJF0cGx8syQCGTyFLW+RfaGOua2MUQ/xxXt0KmA15t/MxdHp92n/lNavB
	fU0J2xXugcBClJSKSJsuC97arEBLj7+VudSOGXSVkRgo8ixMIuIlk6zzKQYiR3yw==
X-Received: by 2002:a05:620a:4043:b0:93f:31f0:6a7f with SMTP id af79cd13be357-9442172a5c1mr3042995385a.69.1793810188455;
        Wed, 04 Nov 2026 08:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93f:31f0:6a7f with SMTP id af79cd13be357-9442172a5c1mr3042988285a.69.1793810187938;
        Wed, 04 Nov 2026 08:36:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm, media: define the UBWC buffer layout
Date: Wed, 04 Nov 2026 18:36:04 +0200
Message-Id: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPRe62oC/yXMTQqEMAxA4atI1hNog1icq8gstEaNoJXGPxDvb
 mdm+S3eu0A5Ciu8swsi76IS5gT7ysAP9dwzSpsMZKiwhhxuzeGxC3GqV2yDV3RlTsaVbHNHkLI
 lcifnb1l9/tatGdmv3w/c9wNdQwP8dAAAAA==
X-Change-ID: 20261027-ubwc-format-docs-7942079e1472
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2859;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4SH0JW1dB6WJf33quabAd7eWZqAqkw4IMlKiqa5Y7Dg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq6173l4RVxdwRlHhknfY4lR4Zsy3zNSfsaf1M2
 G+W9EjzeIyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute9wAKCRCLPIo+Aiko
 1QfaB/kBUdmO9yyqMW6ounuavi0h7rwPMCooaVSZ1lAWrvU3DhazqXlPzOzE007FWwQ36OjMeTU
 WcVph6vBSUSFtxdEz4ikzgDuN+b9NUPDF0AkhMR/ch3YJ6sZ46UJM4DHKy+KRo3pnsP6XJ91UuL
 /UZw363rTFmiI/Az5TBj2mEzq5mhxRutwCoAjWwqhWqxShKc2+o5UHkY+COMcEfe7TP52YFeWoH
 6xUxbFwtPr7EwPuF4ZZBvqQJ0mchfsPR1YWPMEJAo20H7+AmM4I5Nkn7shnMLz35G78lhhTs8kF
 iQwL8udwqPdjUA8GBrxiKHy/MGK7TWD28DmoyHeV98WXTV7A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX5SE+KkJO6IWB
 cZeKILRV3EF9qYnwgORWfPPPC0LE8fHjMXdaqF4xrnEwFNCclij6wtLpHho3/+nSG9da6IEfB1G
 dVg7ICl4kEIioktPvcaqciv396LeRuCFvNVN41Fu7t/GnTyDiNzJnNbFadYn0h4F+0g6HuuSdwE
 iGRnmiW0SYKL1M7jDy6DkEBFNF0neOUel8HgGeI5xTZb8+uYBe1b4EEkVE5LmQ/2Di9VWTCn9Di
 XVrzSQvWn2tuMBLvKvJbg41zSoY7ocyTZkTUXntI9lAk8dfvFnJy9kFENiIGXXU0l4OVyZUz0A6
 m28KWUIqEKq2RZBSGB9rBEung6zE3MCUMChnmulzzvod2gId2SOT5B/Y3rjBpAIF2te+SK/G7Aw
 8NQ5ytK8W/HLl5/Jos4TV5EbEk5UijW/pWS8FdEGqgRKsbxjkAUBzOsZRs5niPDeTjqv9RmJc6n
 /gmz7wjgPc6RitMgQgw==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb5f0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=D__o4bQJyZzLvQ_PEqcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xPcZh__VTzIAgqsVIlfnZmNQzB5rsm2L
X-Proofpoint-GUID: xPcZh__VTzIAgqsVIlfnZmNQzB5rsm2L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfXyNDO/lFzw+kX
 p2t4zSuPKDOR5CeVYWIFqVML9m5jAMVPIg5T26xf2LDfjVorxqOIxyDBediohcckkNLqzWoIQRH
 eXx183VTnbgDAjoQYx6ntrCnsddCyB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

The layout of UBWC buffers (DRM_FORMAT_MOD_QCOM_COMPRESSED, V4L2 QC08C
and QC10C) has never been written down. The V4L2 formats are documented
as opaque with four or eight planes, the DRM modifier as "macrotiles".
In practice the video decoders, the GPU and the display controller
exchange these buffers, so each side has to reverse-engineer the layout
from the other drivers. Nicolas Dufresne asked for a contract to know
what the V4L2 plugins have to compute when passing decoded frames to
DRM.

Writing it down showed that the display driver never validated it:
msm_framebuffer_init() checks UBWC framebuffers as linear ones, so short
buffers are accepted and the DPU reads past their end. Patch 1 fixes a
misleading comment in that code, patch 2 moves the layout calculation
out of DPU, patch 3 checks framebuffers against it.

Patches 4-5 document the layout for DRM and V4L2: metadata followed by
data in each plane, strides, line counts, tile sizes and alignment,
with the chroma size rounded up as DPU and the vendor headers do. For
NV12 the CbCr plane follows the Y plane in the first buffer: DPU has
always fetched it from there, ignoring offsets[1] and pitches[1], and
turnip reports offset 0 for both planes, so this is what existing
userspace relies on.

Patches 6-7 bring Venus and Iris in line with the documented QC10C
layout: Venus reported a wrong bytesperline, Iris called the format P010.

Mesa 26.3-rc rounds the NV12 chroma size down for odd sizes; that is
being fixed on the Mesa side, before the layout reaches a release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: fix the comment on the RGB UBWC plane count
      drm/msm: move the UBWC plane size calculation out of DPU
      drm/msm: check UBWC framebuffers against their layout
      drm/fourcc: describe the Qualcomm UBWC layout
      media: docs: pixfmt-reserved: describe the QC08C and QC10C layout
      media: venus: report the QC10C data stride
      media: qcom: iris: describe QC10C as TP10

 .../userspace-api/media/v4l/pixfmt-reserved.rst    |  63 +++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  84 +----------------
 drivers/gpu/drm/msm/disp/mdp_format.c              | 100 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h                      |   3 +
 drivers/gpu/drm/msm/msm_fb.c                       |  39 ++++++--
 drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
 drivers/media/platform/qcom/venus/vdec.c           |   5 +-
 include/uapi/drm/drm_fourcc.h                      |  54 +++++++++--
 8 files changed, 247 insertions(+), 103 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-ubwc-format-docs-7942079e1472

Best regards,
--  
With best wishes
Dmitry

