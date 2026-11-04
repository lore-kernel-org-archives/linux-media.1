Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823806;
	b=wO/LDt15NogVBfdcGoTscH2BneuiBfhgKtyzhQtlSlG6cm4+35SD5UNJ2EK9fHljUHep
	 rs2KP1BE28qwURy6Yplc6Xyq986f2SQnkc58Bajjxxq/NgoPwTrAEC3Pdk2llr2cfdD6o
	 82kHCGww5HjHRk8zdA5GkJhtLol7C1atXqwmd10WkfUeG/9kIReihWTJxmUTs3yhTsekK
	 cwZwgvvGAVyEIf5RNp6uLl+NGm1OFii6Sa8F657HjGADpmASS7IYeZwHVpwLE9i6Vo21m
	 Yy9JWo0QvIVzukH/2oCxTFHdRT8MwOukiOONct7I0LqNeyvSjvmnxyJdHc/rl8Z9RVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
	b=G5GQwJTJ+eVEkkkyfLlClgfX9lUQTKRf3/6neuw3TbhqKp+Eu6GnkQwQjs1ohiJiWTT7
	 O0eFfdUA1cE9kGKi6w0mYV/04Xddz3IalZKHdocll1D537XwDBM2kS4ygwvsh5Bur7bq2
	 tO3Jog2S72PaXUgwOpldI7+CxNRXfMINRJ8GlkK1ixMSkregVDa98UJ40YUGq3J6GSiXe
	 rI1gX3B3Va4XhspajvCFNhmFVWWK99XHLJJMYFoIne4M1kk8VQjGt8AJz8htUWqrXcATm
	 /8S6jjr2YHEmRjPoHjlTXebCLolaeqKKVkfUYAkgzrPM2cqTdhOXEnBo+iPyhzlgJRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+TomhfB;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E465E6070308
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 20:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E465E6070308
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+TomhfB
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67999045530so1142495d50.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823800; x=1794428600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
        b=j+TomhfBAaKVUi75g2hFwXy80DA2hHOKpyyOCjlerB6w7qOvX0K82SYVW0B1OMQZQk
         4seWrqB4v/ga4ZVzEqiXjHqfcj3Tt8FT1j5OQpFmImIc7Jjd/Zx14xvGqsYLYWpHFmFR
         zF1go7sn4Y+Z2dk9BNECnIQhpT6792Q2s8qaSasJbUOL+r9wQ2vur6h9ODHcyEw7hBNR
         xeg3VA8opyCHP208kGs8krToRuYv/U7XZ3Ur681J/lhP3TPzszA87EbuaQSof/gvftqB
         I7CzXRiJi+zGOObGPW+zsQIBYKS4voMPgePcXQQdoqhwCO+tI78RqQfozDv+1qiTvyYd
         eddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823800; x=1794428600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
        b=nYrbZICh5+CtxK0o1QH9qE1vdk90zzMytEldy49qfvXZ61U8iXYPqnHcRgAyK8aCYO
         SOkh27BvuWAl5qmPSP1eATwXmfqQl9dCLhZHmQZ2ERfp3TW0XekWYfoMzD6HlaYZ+aA+
         9+Jad2MOtdmlFWGCfItxBgr3iIgDJnTO2m8OYxLD+Wjhh77dbmzPQvFH7prG+nd95UiT
         +NazAd98+CDa+/yZcLgUnv3IyJeJtL4hFC7JkZRJ8mbQNtfBubi16OqEvxb4G0h8BJQg
         Ix4gGqOzqUKkJnGUx7OWp9q0RddDj3FZPpN/AEL+Z8qJ+5X7GZkXIMiZ5xGaDUMns5oD
         7ihg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ4PHJMBLd+9CvMsXAsFNTD+dzEF+VUsetUfwOe71t2fcTvxc48v6M/s55bitMgthWVo+sE5EQMBwvqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z89PZwRc73SL/NV+L8jW4qsITskRrhS2cNim6Fr+VjYPnQSKWSp
	DRFWEEJL0G9Yg/zVQUGmR6x8rcvkbUtNt9fcnpqMG+a2ii1BP4ytmJJn/KooEnULlCw=
X-Gm-Gg: AYBFou36vlmakm0YMB/dvtgfbZXqOf6SvvcDBWRs/UZ3JK2P119ZqVN+mvsQOKA7O4F
	uRGEfiwxq4TJPLPtRykPXSU4h3N3CnbvDeMSzHTcx4JEvHnyWejEYSAaFPoD95MXZX/0L7rxqH9
	A6jD/geK5SolGXZ/hWG7yH4wvlsSDfCVglE1jp1oD54i8MYqV3PyQvJtOnnDbkmV4JQtD9urHzc
	u10Yh7zt/7vDu277ri00/k5OGKMqtEOS70gYXUIOK939rsf0SVLNRUO/7RCNn7wvCwly1SPj1cw
	MYmQn7atsiZ4GDw9R/Z4BUYXyr9jiJSjc2e3dAQ2vT3iH9yQg1KK6ODS1ewSnh0Wmn1w7K9R6XC
	Pnkd8OFGRk3yk0z6rjSoDJHMsljhXetdWng2TFHFNWLNu7dAPnSLbY+zgyaKeBsdp4RQ7LDxnbB
	QlTGsOAUtAOFElp5Xirr30gLCM+O4ZnN+KQjZsLzFB4M2Z9bmJc1gh/I1DMraKhb64Duve8AEpa
	5/hxGcDwhyFh5SPOAwS48+cwlmJ2bS+xftGXWwDMZS5rma+laxsDIaof2zXpgQ3lrYNBpMjCITh
	/Z+DtNGpFaGUhS4ZUOXQRUXIcI2aj6AyTP7oPZe3wFnxmMv64wYBqzuGuMe4roFteG4Puq8z1SZ
	p4pI=
X-Received: by 2002:a05:690e:1686:b0:67b:e1e4:6766 with SMTP id 956f58d0204a3-67be1e46985mr3226996d50.108.1793823799719;
        Wed, 04 Nov 2026 12:23:19 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:19 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: qcom: camss: fixes for SoCs without IOMMU, RDI and CSID1 streaming
Date: Wed,  4 Nov 2026 17:23:09 -0300
Message-Id: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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
"falcon", MT9M114 front camera on RDI), where the CAMSS is not behind an
IOMMU. The MSM8226 support itself will be sent separately; the problems
fixed here are generic.

1. The write masters take one base address per plane, but the buffers
   come from vb2_dma_sg and only the first scatterlist entry is used.
   Without an IOMMU the buffer is physically scattered and the frame is
   written over unrelated memory: on a 1280x960 RAW10 capture only the
   first 656 lines (the first 1 MiB segment) land in the buffer, and the
   device reboots within a few frames. Use vb2_dma_contig when the device is not IOMMU mapped, and
   refuse non contiguous DMA mappings on the vb2_dma_sg path.

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

Build tested (W=1) on next-20261104 for ARM with COMPILE_TEST.

Runtime tested on the MSM8226 (Moto G 2013) with the same changes applied
to a 6.16 based kernel, not yet on linux-next: on the rear AR0543 (RAW10
1280x960, CSIPHY0) every buffer gets exactly sizeimage bytes and nothing
past it, and STREAMOFF/STREAMON and "media-ctl -r" work repeatedly. On the
front MT9M114 (UYVY) the first frame after STREAMON can still run 128
bytes past sizeimage (one burst); later frames are exact. Patch 1 alone
already stops the memory corruption.

Allan Siriani (4):
  media: qcom: camss: use contiguous buffers when there is no IOMMU
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

 drivers/media/platform/qcom/camss/Kconfig     |  1 +
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 +++++++-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +-
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
 .../media/platform/qcom/camss/camss-video.c   | 78 ++++++++++++++++---
 drivers/media/platform/qcom/camss/camss.c     | 17 ++--
 8 files changed, 115 insertions(+), 29 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.43.0

