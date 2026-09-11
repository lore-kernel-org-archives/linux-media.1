Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8473149E14F
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105715; cv=pass; b=dAjlh7fMIg9KYwfPH0zCBJNWPkL8kgJRHc/w/NbTpy0w9t3CpxY578LEKE9Bnl77f4bKtTLjHM5mNksw0675IzBZCd+/3buLgQ7MCllgZAoV9ynYy9ER+jwGfGmmqm82teCFwtgpW9aTYvZZeN5VRGNFoISwAZ3iMeZpiX/h5cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105715; c=relaxed/simple;
	bh=TJnrL6d0hKJDGb4rqpDMjSoPYzhglbMdJOCHJvyEPCE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=P/moOb3WlewMol8s46CrIt7TEj0f9980kaL86OXQKbJjRfGe+Em64d286GON6EUIgYK3U52BzyfXHYzegY+m+SxpKS2DPZweFFkDHRXiDIPLofVMlUMQ4QHkKWXzVyGM04NzOhwePvKFTayMNLQJmGAVrWcEpBRIEA/6MzbQ2iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=hM+Pbo4U; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="hM+Pbo4U"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e2254dso53378b3a.1
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 22:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789105713; cv=none;
        d=google.com; s=arc-20260327;
        b=AXr3+MKatw4wTJ49HlE6sTFDF5TTVodQ8XMJeYnPl1Si008TcQd7x6ZhkT9eQ2f89G
         pPxEpr/euBoHPPQ4RqXfaRbOhZgkyo6tDuk/V4zy56qIGenQgKjMyescDkYhl4eHpzh/
         BC8OH+QZtE5y65Jialb0cd3tY/FacL0asyVMDjO6R+tgKCtBWnL91WeI4cjkTA81I9Jy
         SQGdrbCdo1AZheIw9dZRM3dmSKZXexk7EHeigyxopOIHHhiwCtq5kDQcR1SNXpgOyqFg
         rvWYaxG7yXoDkO7pOFN1vBgoil9+0BLCzv6uiQ6ecMei4OUJl1I+Pqp1iHByeHgtXFZG
         kE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=B/obf48ZGyrDi31Af1lwyeU1ecLj+i6UYByj6PNdSZQ=;
        fh=bPTIG+zzijUNzL6j2CdzCH4CXjQZ4LFyJI1EotGqgiw=;
        b=jwhN94KUO9Na2UbFEWGLmkgQ5PKhbhRdXaf7ITc5/YFfaVu+RpwWYRZzlimdSgwXnM
         Z6elwAQW65N88MmfrJlpfu6vVzJeshQM2DwM9jlKe+37FAGt2tf4dF0sIHJwg0jmP7GU
         PBbbKz3WzmEp+ATohsilHXYIJ+PC2SxMn8W0cVEpZ5v4zY1OSCkCCRgSKX7/eXADgk9r
         Vlle6EPWlc3H8BT+xIz7Cs5figRuSZDU2Z6MzbjOw2IVs8WucLIN1nsPESU0CkYp4fvT
         En9dKvviBT6BblegcxULMWWOk3Ki5b4uhzoiOnJ3ZTkKlwDNfVMt4u4crs11ro5+md5Z
         VQCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789105713; x=1789710513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/obf48ZGyrDi31Af1lwyeU1ecLj+i6UYByj6PNdSZQ=;
        b=hM+Pbo4UeVdShI3H9ZiszxRDnVrmasPPmJTe/z0kizDS2nAvqIPHr3C7tIEbGYCF1h
         55+J/PJZ664p0+ZPK7W/RQYsjoz+tVK/tnnW7fuXayn5+yQ9UZ6vVYmdlBH/iqRaLBGY
         IYfkkE7fIX0HFvhmtrfLElcfFGJZJwJHJCU/WPLsbdHz+jzdmY2YHkLIyEEtbQEv80aj
         GdoPk9HURZNjeKQqY6Pns6u2eIgOqWAK5fdIu1yL0Qtjj+QvECICkS8q2OvXvzYnJYiH
         ws2v+5lcZv19brELxjTxg/+U+RJaI0IBNg3KyU7QS6w8if4OHT6x6WC7qpofDIaN5nQt
         wRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105713; x=1789710513;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B/obf48ZGyrDi31Af1lwyeU1ecLj+i6UYByj6PNdSZQ=;
        b=UVGy5J9Ar6dF2POOa1ynhkbl+M0K5/7UfbjG7s3457iIoS5tNFOukjXy6Kg/R8auOu
         4KLTEKSI2tqpADbX0K/jjpLrcWl9F9QaSDtIhda/0wk6A5QNVuHYS5pVxV6adpqtl57/
         zuB2XPxx04+lmq6GqAco/UTDfU4vHK30h9MLzgrdQ1pCNXM4mvKCZL6mik6n8wM7E04l
         iyLBDwF04obuhmYls2wdaCYE/W1Ydyzu0uwYQCg5on2AT3Ul98axWH9/sLnB3w/U44Vg
         FbKLuyJgFaqOjvrnqJIpHYyDchinU2cHpqzZlGiwG3GBQQmGjLFS5HnoqmIvhNV6lyAx
         azmg==
X-Forwarded-Encrypted: i=1; AKwUvBxvKJAU3URs9kwkr4i197JSo0NfbLW5hXqu2LBKWOWR6S+ojJ5joLmVLreyFCCONldTCyq/5lHnZLzzgA==@vger.kernel.org
X-Gm-Message-State: AFuF++kcJkAQ3FsBRvsDTRh7cT04KtQJ7OHFwe5ZMOxSPHqq6QeLkCz/
	W8HCu5PVIZB+WS6ahpWMn+cosQ5wF0io36jfgy9N97+OqyP0UynReAV8SGlFXzF7XASW5VpGG/E
	ZWEoKbSCKR1BI/CWNXC2Cacus+uWSMlqHedRtmUwH
X-Gm-Gg: AYBFou0aaN0BGkhUwh6e4Ytp2Rcg257VqReDIVLk8R+r6zG9adk5Km9S/2g1m5RRK6a
	ok5jBjAwbIQjRMhOQiRXhR+so79JquI9q6nP4+SsRCcrYE8kypyLBkSRYS+Vx7Y01MFLum6wUGx
	Ya+mU3hSR21cjgMi1vufabyyzx9u1n/TtsQjSal7MUStk1OyvGXO/ZCwxsv4ZDX59hjffLPh/O8
	ras78+B6gCmG/6UQeIl+k9b1gZYNjPY4RNBi7Qk/k930CmQqPFmmRC2JNPKRrehedkAnDhSttry
	DXtiVUJXHyoAlHBWL3MSF86Ann5RpFTVIPWr1215aTG1y7tpHY1Iqv2LVFyjU850op2HQfq+PB+
	6V5gYEXfzYx8uRhr37lxFDMa4kjvc1pA54mYi+xCO464=
X-Received: by 2002:a05:6a00:2e20:b0:869:44c3:c24b with SMTP id
 d2e1a72fcca58-86b0d065277mr3199091b3a.0.1789105711800; Thu, 10 Sep 2026
 22:48:31 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 05:48:31 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 05:48:31 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 05:48:31 +0000
X-Gm-Features: AcwNN1XJiM_-mKtor9wgRc0cKID8IrHW-RYw1kk88Sw8zQDxuASJ1G3ckAlh4HE
Message-ID: <CA+0ovChNv1=1dfdKxSXnBN0KVC6eO6kZqTFTsozOoJYCvT8T4g@mail.gmail.com>
Subject: [PATCH] media: cx231xx: don't free the media device on err_analog
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When cx231xx_register_analog_devices() fails, cx231xx_init_dev() jumps to
err_analog and calls cx231xx_unregister_media_device(), which frees
dev->media_dev while dev->v4l2_dev.mdev still aliases it. The next line,
cx231xx_release_analog_resources(), releases the video device, so
v4l2_device_release() takes the freed media device's graph_mutex in
media_devnode_remove(). Remove that free from err_analog and leave it to
cx231xx_usb_probe(), which frees the media device at err_v4l2, after
cx231xx_release_analog_resources() has released the video devices and
v4l2_device_unregister() has dropped the subdevs.

Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1505,7 +1505,7 @@ static int cx231xx_init_dev(struct cx231xx *dev,
struct usb_device *udev,

 	return 0;
 err_analog:
-	cx231xx_unregister_media_device(dev);
+	/* dev->v4l2_dev.mdev aliases media_dev until probe's err_v4l2 frees it. */
 	cx231xx_release_analog_resources(dev);
 	cx231xx_remove_from_devlist(dev);
 err_dev_init:
