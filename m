Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079B377019
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143285; cv=none; b=aL9Uz4bekHwMaTiFZQlJ0yOuiXUegl6OWr1TJKgJwwp4oUx/Ww1k8quwCGqd9bcR6/VN53aMFG4k3GHrQlNSHXIAxWGQzpL9fQ844ihC0+jvAaVKRxb8oBErqw0Ix16bfPtZJq6K1wwBfZakYZz4ZrFmp1SQgDG66aYOmEt4gsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143285; c=relaxed/simple;
	bh=JUlbSNC1c5FQufY/MtplDiQAm5ICexKVO8OpJNtgLGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2VHUE7IIzDdeTsIX9gjORQ5/w1zFN+wc1WKU70StLW31CC0SjpwAPTcRlhRNxIB87ixMPzoYi9yEE2iMQW2bBZHaJC7y/iDwV51BIlmnsBmFhXMJByIKTeWjwvQ08l+PdQAkTZXco4SfmjGIY3+aOkhwun78x4uVcfTfiy/rRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it/WVlRI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it/WVlRI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so19948805e9.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143282; x=1792748082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=it/WVlRICN7GYa9bYEOPv5pQkKzWA4wAAY0XRDa5Us8AcPgs8YmvAUTLolepbQwlGX
         W6szYBW6KqpeZlDIVhu2gAaRW0Ya0kkfQ1b3t16Xx8sj/aWfGUTNG8wk3TA74ueDFQ+X
         3A6SMTm0bolmefUkMis77uM5vgxZUVMy9tZ2+xPTUwzwbbxeGuUMhThm9GtIofQJ5e6w
         JlQHobnLrhwalvV08AZUH/FxJh2i7pzi6sMVfQduyYmNiwLcaaeLwscNiWTLT6GN02MK
         4hEdxZkIDC79dIKrK0ElGFplyBKsKiscn2uU8+phOYC2XHH3oEw76g5nHY6qRHd6fc+T
         7U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143282; x=1792748082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymRDCbkPH0L/MN0wvzTktChP65Muw3EavSGPIzFh+rc=;
        b=AxgGDu90P7Ja6Mn+noRqWwQdXLvQTkJNpeWx9plwSYxBDVmD6H2R/jGBrXFLwUOWSt
         UZ0Rt7+NC/o022ptEY7GNazAiwZelYUMrNhNRwCVwAEePcrBpE/bO8GMFb5gaXvWpfCe
         8LaW/+dimrPshee2D8sRh9kvCG8I3Rb4xOVQmAmArEAJyXnbKM4R9xonROlpiTgitRIf
         8x41a4tfJn/UBOpIxAPUuisgCv27NDpdgxucyuzUmZM7zIZgrcaX82vuKtlfIMG9JUV/
         bRbB9s90CeuFt83ByaBQNwtvYUaPBRpojzzs52rw4U2GsZEpbLrP7t1jg2MLP4y0dVR1
         ghcw==
X-Forwarded-Encrypted: i=1; AKwUvBwJBQ9N4FnpyDQpolTtfbKXCtT+aCLMthtKJRXb6sX0r63iH0pjKaO8bdxAfqMgohRnZeveiWCG4KDewQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK4y/KwSra2+ZNkba/CgYGgivR5UKa6VdE+FIPCTs3QTwovy9fy
	iHe/02j8KDJKdojuSr6cwxcPpvO34Pe28lVKJfh1xB5ebJ0b/XVlwY4g
X-Gm-Gg: AYBFou33WQLfWqnlWB8Xx1i/DN9Wyr+Og9EUu//lkq2bPDOAN8YzF3bTV/lmyCFrKFW
	grLo6DHPp43UyyGlB37NGQ1/oYMSGUKIxrXXRwCcRjQR7hTFyMFUACxHJUFBNdq7X21FmFA1IXT
	vk0iyFccyKgBgCZMD3f1675JKlVDKIRZgd45kLeQTs+0rT8r0MU1VToAWeIDGmpmyldhIu5dL2N
	3GMgA8UaJYdBjPMRK0x/V2tFbkULQ7q8TGLKU1Q0xfj8tRF8cXo57KX1gCEu7cKAlcyQTm2EcXY
	MHqj/7/OpKlhl29s4u0lc1mHv0acbTJRid8qQbcJ9E5sHV1LXMkQf8w+LvBMiuVeP25ibSwLUhN
	K/41l0lP7ftzR8/1Au5A3ff+eyGaTtP/kCyGUbb2ERrsF6b7OiQGALNU19uFg9fJKZsFhtwlqrB
	Hhr33oOm2rkz1ddH/Gp44LLMxvgYJSKOdgzsaefs3IUBjYTpeMSw++qD4PGd9tsddAutvJIDzU2
	4XTbb/tzbS+R7hvHl4/V7zNrp5oXzCaCZmb42DRo+6lL06QU2wkxbBntwvnrRypDQ7rDkZ9Dl4L
X-Received: by 2002:a05:600c:3e8d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a18e4aecb2mr401472905e9.32.1792143281895;
        Fri, 16 Oct 2026 02:34:41 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6252sm63570615e9.5.2026.10.16.02.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:34:41 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 0/2] clean up dma-buf-io kerneldocs
Date: Fri, 16 Oct 2026 10:34:35 +0100
Message-ID: <cover.1792142927.git.asml.silence@gmail.com>
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

