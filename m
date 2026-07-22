Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAB2C325C;
	Wed, 22 Jul 2026 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715819; cv=none; b=WJEJQMZC4qjtnYq/hVyjfTA/lQHpQOpxNbnwBOlTnmVHwqe6Iv/4a4LUVLYAIOGdGo5jGp3pWxCSNW0R9+tBFflzr3Tp22kn8MGF3isrHm4lcL6ElolUkxqLvHHW8FrKs1C06x2PU4FN4RHBIltAYCnvOD7oE6s7weeb9hncXVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715819; c=relaxed/simple;
	bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/gNqIknh276rbmz2gKxXkymWsa0ljpjhYvV46pLWY4NHGxoRZ9OPFRQJFrXLOusNTLH35yttIFBRG0EznptRtHEquRubRkw5qo5YTCduqtyJmu3PMiTunYF+og7TkA0KcJxoLmB6WsP5oDvCCnZjC9MjxPEc/4y4Py6j0SHtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=RDUJ+out; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=RDUJ+out; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="RDUJ+out";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="RDUJ+out"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715816; bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDUJ+outwxONI0b4fnEwIJWY9BdKhC+7ueIccehaag1KY5KB2Kvf1kC0zV6Vom2Eg
	 djEeK/d7fMtXUdYPJ9MPw+oc6IKSO9cJQBKt3FQF5xO+nxOGI6cOjtUynIPA6BJz0y
	 gtI8kvczV80dhDXKqImYv0vl57RkVETXq+heFGd7vwQRD+JzVl+rvjJLf1j2+CbrE9
	 qijT6+cVwkv5izAW3gTEVAHUdzuHemw0GLUw8j2dkW3iu7eH4NTb8zbCi7qiyCVA3D
	 H76aHKMFfCzm87xu6zxl5Fp9IC7H4xnvd2pnSgYAskUc3NtP2HB7fGScDEd8/Qa3F0
	 gxXOvtqcHT6BQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 7B07A4252A; Wed, 22 Jul 2026 11:23:36 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715816; bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDUJ+outwxONI0b4fnEwIJWY9BdKhC+7ueIccehaag1KY5KB2Kvf1kC0zV6Vom2Eg
	 djEeK/d7fMtXUdYPJ9MPw+oc6IKSO9cJQBKt3FQF5xO+nxOGI6cOjtUynIPA6BJz0y
	 gtI8kvczV80dhDXKqImYv0vl57RkVETXq+heFGd7vwQRD+JzVl+rvjJLf1j2+CbrE9
	 qijT6+cVwkv5izAW3gTEVAHUdzuHemw0GLUw8j2dkW3iu7eH4NTb8zbCi7qiyCVA3D
	 H76aHKMFfCzm87xu6zxl5Fp9IC7H4xnvd2pnSgYAskUc3NtP2HB7fGScDEd8/Qa3F0
	 gxXOvtqcHT6BQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id D46D242526;
	Wed, 22 Jul 2026 11:23:35 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Oliver Neukum <oneukum@suse.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/13] media: streamzap: Add missing rc_unregister_device()
Date: Wed, 22 Jul 2026 11:23:13 +0100
Message-ID: <4ea195499c23107cd3dd998f48ecd45a22dc2031.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If usb_submit_urb() fails during probe, then the error path is missing a
call to rc_unregister_device(), which will leak various things like the
input device.

Fixes: 42844992664f ("media: rc: streamzap: Error handling in probe")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 307985d74fe8..41195ad82734 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -365,6 +365,7 @@ static int streamzap_probe(struct usb_interface *intf,
 
 	return 0;
 rc_submit_fail:
+	rc_unregister_device(sz->rdev);
 	rc_free_device(sz->rdev);
 	usb_set_intfdata(intf, NULL);
 rc_dev_fail:
-- 
2.55.0

