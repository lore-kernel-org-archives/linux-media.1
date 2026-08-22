Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D6386C22
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787397797; cv=none; b=ETjUeMYsZGGBHKmId16zYveCt9KAHYSUhY6G7dJqH8VBM9FN7b73jE+2G/smwrL6BTQVz8xNmaFuer9A0iZfG95MYH6v4r6qqefXztOH1zXL0oewMa3yaTsa2Qpoccd2NVm5XsJvw/vwXUwBKixdPQ96VWVZnbzr789767AELgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787397797; c=relaxed/simple;
	bh=uJc74lO7WjucvgdI8DkhmeL+OgjdvyWd31lZCUuWJs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7A7toNntAOTHcSMMrMQfoeXvQP1h4vaVisup+/b7UExyY+RoxGsKMN6mXcJWoPrDMBNA/ZcN6VR85XZgN1ioTQH+p2pwuduAv60pMe+tQxTXMj65eqwqkYJ+WJuYwbEaf6TGt77uV8yXPLhcrAmY0GDAhmhjcyZZV4wVugAXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSiDAYUF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSiDAYUF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1691493a91.2
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787397795; x=1788002595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkT+mJiPYkVs3Ps4IpYVCOf6FJxHOGfqjEwyUrIBblc=;
        b=HSiDAYUFTgQK8I0Psv0bxIpdZWOzFdy6f+8CYtGJkGjtcSs9cP5ImAajEEYj3HUTgH
         oNwF9l5tSBTqF8G8tchvUh0UHh81b6hCLtRF1KNkLVCF/hQqRI/UCIza/twIfizdNzzo
         VJ5D/gEzjXKBW3XIGFIzYua8Ftsq7oGUezGZmFVPEgy503hLgHDO3ciBJgM8aVa5JzY2
         YG9JCdnpTbQkxUVZ6ySXCj3xCCUod1ax+s65wVHj4Fqm4ax05UNXeIjvhy0N5yBnKS6D
         7nUxmdoQJ6yCI9t8e1xljoO18+lqkoEEI5MqMch6KsLRSIg6QAPmyRbOqj/T9h93we/O
         zfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787397795; x=1788002595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkT+mJiPYkVs3Ps4IpYVCOf6FJxHOGfqjEwyUrIBblc=;
        b=ksxj0B9ntPkYpsRPQLfvmz9nhYcJambGsE+OcTu4yCqwXe6pSVwLd00tsMKpDJOzZk
         OKZ943Jlxzzrhbhb1yMCHNKQ6sw9447fT6NNv3VV61gqF92MwQBcbaGSygYgv/5IobBV
         i+AyCF/WQURl6wTGd2gVxYxwSvT9f87RLwtm+pnIFUHjhjbJshJhMj/fScYyCn1JbWrc
         TIfBpk5gOQQlMcX1/l0EMvVbOr2wnCTNxn6rawmkHexcty3l8+yhjHaIEc50j4sEP0vU
         k4ie5UkjIwyZbv9WLcF4bK3AA3RPFEogdmTpzfc9hNkGCxDG+c7XSrQJoabLUMHRgsub
         CBKg==
X-Forwarded-Encrypted: i=1; AHgh+RoHPV3xtWc5awzyTxViimy3jHG651QnF8tAhQ8pXp6uKlhS0ozLILpNlUneVnDFQR5kx3aTuFzNyU741Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mKL9JCcgAwFOlnMvRuHhP9IxE/eo9tsHSVs7MNzgC1W8coCFnw
	YoDOfwI8CVrVHCs7WB2OapXKULmjl5PS1rjxrfFlyTC4CZNrJhUb/ZeZ
X-Gm-Gg: AR+sD13ar6p8/aIAeZzdLEUa7gPw9oCKD8KXt1tcStbDrIUZKvB2Lq4XPWq0dLzWUbG
	DoyBmaNFm18hzhSGQkcpYspS68mgNlmjQCjE7BH6OWce2pX3nVTQIfPaIRXmjAQo8dhf3oi90Jv
	SMd6ROEH9J8w3foLEAeVCg8G04gzeGfw3QcR3RIpKDXjyfQCRqoDdSDpBJO4xEXqYCCKJIDPn9i
	MHru6uwrCkEb+le5cUsElzfHMscDEQPbcDCRXcWXQ2R1z2tyXZdYjyupnQfmYD8EzuqJtsaz3Yj
	W7dwByGH77EKQU7NlRYImevJtVwVFX39i8vxwGBXMIAIjSaKdHKt7i55zlZTwKRlyiSLvTv1FSx
	EnFwKuS8xJD8EtjkFzF5VM0PFd2xCzX2Ycyq0oXtq4oSJbfNQ5Nplb7NDX53YiJ3Iio2EHv0BxE
	1EAhWII8AS4YbJYO+omCYd5n0lXCunMIQFx9/4crfAPZ/EzOohTC0etBaDvXRmRDicH1IO86g+Q
	w==
X-Received: by 2002:a17:90b:4a81:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-395c34fed98mr20373056a91.4.1787397795327;
        Sat, 22 Aug 2026 04:23:15 -0700 (PDT)
Received: from Default ([2409:40f4:101e:d886:7c8f:61d9:4c4d:7b7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909c6c9sm7100379eec.6.2026.08.22.04.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 04:23:14 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: mchehab@kernel.org
Cc: kees@kernel.org,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	linma@zju.edu.cn,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: dvbdev: fix uaf in dvb_remove_device()
Date: Sat, 22 Aug 2026 16:52:56 +0530
Message-ID: <20260822112256.12346-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dvb_remove_device(), dvb_media_device_free(), device_destroy()
and list_del() all dereference dvbdev regardless of its refcount.
Thus, if refcount for dvbdev is 1, it can be freed and we
operate on freed memory causing a UAF. Fix this by moving
dvb_device_put() at the end of dvb_remove_device() so dvbdev
members can be safely freed and assigned NULL when dvbdev is alive.

Reported-by: syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=37578f730d38898f4b74
Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/media/dvb-core/dvbdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a..9aa4b8fd7379 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -598,7 +598,6 @@ void dvb_remove_device(struct dvb_device *dvbdev)
 
 	down_write(&minor_rwsem);
 	dvb_minors[dvbdev->minor] = NULL;
-	dvb_device_put(dvbdev);
 	up_write(&minor_rwsem);
 
 	dvb_media_device_free(dvbdev);
@@ -606,6 +605,8 @@ void dvb_remove_device(struct dvb_device *dvbdev)
 	device_destroy(dvb_class, MKDEV(DVB_MAJOR, dvbdev->minor));
 
 	list_del(&dvbdev->list_head);
+
+	dvb_device_put(dvbdev);
 }
 EXPORT_SYMBOL(dvb_remove_device);
 
-- 
2.55.0

