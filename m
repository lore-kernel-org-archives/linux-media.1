Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1452ECD3A
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792293618; cv=none; b=eAwqVQNwTSiUc+SBjwbo9IkRUwUViAbo0fNKuP4QROry/NrNV91fKgajudCyZ/Zp+IKCZJO8J09s26ub84ZPcOlVjPOIoEqmWHfZCx8yV81OrVKxYgAnSEgZB3EzrSHC7+IdCM5dmVV5+dWryI2y5oWd/4kpwSY8EUurL5mQHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792293618; c=relaxed/simple;
	bh=Va7lAw1wSvIjtYwVc3QAZwRj9uUpt9kS9frA9TRJRoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mj3OHXo3yn8QFy4yjlldq46jr6TQcMhk8i+cpG5/89wWifzx60/v0EdeHlzjqAZmnCEYp1fg0zIDuijfN8m89wKLGNUyh84pmlb6i34K8DNZgjpxTrvHk9b39G4u+mFa2kI82lxQ9h8Qy8MG4d0wJ4/LVuVPgvu6ga49YMXPxfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGnS0Pc9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGnS0Pc9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11899445e9.1
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 20:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792293616; x=1792898416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLQLjdJW3G4Tj7KDthqH3nXbpV2+UVQVNC1UrvvZv74=;
        b=HGnS0Pc9lR+73HPPrHTiImc9CrfuPpfcee9uKGlYCgEKWiHvUjF8QADlsadGwrUzoN
         7J103txtE0DNkv6stF9abJ17Hh+CUYWI9ZAR0xdyOOIJxizqax6OmTnXJyCJZKigX81l
         ABPdXkEzt6AS4WJ7aCf2TEYR6AfL9t8QYuAK8ddBxkrfbTCj94DuZt2QgNNMmTzSKaIk
         sBnOttE+fbJZjKzGZ/+0c1F4/uz33rgN7RyuvTnCTZ4d676uooTYVw4YdDI3uHYiAT9N
         tpeUM5AzE468fxH+SXEkMMkJraAgEQIMVt5rFYZiDZ4bV+qbb882UAZ29yQuMYBP8os0
         +n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792293616; x=1792898416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLQLjdJW3G4Tj7KDthqH3nXbpV2+UVQVNC1UrvvZv74=;
        b=0VOWlYkIa+SxNWnI33VGWDbLN+daPGt0sHadNI2X9gwaulWVHVCqZnApV9SfqVQ0f6
         uPtrNCYuIKaqbLi9Qcg79pRVRI+D2NR4a1bR7FZ/01FFdaR1HgbozyWYHZs0SNHdXdOY
         GCf6U92kw3jqdF8VwNxhIQ0J2h5e8VUNMp3ViGJA7lG/RK6WU1SEUIlaKeHpldorLJHO
         JuMJlH6389twP26l7K+6zlW1Keae7DI62+cELTdkjaghBeLt8bm1bPM7TM87dSvhmBws
         0vXH+YDiAS4As+l9NcWY6zeCsKGbRKCUTZp2aZABqoRKRYGNaTJi22DpPKZrHmpELoRU
         PFdQ==
X-Forwarded-Encrypted: i=1; AKwUvByxWirQ5YB900wab4nLfESv1voK65r33Lag1iCS6Ai9dS4Lcz5qavxYIKLIUQlJr+MFoLhIVsTfyjA15Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLiZSMX+nLAEmLvFgQu/PrjX+0iaNIwzh1zUAOEX3A22gx0duIW
	EmWZmUHpuxUpSwUw0434RuVF1I5B1LlQ1Cj54wj43lrdTzHje7dkYMZ8
X-Gm-Gg: AYBFou1+ETyKZVZeyG30YQG9jorpBJcUOTp+Y2It1KzY/aawTcmIQkT1GNhLOzuBbo7
	W5I/MCLDfT7uaV6SPDNOUvjb30sPxqAYt8yvw1g60HbOxsG7F0ELI4HBOWku2R0RHUAD/BEVgTa
	fW0mxQTfcjD+22NIp0/DUU/wagZTIt/r1jsvf56A7uldNa0WZNRAJcz/xPZ2qbhkMQ7kuHeG6mq
	oB3YgoNaubLr341q3arVIPHYrhcSTYESiqXW0H/f3w/JxXmtFv+PfESzcIUG1FfU6B4R4RVv8l5
	EDTGe8RtwT69kgunL3NqsSvxTqjVdjX3VdKHU9yiu9fKV++5qhTXBCFjWdtjZJGQeXHp5MzBF6L
	qMxQL/e9G/HduGrH4FSyTjlK4p9fiRtPWNWdBKtU2Ly1f22TYVhym7sTZ+2s1b02RWOfWhfmS3t
	tmQyn0DwKIHcX260408TFbXZTjEHlCuDiVNFdIBoPKuI5Hht0k1aQC2qEfecAMyk1jVpJLXP24i
	y6TtAHJhVDmqQqkjO+Aq3x5GehY1lXH/zPpRychzrbBoSoXMWdS9CKvJqA=
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr80710125e9.24.1792293615541;
        Sat, 17 Oct 2026 20:20:15 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm14202266f8f.43.2026.10.17.20.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:20:15 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: stm32: dcmipp: pixelproc: Round up the compose lower bound
Date: Sun, 18 Oct 2026 04:20:11 +0100
Message-ID: <20261018032011.207050-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minimum compose size is crop / 64, rounded down. A 17 pixel compose
on an 1100 pixel crop then needs four decimation steps, which overflows
the 2-bit HDEC and VDEC fields in PxDCCR. Round the minimum up instead.

Fixes: 239cf9e5fda1 ("media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
index 7d8e5f0863bf..9055682481de 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
@@ -597,10 +597,10 @@ static int dcmipp_pixelproc_set_selection(struct v4l2_subdev *sd,
 		s->r.top = 0;
 		s->r.left = 0;
 		s->r.width = clamp_t(u32, s->r.width,
-				     crop->width / DCMIPP_MAX_DOWNSCALE_RATIO,
+				     DIV_ROUND_UP(crop->width, DCMIPP_MAX_DOWNSCALE_RATIO),
 				     crop->width);
 		s->r.height = clamp_t(u32, s->r.height,
-				      crop->height / DCMIPP_MAX_DOWNSCALE_RATIO,
+				      DIV_ROUND_UP(crop->height, DCMIPP_MAX_DOWNSCALE_RATIO),
 				      crop->height);
 		v4l2_rect_set_min_size(&s->r, &min_rect);
 		*compose = s->r;
-- 
2.55.0

