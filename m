Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140946;
	b=sMQCboHbyfUQgTd11kM3wT1riePun4JMwn2BXt4TyNvA/koCRHJ0Ui8cYNILunyeAVgp
	 gsVr94VfZbZT0hyVHm5r4RRT9bvu6JWa+vptuqr22PKN960Y27MOuSjNsK2TXa+3CpUNP
	 1TT3crWFffjQa1cMEMQ566biAZk77IriIyVb8YbftAmYCEWCH8pleDJBA+SircGOXre6B
	 r6RjkhZ8OZDNbjV1ei2uZBk+VN/p1jCnj4glQXel3+WGkx0JT4z7ruxoMnnzs1od1jpR7
	 rgxtuPh+VRwnpyoXpIa1cJ2Hb3cOda+oiXeOGftkRDQRh7J1fBOYwMhYe7ecwlrk8iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
	b=n17Xj9gdwEFPi0rGbLBY42VGNnI8chUmXZg5XowqIgDc+c6ySZiR/JrCaN0K5Pdz/3a7
	 VLf/8DguMH2YBleJh/lC9NCPUZJif2/aiAfFpeWK2ZNYo13mDK8bHjC0Wtk2YFrR749IS
	 aolJ+SZDD+EkzyQ5Q4DgsPfk6gTCX6W3/ZQ2ellbekHf5ChEl6ACeTlRIX2zi5MxjTOcX
	 7xV7ixAnTVbszM6F+QzK1p1rfljCYfeNrU4LYZYE32/AzwvA+OrAlf1uv60HsODNs4I1j
	 Kt0MmjTMFT3dUo6JxId4gPOaGTbbrtUwoAEJzPtfN6ny1maCieDgurfDC2e2PfdMn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S+Yg+so/";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ABA606A320
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 12:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33ABA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+Yg+so/
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37071c0f42aso166249eec.0
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 04:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794140944; x=1794745744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
        b=S+Yg+so/wrYSMEqce3JawMB8vT2zIoQojZ/DHUYMAuB5JrUIMjTCcq/nFfwR38Rqgt
         6e4j3Rr3HdIB+zBUDjJzr7VFBOs8LZRU0hSmSWAgqYRY+c4yiQqdYHa3aNVm4Lk6rtFt
         EadmBXCYDUD8OpJablBSr7NsiOt0bMSooAhCOr5fPlSWe+i1CsGj0a0WCso9uaXh2/4n
         aM9vHDv+d81UjDxeyl34pBEl3R/xzIASSnA9eEtXc7pCNSWS+7aU+b1Ux9UOpI9dbxd0
         b9jBLeMU8Es4H7PeoLjhUOVcaZp76C3YXdTk2AbMwpW5nYamlDQ7r+jojZ8JRLkBIjVF
         pudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794140944; x=1794745744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
        b=W8sDJ+ItMCUsIbQFsqr8IIGyxnAl5WudNkmeXPKFa5MHTNEpclkFWHZX0dTNrQHttK
         EbQMyzrKZ/bkTpYFTbH/ImuJOypYsZ5ZFJqUbXEKT5/ViNil4QFiaG0ppwA4LXSyD/Bi
         8nnf1pmVqpNarLRMgseZeUuY6hkOiIAJdIC6MbTrBAtH384eXlPtv9prGe9rk080N/UF
         6QCb9jHE/CrvDThwD57ya5ai5rbB22f4AkQvD03j9V0EkyAdR56JfKqFMnAGvAIzerT9
         iqbJzmg79DEmvRE0uIpfbRlKkUTsFNgJYJ+9rVlxsk/GNGHQJYvvvYDSIVxvjQZTJMMe
         fjkg==
X-Forwarded-Encrypted: i=1; AL+hErEdz7UJk+C4bfimiCJ9gvsDGScLLjCZABGacbfJwdy5hrAPnYpiqpEM8n4HGHnjJwmB7AfU5JZCnENWHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RxZLOBFFm6JRUMQGfWV72BgKHB5shzXHLkd0pSJWPUZ0GcCFb
	EwnlC8B94X1GB7sZhkxyeMTtK4vVGcoJQWZo+PjIQFN5qXWcHU3Zt7Cb
X-Gm-Gg: AYBFou2kgYo7nvhQwf+tnOKVgdeQFcnEYR2WJJhDhvA6HWJ/2BhAUs66kxkWG4UxaD0
	d1KvLrA2LDPfoc5HVLIajprJjGCNAwKU7bSLMpH+CxIlsDB+sQQbB5tTLbr31c47dFSvQxoihwO
	dZeuWUfLwlqeCPCPB2OFXez/7iSIJqT+yyjQl5f80RuUJ0lXH+jDLZ+LmvJCLMVqqqkPHxYcemc
	jyqe4vBp5YIDnG9fMcXFyrCzKQQ0xbUjkZuqgXHYBo3uAx2RoI7Q7Te8ADhQNhchqR6seTJYxQb
	EV4lprYlvcNI7NjJTXNA4XlWB9dDPL4qTIB3HLFyH2gWNhZkPxAeOEDiI9HUHGh7ywik6181tR+
	o17PxDuVJzN4nqssAaW60R5RWMNYuByA+zGHi+R43nzuIuTYl5f6f/jmr+9c4qN5cK71R5zQZtj
	7hOA6sr9Y6TA+eZ4HiA0zJhQlVv1A0hPDL1plqpO768wf3AnOrO6ZuhCFQwUkA8le2Hc5wDKQRN
	h0WZgzdreIjez1RA30dQxB49swZ2hiA8HvRWq4Flwtdj3uMHtTnEVr0DoZrch+DX5B03dq7gxpF
	P1bJzpnPjSNLZVoCLuczemszY0u6ikffcgEk5Eiyc8InRlhlkYFiJARIYlxtgx2xFvKj4BBMGuR
	KAxHltZxszMcX5Cb79J1lJ4ewbPveS/l6
X-Received: by 2002:a05:7022:418c:b0:1b2:3448:840f with SMTP id a92af1059eb24-1b39fecac01mr3000460c88.7.1794140944129;
        Sun, 08 Nov 2026 04:29:04 -0800 (PST)
Received: from codespaces-88e7e5.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([13.71.3.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3731487edsm6036253c88.2.2026.11.08.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:29:03 -0800 (PST)
From: Lame Morupisi <lamemorupisi12@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lame Morupisi <lamemorupisi12@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix block comment formatting
Date: Sun,  8 Nov 2026 12:28:40 +0000
Message-ID: <20261108122840.85622-1-lamemorupisi12@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Align the multiline comment describing the MIPI frame memory
layout with the kernel coding style.

Move the opening comment delimiter to its own line and align
the subsequent lines consistently. This is a formatting-only
change and does not affect driver functionality.

Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cd..57179298d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -130,21 +130,22 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 		even_line_bytes = odd_line_bytes;
 	}
 
-	/*  a frame represented in memory:  ()- optional; data - payload words.
-	*  addr		0	1	2	3	4	5	6	7:
-	*  first	SOF	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  second	(EOL)	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  ...
-	*  last		(EOL)	EOF	0	0	0	0	0	0
-	*
-	*  Embedded lines are regular lines stored before the first and after
-	*  payload lines.
+	/*
+	 * a frame represented in memory: () - optional; data - payload words.
+	 * addr         0       1       2       3       4       5       6       7:
+	 * first        SOF     (SOL)   PACK_H  data    data    data    data    data
+	 *              data    data    data    data    data    data    data    data
+	 *              ...
+	 *              data    data    0       0       0       0       0       0
+	 * second       (EOL)   (SOL)   PACK_H  data    data    data    data    data
+	 *              data    data    data    data    data    data    data    data
+	 *              ...
+	 *              data    data    0       0       0       0       0       0
+	 * ...
+	 * last         (EOL)   EOF     0       0       0       0       0       0
+	 *
+	 * Embedded lines are regular lines stored before the first and after
+	 * payload lines.
 	*/
 
 	words_per_odd_line = (odd_line_bytes + 3) >> 2;
-- 
2.56.0

