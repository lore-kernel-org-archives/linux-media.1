Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595827;
	b=iskRc2MQvxXBgAp99QJJXtIT0G+is3RXB7D/pLAU76pkeFxC/pjxh7TLyjZvA74aXtfH
	 AFgLm6qu36/Fk53iee8SF7c9Q2MPIT14GhJdkGC9WCMDjedXKrLrU/WhoBy0dOaGKLz/o
	 0EdkpSE2NRl7CGDHgK1OdYTdrHVmqM8OBRPwcWbQdrSLeq6RdryvOW7dWk2QA2bzosryg
	 SG4dVFgrOeT6qbEBhZRjk6eCYuzxLaeD82ZlpWN7spVycFfHmNN10jL5uemntfv+GY+c0
	 DiQbnnv0dqt0v/6yn/TKdGXjMNolCDM+MbbcBmIRxdFPM8AJYuBiMY3WbIS5x7EkHgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu8QXx7o+g=;
	b=n5zJX2kRLVoXWt5Ml6cWWSfUpxd5YR0Y9IbjBEdvdYzYZACrEgOj7xg3IAN5Bx4Hv5Wf
	 aZ6TfFg0six2ArdCO1MOG2Y4bJb58EjcVEnjTCmiP8lrv2dKwLHUYP//ANyJjL5mSQUIF
	 lMW9pO+RHaNdnM2fknn9gXt/Bq5twjnAlzZUNKv+QMumpGIIV3SYrmugKTh9wy8QL/acM
	 QOlRX/3rimfifQQsv9UiwScwiM1+0LgOTkE29MrN8FfB6fjEMTgvWg7f0toc2TdCjm8AA
	 H0F/Li/oJLBYGFpm8pRBAhZgtbIwAltZgns0AQMeAbCjEYupX5L4AaK+d6GNjUFskQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pai7rOpH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XltLmC7h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97576606A336
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97576606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pai7rOpH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XltLmC7h
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFj6T3780569
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu
	8QXx7o+g=; b=Pai7rOpHvCid7pBso1KJQNmUP3ay4+209rkTRCGKrA1soVsInzz
	2+EI/9XiO0RAM/GnD/STisvs4OSF4TmMqSpaYOTZTy4YrfruHtbiexkEV8X+AKhJ
	6HObc71xpqBRTgvwxdC0xYCS8IOuPWw7fCvssyM7FIliP505dAw/b9KSorRfVPSt
	Hs1K6yoPpdFLUGK+7yQVE9fsj5oYSiZgP9Mx0gEp4TlIeIfax6HA+62qfOkZuIA5
	ZsXxXC5DTQR/MQQPUz2nG7Lr+6BZ/wsoDvBGC3M/nm9/vZt3UjBSw5X6aDlmZjaC
	IaQbELHasdMoTMISlwbVrivN0NT59bXZNNA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jux4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:50:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so1629357eec.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595824; x=1795200624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu8QXx7o+g=;
        b=XltLmC7h+NXyy3oLGn6NsDLYzSSjVmqSyDRg4wL4qbJ8RYr3ysP6tLyNLtAP11iXfs
         uFZs8yyK8C+g9xwr4zT8IsKbJUI256iAmXy1y13NzfF3NbPp6NUioYpp8xhAFp4nqoJa
         GEmfPTHtw5lswFxkh+8G3Pi9iB+d7Q8nXNTzQfS2oH92FPIc8JAyzxJz7K+GnmWNtrG9
         KqDkKIDls9GRqEi3oWYxyFQeEUoIComjXN4quh/HRzQ7hREJ4oVpBIUpUwRR8xtPv6pL
         z8V3bS9bSrUS1cvJJWxHa7CPgMmipfHyLjX/D1rQ+evOCa3mYuUx29lapfHE/ACBYrv4
         7Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595824; x=1795200624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOGbIgdMvNNbvF3rlYZmS8C4yu1k+1TFWuu8QXx7o+g=;
        b=r+WGSh6UetS9xMAXYAaKvr1QpXZvAkRxtiv7iw/uACGRoayPnT9/ZjRJ3OmFRi6IeQ
         cRZfg81bNcjQ1gpkcDNjREmKCbLYEWsLvka6zp7ff1Bz86p3MtCo7ZFo0wvz73xHgUVf
         bT9B7uqtItiEZgTSDWU4ILinWQok+MWC27bMTACQl5MJeWFPfLOFJDB4j1Pp3M82chjJ
         X2LGI5nyCUezb6KGV9gmPQDIyWpGcxdHz1Nt+jnEfseUkN1lSYLMTt+aYG14aGw5ijjH
         kQvbGbR4RksBmTw6VhYqjVkdSEju5uF27xuu8ECukN0QRTysz3InRblvLZq3YrxOEPFF
         0mgg==
X-Forwarded-Encrypted: i=1; AL+hErEZiE7//JNSf6VhuviFJGTLct+/3o/g/9GowjDNj2SDaqOMICj46zjMEGy7ZE+LwGv1mpK1ueKQ8eg2+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6+EOKKYwFF+6aQElrh0CnamuSvTVd6quwGssUDTgEcR6g6D5O
	iK9D+zbhw+4Pytbqx8stffD38jwJbHW+haY4DdRAWzdbvvzoelFfv2mHSivluIrHFc2dcJk7QaY
	kfc859x4Z4jFR5rDFxqyKmpPby1FcTkLW/R0y+UetTVdY6OwuglHbSfaOik27kaehbw==
X-Gm-Gg: AYBFou3c4mRPuuDFqy2Dzjkdb84W5woCIVwd9MGJvWWQVgXDW/EByAE8Qtz3YIxphoW
	mM+ileybd3A7zFhT4xSqO5tFf6elenWmRDnArvsmDBqq3TErSjR8CpGmrSSTwXtUu2SJ/rNT56U
	kDDx+qKkQVnR/cJZMcNgB3WQaCDz0p3Qz32u/rcCLBbstDpG8WuTIpDO/Xsk47RhFAXvDG4E6ED
	z3d8q6Msosc3eAY6XxKrQHp1EGpUfUX6mE8Yw8om3TP8ZbR1z995+lleM9Rm3LPIq75Ke6NnKEl
	shk1qIpVqmJNfyfrkVgkMfEmFS8fva+CZeiHBrvY1jwPoko0QvCvBEnBMbtP7wYld0EY5RJ9BXw
	mGznphtDl6Wg+n6RVvuvWczta3mE8V1uc7E4bFNY5o2lno/6yvA1DAwmgktWwBGYTDfksjqa/sS
	8=
X-Received: by 2002:a05:7301:90b:b0:34d:755b:d60b with SMTP id 5a478bee46e88-37968b8a031mr2753167eec.34.1794595824152;
        Fri, 13 Nov 2026 10:50:24 -0800 (PST)
X-Received: by 2002:a05:7301:90b:b0:34d:755b:d60b with SMTP id 5a478bee46e88-37968b8a031mr2753127eec.34.1794595823416;
        Fri, 13 Nov 2026 10:50:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:50:22 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Migrate PAS clients to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:00 +0530
Message-ID: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX87b30uUMzT9i
 DiNEu58Qs3w/01XKulJbqYhy4+xdjBjh2clDpK1szcUFHmO57kDV6rl4BOFQdrnhEJ0iCc4NozG
 d+x9prMdGjt3uo68iVbX3ORjv4sJT88=
X-Proofpoint-ORIG-GUID: BRxLgSRn_X9wwV8ifIGvTiLOrC5qm9--
X-Proofpoint-GUID: BRxLgSRn_X9wwV8ifIGvTiLOrC5qm9--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX2ZADl356A58r
 UloqytaTtTPnhmMi+3++m5Yt6M7BsBj16H5b0asFIlaptwuVOiK3qIgUd++qyHXYLUk/wbSw4lz
 gHt+a9+zAKC2c/IBALvbyJJbPiYWR9wYg/LzH1HumUnKkrwHmefIyZxK5HjVvBM6uubo2Y+XdZt
 axQhZc6YHn+l96HJ0ooCPvwMjZn7bZGm6rTLrTpex0ObMZxBfAEwtollr2xpYYLKLlrQHSb68cJ
 WJbe4ovSIpAi5/HIBZex3NbDGgQVMAWsFqLLyI6TVE7T+kQpyBTmGGV1ifg014L9e/wF7uBpUGJ
 1FB23GCbciebEZTtdkgpSOl/l8kP9fTko0EYEQN7C+e2mEhtegWG836Y7k+nHFyut1TEzHD/ciu
 MEyCqPFtcyh96WyY/MPXxvW7Oai6SgFy4y7ssi4LeNPQgVzWIBxAi6CpqJd376OpBaHkh3i83M6
 DyAmF5v8nQz1+jxjjVw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75bf1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zG7KPAmT95cOeVn0dqYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
public function, migrate every user to the new PAS context-aware API
qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().

This series migrates every remaining caller of the deprecated APIs
(qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.

Requesting the Ack from subsystem owners to get this merge
through Bjorn's tree.

Changes in v2:
 - Addressed Sasiko comments.
 - Addressed Alex comment and added 1/9 as new patch in this
   series and use the  API to other patches.
 - Commit description change.
 - Link to v1: https://lore.kernel.org/lkml/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com/


Mukesh Ojha (9):
  firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated
    context
  remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: iris: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: venus: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  net: ipa: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  soc: qcom: mdt_loader: remove qcom_mdt_load()
  firmware: qcom: pas: remove qcom_pas_auth_and_reset()

 drivers/firmware/qcom/qcom_pas.c              | 42 +++++++------
 drivers/firmware/qcom/qcom_pas.h              |  3 -
 drivers/firmware/qcom/qcom_pas_tee.c          |  6 --
 drivers/firmware/qcom/qcom_scm.c              |  7 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 22 ++-----
 drivers/media/platform/qcom/iris/iris_core.h  |  2 +
 .../media/platform/qcom/iris/iris_firmware.c  | 27 ++++----
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/firmware.c  | 29 ++++-----
 drivers/net/ipa/ipa_main.c                    | 23 +++----
 drivers/net/wireless/ath/ath12k/ahb.c         | 23 ++++---
 drivers/remoteproc/qcom_wcnss.c               | 12 ++--
 drivers/soc/qcom/mdt_loader.c                 | 63 +++++++------------
 include/linux/firmware/qcom/qcom_pas.h        |  3 +-
 include/linux/soc/qcom/mdt_loader.h           | 12 ----
 15 files changed, 116 insertions(+), 160 deletions(-)

-- 
2.55.0

