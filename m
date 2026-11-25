Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590367;
	b=XgD8/JLmbxtMaxS8zVfbsQp3lYwHzHt36AAdtpzP37S/qW/Civs5HEKyXZYNhjLJRajf
	 N13BMaf+j+WTkEtu09Mi7O6fO87lAqRouOKelfu6q9Egf7kqCW0rNoEj6tqTr3eiR7SsA
	 9/m0xNy3MXj8vmqnLhq9FzCHsWUY/m6ArmmPCM2zTzNAa5UmZhTBgco/qJU5iSp4t0niY
	 Hhmd4OSSlCvPqJnaNTtp5LXVkORYodNMcfKmEHkb5JldDdETNgwWqzO4YYx1B/84CNEk8
	 v/lL9AbLxp5mrm4aDST9p5upuCmwz71lpEtk0cuRvvhDnQgleOfpy/z/qELNabTR1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A6UmGJ21affGPFr7f9oqagJMj/3pD+7PVBT7Ip9WBo8=;
	b=ye54nSeDlc505iLOlUXy8vNT/bZsRlMGpc00UPhlgOgEyWOkPAL+2pJvf6IfiIU4gtZd
	 aasKmYYvMu7l0Kx0/gkjH4EYOdp958/jSqKVOonDdehSBExpECZFs3wwoYLhsERKIx2Kf
	 MJAyQ14xRu9Le00pbJ/v7fl4gzLrg9NvYs09q3Ff1YF7srEiVzkwE0/wKaDiNbswG75mZ
	 BmieYAFvqgYJxJt1Qdq1HGz9mb/pwNvCYHR4JHrtf2ShVBbIARVqAHNCUG99Bm0wVPvmF
	 ROYDqNwgkk/DksnQ5V9SkfzTusEW57nKoGnbKjGzuLstCULlCA/4u5uXHVCtKO2sP0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn6QGWhf;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA175606A33F
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 07:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA175606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn6QGWhf
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cde84cb8803so1317531a12.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 23:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590364; x=1796195164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6UmGJ21affGPFr7f9oqagJMj/3pD+7PVBT7Ip9WBo8=;
        b=Jn6QGWhfzKXXEZXbyEgKV/jSiwvHvSRHHKtNZ1I3MNQsGTK/DR9/C2GEZzS8KwLyXm
         esb1B7mNPSXNchYB0aO7OTV1XV8kuaVLHLLutXrRlyFozAwTfpQyOUeO+zoXlnBD1HSi
         GFvGyUwLP/hhFYevjOmRojk4X7Q7I7KrPf2DCgRG5BNGSRbjF2gAnrcfyEuUzJJWoklq
         +Lzj5orOI3vIX/m0L5R8fqERWb4KxiMATz+unXOo6W3mJrhQNYIbvYRUKnCOAoZCsyau
         oqjwzL+rSbENVKiYxIYfS73elznhvyyb/pd0uSfErSwjt83fjOOSPW3j5GFV8Hwvm/KR
         QsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590364; x=1796195164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6UmGJ21affGPFr7f9oqagJMj/3pD+7PVBT7Ip9WBo8=;
        b=ZgdCmJSj0yvQPu0ZV2lZ9Th2dXnPzVOUpN+PpQF6Q3wbRJzrDH9u4fTOBqXd++UHWJ
         CFpr6h0nLt/1/yiGNvtIftwwCVPXXl5S1NgO/ao0v6llF3t94Ti1a2hmEucyuIeOISbw
         19niMdIMpDrS+f/HM1yLo10bcZkjV6kfC5CjTcTEfDp8/OF/GmkKNPf9EaFmQ7l0DLyQ
         JrdNQnQ9EaAO5USEiksbKcxz65Us/WD/LhS6lT9cBJOT67dBONhPvoF31ijkQn6bcoO7
         sl6kxIzj02yGbiravcO0mFH3ZmJi5kmYSDY7gRbgQl0+hN9iUvelUkaqfrI3jUrbXhTi
         /82w==
X-Forwarded-Encrypted: i=1; AL+hErGGPT4yC/8esKKCoXY+wmGj+M67x85AeYTn2ed9QiGSfC/Z1sXCW3nkeiheyyppLO4opcLUA1N98t3TnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95lIg7pz5WnOoAl59psymr3Yj4vHXYTM93dN/Y+nU8IxxguWyD
	f5Wp0bnge2oWfaiHrnS/K28EY9snQGHgO+XYwkikKTBCAvjEqS7qKlDn
X-Gm-Gg: AZFdTZeXY16cKVofwPIBy+1luzfaOvqS5Cs/o8Ahg9fn03BkX7rf6VVPiih/K1omFCx
	hHNIRrxOd8xC2myqHraUtMbU6a2HJZQBwqNGNIQaXN6qRqOCBkNXA9owj9bm3/QasRmiho1f0iT
	wZqXoTSXsgb+mfDZrCTiqnhT9JA4sksdVOwY0uUNv5C/BRB2Cms4bJa9RgvKWxHaB3TYY3koJV9
	u0dGR/cVKBp7CS1FyMr28Zagj2EL0oi5Iej4vSRU8SsVq4zZKdRWjwmQzYhoA3O5NloZgjBt925
	cDUjzEvMsoJKfVnBZ72eDWZ3m6fOqZPBTMwytSs3+SDW701pSwkD71DStaRClGQcxj0iQ2+6qY6
	pwMKKpVoJQAulV+wNzzxqY4spNzHqNGlivTL3ZlwRNgGrMZfy14IjLl37mFPK95yWMfNty/5X16
	T0Yq3Jx4gPndpZc40L57LEOMRenLloZNdn1LXh6CggLZYoEgDOEq0QkCXq1ZMhF+oV7nCk94P8K
	FZ7OBUcVADJJeIVcb1qpcrZBR9qX0CLvNGHayMVQq7g7z+4SkWwfFQ0UUZD0T0kHZTUu9HK5zfK
	t+vWwnWfw5cA6F9mEUGsqjW7TzZzNPiFA6nJAcY+we7lOVce6YUOJ500Kc/jlXo=
X-Received: by 2002:a17:90b:3e48:b0:3ac:a521:95e with SMTP id 98e67ed59e1d1-3b41c94ce48mr16257933a91.47.1795590364121;
        Tue, 24 Nov 2026 23:06:04 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:03 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 1/4] media: zoran: remove always-false buffer size check
Date: Wed, 25 Nov 2026 16:05:45 +0900
Message-ID: <20261125070548.28989-2-hiyoukou@gmail.com>
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

zoran_v4l_set_format() assigns zr->buffer_size and then immediately
compares the very same expression against it:

	zr->buffer_size = height * width * bpp;

	/* Check against available buffer size */
	if (height * width * bpp > zr->buffer_size) {

The condition can never be true, so the check and its error path are
dead code.

The comparison used to be made against fh->buffers.buffer_size, the size
of the buffers that had already been allocated for the file handle,
which made it a real bounds check.  The assignment on the line above
turned the right hand side into the value that had just been computed,
so nothing is verified any more.

Remove the dead check.  No functional change.

Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/pci/zoran/zoran_driver.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index 5b4d5dd06edb..a053365922c4 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -179,13 +179,6 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	zr->buffer_size = height * width * bpp;
 
-	/* Check against available buffer size */
-	if (height * width * bpp > zr->buffer_size) {
-		pci_dbg(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
-			__func__, zr->buffer_size >> 10);
-		return -EINVAL;
-	}
-
 	/* The video front end needs 4-byte alinged line sizes */
 
 	if ((bpp == 2 && (width & 1)) || (bpp == 3 && (width & 3))) {
-- 
2.43.0

