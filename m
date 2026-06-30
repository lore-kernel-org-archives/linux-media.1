Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D08E3F1AA3
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816634; cv=none; b=oe5iK/DhuOCCT9J0s1R8CGvROkQ8av6IZdRoO44NZCCoHSZf4p3R1I1T+UFA28jldY4MPyFCs7bKfT9gbuHhKo/yMXenHizL0dffKJpYk4CYlhEYp5hYWSD8QVQ27jGEHZBtWYRu4qfFFk/kZPvBBZpE10B2Qao0mpOnSjmZ1qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816634; c=relaxed/simple;
	bh=wk13lislPNEcUok9medYL6UexS/2OJaOa5j2saMnHTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTuOza2ZbQ5vOPLtz9z3VQwJznNx2TVKxewH4elPWzMbyhAS8aHomn9oxfYi3O0NWMYYwlUvULCHIc+BLFmbccBJWXW5TxKqwkZdS6pZVMc50EIiVR5H+VNNEHrB1RFsGn+txPC/nzWhpqqKcjJKJ8g8R50tVKbclZAV4NUyan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRDmPxJN; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRDmPxJN"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-809b19a7f25so41573267b3.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816628; x=1783421428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzyaVcX9I6ab7V/9vxSAnIqopF/nmhkEPCSpm9ZUuOY=;
        b=SRDmPxJN/ndzQ/tMxlksg1s08L/6DSq1WRjJQK5aSaLbWAFqJHjh976tz4Al/vdG8P
         EiUiFM7DyKo3iUuXK1mkXPa4fB1lGU6ugLy7csOy+pcNcESBWiFeymqMrzFSdGd4ELM/
         wSfEbCcWNdoiVLa+KQErx+Ku9TlXdPd64D9GqVc88S4IIZ97a+RK754TkbTIn+xBd5SL
         FL8TQbUBYHUdRsjFK9z0BsxuxlrJavEvSiZi+kr9OIycrejGaJy+6EtPvQ8SUSo3voIf
         BsfwW4Ym8JJGscHb6MZYxtgc7zuBkK4XP+wawDBD0eWKelXRxp52N/EsCIRGaTdE3UJG
         S8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816628; x=1783421428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzyaVcX9I6ab7V/9vxSAnIqopF/nmhkEPCSpm9ZUuOY=;
        b=RNf5loTqGzhwuKooxPxGAkk1kIWKa2DoKv3qChdT1c+KhqKSdw2v5yIqpYYI/M5oaO
         FJ2NZODYr6sxZfTYv3uxmi14hYNbfK4y+4knpjVMn2nkJAGQAh6cQ2JeqKTLKR0YIc4r
         0majvCveOW0RtHRcucYVRi+sxgIRm6PtwpksaYsd/RO23u4WMMrXDhXJR7ZmVd2W8MIn
         EhT2T/Pcz3MAe0wzbsTg+WBRn0NzY042Z0vOe+bQzV3nxdscU3NsR8KSeB2zob48fiXg
         Pn2J3gVofHNXOMdWNUqCmrHLHWfKggDgLduO6ueOWPMT1H0DANyY1NCSEtdg9lWCQLa7
         Selg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9KTQJ4K5gYEDrzk9sVjsAGv24lBbkd6eGroOEII3SDZ0RndGEb9skD4WtXP9LfKAsGsE3NTaLCzgKCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKgz7q+QVMmbzxF1LAnFGogVQdU6+sTs+iHaGyulha+K5bbDn/
	nJg7tUyjQoPViEZqd0m46qwJjH6F4KNeIfxMOIdTXMbfhJWhu6+VJuIk
X-Gm-Gg: AfdE7clrw5Jfd+dUI5BKcRyOndfB6mIXguFXSomtyqRaKTFF0qfTGh4kn1DhZB38KY9
	fL7IDgbY5Ps1OWWQ6gR2FNcfz0nJYzA9vgKxuYEkBQgB/2ABoc3UJiUNysiTpke9LzCc8Y1580a
	NSFsNIA7ZcS7e5fsO1XDz7exTidDdSJCRzpEVzVIIgVadruKI6sL7gzwSr6wzanzg5Jiv87Gzpq
	off+VK2G8SVoYxSB2W3IcUYtLr6g7+loriqBdmuJ1/TDgj094ojFaE2h0oZVK62h8wAofZEYYsM
	mhptgrp42f4rh4sIAyEJ1y8o7heiRnkq/919lZtWMQ54ANrV1nUrIugEzZ1uxqQTXsTbUQm+u5B
	Ycw1dr5e6WErzuieLI3OcS9JWeg6GIAKc6/jRSbkchuaTzRhxIXcZFvaYVmpWCjKqMpq1P6eiLX
	C1kUl3vD3hHfsxYnXKltkS40Z+4g==
X-Received: by 2002:a05:690c:6106:b0:80e:3d45:5206 with SMTP id 00721157ae682-810d7ec8875mr35397667b3.18.1782816627725;
        Tue, 30 Jun 2026 03:50:27 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-810e7288999sm9288737b3.7.2026.06.30.03.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:50:27 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: go7007: s2250: propagate control I/O failures
Date: Tue, 30 Jun 2026 12:50:15 +0200
Message-ID: <20260630105015.53932-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brightness and contrast paths use oldvalue after read_reg_fp()
without checking whether the read succeeded.  A failed read leaves
oldvalue uninitialized and can write arbitrary reserved register bits.

Return read and write errors from every control path so failed hardware
access cannot be reported as a successful control update.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/usb/go7007/s2250-board.c | 54 ++++++++++++++++----------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7007/s2250-board.c
index 0901d79e827d..d11f8e723624 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -365,36 +365,48 @@ static int s2250_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct s2250 *state = container_of(ctrl->handler, struct s2250, hdl);
 	struct i2c_client *client = v4l2_get_subdevdata(&state->sd);
 	u16 oldvalue;
+	int ret;
 
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
-		read_reg_fp(client, VPX322_ADDR_BRIGHTNESS0, &oldvalue);
-		write_reg_fp(client, VPX322_ADDR_BRIGHTNESS0,
-			     ctrl->val | (oldvalue & ~0xff));
-		read_reg_fp(client, VPX322_ADDR_BRIGHTNESS1, &oldvalue);
-		write_reg_fp(client, VPX322_ADDR_BRIGHTNESS1,
-			     ctrl->val | (oldvalue & ~0xff));
-		write_reg_fp(client, 0x140, 0x60);
-		break;
+		ret = read_reg_fp(client, VPX322_ADDR_BRIGHTNESS0, &oldvalue);
+		if (ret)
+			return ret;
+		ret = write_reg_fp(client, VPX322_ADDR_BRIGHTNESS0,
+				   ctrl->val | (oldvalue & ~0xff));
+		if (ret)
+			return ret;
+		ret = read_reg_fp(client, VPX322_ADDR_BRIGHTNESS1, &oldvalue);
+		if (ret)
+			return ret;
+		ret = write_reg_fp(client, VPX322_ADDR_BRIGHTNESS1,
+				   ctrl->val | (oldvalue & ~0xff));
+		if (ret)
+			return ret;
+		return write_reg_fp(client, 0x140, 0x60);
 	case V4L2_CID_CONTRAST:
-		read_reg_fp(client, VPX322_ADDR_CONTRAST0, &oldvalue);
-		write_reg_fp(client, VPX322_ADDR_CONTRAST0,
-			     ctrl->val | (oldvalue & ~0x3f));
-		read_reg_fp(client, VPX322_ADDR_CONTRAST1, &oldvalue);
-		write_reg_fp(client, VPX322_ADDR_CONTRAST1,
-			     ctrl->val | (oldvalue & ~0x3f));
-		write_reg_fp(client, 0x140, 0x60);
-		break;
+		ret = read_reg_fp(client, VPX322_ADDR_CONTRAST0, &oldvalue);
+		if (ret)
+			return ret;
+		ret = write_reg_fp(client, VPX322_ADDR_CONTRAST0,
+				   ctrl->val | (oldvalue & ~0x3f));
+		if (ret)
+			return ret;
+		ret = read_reg_fp(client, VPX322_ADDR_CONTRAST1, &oldvalue);
+		if (ret)
+			return ret;
+		ret = write_reg_fp(client, VPX322_ADDR_CONTRAST1,
+				   ctrl->val | (oldvalue & ~0x3f));
+		if (ret)
+			return ret;
+		return write_reg_fp(client, 0x140, 0x60);
 	case V4L2_CID_SATURATION:
-		write_reg_fp(client, VPX322_ADDR_SAT, ctrl->val);
-		break;
+		return write_reg_fp(client, VPX322_ADDR_SAT, ctrl->val);
 	case V4L2_CID_HUE:
-		write_reg_fp(client, VPX322_ADDR_HUE, ctrl->val);
-		break;
+		return write_reg_fp(client, VPX322_ADDR_HUE, ctrl->val);
 	default:
 		return -EINVAL;
 	}
-	return 0;
 }
 
 static int s2250_set_fmt(struct v4l2_subdev *sd,
-- 
2.54.0

