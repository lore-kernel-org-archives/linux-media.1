Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E883822B8;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707169; cv=none; b=uysH34/CNEzpDw5vDSYmclSIFuBfD7XOWfetw93SscB+JSj2VEhGfgaOl/4w6fRe0JQXwiarb8hpp3UBE3ngSGTQ3UD8qgF8IfFy5dr3j/W3PKV6b457Er+JjwAqU6HpFJ2EuAoG7JxrHGdUZUqgPbCcFYsV+DwKupEvONRoakI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707169; c=relaxed/simple;
	bh=EeRpCxsAC/o0jMyKqonVxgwDWTMQxm9zIGP37W8BowQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kW7J4XbKzadQzeIntOzk51PXFAyh1VGwm/BbJLNUOPfj+ARCRkcXYzP9cqAjJ+9MxoFDxP4rLKSPm1GjOHnrwSrKwKFDjc3hxXQvJIA9bMPsZjBgKB6oiEYRAzSUNYMOyo6th/z6MqMObK/HdjY0CmcsTi4W6WNJr0BhpyZaEYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/hWoUk/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/hWoUk/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C1DC19422;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707169;
	bh=EeRpCxsAC/o0jMyKqonVxgwDWTMQxm9zIGP37W8BowQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/hWoUk/BUAeZY5cxfUm7C1IzlhcaXiyTMXVSi4WqWm0g/C8tI5gNU8SJg6pXli2E
	 X+Js6IYxHwIjq8ITofICj9KX+bUjkLMeRn77oj6fcIBjdg/bK0EGTTrMf5wR07Ik+q
	 SLRY6rA+o/VTY02cgET+MXN+zYoNrMsOEvAgioBYiE8Atp1uCfnZp4OPZUhE9VrYg9
	 C8rHKgpJoB3k10BME1xicne/QuNv95O4CeO9GLcLhpf+XN7YllqOmAGOXWxUgScGfh
	 MDbebEenKtT/5dIHt+bs11We9M2WnS7orN1+wkZdhH7Q/pckigXWTrqM+ziOuH2gQ1
	 5yhBfxXSoOgLQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy674-0000000043W-3lTs;
	Thu, 05 Mar 2026 11:39:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] media: usbtv: drop redundant device reference
Date: Thu,  5 Mar 2026 11:39:19 +0100
Message-ID: <20260305103919.15560-5-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305103919.15560-1-johan@kernel.org>
References: <20260305103919.15560-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/usbtv/usbtv-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
index c4bfadbe63c9..6c4facf4f41a 100644
--- a/drivers/media/usb/usbtv/usbtv-core.c
+++ b/drivers/media/usb/usbtv/usbtv-core.c
@@ -91,7 +91,7 @@ static int usbtv_probe(struct usb_interface *intf,
 	if (usbtv == NULL)
 		return -ENOMEM;
 	usbtv->dev = dev;
-	usbtv->udev = usb_get_dev(interface_to_usbdev(intf));
+	usbtv->udev = interface_to_usbdev(intf);
 
 	usbtv->iso_size = size;
 
@@ -119,7 +119,6 @@ static int usbtv_probe(struct usb_interface *intf,
 
 usbtv_video_fail:
 	usb_set_intfdata(intf, NULL);
-	usb_put_dev(usbtv->udev);
 	kfree(usbtv);
 
 	return ret;
@@ -137,7 +136,6 @@ static void usbtv_disconnect(struct usb_interface *intf)
 	usbtv_audio_free(usbtv);
 	usbtv_video_free(usbtv);
 
-	usb_put_dev(usbtv->udev);
 	usbtv->udev = NULL;
 
 	/* the usbtv structure will be deallocated when v4l2 will be
-- 
2.52.0

