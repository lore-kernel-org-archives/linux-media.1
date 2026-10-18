Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB53D7D72
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364083; cv=none; b=CjRHDS2/Gi9CowPvBA5nqTOuQ+A8XPX+w4zapbMLBULrA0RTpdrLbPTgeJfhXnWv+ybKzv0LlOhwGsmHg3OnX5B9H51XBp23efxJ/r3KzxwxPrQWpfR1OpxhT9MHdnbzc/GahII3175syGCM51/RyYVwifybZgF8r+4OrHICUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364083; c=relaxed/simple;
	bh=XYhSvFA7CBE5j2HCUixLblDFjVWyrOA3uBQKm7vadDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJ5luKZPlVkx3kVZMm46cBgQahMIXkSeWN4VE+KTZDjQDO/0fbZ1F5nM2x/FGTPu+3Bmn+MlNJ/5hE0GDbP6pUbSEprU/V6LbXomBrggKuJBJTZSa1PbpCnSxYmAWq365Vd515d/tlyr8vhzE07dMFmlO2RIjyAaekpChEeFI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdnt1SQm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdnt1SQm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso777330f8f.1
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 15:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364079; x=1792968879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1kgUc2g/VLG79PKdhTxP86IrE7Gw22NMZrvrz31EMI=;
        b=cdnt1SQmdLpQdw4/vsPLYrjkdD8r6sYDy4++rdwleAx64mjKe/vn1eFlfkn5GBxr1B
         4JoQtVHNjqbtxqn3Z99sOf4E0MAkDbLLc2oDLmVZsQ+iw12SZsl9J5F4AzjXjrSJ7RhO
         hYnFjqZOV/qxag0gTy5W/M8QttJLXx9WFQEX+fdrwUSQxYHj+WsLMUHTxTO8kXsiUeoy
         gmnB5hVnuqRPxPOQDa4DeEEkhE4jNs1T+tUX/7rVa8dCsqaFgJok3nzsQm0twcbpl690
         gzi8XXk6//eLLOUdWlASm1q9AtIl4Q+Wxz3LJ+ieCcBAsrM44/CyeiipK0BB9sRKAMV/
         z5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364079; x=1792968879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1kgUc2g/VLG79PKdhTxP86IrE7Gw22NMZrvrz31EMI=;
        b=EnUOmnZU860YABihMNfKF3FBnIGHUpin026jmBBnZT3GPqz1Vayk6LMrhtaTyn5Uz3
         Agg/GtsbHWNFMW33l8NS3p3/xijBittWPIuXvSkz++XqkMVibVzXs89cdavM04suq00N
         ixBvF3gnO+XThBF9yZi8C01y3iPsOAn+8qxm75dl/dz7GoNl/eEYEHmF8rhgytu/JqO4
         /Al0H/XR6Cpmehm8gLrLlxdkK/0pAC2KSWh8dirSlXsdg0fHw6Mduf+VGIWea5U8s3Jm
         JC0pU9rcrkT/ruASI5HNRG9UwdfUp6l5hFxg95RKmud66s0NPInwDZo1ET4UIEGdeUCt
         ESqw==
X-Gm-Message-State: AFq9FYI+nIabSPOCzVbn7wfN5z3iSUqNrfczkuAqqPuSzZotaPo4LZnc
	yvWfadhuc/IAQzFOL8Tu70oElWlOMeWwxBnG2SJ65Lbh9U+SEXIJDWw=
X-Gm-Gg: AYBFou3LzvN+Yim330BwnwolC0bfEuEVXunIfkaj9qwiThrzY2XcCYiuB7Gy/oki3OB
	sLL6TGq3G3ckEnErPzVjz2qWfJ+acqjLDRNEtykdUU6shjXUcaUK22vx+gy4qbmGavkhs6ImLGt
	eq7Ph+rY85EPE027QCuFl6ULRhjPKImpCQz2BK9MzmGLOyVhdaYgFy8hUs5k9AF6MiiLZw99fpN
	O9y0i2NpxSFV/e78TcgAdJTH86mvfv+/JjcTVD6H9gj+Icob8PDe6UspM8w7tvgYx9awXb3j1gX
	wgFCGnUwj70NrVDaHbhq+O5DoHc+nle6XqDehvRWVr/20hvMD+j7ycKI/ETm3OgQzHqW6n2LW/n
	T/zrLWxJ/BS4sEUiJLQIyItIrVKlA98R28cpFtVlPmBrIuHj+qedxLC8ynU4Cj8UPuIrs0oVIcc
	pwhdYZNTQBHaWAF85yG9/slLpe/iSYYdlW0v+CDL0=
X-Received: by 2002:a05:600c:548c:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-4a1d7610f2dmr127399005e9.20.1792364079193;
        Sun, 18 Oct 2026 15:54:39 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e19ad17esm42257355e9.3.2026.10.18.15.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:54:38 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 0/3] media: USB: validate transfer lengths in URB callbacks
Date: Sun, 18 Oct 2026 22:54:34 +0000
Message-ID: <20261018225437.2655311-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

Several media USB drivers process URB transfer buffers at fixed
offsets without checking actual_length or iso_frame_desc
actual_length.  When a device delivers a short transfer, the
arithmetic on the length value wraps and the driver reads or copies
from an unintended memory offset.

This series adds minimum length checks to three drivers:

 - cx231xx video: isoc and bulk handlers need buffer_size >= 4
   before computing p_buffer + buffer_size - 4
 - cx231xx VBI: same pattern, raise threshold from > 0 to >= 4
 - au0828: isoc handler subtracts 4-byte header, raise threshold
   from > 0 to >= 5

Tristan Madani (3):
  media: cx231xx: validate minimum transfer length in video handlers
  media: cx231xx: require minimum VBI transfer length
  media: au0828: require minimum isochronous packet length

 drivers/media/usb/au0828/au0828-video.c     | 2 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c     | 2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c   | 6 ++++++
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.39.5
