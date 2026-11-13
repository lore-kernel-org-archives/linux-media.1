Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581775;
	b=KVjLs4oYyfH9Bj6PaZ774saQXzdKJW0dlRU/9uWAbi/64tcaGms9tlzy1mOC0GwHipOS
	 8Q41UcC8cAY2HAOZMzxnbK3BGLmbJB906UvXkreMNqU+5ntM73K5FkFDijmGBLW924W5f
	 RuKpeTMjjt5ok7bNJOHWYZ85HNyP8W7c5gp605XRGoyw1uHVy+LAZB0OMVacodnjbyglL
	 m0t5cIi9fyd3FsSg1ZFktsC8UAzsjUBHW7OyTcJLM1oOE1LFjsp8cDqXHn3VIoaW42JKZ
	 8HMyD3mwWsisloKOdJvFzm6uZFHd6zdaRXbVlDpdpbLR/30vem/OEl2UN6dv8XJS19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HTKei3hMm8BrgIn9MBb98/wkj/SGe/y2Ur5xLD1rNKQ=;
	b=Li9Vrrmouehu8kgLHlK6Z3ZJgUKW0pRui6V424btdGcdTlR6wxTn747SIiTBAFBoSmcq
	 FfHsTML0Tnb5tGHreHjoZgHITQZyXIqnJr8UpongNpTypTKoGIlREa4+hcHn1UWjBixWv
	 C8ZYPNfC89YdhqsYJcvo2ezuPb1g4O2ctENSKo4c6aLfN98jvsV7jQUJuMYxN/pPbH/su
	 vCVGYzpsoSdCE2MD0ociYlWcdsrVHJ8gV2CJBECsYpnCp21wXbO6KmpXkjsO+I+voPc6x
	 M4uM1yiud1pmZWcA6ah7d2wSlvEcG+s3+4QyvHrL6+Jj8HuF3RvnGz90uE8wgA80+Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1m7vzUQ;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE9606A330
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 14:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFBE9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1m7vzUQ
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-70bf1671c21so1464733eaf.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581774; x=1795186574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTKei3hMm8BrgIn9MBb98/wkj/SGe/y2Ur5xLD1rNKQ=;
        b=c1m7vzUQ962ZBdEwr/0zeh0jHX6t+DLgPr5rDyNH7TyCI4WMFpUjc6STRXXFXdk0bf
         IcMsmCrRV9e+6+6yPgA9cuQM28MDbKvOzqvNz9NM8DBA0x5scmFTU/+L4/fIl30GlAKA
         U+p6CBUDtvGn3GE1ISHUaMGj65YHgVKG4sh71Uxpp9O0+EyxDDNdosZqbTNOAwclNNVM
         u6JXNviREgWf4Ija6P0zPhN8og8TTVDA1+C84ZWqus9/8BNCWguCUr0efo7yJdmXfMt/
         4Jz3p0g0jrS/YX7IKFRU8B4WWEfwakl7qd/lSD6491uV3rZL9a4cyvqKJsy25KwMvGft
         7MCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581774; x=1795186574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTKei3hMm8BrgIn9MBb98/wkj/SGe/y2Ur5xLD1rNKQ=;
        b=twFuwOIhO1LCE3M746aU49E9oVAkKYlKfXD5lJKNbvtL28Z4YiHww7Gb0IS/lbZ6B9
         bPdPjCDNyivyuOhRMZzHjCazj1Xee8NrisAvYaZNMLbDy+l4sUZOoqB28CM2LYgZjT8Q
         W9nFcZs+WTNv90h1qqlHllvGTAULvlarlkmVo6PG6+/FWRxcBGTvuLG6nZaIea1yDtL6
         aJyAOCHhSxHfW6m9shxy1mD/GN9Ixy74mb/J5jmhP6pO3IxjXWwohqyDIN1Q0lq/5bhm
         lmBjJGMtVEZ+1FxUWah7bNkpsdkeB5YcaxskmTQV3le2K6bD4f/f5FbNhvwutVC7KyiW
         u2OQ==
X-Gm-Message-State: APuU4Z+Gwd/qJEfwlpEPgZn+4X4rDGa7XEXSLrq8ef6yes+bVDTxDzIV
	DCFgO9t1TXlh5laqOJLs06gbp6ELbxwgU6E1zZK3N0z1BzBmpM5XW8tJ92aDwfiI
X-Gm-Gg: AYBFou2+kgYszbNsx20fK21BBo+oX2a5+wIb0tUAm1Ahl+XhZtY/5Pl9nVgffa3hJ6/
	TrKpOfHv6buoNtiG2a24wGeWleqmIP60msJhoRzfKNNxXrCHFGxRbaNYsA8Lb31tNbKIuPaKMrA
	31FL5EKqKqs+BQk5e6cBNBGXnxKQvDtaUrHhXoPumxgDdkvPUute1n9uYE+OA+vdcvM8XK3ZBOr
	sZXGdYHIx0Rw+9d4MmVk+lWjNXuCaskNJGM5DenDhpoffrKLR/1VaS649s6FfBqXG3lOYQLh+CE
	xU1sDa/OPllWkujqMJwkUvdku7kZOP+JxGeLyH7a/oZVWXrugAID9CvBXa0MshLKDiW97F/K+2g
	CmJ9dUgX5gyp4pckHOYeN88zMf2AxShXHlcH/YVc3dKTtRS5yjMTz1pE6TvnCteST2nf+ACNydk
	jtetd0Cf9A6vz4Y2vXJt97f9MtTRsh8pCfSB/RmkegUX5efyzu8a8aUA2jX8ziEEOsh97TL5BEW
	fXjJFkd2GuSKXdIoOijLI+C8S2MyCetDhPgRlQlxQqZ0n4L+qPs9gToBUJ57cfAej8XSEiKm+i4
	wSAfhOb2Rm5BIROCOINf/vTL0Sl7NPJdckgw9TvhZP+XKVcgAwALX3i53BsNLS0X5K2zybz1peC
	o6qH8IIEQq42BojgUMomy
X-Received: by 2002:a05:6820:f024:b0:716:d5d7:60f3 with SMTP id 006d021491bc7-71ab4cd9493mr1547569eaf.9.1794581773792;
        Fri, 13 Nov 2026 06:56:13 -0800 (PST)
Received: from cachyos-x8664 ([177.245.232.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86288133265sm2844298a34.14.2026.11.13.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:56:13 -0800 (PST)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com,
	diegomancera.dev@gmail.com
Subject: [PATCH v3] media: em28xx: clear dev->v4l2 when v4l2 init fails
Date: Fri, 13 Nov 2026 08:53:59 -0600
Message-ID: <20261113145359.65440-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
References: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
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

In em28xx_v4l2_init(), if an error occurs after video_register_device()
succeeds, the unregister_dev error path unregisters the video devices and
drops the initial v4l2_dev reference, but leaves dev->v4l2 set.

An em28xx_v4l2_open() call already in progress (such as from v4l_id)
that blocked on dev->lock while em28xx_v4l2_init() held it will then
find dev->v4l2 still non-NULL and succeed on an unregistered node
instead of returning -ENODEV. When the device is later disconnected,
em28xx_v4l2_fini() also sees dev->v4l2 is still set and calls
v4l2_device_put() a second time, dropping the refcount to zero and
freeing v4l2 while v4l_id still holds it, causing a slab-use-after-free
in v4l2_open().

Fix this by clearing dev->v4l2 under dev->lock in the unregister_dev
error path of em28xx_v4l2_init().

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Changes in v3:
- Resend: v2 reached lore with the "diff --git" header line split in
  two, so the Media CI robot could not apply it. No code changes.

Changes in v2:
- Drop the non-standard 'Assisted-by: Gemini' trailer that failed
  checkpatch.

Note: compile-tested drivers/media/usb/em28xx/em28xx-video.o with
allmodconfig (no warnings); not runtime-tested locally against the
syzbot reproducer.

 drivers/media/usb/em28xx/em28xx-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..f78325a41124 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3129,6 +3129,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/*
+	 * Clear dev->v4l2 to prevent an in-progress em28xx_v4l2_open() from
+	 * succeeding on an unregistered node (returning -ENODEV instead) and
+	 * to prevent em28xx_v4l2_fini() from tearing down the instance again.
+	 */
+	dev->v4l2 = NULL;
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.56.1

