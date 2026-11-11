Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405227;
	b=f6PPZj0FaWKAzz37IZhwCkwhdOxNIRgFh3QsJhGUDnGQsPEKJzQPyLrU4gK61c/OasnR
	 ubCjgxxZwjzP+GXUNRvLHGVjKX0Jt4UyHtq7eSFNn+F1TsMDmGyug7m6MXC0PSpwJNDib
	 EDyOhMOdec+S6VoRFuysjdel7hDQdHkHOub+o9v9bhbmbeD8k94/jr27Sq2r1VuLm3cZn
	 6TxAJ+WMuL3QpDGp2C/yreLF+bGWzlLYoDPrljQ+LPPgXOLJMUOei3UXLKEQAmp5aJ4tJ
	 Bc9zIK5JAcUrdRWYbCDXggInVRQiVwnVjlfwc4/7of/vi6Djl3/jvt0vvSuWQtSOwlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
	b=Ll7RIq6/3giMiOMrAw/lqgoBUZ4SKPoEw8ECHJeqf5LBMslNXg5vdpl6jDNMMSuEXHsh
	 M6nKTLtyc5Gt6wbsUciAjYRBqXFxGlpeQjpIxMI906PC4AJdurv2WkIIRMEcWOz8JoFG/
	 0gtbsV/jUIGxOaqFLZ2sq9Ch6T1fnOcXtLxx1fIb6TDW/xOSLV3iad03ibAJOsgyx0/1G
	 +d/+q7o6MhOdjGbwMNCcNlso7kE8l99FFr18mk9Ji1BD7IAn7fRDMjq/vEH3FUdKN/Qb/
	 Ej9piqykJRRk4NvwMp2chcGhxxu3PU9LUzxAOLf1tlDGYcyBUbEgy+fkR2Nf1Li+kSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dQc6Dc1c;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E1606A324
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dQc6Dc1c
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ab99038afso2483341137.3
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405225; x=1795010025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
        b=dQc6Dc1cFeh3lUkUO2AOXY93vRxDH1gCO1sr2nYNEGrmlq42lk9DvEjZTgunacCbN9
         R9OBXeINCBjqj6PzOxF455p1WhcfMxvU7UcCKP0xVe6L1F5CbEHd1M6nXWvALtYkacTR
         udtl+zMqaMaTqi6JZXjCqRAViAshVdEZnvj+0vXj8FaxN6Fxjq/DY9vrU/0hx9oxG+KP
         mhz8b/xqit94XezaLxvZuhwx2BmtZbdoJr4c+bPoXpfkBIFJklN82HSNUzDx0sBy7lvS
         ES1sMAms0s/oy+n5HwSttmYDwDkTxplIum2uG7S7tlH9RiQe2CpugSPN09uGmP1cYI7l
         W/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405225; x=1795010025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iotswADUSSGHEiRZkFhuYUuQsdnE4S9RnJjUi0KsUEY=;
        b=BYGw9BqmUcCjdbcX5uZvAbKH6N9niHnIEGauzb/9KZZacytdHT3XRCtmtcP8zN77Ep
         MqRZuGMjwjnCF530qdPuFxgYDnXm7egRHcey8HRANRKGvec5SOYs5+QUP2Vql0AW1wp1
         Cl766B0ZvnnILDc2vpS+BV/v++qJB73HD03Q4azUcYHPeKqeokAR12CXI4BZqwjig3fA
         PPFlMXIcY0C2t/2c0Z1RkIQbo0z4YaBb0jHw9e5/EYSMuoI1Hnk/9L8hWkHTPjxzrh+T
         228AJop2Jl9F+Esz2EYqSIqzXdkEUYAO+r2ul0YyYFVJvKfm5iDr8iCRmGAsHp+mEaCF
         4Tvw==
X-Forwarded-Encrypted: i=1; AL+hErEmedQkX5I9H4m3CMM2RVoPmm5jXlXwiomO8TX+9Sb7vI3envW/LbgY2xjtVsEvPqWV0aTNQW37bVIVbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z95hSqbNkIaYdePwEoumrwCh565wSfouL6a0B0CMs7nKJ4mPso5
	P/qvGxTYF5dyMRNTIdXI9aeZpw+TpMF5JqQ8bOkG+db0tGQ1SwuS51CCwPgcQCPpO3o=
X-Gm-Gg: AYBFou0gyrZc96LZC8+sehgob8AMHVIdX/HZTvsPb731vHk2Y7pQlSEVOynV9Z3ueKe
	3/utGj+6eUrtvWM6m1Pw+xnmUL5mBZQIuyWvrxt7m04kvsBCfC0d12u/snqzNG5kmVfOpk4M39s
	uuTzWFCJT5gGGSBPlu87K9o0j+SfwT76W0puUk3hT5aGt1cBdT32awMFoKEv+znQWBOxFZInWl/
	Yb7/j+br11keWkzgkJrab9/fJLMCU3FXA8QSxAQSoZ3bwbSX7xAa6Lryn7rZ4pG6RDjfyRAxNkU
	j+TDXQzFr+Rxq0cp7w7vOyHawu6Qobn7qRl88v9vH5KJe2FFrszv/OFEr1nmLmKDcrD6exi+DIx
	BtUGtRX5NFz3NM1qWDGaJV/DS8BRX/MIZzOofaYKp//12c9Jfg9owNZ2QJui+dLp45ZU42Uc9pu
	7syGQhizB/bHU3TRvKM/Wlx2VgufxmHLYjbnPwSkskGWqvZEMs43BIHaS2hUfjQEJNI4uIT+mGV
	xdu6xcas4mZ5PmYViXu9mF6/Ovf6HYuSVQpIQMrDaCTlohnVXrliYf+tH8cgslF3fU5rdwGGY6M
	vtWTntY7rDk5CrxcvdS71BnZ5i+5DgIy6vk9sVWSh/Ns2xHUudzkLle6B8zmsCFKbiKapISu9k/
	Y2eik
X-Received: by 2002:a67:e106:0:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d5061cf3a5mr665976137.27.1794405225039;
        Wed, 11 Nov 2026 05:53:45 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:44 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: qcom: camss: contiguous buffers, RDI and CSID1 streaming fixes
Date: Wed, 11 Nov 2026 10:53:34 -0300
Message-Id: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Fixes found while bringing up the CAMSS on MSM8226 (Moto G 2013). The
SoC has an IOMMU in front of the CAMSS, but it is not described in the
upstream DT, so the CAMSS runs without one there today.

1. Loic's patch: use vb2_dma_contig, the write masters take a single
   address per plane.
2. Program the VFE 4.1 write master buffer size in frame based (RDI)
   mode.
3. Do not abort stop_streaming on -ENOIOCTLCMD from a subdev without
   .s_stream().
4. Do not fail CSID power up when there is no VFE with the same index
   (CSID1 on MSM8916/MSM8226).

Build tested (W=1, LLVM, ARM) on next-20261105, each patch on its own.
Runtime tested on MSM8226 with the same patches on a 6.16 based kernel.
Known issue: on the MT9M114 the first frame after STREAMON can still run
128 bytes past sizeimage; later frames are exact.

Changes in v3:
- Patch 2: added Fixes: tag, removed the comments, no clamp on the
  height (Bryan).
- Patch 3: removed the comment (Bryan), added Loic's Reviewed-by.

Changes in v2:
- Patch 1 replaced by Loic's "media: qcom: camss: Use contiguous DMA
  buffers", with his Signed-off-by fixed and Bryan's Reviewed-by.
- Reworded the IOMMU statements (Konrad).
- Patch 3: added Fixes: tag and Bryan's Reviewed-by.

v2: https://lore.kernel.org/all/20261109112611.94010-1-allan@fatecpompeia.edu.br/
v1: https://lore.kernel.org/all/20261104202313.72494-1-allan@fatecpompeia.edu.br/

Allan Siriani (3):
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

Loic Poulain (1):
  media: qcom: camss: Use contiguous DMA buffers

 drivers/media/platform/qcom/camss/Kconfig     |  2 +-
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 23 +++++++++++++++----
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 ++-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 ++-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 ++--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 ++-
 .../media/platform/qcom/camss/camss-video.c   | 22 ++++++------------
 drivers/media/platform/qcom/camss/camss.c     | 17 +++++++-------
 8 files changed, 45 insertions(+), 33 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

