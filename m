Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C698E34CFD3
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867455; cv=none; b=k62a/s91a/AMtT/ubaF2bs53w2m0vEKLhg23ZH3RQVFbfk9rvGpC8/HkXAvZXOnyMMQljRg5XhynlvnEZdyrpZO5htI5IakZFO+ZX4RX7yOddqYnygRKC7mb4FyLpQmVpn82gHlRUeZEjWdjKO9MBnH6ZkzeZRQ6H3z8FM/I1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867455; c=relaxed/simple;
	bh=DqBNH0NWUoDaN78h+0Ar9Y1BKtcQDZVxXPhHLcvaXQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6G+n7HTSV6fT0b5u1PQIO1jA7IpuqSt56TUkLvB0tdVWOQW25jM6eQaT1qH/Ecgla/qEjEG2HMNNBdtlN6NkXpX594N+YhnQ+xokzUVCqcQqOw9esSvQPCwMxu3mE2kBDd52H+uRU4c4ZP79BE6vqZ3UngVo47+a4yNHMZVQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=ACMAHLYH; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="ACMAHLYH"
Received: from mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:d788:0:640:6e4d:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id EFC17C0295;
	Fri, 19 Jun 2026 14:10:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net (smtp) with ESMTPSA id fARpYSLdFCg0-6SXQIJrv;
	Fri, 19 Jun 2026 14:10:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1781867443; bh=4uCoY8SikzfB05GkQy6/pM1sh3GGRsdn0xxzKFCz8W0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=ACMAHLYHr0tYW/4ZXxXWfTnYQCc3U6T5tdkfiA1lqIVbBrwuvGb0QXQnzgcPIm7FO
	 5sdimPoEZgrmXmxq4u4RQsPZT3bVOAWAduLnozYa/ulP/ZVX+fzlhfN8O/xyGYJ40T
	 a2gHk4tlC4BIzZ7k629pVeGLy0EGQfU3FQFjE2E0=
Authentication-Results: mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Valentin <benpicco@googlemail.com>
Cc: linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/3] media: xbox_remote: adjust device name setup in xbox_remote_probe()
Date: Fri, 19 Jun 2026 14:08:15 +0300
Message-ID: <20260619110816.2926821-2-dmantipov@yandex.ru>
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

In 'xbox_remote_probe()', use the value returned by 'snprintf()' to
check whether the device self-identification is empty or unexpectedly
large and so fallback to numerical vendor / product ID is desirable.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/rc/xbox_remote.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index d2cb88b8f1ca..7b53fef277f7 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -190,7 +190,7 @@ static int xbox_remote_probe(struct usb_interface *interface,
 	struct usb_endpoint_descriptor *endpoint_in;
 	struct xbox_remote *xbox_remote;
 	struct rc_dev *rc_dev;
-	int err = -ENOMEM;
+	int len, err = -ENOMEM;
 
 	// why is there also a device with no endpoints?
 	if (iface_host->desc.bNumEndpoints == 0)
@@ -235,12 +235,11 @@ static int xbox_remote_probe(struct usb_interface *interface,
 
 	strlcat(xbox_remote->rc_phys, "/input0", sizeof(xbox_remote->rc_phys));
 
-	snprintf(xbox_remote->rc_name, sizeof(xbox_remote->rc_name), "%s%s%s",
-		 udev->manufacturer ?: "",
-		 udev->manufacturer && udev->product ? " " : "",
-		 udev->product ?: "");
-
-	if (!strlen(xbox_remote->rc_name))
+	len = snprintf(xbox_remote->rc_name, sizeof(xbox_remote->rc_name), "%s%s%s",
+		       udev->manufacturer ?: "",
+		       udev->manufacturer && udev->product ? " " : "",
+		       udev->product ?: "");
+	if (len == 0 || WARN_ON(len >= sizeof(xbox_remote->rc_name)))
 		snprintf(xbox_remote->rc_name, sizeof(xbox_remote->rc_name),
 			 DRIVER_DESC "(%04x,%04x)",
 			 le16_to_cpu(xbox_remote->udev->descriptor.idVendor),
-- 
2.54.0

