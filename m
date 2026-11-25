Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590370;
	b=3yWgGcdW+dSVdo9QDlOoHcW28GUJsYVVyLlewFNOuJrUHFnZBvucXQLa9xF98Yg4z2R3
	 ql57C1ZxxtmmLQM3TAeZxVxsAQNHpoiGcYf9VsQBNXQgVP0yqGDQiA7Amnh3VAXwJfxxy
	 /UI4YlIarbgYtEKAbjYJTp6qwZPs4SCpA14dH37NDOeNF8QNGLPf0QI6TpKO6oNSuDDzS
	 04FpJmA4vmlferEdL8HXAwxN5j4pGy8sNxuT7jDXPbSvyot8EjxYgy40oSO1W2ZQOMn2M
	 GlspuQBFAyQtU0iIU9PjYt0hdSVYh19RelSSQIpEw89VtovWWGG2ssgymTOs240VNtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c31uTtty0UwsaTAcdqE6aehdmrsQiJywU/0e71XAKfo=;
	b=KHgFUMxZhBtP7746xQpMctby8KbV41WeFdhpojy4QpKg5yrBNBFw9th9NTILKw+WWuaQ
	 1SMMpyI/IHmx/bRLayX2ib1Rb25uwN4zEijr2V2Kw1wz5LBsBCcLws19qGkYVnl5t8ZXx
	 Ck4iSyGBadi2SKlTRlJmRXNke6iME3BJbQsN5iyST9Ds+pwkfcTQzLooPVhMmZ6WnhtS3
	 rWmeZP2mHtVvjMWAPYVCbFKY4dr0kJ7ursO9oNA/X10wvkHIdNr+oOrSCYmpBGQcJdu+T
	 0dEsEDV0Tv37DpAHZe7erBhZBQWEuEVMxguNgXCnmQkcZuZSlFG+ORmqFdQqAyH95ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOJMvyfj;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A945660A2603
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 07:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A945660A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOJMvyfj
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso3695862a91.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 23:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590369; x=1796195169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c31uTtty0UwsaTAcdqE6aehdmrsQiJywU/0e71XAKfo=;
        b=AOJMvyfjFmFpvbjF3WCVVvpNfkVHjfirpKsd0ZXRBmnlJUEZqbuvGOM8BkaSsrIwOM
         HVcuPdy0Sg12hAarZ/eNmO9BIAjUKWDQnJPcKZ48cSHRqtZPw2ypinUQ0W2gVisUva7i
         xU5/0gOs/8Ju1Ou5Rl8arABaSOPVOMdsxvAwuHLbeZDw5Fd9AWbqXXn/9FKmzRCwLIOp
         0VZ9RBvCII31lkfsA1vQiOJO0/TUsQ2Pi63sj+U42EGcZF3Mru+TZq7wbaQYiqt1gK10
         lGroqXcg8vv0Gal1bnUUbhWWre7rTG2h3U/3+x+44G6Er9NS7c1qK2U0HBLWw2eJkxc9
         Cebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590369; x=1796195169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c31uTtty0UwsaTAcdqE6aehdmrsQiJywU/0e71XAKfo=;
        b=HIKGSREyjZKL0JaZ7Ph1HoqCxwGnKbJCM3Pr/01XqG3cn5l0KarhXA/Uih2cAxqJqS
         laj5iCkC2EfXQvmySOMGpeJStwoAF+9jkylzp75/iJdXSy5w1Qi0PjOwj6ZDC/rSaPoG
         tuvnP1wQj2dh/1upvQlbFNqCZUYI4I910ws0xMrLkOjFLXA0JKqu5kOfTrI1nbCDjXr1
         T/mN9J7D7yy6pYnoMpTZo6t2/bSENo62Xo4fj4QEOfCRQekRJ1s7f+o2F+3KpGBz5fRb
         exNr5UsjPnyBu/FfbNEzkL6nySsqzrFkpvzKE7px7iovL+FcrHXTimkWCf+tIzHqDjs8
         pWaA==
X-Forwarded-Encrypted: i=1; AL+hErH3lkbTkanwVu5IOxlAFkhnvnZqifG08BjESdK6U/Yx0HLzIEzuwVOwVthhET0BREDS99XZ+LPZ/cVlbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9q7RLrR/irhrWYl0QJw4/SxrfH+uIm4UzLOg4OSvI0YEwuTbe7
	H4haAvVwO/w7RBPqlhHVmgxSFW9gvvcH3dlWNYmOlyOwgTSu5fkE8qxN
X-Gm-Gg: AZFdTZcyoXzsonoulbHBNQXRWqUZgjxq6vtXCuBk7RiuCixTULZMZ4dETObR0BheEuI
	gAypTS5qbMTYMKam/7Hdvavk7nRRef4WEhLmUg6ToUyOSnzPl3OAqBjiFd75PFeUjQ4AbN8nrmx
	EMQ9OFm/nX+14IjuOU1MBC1ETz/sK21C6nyGGQQFY7S1KXc/hu3MDW7JjZ332HBJAcRzIKogMom
	fK2B6mU1jQAhng3eiSoyaK2ZegYyulNaABcGI2QS/eiPlmkQEXUkACuMOzC+DX8UiKSw2W0Se/2
	t/SPvfkhEviDPcxgVKwp6yZKKiC/UfN1HlquTyoJH8m3/1RuLqkjjJ5trGR6n6ufvmGUOXPzUNa
	D4WDQf/3plBz/agReiTfrak3Or/Ldz5iib93Aus1vhZ23ZjexaJ875inhY51YL/I39Zt4LSgVk6
	pO/kGU0mCjpkjvk1ooCSS095uDZ7E+WQsBZOT1fFT3aZ2b/E/poVAiRZrM02wTd5nbnJUIqPXJd
	YVJlZsji76/rTcR5aNZtWUjZCRQGZll5QLpbyc5WOyEV4Zsn8PAqoVXsnw6IZdaHT/kzJsGCzC2
	pAdZofDp5hVwgqpYACwPNtvsO9sPtZaXhPuoVP4uaHxYoNUjhdwzYPQBzUmgE9I=
X-Received: by 2002:a17:90b:388c:b0:3b4:1c0c:6863 with SMTP id 98e67ed59e1d1-3b41c557600mr16471914a91.0.1795590368971;
        Tue, 24 Nov 2026 23:06:08 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:08 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 3/4] media: zoran: reject VIDIOC_S_FMT while the queue is busy
Date: Wed, 25 Nov 2026 16:05:47 +0900
Message-ID: <20261125070548.28989-4-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125070548.28989-1-hiyoukou@gmail.com>
References: <20261125070548.28989-1-hiyoukou@gmail.com>
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

zoran_s_fmt_vid_cap() updates zr->v4l_settings, zr->jpg_settings,
zr->map_mode and zr->buffer_size without checking whether the queue
already owns buffers, so the format can be changed underneath an
allocated or streaming queue.  The size the queue was set up with and
the geometry the hardware is programmed with then describe a format the
queue no longer matches.

Return -EBUSY while the queue is busy, as VIDIOC_S_FMT is specified to
do.

Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/pci/zoran/zoran_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index 99fedac12b67..ec8ed5601f50 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -506,6 +506,9 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
 	int i;
 	int res = 0;
 
+	if (vb2_is_busy(&zr->vq))
+		return -EBUSY;
+
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
 		return zoran_s_fmt_vid_out(file, fh, fmt);
 
-- 
2.43.0

