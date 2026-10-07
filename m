Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604AA3BD22E
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372711; cv=none; b=lW3CweZRKdmtIJFMq1XwrNO+LtQREio9qurG5EzR4nltItn0pLHKz3Yk8APQ4EFcZRz443cZtXSQDz0lVxGLxh3cfHDGOkmdsJYFzX3pJiMU3WMa1TjyB4R0ePNXkbcQolKnn7mJLno+kBee0iiV4BVtv/izdGvLADFQG+ipnPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372711; c=relaxed/simple;
	bh=IRIBY/htuKvMuudQun2ZmyNAVlCXKkmrhnz9sAhfFQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M6DxfRSnLpXkM4ES+J/iwFWvWSicIl0XOBTQJFGNJYSnzRF61y0zorJF1/yOU6lvjtAxhoUGaZEON2SbqVKBfoJN5ZOPoEKgD6Ymgc6bYC+bAxk9pVDD96BRCAu22f7HPDHL2pfgtZxAYFhzyl2Dna4wXlaa48wSM4DjkPhj93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMs7E//6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WX20S1Dk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMs7E//6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WX20S1Dk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV2f02969294
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 11:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uGmy/RgKL0bxnXIeZ3+QDy
	Widdh5uwCvmnhTIxh/LzA=; b=iMs7E//6HbiSQT1pND03Qc/Nm6Q+EvkmlIa46m
	zeHS8Sjko3NGjT/9p6iiI/jLkAIxSczQ2gkYpb/mnXKsjb1i4PDhutzTijMpMNNT
	NC281pC8zhE1i8991iHNRGF+4/LgMpYMfYOhn42G6/fs26k0pAIdgxJ2GPGRnwJK
	xqHeXMUOHS4728c4ncN8HzryVyh/V/UNUo/wka8/O2V1KFLnAQbkwW1PEwmM/v4Q
	kFsDhdaYUAQ2OuMtv31eHeN5Jhd/CHDHRmfu6pdjPijZycbNKfPzU2UO3pXInYB3
	WsKnPDiyM9e9CylOpcf5cbCAIkgVDri17WvTJARxvJycZu9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1uqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 11:31:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e5dcd82b26so15934425ad.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372692; x=1791977492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uGmy/RgKL0bxnXIeZ3+QDyWiddh5uwCvmnhTIxh/LzA=;
        b=WX20S1Dkf0pS8xSDBJQx916EkL3waPHJdbrwToWwtkXRKc9u1IhW2Rn3tbrjZHGJEA
         sH7huE8tI00c1yJROF30TDVWC0Dn/1BRbMDzxiragS0Wcs234Wm2qnlJD0UJmn5U5CNZ
         YK07gL/fK9wgLB3/ypuJFitzMs/CyJ/iO/5NeEVTm8STp63Wlqcsyadftl03OguUryJO
         92S4yWBJm5FSfkE+PsWmPdjQe5+NSJbitOogBsnTvUdH/Ka1GCgGHH9rXKsMdMEoKeeA
         sCJ22rA7HGq+5lfhDIipXHeJ5Yb9QTv8Fj7Z8CvrFvZpW8MxkL/FmEjedQrsQOU2iiB9
         B75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372692; x=1791977492;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uGmy/RgKL0bxnXIeZ3+QDyWiddh5uwCvmnhTIxh/LzA=;
        b=vX7NvA8WsBXSAdG31exkxt7EROtWt6fg1BiG9+1dR6gGqi5rUbCBhGcfH0pXUvQ4M5
         FFED2QsUnB8gRhi6A2Gj7n07a3lRz8KIZWwIipA8bSq5b0uCTB5PSGS8Bs3LfEgYXyHi
         eyRItYo8EgOOH1WRjVfVIfNmvZaUYX0ku7P6PNfE1vJ4QmLRKK5sKlxM+/xKkUo0pdvp
         d4TnaKx8VpUeMWb/DJQyGvdS3LrcwCJSPxkzv4mOL2mDSHHUjjXXVnx6KutbK11/1lGU
         8jiVkFk/n1zDSctL4AhGIliY2eNDnuva7zS7i0rgSHxyQbjVY70e6YNYwr187S2AXqfe
         qMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1KLS0KxV8eUpoz4sbrzXmXpiZELrUo4AMXGyAYKbfnMob71pP/RNcRtZ0FtPc0c9TNSb7lTQxZIlzWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/qPCaeoJ4jZsNxSbLfLJWj1Wojvon2Ffwe5z4sX4nBrqUq689
	Zq8LDiJ1mgP4yW+R2je6Q8ZCcK1UHWgJfEBUjYMKbc9hR95UMo54Je22LSnaxmcag9zK+aj0toV
	iy9DDMnEx0yrZ6tacciRN3EWFHB03jOj5AGz9QBuTPx3ytmX9Pz+8n2iLsYP0MS3jmA==
X-Gm-Gg: AYBFou3SWoWlSVXrgAAHCEylNOsIGL8E/zLEnTOc18NdBy73uOgv+9TY/dmqNZQXmHH
	2Su0BLJwYP8MzBk/T1cyQSihEyqqo7SRBz9IVvxtHj07TgnrejlV4excfx3vSZdy3S8l1tl2hX5
	JZ66mWD0rTQf1+Vp58V0heYnfNjid6UbdiFZphYpHrxSFxVDCMFKPNgjB65Pt/scEDWgW094p/N
	Yn548jbZ/1kYeQI4mIGsuiYiDpkVwEX+XmBg3sfp7+Jr1NGFlxdEadBcLBjDRcVCVqjYESLZMaD
	EuVv2cEF/ZdtBUTZblkYbfE5i4O1bpBF2XXKl+J4w0tP16oNuwqfgpYqDbzbv9soJbZM++RGSTI
	EQIHsWnh5LhzGG9YITXhwOIzZvNTgLVDj9g==
X-Received: by 2002:a17:902:9a06:b0:2e4:4eed:5cc5 with SMTP id d9443c01a7336-2e60051d494mr12539015ad.38.1791372691795;
        Wed, 07 Oct 2026 04:31:31 -0700 (PDT)
X-Received: by 2002:a17:902:9a06:b0:2e4:4eed:5cc5 with SMTP id d9443c01a7336-2e60051d494mr12538775ad.38.1791372691310;
        Wed, 07 Oct 2026 04:31:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0d9sm8388515ad.20.2026.10.07.04.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:31:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: iris: Fix IRQ synchronization during
 power-off
Date: Wed, 07 Oct 2026 17:01:04 +0530
Message-Id: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHgtxmoC/yWMQQ6CQAxFr0K6tklnImi4inExAx2tIYBTNRDC3
 Sm4fPn/vQWUs7BCXSyQ+ScqQ2/gTgU0z9A/GKU1Bk++ckRnTDJhKxpiZ1N+o4bE3YyujD5dnL8
 SRTB5zGzPI3y7/1m/8cXNZ6/Bum6N+yojegAAAA==
X-Change-ID: 20261004-fix-disable-irq-safely-15b2f712800b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791372685; l=2008;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=IRIBY/htuKvMuudQun2ZmyNAVlCXKkmrhnz9sAhfFQU=;
 b=ms/CR8GofPJACy3PB23XX/xbXKoCbXq5GVuTMAf23UyEst51Yp6nzbfAoEeZ+D6EOQKTaeOnp
 tEW/ekujTuPD63Ik6OsnFZdrRMyMuO2Z4eihgOE4Zh6N64wjy7iVZQK
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfXy4NrSlA+GEZf
 A8JGvT3fz9MsHxwo3YiuWEAJ9aHlNBf4G3Wnza/N6rRTzE5OtxDH84k0WWaD1dAuUApJopgn+xO
 Sqs4e6ZWkIR8dhA2VHSxF4Phc+++XdE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX+tkwz/gTSgph
 sjG2AqKEgyjToEh0b9l19pTi1EOZ0QWVUGg9HySVUNruIOTuTIk1F74qRx24ibxoOAoEuoNfLPa
 rHPN2SIZVtDroza59tWRF48MkWfYUIKRiOK2LXFCRDX2aBsuH9mTRWSGW/iJryHh1z5RBGZxPQH
 Nd5jftKosWIVipTMqEFdY27wTFJdtISedIsDQl0XsAGuymzqr0qdZitrBEUSkR0b0MK+IxIlh86
 pVF9Mrdl2gISZvQa7nZxT6jSwhOrIoY2YjUBqSrdzkoE/7jy965pMqLQvXyEz6KVXEf0UzbKncR
 uoJl7GuS0GQNvMiIVuqv345uI5gzP64ZOr6JgWZmurxYVLEs3oUISmTw9mxi7tdv05nEVNBBf5q
 /hVTFJ7OiFeQuIPIe8Cm/SvrCF3Qc67taeLVjUTutjufvsBRAFqjk/lr0gdP1StBJOEUGZkWz2G
 yz4s1ICKQKrJxeIXEpQ==
X-Proofpoint-ORIG-GUID: R0oCw6xldnriGJzMWsSW9SgWmsTPU8R9
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac62d94 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8ZDczjnBWwFEOdFZX1MA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: R0oCw6xldnriGJzMWsSW9SgWmsTPU8R9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045

Commit b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during
power-off") changed the VPU power-off sequence to use disable_irq()
instead of disable_irq_nosync(). This was intended to wait for any
queued threaded IRQ handler to finish before gating VPU power.

However, iris_vpu_power_off() is called with core->lock held, and the
threaded IRQ handler (iris_hfi_isr_handler()) takes this same lock as
its first action. If the handler is queued when power-off begins,
disable_irq() blocks waiting for the handler, while the handler blocks
waiting for core->lock. This results in a deadlock.

This series reverts the commit that introduced the deadlock and
reintroduces the hardware protection safely.

The fix drops core->lock before calling disable_irq(), allowing the
pending ISR to acquire the lock and run to completion. To prevent race
conditions from concurrent power-off callers during this unlocked
window, an irq_disabling flag and a waitqueue are introduced to
serialize operations. Finally, disable_irq() is called before the
hardware is powered down, ensuring a safe hardware state.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (2):
      Revert "media: qcom: iris: use disable_irq() during power-off"
      media: qcom: iris: Wait for threaded IRQ completion during power-off

 drivers/media/platform/qcom/iris/iris_core.c       | 10 +++++-----
 drivers/media/platform/qcom/iris/iris_core.h       |  5 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  9 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c  | 16 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  2 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++++++---
 6 files changed, 46 insertions(+), 12 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261004-fix-disable-irq-safely-15b2f712800b

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

