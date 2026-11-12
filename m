Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500134;
	b=3CCm77Syq3gTveTCXsClTIm/DDqIgUsqgy2hZJONLocyti9fyEPWi+ejjGt5r17SjkpZ
	 59egkFh0GP2hm9mITPdaKcs7vw31CR7zoPfcc7fYGWTnPAGkeM6Q874bpbnKu5ZE84boY
	 OVJvVkmvkGhOefHLYC5UTC7tzbz+wO3JnzSu1+KObaaaxg8T8QLMRXejyTmNcDT/6kRrV
	 n/j3NJ93BWYoZx0B1cCLCVbgNkJYzOliv4j5GC0cskADgkOGm1ystM+YQutS/aT/QY3it
	 +PLzNTjwUevv+ueb8E7kRdbRiEZEwNk7/GeOXPbRLFWO0cofZPuROqT7TyPPJA0E+dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
	b=ZuEVpsO3eA541CB2w5PYh0JV7d/gZil7ue+xZbgyPeWe0q34cM5+PNXyiE+mtVh80MJV
	 K6VWV9Qf1K811gs59AjDjyKFNfKt86ImIRkGNy72xhp+a42Q/A4fhVm1W/WfM3z/0xLTb
	 kMXEAiEbSNEW1fRe/EOCmWbdJasXFPIA+/j2+cvlZNT/1jSMNoXRU0BfyS9jjW1YIG7xp
	 GXg3GnAlMlqgR/y/8ids0z9djwoinf8+mCSIGh1y4WurRoCN+l1Smw4GyU+MpLKq3r6dm
	 cysUo+6AImBn/UUZDtMlNNsP4OJ87lElDIV4Q3EhnBp+z1yK20rJJYG4ugq20oFpYqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J3R4a6ZM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FnnEetM+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20772606A327
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20772606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J3R4a6ZM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FnnEetM+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZaUh2293614
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MoD3amaMD5SRK1apB8zScN
	P8aTosIbfh13l6OfNFYjY=; b=J3R4a6ZMj9y35oGr3vxJ0o7+JDRjkVzo3S2Byl
	QPwYQVtR0x8FBKbThceAZewe9LIIDjxxwrQdGiFfHws+9OZxBJxX6TuFmIpXvhJo
	u2k2s4wznKOj35Gpzrl4+dx8UDWvG/98h7dqYDvYBQlW9bPz6FpcyWgN9Ly6vXHO
	DC1xR6wt2/bmKPIXfqm9IfCLA6003FtXzmlx2nLzR46TJNMhKTmXVFhR5nhey2v0
	ure6+5PtmG4jozQNtcr3lBJDcalx77JtpbTjg9aX7fwWgqMzOCpO+SF0OqFqghB7
	CTeg6uda7adazv7ahD91KQTZx7SCCLn8tWCHgM8wZLghPjKQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs0187e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2ca2a4489so1030414137.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500131; x=1795104931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
        b=FnnEetM+QMyLlM3+7aiK0NnoRzJ4dSSSJ/TO8sSt3YwzjBc3IpKmXsoYqAChcuL5IX
         qacLjbW7yLxgn5gro10EgIToeL80zWVmaNS2ICxMfPyIhjx2pxubkQbm+FlbuzPJYOwQ
         weybcXyw9zVylfnI3oG32qVGyQ0EkKbQP8oUe5JVrYCxlP39i3q/zy+KL9x2WCfiYjVb
         RUGS98rKp48Kj5frEM8sGUjL/ImXILAx++CvetMxybwOG5W7R9n2jaWJ/cy3Nyg9Lv7C
         GwrGnne5SJAL4Vm0Zs5Pl9rcH4e7A+lWpZdvoPU1qe0UTaOHrInPchzc4J7k69kVd/M0
         Ixew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500131; x=1795104931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MoD3amaMD5SRK1apB8zScNP8aTosIbfh13l6OfNFYjY=;
        b=a80kqXBGeDzaxrut3Ti7HFTdoxCBo7wAWeugfBXp7IA6HSoPtPHNVCmA+1OIEF44Sa
         obyyOzqo3CIjA5pdyGdxCkNCTV+6mxb3P3jlaV5Ts+VtuVacxZjMJPVEUweZ0a6DZaNb
         7Xg8MfWSvWP4OilC15MLi+rvuXKf8RjgAEUVHaOp3ZAbC49S674/1rJEiFtnbyazhpft
         kq0Pmm8W9sxseTm1t8MtHBvm/9j/wdkQXjxeDAat/p+qpTWM2wR6pw+46tcuoi5BVRQo
         dSibjLl1uO2ETRl+VDnT4LZowNgbz8yFMMKXCyxMnpERieamP9v/AC+sUyh46fPIiPt4
         qq0A==
X-Forwarded-Encrypted: i=1; AL+hErFdIVg+NLKIc/Z5CHQ6XRdpePVlbMXjR0yfTHQ4uktKV+bPkkWol01UCPeSkpq6qJbrG/fK+5l+oJUpaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z95u/uIShZli3Qe319J8/YluC+DDF/e0r1OmM0104NXFEv4E+8O
	lha+SxXQYxm0gt6urBPKgXCycxfFHWbIy+IqyIH0NYYAE8oRTNIqwIePsBFp39NV3cq4vooIp0P
	I3pSYOnZ3Q8srhUV02UTWRxhpne4y/YlIATCqGm5UE+7s4R72i/WPQe0OrKAz4zfZDg==
X-Gm-Gg: AYBFou0WiespSkZD3rgx6iESeXSit/uoCjz+9SBmGM2Ext0jjcxUJgGJMKUKSCrpsnn
	OSUP5Eume5R3bgrxJMKC6oqemlONUtexLSiIndwUHehHrLm+9pohPPDAsdJoTMLeTCgLwbAFflP
	Y28MHhh5vTeSMO6FVkpTwJuYSLggb+CogfZC74qLefqtpZonrD/5qJLcyIGL2irzT6sOhb/mLGG
	aE6ZvAEEz7UgSjF1LVDCgnX6FTSPvbFFdscZmGPnODffTQGVsN/X2AZFfKamcFbi+6WRM3A4Q9t
	sE5LT6ps0RrRK64tuDgyvNslgi3UVQaxEJZ+3jxdz9WenAxbcvwJq/2nY7BrqLwoLwxQqjS74Rj
	vqA1fgJuu2EXh6KqFl8gwcEIR0qCMcZbza7553zyAiB8dyBwTBncAmpSyflr2ke7NlZOc9KYJQO
	JXfWnZHRrinsis+SDjxANRJWDphrvtMe425hYRdOHJaBRlMcvUq5CaxKg7SaTT6tL/5dZk4TTUm
	AlQ+LpLA5llysk6dh7lwNtUILk=
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr1915960137.13.1794500131181;
        Thu, 12 Nov 2026 08:15:31 -0800 (PST)
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr1915955137.13.1794500130657;
        Thu, 12 Nov 2026 08:15:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm125874045e9.1.2026.11.12.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:29 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: iris: venc: fix encoder crop handling
Date: Thu, 12 Nov 2026 17:15:27 +0100
Message-Id: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB/m9WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3cyizGLdtMyKVCBpZmhskGZkkJyYZqkE1FBQlAqWAKqPjq2tBQD
 Incq8XAAAAA==
X-Change-ID: 20261112-iris-fixes-f6130f20caf9
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX5KJfXCJTpTK3
 X9HMJcXpoHOQtT61Ipi+lFEbKECjR2JhkBSpcuNYm3gCfjQBo6qSCJoTlm9RFntlgG1FXE60B/K
 +yinFt3RGJ1hhjiYolT1lowHBiOr7SnnFX0PCbEHTfGeP5IxflgCaUCtTZZotDIad4/yPE02E5M
 VkeI6xrQ1WL4ZnfqV4z5Z17uFgfjOLfKzSENrn4gtPwnLtQKmpFthEJsOurrK5VJGpZ/vKvdE+G
 4f9p+s88Fkwt+um+lcUkHGKp4bQHI3E3QkZB2yu03MBZEqdZZks2nvq9qQoZ3q1HauhMM9mprjU
 V5Yxz7k9Lq0d2W5dfI636r7NjP8/gfUnuxbG0+TvO6ADYtjSiqedMVyH9I+iTSNQ9rAs7UXwXjy
 L6jTJVjxV82lptI2QhCLUKXAycNmOHy4NphD4LVslyhLwpfINwlwDKwTSIqXyXMlHKzEi9ZeWaC
 Ytu29ZBVNaOxWjEreSw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5e624 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aBm2fhwrLcIJbTaFzjEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX8Cs1VvBkdoBk
 YfSX1Z0pGU/yofZ7JL698mXyGJNyzTXxDo4xP2maGRJdqTqa2OnKUBLmXdiZ8N4HhUaiPneS6rp
 3d4xjXeHjNH0+3ouqnOgmAlWrzqIJH0=
X-Proofpoint-GUID: ZLhyN4laROuR3_E82YvFTh5LWOoZ9gzM
X-Proofpoint-ORIG-GUID: ZLhyN4laROuR3_E82YvFTh5LWOoZ9gzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

The encoder keeps the source resolution in two places. inst->fmt_src holds
the padded buffer geometry reported to userspace, with width aligned to 128
and height to 32. enc_raw_width and enc_raw_height hold the visible
resolution sent to the firmware.

inst->crop belongs to the second space, because iris_hfi_gen2_set_crop_offsets()
computes the offsets as enc_raw_* minus crop. Both patches fix a place where
the padded size was used instead.

Patch 1 seeds inst->crop and fmt_dst from the visible size. Before, a plain
1280x720 session ended up with crop.height 736 and a bottom offset of
0xfffffff0. fmt_dst now also carries the codec alignment on every path, so
the CAPTURE queue keeps reporting the coded size.

Patch 2 bounds the S_SELECTION rectangle by the visible size, so userspace
can no longer select a crop larger than the frame it submits and silently
get an empty bitstream.

Tested on QCS8300 with v4l2-ctl and ffmpeg.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (2):
      media: qcom: iris: venc: keep the crop rectangle in visible resolution space
      media: qcom: iris: venc: reject encoder crop rectangles larger than the source

 drivers/media/platform/qcom/iris/iris_venc.c | 24 ++++++++++++++----------
 drivers/media/platform/qcom/iris/iris_vidc.c |  4 ++--
 2 files changed, 16 insertions(+), 12 deletions(-)
---
base-commit: e726cf08ee6ba7e8b852c77760f12c59f90f1338
change-id: 20261112-iris-fixes-f6130f20caf9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

