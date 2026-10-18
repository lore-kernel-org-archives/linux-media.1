Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336083D7D6A
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 22:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364086; cv=none; b=IWl4HYSCKyE5SSxEZb9nLKLmwEadDaxYMGBtQWqd0+UmaHWaL9PQ0ftp7tSSCU5yv4HnxFxN8ymT608jc94MzTxNVYljUvE93AAOorKMA6jswQWbyeOw/sH58l/VvhvlzJLhZjSJDh84m9FUurzBqPNo8WnCw7A5J5ykSvBv6Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364086; c=relaxed/simple;
	bh=IK/EGbkpH+0wAwzTsB+OJLPZsQWdw/bwyK0e+62U/5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNBHLh2seLT+me4L/PZi2Tzl7SFviU/suMP0p9/VEKKuoZp7nvxLWd7dL63NFDYzjwaNRDvfTOY/xzXoiJXgmzQwCrs0MU9TX9ZwebVsqfOfSBh+6r8dv644OxJDIMR9h/EpSFZ9/p6FyY7RBpgkvGIu/ouNWWqvB9PJMb0vObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqvGyKW+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqvGyKW+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso981269f8f.0
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 15:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364082; x=1792968882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfKdzvG99A5J2b4eI5EDjag+BWAW3HaHussdspI90Ro=;
        b=RqvGyKW+Vga8xaUsexv62XZF6EflOuVjTsAhJrIEdzEVTOVizPDC6BypTxNkMOUNhP
         3JGWmxV22RvAIjKEGOjneJbpvD8NXr+4C2YclZJqdgQkejaCEwStHDy+6HvJPZZNYvvc
         d+IJ6uGslzYtcNifpuw9noBQeyFW7mmeK4xXI4YHt4jX2NSwQwn5LYT5da82rvlDWYgX
         t8esFQJBAJwZ7jhHwZJQgK6kvUa8xaJ8z7iZLGfMsWkN1OgBte+6iJGXcvrcJ4yr6RsT
         5DxsCvWUIZIjjydli58w94XYTmGQNt9lVZ/JL5mDp8AEhTwpzC3tsJGPkiCgF4Nubgtk
         PdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364082; x=1792968882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AfKdzvG99A5J2b4eI5EDjag+BWAW3HaHussdspI90Ro=;
        b=lrIyTK3o1GtN0C7BpaDhcx4qXI8AT9aJdtfy6YJKHDqm9IrWZzMJerG14MZ8LUPWbv
         l+V4iV0gCk94jo1NblXtkl0g8UL918KQgDSkROk+Dtc4s2Lx3MD/YQecOpl5exmKHAzd
         s7I7Z1X8ssfI3vgkG5oXj+8rjQqdQztZKEivx7T7PPK7DbGBG+H6K/NXXq4t1nUft4MN
         Jj1ZLAzD0r1bl27w6mpYcI08SVqz3/7eKPZWU0Oz8T3TPb9fuPZ5rDzbEJBgz6H7vJt1
         4lQh1vB3zFRjx2uKHqKJTUum/CCKEUMdtxmnTp1QwgNW4QX8eVcq/onehV2MsWX9MYQT
         DZBg==
X-Gm-Message-State: AFq9FYJIHLk4dSlfi5Ezj4B5nzVytiobIU7GUZUuODZXuaakc68YlTYg
	aIgIpTQIsrkLZt+toYtl6LDeF73TFLE12qsBkbrRkMmtMvSYwBUcYaM=
X-Gm-Gg: AYBFou32BVHsIryhiXQH7R+3+XbjCbWWqWvUK81tyErRB7cvqeogb9dGCIPG1n0WiAH
	XeI/pG50esv+obTYAL6zIv/Cn8WJBGsD/zRChGX09F/ShfBAUQyP6XoVAW0TZ8WPnqmoBn24lXB
	cNrEaHgHvxWC3nhvZjbXhXgtKbko4lRTthbRLFYU3BYK36ZMZj4wyjs3/HEwTufADJGgYDUOWDK
	eUzqiX7CWi0RmBE6rmU3rj/CEQtRVptvpwOSW4WE5YNqA7V57tqwMw792B1p9WjGZRIkED5D7Hk
	pgrmg3vcT/jpa6ZoWGEOasRjUednIgkVyDct1doO6K5g2v2B8pIJL9ZbPxGuqgTY315bdOdsWlJ
	B+Pgu9c0T0EtT2hAmxwT4gT1SJ41pZnIp51aNHdaNY+JFm3kecTX/IVxLH6L5rXkujOUagYvuE0
	B4ENZnF9XeTgme+ANFp4FA3Z2W2yNDs1717YqoZ5E=
X-Received: by 2002:a05:600c:c084:b0:49f:d6f0:6f24 with SMTP id 5b1f17b1804b1-4a1d75af414mr101286535e9.2.1792364082213;
        Sun, 18 Oct 2026 15:54:42 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e19ad17esm42257355e9.3.2026.10.18.15.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:54:41 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 3/3] media: au0828: require minimum isochronous packet length
Date: Sun, 18 Oct 2026 22:54:37 +0000
Message-ID: <20261018225437.2655311-4-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018225437.2655311-1-tristmd@gmail.com>
References: <20261018225437.2655311-1-tristmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

au0828_isoc_copy() subtracts 4 from actual_length to skip the
packet header: len = urb->iso_frame_desc[i].actual_length - 4.
The existing check rejects only actual_length <= 0, so a length
of 1-3 causes len to wrap negative.  The wrapped value is then
passed to the copy helpers as an unsigned size.

Raise the minimum from > 0 to >= 5 (4-byte header plus at least
one byte of payload).

Fixes: 8b2f07952345 ("V4L/DVB (11066): au0828: add support for analog functionality in bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/usb/au0828/au0828-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 3c53105f3d2b3..6cc99d1a2fbce 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -530,7 +530,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 				continue;
 		}
 
-		if (urb->iso_frame_desc[i].actual_length <= 0)
+		if (urb->iso_frame_desc[i].actual_length < 5)
 			continue;
 
 		if (urb->iso_frame_desc[i].actual_length >
-- 
2.47.3

