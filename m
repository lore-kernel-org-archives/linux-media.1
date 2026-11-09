Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223580;
	b=2h4eel+DtwjsIPgo9osVLigNJr6BmdqzS2TVSq5L8TQuE38fTz4vnI1D5FsmPJ9zw/wk
	 Ci5XrkCxuL9eJoVM1O3uvQ7uEn2bADzMaLrCZSfarKeAAdvCvIZLovEZtUZbuD1/94wPB
	 zLBKIzZfEa2Pidgwzysl2b7EN87EoWRv3EqX5ysw46VJ2bYXzfvFymKzuSEY8zQ/Kcsth
	 1/ANMkzuRP6ta/QF3gG7C4nrxe7HSuJiTjibaldHSTKx3lZ4z83Cqs94hK/7801IpPF1J
	 J/zrm1MB6H8imS6QdTJ5/RHaDPy1o/8vjo7OolsS3qkaOcJBKa1/moQV+BealXNpZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dNtLjhgObu2PN0FqT/rwaIVMj2e0X946qXdrYNXFUf0=;
	b=CByqZ66ckilnjo+03cgcKmhZ9GOU0JmeFDOFZZHVS8HDQI3vxEkVlteBJ5RqzO1Eoe5w
	 PsRHhjhOdT8LF8WrbCq5ZynTn2uXg73lFSpUdRqk88NcYC05vn0srHFmKdtKO/fTPTKDc
	 JRYh8LPFtZ/bNLb7/Vh/3n2wmXNxHHSb0sgb98RWWs6xDS+iF+lxSrBAnpMOsLinC4IGW
	 PMfTw89uM57C8bB/1JV700YdaAz2c34Bo3GQ+LjCF144lC8GDFx4TzAQ1CoQyQq3scwG+
	 07lKQK2mKZYjkkuStjZ07+FdyDRP8tc6A62QeX0QHT64U9xdA6bLoYoG7ykEVCnI7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cwMU7Vl7;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB25B606A32A
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 11:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB25B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cwMU7Vl7
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b33a08df33so5607817b3.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 03:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223577; x=1794828377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNtLjhgObu2PN0FqT/rwaIVMj2e0X946qXdrYNXFUf0=;
        b=cwMU7Vl7CG/DONRqv+abAClPlkALTsE5+RuvRltjGouPECQC559lKGnWKys5NzDnHm
         YYopORMwb+Wq5+mwBgXwkjBbYw0JLFM1JEXxHJlsQ4f1IDm30h7ABAFt/V6SICRO2Drw
         hXY3nHSFT2sdIPO32zCS05rL8SpsLNrfGwphxtAxIO95YFzsJF0rwO1Y+kecAsi+4xWB
         uhBJ7aLDK5zXgbswpOtEUS/OaPCznqwpy5ejtQ5Wa6ptdKsbkuSnqFzWx6u4tO++uyCQ
         CIWJvnupq89ZkG/k0RL94GjV9/D8pAwwP0Jgo3QC44P3R47kkE5KMXGnXrcHjjNbdaRl
         wuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223577; x=1794828377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNtLjhgObu2PN0FqT/rwaIVMj2e0X946qXdrYNXFUf0=;
        b=TUUXwDawrygVT3dos6Doj9LfhMKIxmMiw5wOVh/Dqa9O2uqG2PJMyH4aBzVBJyEX3o
         M25ur8isdZh0bXqdhLpNeecC5eMcMPcqlU8j8sCBjjSa9ZgjC5te/QN6ARK+EVctin5f
         3AReS1+0/hG9Iqwk3RSWEkkKwXIcfg44VPccbxTlymcMc56JYeECk7VxpVhgAY2EFmNV
         5Jc0ycQMXOfBBNfW0NaDUN0QYG23tutyhcOGctEUY04D/7UR41jmAEL+yuxuEt9Z6Elc
         PY/riE+V5Psw+0JyMBn4MAcMaAvVus7qY+mjYPigtZJHWKS6ppmNQVd2qnR/eOn4NlbO
         e+yA==
X-Forwarded-Encrypted: i=1; AL+hErGY2zNYkqZkS9dospt6u7NbJ/Ld8FysgPuEkNT1U963e5ipJsuQYqzseX3u7OpOtSattHcVveo4NQq0yg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xrQ4cmiDDpz/NmGcxWkbX3fF+ru7ziAAAhmpPAsPfPx+QqHls
	bwPIzJcMpX7s2PZC+PgZdH+KX4A8Zdnwt1496MqBQZwyLM5BbZLNAfYPvhbcckCNrbI=
X-Gm-Gg: AYBFou3HD+NqFEt7TM4A/lHbGXKxNNjFS9QKqQV9oAi9KXqOoEJFUTDCuKuKxvsPIW0
	rHPwdMxwCq+mDKdtX+H5B0lZ+kzoeXCpkvIZzp4btkQz91t7VHf+xA9qA1ujLA/EOxXp9gXCO44
	G5XpWNWp1JJzapWY0xLZaolozc+d5QYphCNGRhYPM2qPNt7kWFlSNJAr0Fh0v/qViNl+HIlAia0
	3gcbc/qlhF5ehvVN65Ijnou5HgpsqyDf1IqqvuWFV6FngOn4M3TbttbvaoQOAbLf1acJClhW4YL
	345EGg5D0GGXivoBlJ4rxwMYGy0fBrwuIvK2Zxwy/Bqf4Z2i5Gux7MA5/EAaAb5ZoQxb0pwX4xM
	w65cY9M+wZiBKJUQdiS1tQOAgdQeM62f5GzdE4+fEzv7C5aPjANzLDAyxdV+Q0bkHicHW1f8wM9
	RoBr6QOmfB9yT6WinGMyFYlwFMGMg7Jpce0PqizQiw3dO82c3lvEWyOJh5uOZXysRQanqbxsvLX
	MMHNB0OjD5jmuAASLNZjdXo+sNWNZBfvg01mEhvZ/uYfTyqaTcI7Z1jTI80RbMmSelY4I/ImwXF
	A9jme/CcKalC7+0PXrFFnRSD35AVfCQDCM19+IJAfn8lTGNk5uT1Y0W4SblTk1xN0bA=
X-Received: by 2002:a05:690c:6892:b0:8ae:b617:712d with SMTP id 00721157ae682-8b36c9e2fbcmr22297877b3.13.1794223577562;
        Mon, 09 Nov 2026 03:26:17 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:17 -0800 (PST)
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
Subject: [PATCH v2 0/4] media: qcom: camss: contiguous buffers, RDI and CSID1 streaming fixes
Date: Mon,  9 Nov 2026 08:26:07 -0300
Message-Id: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
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

These fixes came out of bringing up the CAMSS on MSM8226 (Moto G 2013,
"falcon", MT9M114 front and AR0543 rear cameras on RDI). The MSM8226 has
an IOMMU in front of the CAMSS, but it is not described in the upstream
DT yet, so the CAMSS runs without one there today. The MSM8226 support
itself will be sent separately; the problems fixed here are generic.

1. Loic's patch: the write masters take one base address per plane, so
   switch the queue to vb2_dma_contig for every SoC instead of reading
   the first entry of a vb2_dma_sg scatterlist. Without an IOMMU the
   frame was written over unrelated memory (on a 1280x960 RAW10 capture
   only the first 656 lines landed in the buffer and the device rebooted
   within a few frames).

2. In frame based (RDI) mode the VFE 4.1 write master buffer size is
   never programmed. Program WR_BUFFER_CFG as the downstream driver does.

3. video_stop_streaming() bails out on -ENOIOCTLCMD from a subdev
   without .s_stream() (e.g. the MT9M114 pixel array), leaving the
   pipeline started and the buffers with the driver: vb2 WARNs and the
   next STREAMON / "media-ctl -r" fail with -EBUSY.

4. csid_set_power() powers up the VFE of the same index as the CSID,
   and fails with -EINVAL when there is none. On MSM8916/MSM8226 (two
   CSIDs, one VFE behind the ISPIF) streaming from CSID1 fails with
   "Failed to power up pipeline: -22". Skip the VFE power up there.

Build tested (W=1, LLVM, ARM) on next-20261105, each patch on its own.

Runtime tested on the MSM8226 with the same four patches applied to a
6.16 based kernel, not yet on linux-next: both sensors capture, and
STREAMOFF/STREAMON and "media-ctl -r" work repeatedly. Known remaining
issue: on the front MT9M114 (UYVY) the first frame after STREAMON can
still run 128 bytes (one burst) past sizeimage; later frames are exact.
Patch 2 does not cover that case yet.

Changes in v2:
- Patch 1 replaced by Loic's "media: qcom: camss: Use contiguous DMA
  buffers" (vb2_dma_contig unconditionally, no contiguity check), with
  his Signed-off-by moved above the "---" and Bryan's Reviewed-by.
  If it is picked up separately, patches 2-4 apply on top of it.
- Reworded the IOMMU statements: MSM8226 has an IOMMU, upstream does
  not describe it (Konrad).
- Patch 3: added Fixes: tag and Bryan's Reviewed-by.
- Rebased on next-20261105.

v1: https://lore.kernel.org/all/20261104202313.72494-1-allan@fatecpompeia.edu.br/

Allan Siriani (3):
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

Loic Poulain (1):
  media: qcom: camss: Use contiguous DMA buffers

 drivers/media/platform/qcom/camss/Kconfig     |  2 +-
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
 .../media/platform/qcom/camss/camss-video.c   | 28 +++++++--------
 drivers/media/platform/qcom/camss/camss.c     | 17 +++++-----
 8 files changed, 62 insertions(+), 33 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

