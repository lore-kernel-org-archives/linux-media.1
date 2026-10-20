Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500357;
	b=kJWKlhUegI+s81LvUKRPEmLdzlyxVPwVBdy1vCmAo/yctZk4otk7EcnLQPfP0La3wCfA
	 ndncdWLgvT/dCHIAKb8Pi8jWKBgduXsScyMEynroZhS9F5QzrlwKxBkDq4Irn9sbouToi
	 DorLUmE5gnygSP//etYS7+uecyLBtb1N+JuMgaXaSWjc40TT9omaXBi/Mw8WpvHcG/WUY
	 ZphoAOkfJKa7nyzamF2K47GoFxiLqBPx/yaaLsk2bB5sm5vjixYFBHpzid1zqM6vEmxZQ
	 pDt8Ulw/OeHfaKCbJTUJb1PcuarQODrnrP/10K08rMq5ufNSWcXAcuI/QXE2+5RooSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500357;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BOO0zJB451BKu1AoqP2Cts0kx0zO/TCcN12JgzmgI0Y=;
	b=Kns5sZw3gw8CiLqiXLK27jGzT8uzQ1HByGezF1hWJwzNb/Wp2GGBTGHJKtfH15YGko+5
	 +CbqNTtp9hT4DTWB0ZR2dAeCaJeSUwzBI31wPrLueJv0SkCf6HjeFF/YBtqIaykzmQIMO
	 Ykf8pTeOqLY4hYqpb2K8F1xqBsej9TMkuRWET/4bFyhFSY8uMBmviCHM5i+hIXzeBmu92
	 OJNpD2TPi/4eOwCbCpvkACcXubxO5SyhHW2HIOKrtDv6CVAkRcp4ztlfsPG7VeLwfsXSc
	 FqXcJnZkKcuJWmJ1JJTVW8ueyQPvqv6ZcTJ45gLOoHjUkeFqHafdRJnenujTXLIzkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206CD606A319
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 12:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA451F000C5;
	Tue, 20 Oct 2026 12:45:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: i2c: Make VIDEO_MAXIM_SERDES invisible
Date: Tue, 20 Oct 2026 14:45:50 +0200
Message-ID: <6f7c0535f49c500b2adf022f783daa68a4b7c736.1792500316.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim GMSL2/3 Serializer and Deserializer framework is used by
several Maxim GMSL2/3 serializers and deserializer drivers.  All users
already select VIDEO_MAXIM_SERDES, so there is no need to make
VIDEO_MAXIM_SERDES visible, unless for compile-testing.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/i2c/maxim-serdes/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
index d0c70d6786997200..24a9e1d0dd5f60e0 100644
--- a/drivers/media/i2c/maxim-serdes/Kconfig
+++ b/drivers/media/i2c/maxim-serdes/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config VIDEO_MAXIM_SERDES
-	tristate "Maxim GMSL2/3 Serializer and Deserializer support"
+	tristate "Maxim GMSL2/3 Serializer and Deserializer support" if COMPILE_TEST
 	depends on VIDEO_DEV
 	depends on I2C
 	select I2C_ATR
-- 
2.43.0

