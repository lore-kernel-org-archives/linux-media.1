Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDE30C62D
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778930655; cv=none; b=M70C7xFJHKo4hod8eojbR+uI+0tLe4pT4L/oSV9sqa96InJxHhzDhD9riSFHx5rb9EyLQAm2L2t5kEGLJg/qixgU7TVzI5To7vzGCUhq9UqYTvEi6vS2JdQ8V240UtZjfskaS3ep/BY4oqrYlymlC6KIVZ9ABL2OzI4BExRxmsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778930655; c=relaxed/simple;
	bh=ImpGRNEHYg+3sPy1LbebP9pUnBnWQsbptRi1PWqW9Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efzezMGHmXjEWbhB8VoG+r33XnBVp6UfX3ZxgeYDfAAczVN1w0YJn0XFpZyqv2ulvu4c9iUbK/VVKZPvBRVDafMh54wPm/YkFyxzEZ4SnnPnVpjstLkR1WrINEeLhebaC5F27LVU1lZpZa5efy+Z8v5Mr7Miu+8U0j3bW9KFUQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGtoJy9G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGtoJy9G"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so3119855e9.1
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778930652; x=1779535452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dww/lPRIYAdkQRXiPpybD8LE/hx1CCV39ZTfqjkRArs=;
        b=VGtoJy9G1KUPRjUVnOM3jOOyzgkDJphafDUUDB12wkfLOqmKLmSP5/uAA+y3UAnSI3
         1tgJmm1dLWMJmhP+rxx9qsUY88ggbGUTObPcAZH1qCWi55BOHBouxYSiw7J2J6EipetO
         4TxSRxGar8gc+IeKI3+z+tTE6TK5HVtRfr3xGUhZbh+3Cc0F16IL1t5i52IZ0fLiu07l
         DMcBhIpVQw2JlloIY8Wenwfdq7w792uWR2gD+HwEP3xfj6OMlPUMUODRS/T8LCjl1r/J
         q/JD8kjREY77EyONdX+zfwV/4PLwwmA+bFgBxETIO5gBCn2CwbQOoWCpYPrzJSaK1NE1
         Vblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778930652; x=1779535452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dww/lPRIYAdkQRXiPpybD8LE/hx1CCV39ZTfqjkRArs=;
        b=FL4kVi57IMeUJlrHeoUf7hnvAe2/OwRPNWUfvBMKdrpTkYbfGVDEiR/5Dwjn8k1iQ/
         DVDOTFtLLRAyczC9JGgjLTpAKP8VBcZplOwvCxZB+f8aClzZ4S6KE2fMpti84m2hVuT3
         2JBCkCLg1czI2kf9Pg31Qxp29rq5yvgVnXGw3BqjeX3a4SwtO95xCJvKFoXlMtHgUlV1
         sL4QmncoanXxfCYOw5DLqWdxsOICk02XI2Z69Vr2U14WBz8aDHrz710xfSIW6Fgp2prm
         z6hJa8VsACf7yiGg8yEWihLrnFcbyEXzkzeUNHgmdp4ZdRN+UzUAOcliWgWVmVZ4VykY
         yE3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9abfPpQugciCZ8UwHcob5XxwjY4N8fPS8k0ND5aBRTgFo9xkneigi0O7ayiPXlCYw9O1SzDdlCQtmQSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgKFV6rH3GNFTvtj+OkpDk8ssyOFk/32LqxBkJW1D/DoPmUxdM
	XbBb6mvfdaz/ygnc70Ti5jtQL5d3xJ12PxDms1O5jqqQR5jcQSZe+Cw=
X-Gm-Gg: Acq92OFkODTV8Ccebua/URaZ6zVX8wGuTgttqVSW06nWrNRukkqypahrA1POLeHWbOt
	EccUYDwqlQMUY7l4kKICokY5XNVrQLLmOT8hpJb3q3JR206TgvuEhqgBecF+5iAmUdMnr1VtcMu
	tStCMOAC0cKYaj13+eNh798Z+5Y3W/p+VTk83czsV9a4N46+s+HHr1O6u9t6Bn8fN2IOUfVWNDu
	iZeznyTdszFymxaZkFTQts3kQG3DClILe6j3ek9kbAH/Y3J1ait5ui1AVuko0xGLhKHzR+ivxlO
	/4Dt9aVHTl185K3q6IjgZVPToDa7DzJXB++wL3qnawHPYT4aYoGqnphwKJm2NQkX+yLFFzxJ09l
	OrMK1+hQxGpbtHRHjPLwYz9kfkN53m2fQ+qUijrDeA5WTdyR2PMRxosBeGy4DbN0WK8KjHpk4ef
	g4Rgk9UnC209Zkkix5j3INKMROfsMXdCsx8wDIh+60hU8PWXoeEep8ImGZdBJu1+OhAzrtzb2CI
	4+Tu8twSkMTISb46ffuFg==
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr43272445e9.7.1778930651852;
        Sat, 16 May 2026 04:24:11 -0700 (PDT)
Received: from archtop.localdomain ([2a01:599:90c:dba3:ce9b:8429:85f7:db09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm121917315e9.7.2026.05.16.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:24:11 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-kernel@vger.kernel.org,
	jakovnovak30@gmail.com
Cc: crope@iki.fi,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	skhan@linuxfoundation.org,
	syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com
Subject: [PATCH v3] media: dvb-usb-v2: ce6230: add ctr_msg check usb_control_msg of size 0
Date: Sat, 16 May 2026 13:23:55 +0200
Message-ID: <20260516112355.318-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the function ce6230_ctrl_msg, doesnt't check the size of the
control message that is supposed to be read/written, which causes the
error Syzbot reported at the usb core function usb_submit_urb after calling
usb_control_msg in the driver code. This patch fixes the issue by returning
an error code if the req->data_len == 0 inside ce6230_ctrl_msg.

Fixes: eebb876b0b8f ("V4L/DVB (11216): Add driver for Intel CE6230 DVB-T USB2.0")
Reported-by: syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=427909a2e3b2f83d78cb
Tested-by: syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/ce6230.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/ce6230.c b/drivers/media/usb/dvb-usb-v2/ce6230.c
index 7ebaf3ee4491..3152a34777f9 100644
--- a/drivers/media/usb/dvb-usb-v2/ce6230.c
+++ b/drivers/media/usb/dvb-usb-v2/ce6230.c
@@ -23,6 +23,13 @@ static int ce6230_ctrl_msg(struct dvb_usb_device *d, struct usb_req *req)
 	value = req->value;
 	index = req->index;
 
+	if (!req->data_len) {
+		dev_err(&d->udev->dev,
+			"%s: cannot send crtl_msg of size 0",
+			KBUILD_MODNAME);
+		return -ENOBUFS;
+	}
+
 	switch (req->cmd) {
 	case I2C_READ:
 	case DEMOD_READ:
-- 
2.54.0

