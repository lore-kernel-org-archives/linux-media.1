Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03355846F
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867455; cv=none; b=fjUWnpFnJ12DNnZOwTOZx4PaUx3DX+gwwIUBy/dXaN8dXEHGPVtSfM/scTbHnmjU6v0IEnHB4Dj6fIUTHrTsCigt82bGvKw4r+OzPIkmcE7potYKqXExKkosNaEga1aou4/VknZohMtA50XJjUKkRfRkctFjx/B+UVtqRWIK0JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867455; c=relaxed/simple;
	bh=l/4T2sbrOeddlGeWvibVrIU6OBHWpX7sIOgRJL1QoKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=udHGh3SWMIt045rI5fy+Cf/F5LyQZBT+uiT7yCGKlv2nIAyOuCFpmVJDo8rrWzHjaoYX49ftcDeO6BJRCcyeotnxjWDhc3vEMhrOU3iI92E9TLqc8hp/8KHptbT+NhsBYTJ2rk3Qi5fVxH1gajGZKfnnWEWChuw3EaBObvHV0UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=Fy7zsBWo; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="Fy7zsBWo"
Received: from mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:d788:0:640:6e4d:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 55339C02B5;
	Fri, 19 Jun 2026 14:10:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (smtp) with ESMTPSA id fARpYSLdFCg0-g64fOka8;
	Fri, 19 Jun 2026 14:10:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1781867442; bh=ZelpwgNkFtJt22EYTOGSmuoEiV4c2n3mQlxt/F9skt0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Fy7zsBWoQwWlMfSOJVJpLjW8kLzdaJLETHM4RsuFjU/f3vIXFJlMUD26HYRlMVn8X
	 joik89bv5Sk4I/AH2WB4dIbv3vMh/IMQwF7PqhzU/cfndgiACTCjEd6b8rz5pVJuFO
	 BTvXappF2tk5+EGgL/5hdGX7xjL+dA5mQ4TIV4hs=
Authentication-Results: mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Valentin <benpicco@googlemail.com>
Cc: linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/3] media: ati_remote: adjust device name setup in ati_remote_probe()
Date: Fri, 19 Jun 2026 14:08:14 +0300
Message-ID: <20260619110816.2926821-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'ati_remote_probe()', use the value returned by 'snprintf()' to
check whether the device self-identification is empty or unexpectedly
large and so fallback to numerical vendor / product ID is desirable.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/rc/ati_remote.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index 51d85de24fae..7a8e5f129f70 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -816,7 +816,7 @@ static int ati_remote_probe(struct usb_interface *interface,
 	struct input_dev *input_dev;
 	struct device *device = &interface->dev;
 	struct rc_dev *rc_dev;
-	int err = -ENOMEM;
+	int len, err = -ENOMEM;
 
 	if (iface_host->desc.bNumEndpoints != 2) {
 		dev_err(device, "%s: Unexpected desc.bNumEndpoints\n", __func__);
@@ -861,12 +861,11 @@ static int ati_remote_probe(struct usb_interface *interface,
 	strlcat(ati_remote->rc_phys, "/input0", sizeof(ati_remote->rc_phys));
 	strlcat(ati_remote->mouse_phys, "/input1", sizeof(ati_remote->mouse_phys));
 
-	snprintf(ati_remote->rc_name, sizeof(ati_remote->rc_name), "%s%s%s",
-		udev->manufacturer ?: "",
-		udev->manufacturer && udev->product ? " " : "",
-		udev->product ?: "");
-
-	if (!strlen(ati_remote->rc_name))
+	len = snprintf(ati_remote->rc_name, sizeof(ati_remote->rc_name), "%s%s%s",
+		       udev->manufacturer ?: "",
+		       udev->manufacturer && udev->product ? " " : "",
+		       udev->product ?: "");
+	if (len == 0 || WARN_ON(len >= sizeof(ati_remote->rc_name)))
 		snprintf(ati_remote->rc_name, sizeof(ati_remote->rc_name),
 			DRIVER_DESC "(%04x,%04x)",
 			le16_to_cpu(ati_remote->udev->descriptor.idVendor),
-- 
2.54.0

