Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7B45D197
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820145; cv=none; b=M7mMN8QbwUp8zCZNAapK0IocRlI1gcuccOnBngrnTBLRGceZj/ha+6JzloHvQ0SP5hM3vK7m+7wMBGk5YoSbwXQGVtS3UYgd9vLZuhH7cD6dbdKoC7heb/VJK7BJYub0MtFIMIh53m/yp1BbwN4jcxML5f48gPR/abqOz2j38RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820145; c=relaxed/simple;
	bh=bulsuqfT4elwA0ChnmuElrRF7eFdJcIJCtLvAjuNCcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gnuS4U4X6RkZEDK+iXVG2QBijbF5nZ8pVks3NjfrMxmGMPo8adfO4jvn1yea4CbC0ja/OEB6JbqHg5YXHmVO6U62HrDjjiI3QAbXhU71Xn9CrCP6XvwTv7AdJJZ0XMzlKGIZDqwH8YI0TG16MGw/qhEuNMbTZYcOcO6nV7Wvapw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiDDdfNG; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiDDdfNG"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso221788e0c.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784820135; x=1785424935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhoCJazApu7PhpZQh7Bx1EblplBzJkAncb/FnM2OHyE=;
        b=NiDDdfNGz57SEE6agrAqZqmiVJL0zrCFifnn+vmXH6+WOPwNybJ7tAD4/o6IeWZWpt
         QXxGLTIVFfsUw8kljn643MP6FzBc8RiPYUc3mHnqVynOMiRoMhRn3JSOd0UKs2TmCD2C
         PQ7Z/kqqpJYc6nHGrPno3L61e/HfLqltwb0zIrUQCZ5H7cZfm1QS3Qg14VooYTpQWiZy
         aRly3Mu5fI4FyKb+KMu75pKiAdhMnkur+z831B8WLr+AzmdVzEZ1RyUAx0nmqRrP5EFv
         0WVDhnpQ+edsKIPL+VnU4Jsz8U4a1V63whCpWvK3W6hWAsSspLgaK0g3KgtjcNaWZWA2
         KisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820135; x=1785424935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhoCJazApu7PhpZQh7Bx1EblplBzJkAncb/FnM2OHyE=;
        b=N17KcOTNwX8G7OYW0zad2NvneMUsEvzb1dZQZ/WTxRSGK7CZifpf8PxEeSpIiCzC/5
         Lu8HJK60MgtGvuRKbzdcYBgf9BR0q00HN6mgJczoNEdfFpHAzQBkW+lZs75oPtx4fL8g
         hQEdVAHgPQHCxDjjEoDiSrMo/4ksDAQ8undfnjwcWTJEPN1NdlDm8cp8sWdqIu9X/RYM
         aCpqCqlRGI82iphXceDc1TSB7VkQwEAkNsQalVoaT8/yYmJvV4QYpGbq6aRWN1xS2H+S
         v3R1k1wdAkxsA9YKERtiKYdKOAmvqFKDOIFH5tlURAI0gV0XvsU9s64M1YYRJXiuE2Vk
         vEqg==
X-Gm-Message-State: AOJu0YxxIMYSstNNdivu0aE+ZW4hICfKm57prTeQL8/NEklB8eecZBsn
	PXWs3Yc18lItquM/O5PDRQPx7Tezm/Bj6HFGDBLmFLl1rlIy7MbwZ0wdTuE2rSOO8g0=
X-Gm-Gg: AR+sD13QsYWxg5AphAhR0hmsIBRP2mHwWkBpD+7F/kH2YNv1vPf5cfKBmefcZFlTTEy
	w1W5OUwG9jiz4UdY5TE8/jbo9YW5MNR+V4FirE/B01h26SowummR0sGNd235TxcUvkrzv2RJSGx
	QdV1DAWZnhCmjZ808cJAl3iQgnsCHDhzTVEYMAiajfzdALl+WrG8vey/rquOf6C4sv13po1HdwO
	aFfc1DzyBdtn8SLfu2Jgo90zwhnAjfIorQdfq6vYZdA6Vee7PGRsoguYUXAJit+jjhUh0UiEVo3
	BCPgELlpjAZF5D/kN9k0rsPYe1SSDu0+7D9tdGfwFIhz/Fe9OUqSDkNLOLW0Gk2boU057XXfzTw
	3R5lfym6/nlSzSWz6f7QBT5SJQFTdgtmw/6tG5sEac3EYhL948LK0jol+yeBhA26ujv/56h2dWH
	4Bt/yl36dZZx2oNP9Rr46OpQvyKBV2+iI3wedsbnroXZSsUF8gwA5gDy4kud6vMv7clonEeQo0q
	tY9Z9LFDU3BZa4qnfnc
X-Received: by 2002:a05:6123:a1:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5c2da0e126bmr1430338e0c.7.1784820135565;
        Thu, 23 Jul 2026 08:22:15 -0700 (PDT)
Received: from user.intranet.unl (fweduroam249.unl.edu.ar. [190.122.249.184])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c648704dsm6118065e0c.12.2026.07.23.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:22:14 -0700 (PDT)
From: Tomas Chimenti <tach.365@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Tomas Chimenti <tach.365@gmail.com>
Subject: [PATCH] media: atomisp: Remove useless return statement
Date: Thu, 23 Jul 2026 12:21:46 -0300
Message-Id: <20260723152146.86978-1-tach.365@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error 
"WARNING: void function return statements are not generally useful"

Signed-off-by: Tomas Chimenti <tach.365@gmail.com>
---
Hello

This is my first patch, any feedback would be very welcome. Thanks
---
 .../pci/runtime/inputfifo/src/inputfifo.c        | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..f0dcd839e33b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -88,7 +88,6 @@ _sh_css_fifo_snd(unsigned int token)
 	while (!can_event_send_token(STR2MIPI_EVENT_ID))
 		udelay(1);
 	event_send_token(STR2MIPI_EVENT_ID, token);
-	return;
 }
 
 static void inputfifo_send_data_a(
@@ -98,7 +97,6 @@ static void inputfifo_send_data_a(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_A_BIT) |
 			     (data << HIVE_STR_TO_MIPI_DATA_A_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data_b(
@@ -108,7 +106,6 @@ static void inputfifo_send_data_b(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_B_BIT) |
 			     (data << _HIVE_STR_TO_MIPI_DATA_B_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data(
@@ -121,7 +118,6 @@ static void inputfifo_send_data(
 			      (a << HIVE_STR_TO_MIPI_DATA_A_LSB) |
 			      (b << _HIVE_STR_TO_MIPI_DATA_B_LSB));
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sol(void)
@@ -131,7 +127,6 @@ static void inputfifo_send_sol(void)
 				1 << HIVE_STR_TO_MIPI_SOL_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eol(void)
@@ -140,7 +135,6 @@ static void inputfifo_send_eol(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOL_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sof(void)
@@ -150,7 +144,6 @@ static void inputfifo_send_sof(void)
 				1 << HIVE_STR_TO_MIPI_SOF_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eof(void)
@@ -159,7 +152,6 @@ static void inputfifo_send_eof(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOF_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_ch_id_and_fmt_type(
@@ -177,7 +169,6 @@ static void inputfifo_send_ch_id_and_fmt_type(
 	 */
 	token = inputfifo_wrap_marker(0);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_empty_token(void)
@@ -186,7 +177,6 @@ static void inputfifo_send_empty_token(void)
 	hrt_data	token = inputfifo_wrap_marker(0);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_start_frame(
@@ -196,7 +186,6 @@ static void inputfifo_start_frame(
 {
 	inputfifo_send_ch_id_and_fmt_type(ch_id, fmt_type);
 	inputfifo_send_sof();
-	return;
 }
 
 static void inputfifo_end_frame(
@@ -207,7 +196,6 @@ static void inputfifo_end_frame(
 	for (i = 0; i < marker_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eof();
-	return;
 }
 
 static void inputfifo_send_line2(
@@ -297,7 +285,6 @@ static void inputfifo_send_line2(
 	for (i = 0; i < hblank_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eol();
-	return;
 }
 
 static void
@@ -377,7 +364,6 @@ static void inputfifo_send_frame(
 		}
 	}
 	inputfifo_end_frame(marker_cycles);
-	return;
 }
 
 static enum inputfifo_mipi_data_type inputfifo_determine_type(
@@ -453,7 +439,6 @@ void ia_css_inputfifo_start_frame(
 	s2mi->streaming = true;
 
 	inputfifo_start_frame(ch_id, s2mi->fmt_type);
-	return;
 }
 
 void ia_css_inputfifo_send_line(
@@ -516,5 +501,4 @@ void ia_css_inputfifo_end_frame(
 	inputfifo_end_frame(s2mi->marker_cycles);
 
 	s2mi->streaming = false;
-	return;
 }
-- 
2.39.5

