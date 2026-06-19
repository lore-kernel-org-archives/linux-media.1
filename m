Received: from forward200d.mail.yandex.net (forward200d.mail.yandex.net [178.154.239.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854663793A9
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867882; cv=none; b=DsSgoN4NObPHubrLI1jAdbx1S0oQx1+/tZ/pJHG/QljI8Purqyl1zJ5T3jrmyWKVu/aPx43Xe33Ia6F/s/LFzBU+ad2D0Ck5fl8j9sY3Jf644J9AXH/HCKP+YZ3zBZeaaXUuFfNakx8e+jhhHtF9bd4uasDwS+/uUJ7qOpyfgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867882; c=relaxed/simple;
	bh=C+fTc0A7gC9C+En1q1O5Xt3uV8vXRsmHLyW9PxC/mtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIGU/Lu63TDdL8GW2Q2KQHc0I60W9GRFXrm5I0W8j0AOdfO48Mdfa2i7Vp7nsY5YLFycXkId+lt93nHIESqim0VgwJotkaBZpQU40wkU7mRtdsvP+ThFH+semhqcIAYJ8EfaO10TFyvMWnGmK7qBGppJ3qRvPDWhufrU6hiBV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=G2H8Gwd1; arc=none smtp.client-ip=178.154.239.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="G2H8Gwd1"
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward200d.mail.yandex.net (Yandex) with ESMTPS id CA5AB83B19
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 14:10:52 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:d788:0:640:6e4d:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id D6BEEC00A0;
	Fri, 19 Jun 2026 14:10:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (smtp) with ESMTPSA id fARpYSLdFCg0-y6zg5o8J;
	Fri, 19 Jun 2026 14:10:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1781867444; bh=jJ8roMejQhKPK2Z+lGVz3BvI7WXhbhAa/4t8jHt6ZEM=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=G2H8Gwd126tzZnPY8DlEXUBOhVAVATIgn5WzBsltmKyK7Im+QuEB3udixkuMIlo/z
	 SsvXIghotdeO0h03JnFmtL8Tv8ERq+K08oSvSYjYwbnUIjAy42QQLmDqTyCUlpzYhW
	 r4PooYBojmtSSgZ+wkjzqsLtFtFbGNBS8oKEIGBY=
Authentication-Results: mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Valentin <benpicco@googlemail.com>
Cc: linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 3/3] media: imon: use sysfs_emit() in associate_remote_show()
Date: Fri, 19 Jun 2026 14:08:16 +0300
Message-ID: <20260619110816.2926821-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619110816.2926821-1-dmantipov@yandex.ru>
References: <20260619110816.2926821-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer the convenient 'sysfs_emit()' over 'strscpy()' and
'strlen()' in 'associate_remote_show()' sysfs callback.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/rc/imon.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 049a73b5f882..621554005f2f 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -805,19 +805,16 @@ static ssize_t associate_remote_show(struct device *d,
 				     char *buf)
 {
 	struct imon_context *ictx = dev_get_drvdata(d);
+	int len;
 
 	if (!ictx)
 		return -ENODEV;
 
 	mutex_lock(&ictx->lock);
-	if (ictx->rf_isassociating)
-		strscpy(buf, "associating\n", PAGE_SIZE);
-	else
-		strscpy(buf, "closed\n", PAGE_SIZE);
-
+	len = sysfs_emit(buf, (ictx->rf_isassociating ? "associating\n" : "closed\n"));
 	dev_info(d, "Visit https://www.lirc.org/html/imon-24g.html for instructions on how to associate your iMON 2.4G DT/LT remote\n");
 	mutex_unlock(&ictx->lock);
-	return strlen(buf);
+	return len;
 }
 
 static ssize_t associate_remote_store(struct device *d,
-- 
2.54.0

