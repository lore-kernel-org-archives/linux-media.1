Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8D20D4FF
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845821; cv=none; b=pLjjY8zjqpmgzuam+6pSISGCSOE3CDiy8gSudmjf9+8wNs7FVAC4XgC2vrzShSIkAMovOODCGd2upkk3q3FONmPm5JDvKqQIK5Rxa3RuEQxNTSU1r55q4fDZ3LGyY54H+OqdrWfClLaeqypNfKDrNqk5XYPpdRYkPhlOvtjvBp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845821; c=relaxed/simple;
	bh=IKuWsaJY5APoPhOYXNrJ6Ofun/XWfkcoHsBrnE7/6MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8v+o9FedIpJBjhtyAnMpsKew/BMZsSrdQOSZ7Vyn1UmlKqFluL6ppfwYbTEPEe/dk6P2gPCqP3VjgvJxF0MNVnGzY7jhu16BhxmBvugf7WDJY5QTny/Sgd/OqRBEdqdqqadQzGE7I8RnUC5etbWzUiWr/KwEuMVNbG13VyN4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGJIvyyS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGJIvyyS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so8565545e9.0
        for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 12:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845818; x=1790450618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XuolRd2+0mj4vgNgJerFOuLLsbSMUrRswx//2/7gQLo=;
        b=aGJIvyySCLGqesumKpez62Bc9Ffyfiqbq95DF6mxOnh9MFtaFU1RTSDccxrpfgtQjx
         VVzUbOcf2AXGnVqpp8MBfZgPKpsTu9N7okR1Bfkl9s/mVWL95R3J3QvAuLF155TH//YJ
         rREZYC91wszoRWxrJt3fA+S5xdEQShCG08/NVwUth0wdnAy/HxgA9j8Axw3FERMe68l7
         WiJHbq7yjuXQ4CqhZq2F4VwJRKxtBVBwEkkTyivqOXBZCCKBZYwEz750wAFHY6pf1Wrm
         wlcyfm3mEaAFm7fOz4fwJdhcDXAOP62Zv7NlBbrOjR/4xo8Iesp1Bsx/s8AV2ahMGYKT
         c+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845818; x=1790450618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuolRd2+0mj4vgNgJerFOuLLsbSMUrRswx//2/7gQLo=;
        b=lvmWyvAV9uKAMkcHkT2MNYYdtZelhNRqpsDqFVzAdJ69qsXA51eBDhaFF3331LfotN
         HI1A7FnC6GPDdhmVo0GldMb7jIrW06SNKnqrAZq4u//pnLsFo/JWbeLNroJ1Kgn0yc7J
         jUrUwHhDjWAVKwR/bzLJhS5+ZIS5QIO/tOK0NhGj0YjGECNsDnwThJrIqJuHRkS2jMCK
         Tr6HNhhgLsPbtDUom392cEQ+iYnRRn3AyU8jEeVQlsmMUwQcZPACysTwElm3RGE3a6Fy
         XPUXfyllJITS4H0PA7pSz1y7nGiphGOGRycSZ6Oi7AwvyfuRegFnQFSVgnRfdCtgjCUd
         JvLg==
X-Gm-Message-State: AFuF++nuHpgPM7AeQlWQzoooeuW4pCjxuSL6CtAtEAbtzI5Nyx/DZCi5
	13ZnauMaRZLnE6AgaYwsdc1uWET7nCm0rbYJBX/iTpvvLQKfTP02hNV9W6XJ10nmCBHuAMPQfqQ
	=
X-Gm-Gg: AYBFou3QJSPmC5jRtVuDScmyERKeeMfD/oniAJDdlZAGobChmGhtqDmN9AZcXCechLX
	H1Ybka58MrrjHwqn3P2qPLouqMAO6W36yH97DZQoS1CkZYmQlxISk5TXwIp9NYSsqsP8qn3c5bG
	tfG8/O2hl1ekdcPtwMzAkdpIQa7ObJaQ9EgF+4E1LGz3QPdhLe4mpS8+L33yo76hx6yytzYHc0z
	FsMLpRZKpuOMc8Qd89geTihFLElc48Uh5E/8GyfR0PGlTH+rOW3uDGk9IvPeiwolAy6Pl1TNJjf
	zt/KUxkPA5m4qwnCkpvvr7YSWm1M2UBFOtGbKGEK9NGGKks35f9mZkQTSP9mojv3FO0qayWxYxw
	QAqWhDF74+5AIT418VaZEULyxM0DTid5iUAXZCUzSU8V51G/dFzD7x0OFboKca8anYpNVOJYmV/
	gJ8cdmLvTX0qnVgK6VtHlmBqNC/4+2+pIoJFhIhQZSHeY+0flJMTE5BdmNnmfIX0Jww36VXyV3O
	5as635xjva5vL4AG/jHKETzpdfJKRe8vnixooomdhZ36LqhhV1BQfC1TCayMg==
X-Received: by 2002:a05:600c:4e53:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49fc5757378mr86320335e9.30.1789845818264;
        Sat, 19 Sep 2026 12:23:38 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456325esm9213088f8f.15.2026.09.19.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:23:37 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] media: dvb_ca_en50221: bail out of write loop on non-positive fraglen
Date: Sun, 20 Sep 2026 00:23:29 +0500
Message-ID: <20260919192329.272325-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_ca_en50221_io_write() derives fraglen from sl->link_buf_size, a
value negotiated with the CAM in dvb_ca_en50221_link_init() and only
ever clamped on the high end against HOST_LINK_BUF_SIZE. The loop
guards against a negative fraglen (link_buf_size < 2) but not against
fraglen == 0 (link_buf_size == 2 exactly): "fragpos += fraglen" at the
bottom of the loop then adds zero, so fragpos never reaches count and
the write() never returns while a positive count remains to be sent.

Treat a non-positive fraglen the same as a negative one and stop
fragmenting, consistent with how the existing check already handles
link_buf_size < 2.

Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 1b91ebb8f667..9131f62c1258 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1487,7 +1487,7 @@ static ssize_t dvb_ca_en50221_io_write(struct file *file,
 	/* fragment the packets & store in the buffer */
 	while (fragpos < count) {
 		fraglen = sl->link_buf_size - 2;
-		if (fraglen < 0)
+		if (fraglen <= 0)
 			break;
 		if (fraglen > HOST_LINK_BUF_SIZE - 2)
 			fraglen = HOST_LINK_BUF_SIZE - 2;
-- 
2.55.0

