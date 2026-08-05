Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF243FD130
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922465; cv=none; b=QnEeAXYl46ZfFzwjG5RnhUdUcGp/w6IXyt8+LTeHW0977X3zCL5ZTNMmmiN8BMdmFIyVBxIswtYiUOO1t2WDAOWTa6KmgCWjC2FX9YDLaXEIz+6UoZYx+oCPy2Rk07ZdQxTabBIUYWuR17qddFpL7nqSA+a3dgTByx8zRQgroGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922465; c=relaxed/simple;
	bh=yOwOwIEtLYmzE1+oHow8xmedK81qWff6udPxzAGjotk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UDr28eKgiA7bbt/YGjwYAcniwqNKUYYG4aFCJeoAdVpNVDNTO2SfvkP7mI92vDDkoi9046iTPmAE1p1sfJBRMqW/cqSJqhpDL7KwPDJ+h94Q2FCp25OMBBus2e8u1fmGajYyrK13pkvusCzJsy0mW141xXpx2K/ZppgRtNY/Clk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCiF+Gwy; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCiF+Gwy"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso743489a91.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785922461; x=1786527261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EpMZ5BFR7tuaumWIHL2wnQpR+9/jOvBHxCGkfKj14w=;
        b=kCiF+GwyiFB0ksvajV80QjyBvU36yxhvOw0WkKRsMaXfxwuuXY3VOdyo23PcndQPEb
         U6oa94TeWK2oRG9pBTENRCBPe/E1VKgQ+Uv5prBT1yMA9Hxg4t6uHq5N1naA/1iFTN0t
         F5YAyBoNpVSoGXYEAA54DQH4IL1Si4qytYcTrhnv0yxOdqWPBi1QSH41HW9jSqKZZk30
         augz1Hzhb+Ul62pxaJcerU+vnqSZsAd9jkisrfNpiCimBzIHpPvAhiK3iE3ruyDYYgKj
         GlfjFS8EFHPE/vgMdrojmOVx1JAespxcI4YSuAIU9UKZTKEOddGIOlLEVu4q98uJpOr7
         IPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922461; x=1786527261;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EpMZ5BFR7tuaumWIHL2wnQpR+9/jOvBHxCGkfKj14w=;
        b=tGrRsQ17yWhxr7Lrn8OIN/cBzwZ7+SNGwHgNbvE7Iqrlol3QHAAXOqQ02XaqBXP3IJ
         bATvOABU2jpAS0r3YBs9u6eyc16REep15WCd1nh0LBGwD/5846oXblBwo7UBBRlHyCYU
         SXzomcuMfz6K+hD2viawwnlTlkrwmg0ajr+WzrIfbdJ9XuiukW09VaDQ7vyQ8P3kknRO
         7309ZzzhydWjXKhxKRsTi8fiPzxCnXA+jhbZmf0tVi25Bk6LdFaFAjswXjwotht8zKap
         H9EqyiWDpT+oaP+ZNmfyF6YsnKmnNV5GFLGozhf52JakY/bHOsFC+iWrL4ZdZyuWixU6
         EVrw==
X-Gm-Message-State: AOJu0Yzg1bKYi88r5xv92aPDeoZ7ihuU+/zsVsqIyVDNZPx1NXZhCnh6
	bASxhaOIWIRXvirXtRo4CGAITBwscuf9IhL7cOFYHV/qqX5LNJbUPikR
X-Gm-Gg: AR+sD13YBwtevmm8GCbw/FOfEIZjMBndtI8LYdR3sbLwieySTBz+PgKaYtzodhTujm2
	iRj+de8j0+SsKICjoo2hzsG0FUVGRNuiZR5dD7zYGkOjYSP0taxuQm6EWBr+1uCRJRxlsEHAukY
	156rqW+q97nXtRO95Z16NBTPGEjAiuORTatnlgapLkjGGnmcgOzATRA4pXSoiRRPunIiwrX+76S
	cFMeIa19Izsxy4quITZe5boAzImm51nV4TnLWcCBrwhhkvRjp49H0+MKwgpnhv+Ub4ASJMgk/81
	7oUXOuG0z42uiyFK7so6aRh/EIbmYBEWHz9J1sPhUI2xp/eON8WQHde4K4vYdIdpCMomDeiHnhv
	Q7ZtB3PSpGTyTNKPTvRb2u+5od1JrelLhHFCQ1WBKtV8ORyqQZJLdPAWV5pt12CTF25mvvfFF51
	PDgMGpfYEKG6VWCTwh1zujJ98BpF1E5D3o7UOTqLPscZyYVKzK/r5aXcUkQyMmQ3CDgIzO6Q==
X-Received: by 2002:a17:90b:1f8f:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-3903c542eaamr5523426a91.3.1785922461335;
        Wed, 05 Aug 2026 02:34:21 -0700 (PDT)
Received: from eos ([103.89.26.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d1ad274sm1476616a91.0.2026.08.05.02.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:34:20 -0700 (PDT)
From: =?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>
Subject: [PATCH] media: uvcvideo: Make uvc_event_control attribute name array const
Date: Wed,  5 Aug 2026 15:34:07 +0600
Message-ID: <20260805093407.110571-1-reza1234khan1234@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The attrs array in uvc_event_control() is only ever read, never
modified. Declare it as static const char *const so the pointer array
itself is also immutable.

Signed-off-by: イムティヤズ <reza1234khan1234@gmail.com>
Assisted-by: opencode:auto/best-free
---
 drivers/media/usb/uvc/uvc_status.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index b632cf5e3fe9..97c939206302 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -165,7 +165,7 @@ static struct uvc_control *uvc_event_find_ctrl(struct uvc_device *dev,
 static bool uvc_event_control(struct urb *urb,
 			      const struct uvc_status *status, int len)
 {
-	static const char *attrs[] = { "value", "info", "failure", "min", "max" };
+	static const char *const attrs[] = { "value", "info", "failure", "min", "max" };
 	struct uvc_device *dev = urb->context;
 	struct uvc_video_chain *chain;
 	struct uvc_control *ctrl;
-- 
2.55.0

