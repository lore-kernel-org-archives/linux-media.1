Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34363EF0BE
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144726; cv=none; b=MeIzdiLOgY1YFxCongD1Ta6gT1m55bJkOlh/fk/3uCnOgti+KHbuNimJ6If9a/DyR6iNGE5qVscFZnvA1n4NibtaktDQtC+VUP12GS+rdGaKfu4wa/YK4vlS1N58zHV4/5FltLbkhvQF1D9c/X5hES+1RzMIWLlPHsHgUrHF5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144726; c=relaxed/simple;
	bh=JUlbSNC1c5FQufY/MtplDiQAm5ICexKVO8OpJNtgLGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6k2XSAPmoaTtFB3tnvLjBZru1i/jH/+NR8WvyvywIDx6kOCPaYNacR82C1DGBrxYTPfejDE8tqdpNeaQt8VEfIulB804QOCIxUcQUP8AJYNnqa5mBgQL7+vGQoQutIP0HHkAFFT4tJNDvq6Vwuys14pwcg9tr5op03nPNUwgOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QP12MHXY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QP12MHXY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso13850045e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792144723; x=1792749523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=QP12MHXY7ecoeptPyMKS6O20micJHk3FJ9k7RbLRZOgS8Gc+nFR1MG8Kehq4FKEgEy
         yO9MTAlr2NRWG3ZuPV4Im6oExbHMmXXxHeC44TmCiZde98e7YXEQzda+6Bw6PVtyyi62
         30bNSui83PAaVjAH3Nzg16A5nh4b7L7J6iikmbVl2l0kbiBdwEriVyLO68ZM6oMGFDbV
         fSsifhlhbOSxvgLGjj4VP8BPTqLeNk9JXsa/X1xdCI89UkeTyPEghhC7rIu/mMhN+Y9o
         4Iz5/AacQwKcj6Lg5MrPMuj7xTp1VQO0zXJzbxruERO7WIP3EQeM8RrD/DgssD60OIO5
         Nszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144723; x=1792749523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=uQo1Cv5x/BY2Dm4qRhdrTqUbDyTsIumGxb3Bv59NFOiPnxeNI38MsPhM5vcdXnWnfm
         yI0080hllQDUHDP1HfSQK7HC9oDwnriX63Hq2DnC4QHkFU5hVzghPRNL/zwPkBqwDmsU
         izX2BFPVuPNG+VD09uS0zOblZeJMhoht4w/SMiR7e3bS/MIj4obi8eBJ2eWDoPp5asJ8
         eYMHqEin4+quaDQzdAg1eC9N0CyXSaz7KTH8258GXhmiL62KwBDI7130JeBx3Dn4FMBJ
         y8sms2fIoHaBmgY+5KrQ2Kbp6CGp4wPEp9XRRpcBwvF/df2DisqpR9J2hRlDdl3BFBXS
         mCxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/+Hk1dP4qiJv5QavTL/8GjUYX+j3HLA+hSwoAAvuMC+25SUzuLj8ahRYRsaifeapcV126xWgLEQ0k3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoc1kn3ovqo53z7VpDQWZJ4zl+f4JcoWqfrFiPEQzGWG/5eXUg
	HFIrL/d7H0QaPM2RIL2j1eJAn4ngvAsTw6EXRs/PjY0pIxH3c6lN7z5R
X-Gm-Gg: AYBFou0hzVSOwvWl5i1MwzTwOZqxh2WHmiS3zWSMRcNeApCoG2x7nfWfDvd8q0HND0V
	vy+WzkwlZM62zQGz9hCy27mETZHUTZ21Iyk4aFvoB3AOpVAGS379ZEsh50JuIKG4xcgZ9Gb7FQ3
	GScXhRS7Bn5mqbOR0TuBN3V6t+W+jQZcn5r0QqU7OohxDCUJNS4Cq9AlQ4hqrxCvFN5qVkJf99o
	ONyZzD9DjP9+cszzy6NpV9t8+YkeFTv3+qCQFe8LIYOFuLxTkhqu4xKSOh7ilHHS4Rm6Poce20d
	boKtjzwl1wUYCfPL6ADpSK8vP2XsG+5M6wZfbJyYkBLod1t5tyDaT/s2RRRHlupqMS/tjwKnVnL
	YYj/HfFfgWx9nSCoPV3rRPDeiS+aY3iVsjff5a7oOgXB86wJkHJwGMusBpjZ4w6W/tKj1rlb1/5
	gq704Cb32l3l+j/vGuya7ZK24YcXFUQJsK6N2K8nC6vsluLDnfxWFh9OMyV1vn6td8YPus5idzN
	D/A8tlrcwSi5dl5x49c4918XolrFI9LsFlL6470aNc2q6t7EyfKvfESXSkxhMaFB5fuU17fKBSB
	Ew==
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr461974895e9.14.1792144723043;
        Fri, 16 Oct 2026 02:58:43 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm4133033f8f.45.2026.10.16.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:58:42 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 0/2] clean up dma-buf-io kerneldocs
Date: Fri, 16 Oct 2026 10:58:29 +0100
Message-ID: <cover.1792144609.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kerneldoc for dma_buf_io_init_map() and clean up it overall.
Targeting the Jens' branch where dma-buf-io sits. If preferred, it
can all be squashed into 

0d3120db2cbe0a ("dma-buf: introduce initial file I/O infrastructure")

Pavel Begunkov (2):
  dma-buf-io: fix typos in kernel docs
  dma-buf-io: document dma_buf_io_init_map

 drivers/dma-buf/dma-buf-io.c | 32 ++++++++++++++++++++++----------
 include/linux/dma-buf-io.h   |  7 ++++---
 2 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.54.0

