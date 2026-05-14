Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A77121638D
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778718056; cv=none; b=WlV32KdSYLh79+h7sTvfPfAKVs4djzg7E/qunTjhnpGxYoX3uG4aMxuDrUozX4mPpBYjzWpEOZWvIXZO077NHs6URhSBPkNCGlIL6qXabfF/mW8GW7biBvpGeTAKyt5llt0hhHu3aPwTrCqgj9QIjxdLVzIRdOORecbT6aXWN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778718056; c=relaxed/simple;
	bh=bv9X9C6ybvBXVMAO8U6jO4EDYmS8S3AlJGFSYWl4PTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u7ZuUUBaLVWqfEG1ekt6XA9B3GOOkljoaEKtpsWU3x86F2lho+/2gpj0X4YANQxP3YqWqHI2IHjANh+DwlXHAQk8BRM0CfBhHfS1ghwBsiOSc/nR5m4kAAaJcGGirmY6cDR6XM0FS9R4YhPcu/qgGH/pjpKeumbVSy7vG5GgkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMLRDoOt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMLRDoOt"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82748257f5fso5369133b3a.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 17:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778718054; x=1779322854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=NMLRDoOtQADaXjlatXW4cWY/7SiKGT8P3xTqlN1PjTVuaaf0ycwCTDYX+9/px/TEw3
         +74S+0Fk7QYgLHWDPp+LNVrTfXZ+37u4AL7wJUsH38WBYSbGhIsiGkk2OLnZW+/nOO1+
         QamTZ/T3XY186kx2QaBRJSdyvrqFBTBWNY1SAKS5nNbRQMBilkkuz1ixTfJXHdaaKv0h
         9b+PVlznyKv6SF3gmwCAlG4hyJ9KpOIWz95Hx44KhQr7WzzjsoB2JajLwcseRMuavHqp
         OEi4HDCylPC0Wvx39ON1yEi5RNSA2vguG9LAlB+THso0lvkAC4Pc/Z2r04L42Ut6VZ0b
         7jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778718054; x=1779322854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP4TJnoSOJJLQkWv+kPmUFMD5Nz5E/Le8rvbutXj/wM=;
        b=o1RV0h5qNMe7qleb3tmbUkLaf08RqmB9ovOvIq3nNz35FY4k5FgaA9TS4gFVlP9hRC
         RcoFAn/mZY1MEYV7fk35QdZHFPDt5BpbK2wu+xdNol6fKSTJ3rH5RjVSkX9QKYbf7TrD
         KVm90XoTrwDbrJocLCRR1NA9JNepmnvBYSTsZJV+NiNIUTZDC3tknBTrQEdHE/RFU9vy
         3w1dz6axkmZTKFJWiSfV8o1sBZwchfBV5TjSK9329QKx5tJ3rBiUK8GYMhmYkI7aYm+w
         5hRO/ZNVZmBm+NCqB/rZMyIIKBhxSga/zFIv1CoaselKfgl/FG8xpO80I+lKtspJb2Di
         g1pQ==
X-Gm-Message-State: AOJu0YwT83dToKRRj3WHyIkh99o7+r3hTF4kyjIPL3wNUtFgTJbzotHf
	N0sc2pCJkz7fcXXVjhQi/LUElMt1X67yIX+HrC0bVf13RiTNERNeasKtgMb9zImE
X-Gm-Gg: Acq92OHFdxC0yyGoYDjF+hHOTUxkCXaRs4+MxOQjlZYC4jquUliJX+1MSn/35rCEtE0
	yD78cEUxTWsx6KEgmO4KNaHRB0CZ1gWLQtnaP0rsLbkvKA8xMJQbVV+zf9nQnQNEH/SjzrZ0ike
	ydZ07LWCHW8uVZd25pqpoj7aNch+ri/EG0eVu88aZ+fJis749eMqh7vX70gAdhBJv71xHFkouyt
	wj/6iSawIkrLeuxcx5f6m9YIqE69nXZPpt7yx2CgyeSwZeQtteCzmu7sxmuGrErS0YyjXULSYw0
	R2AG1qcGY8FTAfCR0Gv9c0pbZvEsRjSfdBYivW5ESjIsNaopVKbu0x2qI/TrLwBRcE5P2irrxSI
	5YYzouhHbWo8DTi4eJnKoQkwqQFZfKxAYLDQfV3kgwgaPyKpQY40WEy3J+2WwwWc5pv9s07rp1s
	RCiJQhOoTV2NOVITp8gnL5LIzwF7CBxKuSJrqwWEuDJmkiOvO6ZtqB6dTsYcIjAY9Tr2N3RbQj8
	AipdT2sewE0ccaW
X-Received: by 2002:a05:6a00:10cf:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-83f18e6700dmr1291999b3a.18.1778718054293;
        Wed, 13 May 2026 17:20:54 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.102.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cca8sm668181b3a.56.2026.05.13.17.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 17:20:53 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Moksh Panicker <mokshpanicker.7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Thu, 14 May 2026 00:19:13 +0000
Message-Id: <20260514001912.10580-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When mxl111sf_ctrl_msg() is called during early probe, state->d
may not yet be initialized, causing a null pointer dereference in
dvb_usbv2_generic_write() when it accesses d->usb_mutex.

Add a null check for d before proceeding with the USB transfer.

Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
Cc: stable@vger.kernel.org
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..9908675c355e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
 	int wo = (rbuf == NULL || rlen == 0); /* write-only */
 	int ret;
 
+	if (!d)
+		return -ENODEV;
+
 	if (1 + wlen > MXL_MAX_XFER_SIZE) {
 		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
 		return -EOPNOTSUPP;
-- 
2.34.1

