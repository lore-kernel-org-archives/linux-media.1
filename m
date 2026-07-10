Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB663D8133;
	Fri, 10 Jul 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673639; cv=none; b=fQKjbvdP8UdO/mskyWAb++Cc4rM9UeeQ/AnjUF3moW9eIZoiKAcZGGAMMr3XxYy6k0FwrmWZI0w12BgmiqNqy/MXx5oZmLLI7hXNb4tDiKLmwDgybT++V7ZeIKqUiYiv4VnnxpDYG2rBCW7zgFlZjQeFzoJtXfgBxkEehCpb/J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673639; c=relaxed/simple;
	bh=KYzIeosnO2enhhXSMl91ubGLG8DH/itg66yDVgpWQPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpHLfanZxkXRP5CHIWe1Xh2Zf9XmZ9vqy8zsz968tdfnUJyhza81SUG53eU4/welFR6t9PbptvZSDr1mef9MOfd3mJ+glFih5jVswljWNqos6S8QHtbP4EN1SZx/JRx5w4Hd6LhBjUrABZS99B6Eu9F/yY6x42yY6iX23SUzD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=fJo18Q5p; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=KXHBa3IB; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="fJo18Q5p";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="KXHBa3IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=KYzIeosnO2enhhXSMl91ubGLG8DH/itg66yDVgpWQPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fJo18Q5pJMwU871MrM74VlcPVHF0yG0yhQKHySQm20sZ4xAPMKYrgJT/m1oO+r/Fm
	 Vf345itnNBtOoAtuE2sENdGKf7s5BHApYNT+AFc8nJjGcN7uDrklrS0XShJ78zR0np
	 QVPMdgzoKxZcAX6ZgT/RBOyv+WXjZQIyoqDpxCHGYDcjarEB2V+bHrB9OcQfdCdklQ
	 Z+04Pj79nJAv4ehGRKoPQNn0gG2t+uzmK42lypCJsTU1nVnqzgDS+Z1YswUldSxJrl
	 8VGyo4ax9woQ4oFxTIZkkv6FavHjqXx72V9vefOHXhjzHXPlq6X1Df1kD9CQg41HzS
	 zIfLggR2hic8w==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 7D30C40B31; Fri, 10 Jul 2026 09:53:49 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673628; bh=KYzIeosnO2enhhXSMl91ubGLG8DH/itg66yDVgpWQPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KXHBa3IBBOAodgz3DSLRswbIXpWBSrghL4uDzhtcmDkJLv2LgFvKITW30zSRPWOo5
	 MMJCfgLFypCZN7aq3CD8wgCqNqz4ayCBKdLgYDY/n0dUxxQU0aDz3RilMf0pkXIBWf
	 t2FJhmBy23z0JGsw+HmxO958az6Wf62XmmqY+uUAf7FSzrhKDLa34AvjPeCjwTNZq5
	 JWeRacTmDmnq2dimIibBffAcz4dC5cBvY+avNC76ZB4KCodMvGeQzZ81ppU+9CtpTJ
	 jchFNiqJGam6P/7Tm6DQFsvllEYnl3U2LpF54jxDkqgbz3gaViF0iW3A9KKuHnDOJd
	 FGNNp3Zsv75Qw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id AD91F40194;
	Fri, 10 Jul 2026 09:53:48 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] media: redrat3: Ensure rc device is freed if enable_detector() fails
Date: Fri, 10 Jul 2026 09:53:30 +0100
Message-ID: <000d0451503cea5d93dda388bf3a80f97c9e2a03.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This particular error path does not free the rc device at all, with
its priv pointer still pointing at freed memory.

Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..d2a805dbd3f3 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1111,13 +1111,16 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	/* might be all we need to do? */
 	retval = redrat3_enable_detector(rr3);
 	if (retval < 0)
-		goto led_free;
+		goto rc_free;
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(intf, rr3);
 
 	return 0;
 
+rc_free:
+	rc_unregister_device(rr3->rc);
+	rc_free_device(rr3->rc);
 led_free:
 	led_classdev_unregister(&rr3->led);
 redrat_free:
-- 
2.55.0

