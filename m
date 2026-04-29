Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F4219EB
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476014; cv=none; b=QeBEHo1KsQ0MEOk223ataRxm5u8c5RtNHkXv4xy1H3qbC3GPee4tQ0RovWSZOA25dc7pdtgGspLbFKy1fEjlpCoHt/JuJsQZE5XgduBb2Ywna9HjIj1+7P2H2c68TRn5YYu1Ie8BNu8pSaina3qEar3sh4rTnBEeN6SU7P6ushk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476014; c=relaxed/simple;
	bh=Ew9ubal5x9KS9bq3vi1DJ0S0IiFanwbXoxQj4zEyPqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U2SUnU4Io5d/EDD6qoHFu1MJpW4Ug+7YfehvnouCC1wCzQCYcWBR+5chjQteyPAKVX3Odp74p43scxgjIb6a7n1/at9TNolUOmWSrazHhkgMRQvyOVCxsqgex67QhBVQ1moJRecU10tL37YKreDxxesHgKyCltThC/0n7uRYZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNULYqJO; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNULYqJO"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50e5bea4045so89058571cf.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476012; x=1778080812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LoV5LvB5TeOBPAogjEhvUJRmTuyIhJKQITrSyrp0dE=;
        b=aNULYqJOx0FSgPIhXnWs9uXX7KUYi8+1VYFSL4U/8gIICkL8FZxg5zi3E1W0WUVOeZ
         MGhIcjwTWMatR00500o2MFzOQGK+Yg2SUCtukEveGeOV7rnbnz5zsKc3Jmq8oRIahwYy
         C8cTDOE2zJhl6iw/U9heuKk5hJxpJHb9LL3PpmMdQM5P3yQhmc+wOUaDJTsCdHoUwW9O
         lKyGv6ufc1eq098nbaIfkGZ/ZWAWvVZ9elsI6wXaDVouuyIJ2NurBwAbaonqQJWERkye
         cnpFTw/Hy38RKMB3cyBQV9V0UxJULlES3MyR34T0/b/XH9uNC3T3RWKwWLOtbe/67a4o
         MIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476012; x=1778080812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LoV5LvB5TeOBPAogjEhvUJRmTuyIhJKQITrSyrp0dE=;
        b=S0V2ALGzZ9+QL04oRnWzAUc3ShUjf2FlYWOjZXEfug3l0918a7u1TUVuAUqiWDgU73
         UecZLcFLv6poqgYRqLLbyrKzpmjfHx8OxlLmKsaxDuEL1q4NuwLGYAgXV8ywHB/N4IL1
         oTl7SBCi4BCHTUs3ylf7HeoJCDS2l5q3vVjJfjiKFHivRW4CiVcaRcrlO24tNd7t3tGk
         Czf8m+OK2dTwB6EctDMxVea4ScJV6WrPiCwGUasIgfyO0S3I6PXArT5PKF3OlG4/oey9
         Q2GTITxiiRmg+TX/+1VF7V9neSZDAkSnvAEUuoa+hOP6II5rNXcq8S4ITmJOVaznpOXG
         sn8g==
X-Forwarded-Encrypted: i=1; AFNElJ+pCtoiafPhFeNmRVa6JH0+gOqPHOOf53RzRzBatnM3E/MVx3DvgHaN5uw3wXaTxRZiHD/O4EoB3a8ODA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0SKR1/4BtXdXlaRkvDw/Wa4lQYPtNh4IvttnV11ij0266OtP0
	mxFPbgvsUc0N6/58VxL/eeD/YfUDGDDKtR7E7mpP3HdkEJ905Q9BbmH5
X-Gm-Gg: AeBDieudOEvqmg5RLFd6X/IFKoO1Ym0bzplz95WzTZON9RwdLRcedSXbTBK6yTFj5Qb
	UK/7ufEyGF5pwPaIIfGTIooRED4P+RaiyxKD3pYcI/MhXbnacuVbbX8MOUxzQsdZs2QOAWgpqB6
	2JWDu7JtGIWxVLe+quYLBaUtoEUdsXoClogHx4HyYl2LzofuyZ9SiPMqMr6APwqR7h6ZmR2u8IK
	tuFq2TpcURwEbaBVxl77W17m+C9o5qZAAhfs3DW6O6kRvlzSHjblievn7p0rvlWHgRp8H7+0ecl
	7tLgwv85/LwdIl0ScJt90hkrt6a3xkb3/fuNtRUgwkLlFWqe7BsSQYoMVBPftYOk9JfjZxiE0f0
	tT32nC0bl82qF+qEhK8QcnV1/UyfNYHTlHfnGxJ5/Kk+a5GE0IKKqsiLGHh4Rv0FFs0fJRBHMXT
	Ih4XJIUBojmKVWHk6fDuWYYI1bRCx47LdWYJ7woVzdxjOjnpJyDGqiq5y1hoU/oanA+EBa
X-Received: by 2002:a05:622a:4a89:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5100e101278mr117552321cf.5.1777476012272;
        Wed, 29 Apr 2026 08:20:12 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:84bc:8954:e2b9:d27d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101aeb58desm21712421cf.29.2026.04.29.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:20:11 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Wed, 29 Apr 2026 11:18:58 -0400
Message-Id: <20260429151858.28761-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1

