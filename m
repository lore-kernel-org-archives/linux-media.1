Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F740861C
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338804; cv=none; b=Y2VLyIUgm1SqeFtRDjlmAGJEQsY8qTWmAMKCHzm0deV5VVzgPco6RRkllUV5eTwQt7/9Sn9LuHqXOfM9UHvXiQdiO0ZpBZymbzts9P4JY2PW8PLUfBcodkRiYJkykJTc74yI+/oMzja7vm+YW6DZsLO3Tx8WWiEFa0jZccpcNGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338804; c=relaxed/simple;
	bh=eGytTdZXZULcD8tqC1CIcwuk1WfKe2DbR8H4QTvYg9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZF1Ka9CQgr49uL0WiKaVAdihSjds9NAXASczaZRv6VNGgUpuC5eGvOZRmi/C2kul/eg1GkVp2kY/DSZ9MPVHY+gYegWlhg6o6f9yUmLfpZEwqw4fyHewXjF1xa5KlCrmuvoGoBAaX1ljODJCtizmkfeayFDotT9zNPIJXcyJuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi3Ba/kT; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi3Ba/kT"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-936623c6dd3so394456185a.0
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338802; x=1789943602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVY8bihuflumLCxMEbX45VPeeuxfSdvnGs8RzNDh+/8=;
        b=fi3Ba/kTP3Wj1IxUR/p7GByFp0qBIXhMhhN/yOrr/j7q0qWmDBmPT18/K5tvZv9JlI
         aFj/S03g6FQmIDAuGaT2+jdMieZ9iFT4uZjR9Uaq+0V5eN4pDoqspIJE55woHv8k6Tr/
         wrjMMJ13dcl27TNfg2IWJH9xdATx4SA/P4Hl6Im5iZ3cDQRFSJ1xiHSlTKQvbwcFZkL4
         0l7IaElExQXDVROrQcGqjHqE7KszQk/66YsXbEgPthl2kGl/+l6yju5A6eFuRBeuHaWm
         mOH6YDeIKKMzwTDU2fRMgQFQYEXuykLjuMoC8TYBRrJQbkhipCvknSpQI67+5N5sDZvr
         RO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338802; x=1789943602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVY8bihuflumLCxMEbX45VPeeuxfSdvnGs8RzNDh+/8=;
        b=ARISZUyBIOrOLXcasYL7e+V9UE4/sgoKgbskh9Io6pSrvW0dMPqtGCz5p2BvmyBHyy
         gzEzaNbWx4vVmZbRd2fRZXq/jvfxoAXyDilNHu2f6ZbuLj6Pz5S7EAuWMEZA5TsUt+JF
         MjJRfJVeLGu/tIpRZKW+oGOmIeKONA7OV1RjNogG/7DKK0LinzE3cMq4dTmFku94uJaW
         bEBbyw1hCAGZ5N9pWNlXy2LhIiGC2qfnvsIo+zl7jXuMKGxlgNDwkMghBKiWwkYj52Ak
         yPCMMXxLTUJEyCut/NoPlDlRBFAUkATjzgSi2+7fw+V0Fam48gtfANuG1ormR0arXUn0
         30yw==
X-Gm-Message-State: AFuF++nOWhHYALShS2BZaoNRHdm8QpxBN/LMa1D4rZdGGVePcsNVEY+1
	Y8rEefJekKWRAssLNEGbtGQHGrDx1l//Oq1V3U5TS0JNhePDwc0MVs7eUzQz6ifomndi
X-Gm-Gg: AYBFou2BDJNyxV0z4F3K+C9Bw3wVxGnxdNI5eRXaFaD7sbSnWQFYxdk5UR5SoXx/m7L
	/YxMrZ2DGWAHlUfPVUIIcwdy7gqAcnH027K2E5kiZBXewqSePxN/70QWNMvRVY9aZ1DEOIQH3a5
	l1Yjy85HoUCL+ZbB48pDfSCSJw+l2qjJutMcBREHnlct1Y7LksqTzw7RR0V/3F+bA185Aa5RmVD
	xnpIVI5aJOkHRhKCY4CqTHM4TjY93TWto8eIbK61CGIF81Sw2+yITtYBCYqeJ3VuHHkbCX02RoX
	LYOxDyIklNBvUgLr1zA9hPThcvpZP0XTEOTbqYKhiq6UCNuXDaFU9hUPyXWGG9OI6nl4zjE5JQ4
	F3JO01oh5vHlp204iOwx0TM94FCMVeLNzI4c1E+SOOUrHLQPxPuJ3ZVTyOg7xDibFAo6mfcSPqx
	IyIyTbDTuTX7wRk6Iy9Cs3d8tM0AbiPFAFhf/z7hNQ3I6TphgP/uEWIMo66Uh88kSJBgf+rU8mi
	v/0Tizlkh2ztgSE4jgqZvV70h1vAeIakfjk9ANUOMvLxe5Cqz+wgQRdrC/RkwWvzNXnnc8CJtZH
	MCgKAD5lWUWh9qvX2FtzIB8YUMlG+Vtc1w==
X-Received: by 2002:a05:620a:27cd:b0:939:319f:d6e3 with SMTP id af79cd13be357-93a18551fdamr367887285a.5.1789338801620;
        Sun, 13 Sep 2026 15:33:21 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm824019585a.37.2026.09.13.15.33.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:33:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: go7007: unregister the I2C adapter on USB probe failure
Date: Sun, 13 Sep 2026 18:33:13 -0400
Message-ID: <20260913223313.90617-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB probe failures after I2C adapter registration free the backing
go7007 structure without unregistering the adapter.

If i2c_adapter_online is set, unregister the adapter before releasing
USB resources so that I2C client removal can still use its callbacks.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 59aea928d57f ("[media] go7007: don't continue if firmware can't be loaded")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime or probe-failure injection testing was performed.

 drivers/media/usb/go7007/go7007-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index c0cb92fa6..b2bf24d02 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1320,6 +1320,8 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	return 0;
 
 allocfail:
+	if (go->i2c_adapter_online)
+		i2c_del_adapter(&go->i2c_adapter);
 	go7007_usb_release(go);
 	kfree(go);
 	return -ENOMEM;
