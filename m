Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D4C3DE44B
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962866; cv=none; b=Vy/4xyQfvFvyZjnToDmkcZm3adQyR4m3l+Wo57aCv+IYGHEY3sCPWUPVI3BEa688dc6JhRCpauIf1lZDKt6adkECfLl1Nc2hW0XUlcNnXjyZqXGfYd+X3S5PlcEzipTpViRB4tHcQjxCPA+u1ggEUkJVQFnm5LkEw2CyH6oG4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962866; c=relaxed/simple;
	bh=vdHkCJ+/Glc8aGhWZ+9VZu6loJVEoLi2/QJJuukYIo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NUszaOaA2wz0cjqUy740o+VcmpmBxch++fomzun+1+NNsQNWfOsHoBCwDoWIyZsEjALg9h1DwODpPTT87sPd2l5zdINSSp/1SRQGldwjLuDwo9WQ/yDtypPWpQprOizsNZ0ZzosypDIRBfE1r6aK1kGDsuHAtGhLSKKp9NoXbZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZ/e7J4E; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ/e7J4E"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5218927884fso14113101cf.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785962863; x=1786567663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m5G3Bj9i5eLT/ujfBhOPRMiKzFS7D44Om03rFcmwrNc=;
        b=fZ/e7J4ExYoGHTMXUsqRbsjywkjr28M6SawtF3XqwIBsCwc3nYFPODNekklWyAqsC7
         BrmlnOmCUe/SoFk3/vWBflrmYYKQxqTWUuwy3RInbmnZVJJjvBilxW1UPwe8CnQxTi26
         VavLCNOw8S282e/ozwj3JO7WHYLYhfbFg8qAwa1seA5BRSwFhCaoWnXqGMNFKPL2xZ9B
         rB1tWUUu9kB7A3yzm5NzKDiq8QqWbQsCHZ82D3FtmERWuUpa5yEzGaRFuxfl5NJzv09E
         kpFeQbOXAxL77VqOhurN8QK7j4YWqMHuxz7vJAFUtb5y8X+CHY+7gbKhtfyas7jZ+a8J
         EFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785962863; x=1786567663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5G3Bj9i5eLT/ujfBhOPRMiKzFS7D44Om03rFcmwrNc=;
        b=OKBgptHkxK/kUN1RumV+QhqwzFSDtfpOUBtNgW4aAMkammL58Hn+vaulFyM2/DgGOO
         907r0rJqa44sx8IXVMxvcwsgg0Dh0qljmA071QhVRhAqkljbkjLJfm/x0B7W9fotxvJr
         v0TV9eMEltMof7Ev1gzycITGElddBiUZD0RPwUt4YX0nDH6gD7Jxlkl7rmPsfntRS2cr
         3xeqBaxpwoC3VJ2TbWcNhFmg/okXAU0JsV9M5sK6TR+GtYEhPhSfNfPgNa/0c4wNjvzF
         J4lMYfSd96/vobDrrErNg9ekx+798KJhsOOa6UQ+9kD7wFESJARws8PlWdekGqrWeBf+
         3zbg==
X-Forwarded-Encrypted: i=1; AHgh+RqXqXTvVhyqsHBJBNEKIeKveszh4r9IO8Lz7to0wwRhN/HX4uj5iNCJrTEAnN32ZuxtJk0/GBrBVB2Q8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf01AJcM/fUWGkhXN+r/lUq1PbeDl5aeBijm+6mCRigQsjKKOZ
	y7Fqp0ZiOUAZVJjQAuX7OXDNO2qqPDPXRsAVwKJi9GW9yM4Fm7g/c+1wyhj0n/O+
X-Gm-Gg: AR+sD12fTeUZQDHDt5F6jjD9/CVMqMlyZPL31Ez8yj4CNl834np6Ho3qUzR2rbuQMpo
	VsumqbXvj8wWV80R9vKq1ajWUCbhvxfh/vsgM4ImuzDMXf9BjiEMrXfH2LwMg3ICuY72nd47VuK
	e7aukbCieEQIsGtcuVTCNbagLyDVktNWejfZ+Ju31RWoq7CymctX6osOmISc9EpvQfVsOC6PvNV
	xUyCEbyxhZIdacbXFkCBNI3GQMQLqeWPv884kXAynPjNGufTn62XeMpYMMbddUdXj/iGO24lwK/
	8YxdZKs0yzsCVIwX+X0VOndZnfrUap3Pj37m8jvyLtEH4DCQGTzudDn2dnfr8yNJLBgH5FdKa1J
	EICtvVA7zcIDz55vF7QsNM2K3S+xId6xwCwfcG/w2tY1i+02kDYJUtHhE1NqcdedZ/ptRNAAeLL
	MbMToD584MgoObbJI+GAyByoWr8N6D5lO8PuKQp5V9Wjif//iw2qS0n8LYsIU8H0v13OO8/De59
	hVmv8NN70A8GGjgvg==
X-Received: by 2002:ac8:5747:0:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52ce6073bd3mr101761921cf.19.1785962863280;
        Wed, 05 Aug 2026 13:47:43 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce87a9403sm27951871cf.2.2026.08.05.13.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:47:42 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hyunwoo Kim <v4bel@theori.io>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb-core: Fix UAF in dvb_ca_en50221_io_release()
Date: Wed,  5 Aug 2026 16:47:04 -0400
Message-ID: <20260805204704.3789917-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_ca_en50221_io_release() drops the open file's reference to ca
before testing ca->exit and unlocking ca->remove_mutex.

If dvb_ca_en50221_release() concurrently drops the initial
reference, the close path's put can be the final one and free ca. The
following ca->exit access and mutex_unlock() then operate on freed
memory.

Keep the close path's reference until it has finished accessing ca
and released remove_mutex. The reference also keeps ca->dvbdev alive
while the wake-up condition is handled.

Fixes: 280a8ab81733 ("media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 1b91ebb8f667..86df28c4aa4b 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1787,8 +1787,6 @@ static int dvb_ca_en50221_io_release(struct inode *inode, struct file *file)
 
 	module_put(ca->pub->owner);
 
-	dvb_ca_private_put(ca);
-
 	if (dvbdev->users == 1 && ca->exit == 1) {
 		mutex_unlock(&ca->remove_mutex);
 		wake_up(&dvbdev->wait_queue);
@@ -1796,6 +1794,8 @@ static int dvb_ca_en50221_io_release(struct inode *inode, struct file *file)
 		mutex_unlock(&ca->remove_mutex);
 	}
 
+	dvb_ca_private_put(ca);
+
 	return err;
 }
 
-- 
2.43.0

