Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290616;
	b=Wf8nGJL45NCtQZcgoH+xyID/iTTcrA67nU5Rtz6AS0m+n5fjsp5moR56h22B56Kxwot+
	 u1iMvw/QqeJ/1vQz/TolhizEOzxvZTWnifQDAujrjDWbbzHlegUDYsKQ0Ol+zbvlOI9zg
	 LBLORNhtlmRcJ1/yM5FIX8ZvzCAjvQ/U34YVtdkgPsnb3H3Y2nJsh/bWz39NrS+Z2ctY6
	 PUldevXQ0grtoUMBbJvSD7zn+uo5h1c1kAUbrBKVljSSnUNxG90YPhZshIAh/5Ddy8yS+
	 cvWMFWds2AqQCP216QWFjpjj5wFlgYeRK6acYDOtApwtpUZ5Al01ADDinKCK1vK+dQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=caO62CRcquzMhc3LfJR9sFGBYG9i0UvG7WLpxAU9WDQ=;
	b=y5ds6AcGs+/oNA29B5W/SgPwTppNJ2xbTk/igFNkiDoXKE9eIhAJ/aJsPKMWTeTu4HPQ
	 LB4Kze4wzb5h9mE7gur1Z8YU4fi+7PGahWa5B43ev2QdQSE0EbdnLXoUVML6/tJd3egF7
	 gJ6UarukSPnFFJHNirZBVFxqAtFdbtRuSxYQAPdq12S2O3Ai0O2UhKFy4vZYjllIcHVa2
	 uRKtHEQshLUFq93X9VyjDuAEs0J3WEnyeI1KZXm7mNVYLkk6MAgaifruLi0oKNpL93Bk+
	 NIigE+O+S8jvL1NrY2PkrOAL5oKupCKvR4KRvxQiyc7rMrLDOukp++vv5dmQg33nCxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWojhLjQ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB5606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 19:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAB5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWojhLjQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a42b34e930so1729277f8f.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290614; x=1795895414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=caO62CRcquzMhc3LfJR9sFGBYG9i0UvG7WLpxAU9WDQ=;
        b=gWojhLjQLIPFxgEsCV8UZbCzC0PLaIsSqUzBowkTLEz7KA4iCZycyQCEthgek5zf94
         58zNgjfbhhbq82SuVPbvP7dLsmPjklKtvZjb+HE5syT869WgdxjM3qBb2+dC12G4uk5g
         nc54Y2cUGa9ows1ji6b8GHtpOmwHEU99FYjNMF4MEzne5uK3S55iwxLApoCz8zs+yiDN
         Vn+9yQi9GOPvKtkCQUbwHaBbpZCfOzGoN7stBbypgYalNOGtnIrvRjWAJc9eh/nzNZQP
         61wNBnUzaZ2tjEEjVhbPe8XnKouYgSXVWMJi4zZrQ6hOOHm1ClMDZM+JbugY48plBH/S
         1XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290614; x=1795895414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caO62CRcquzMhc3LfJR9sFGBYG9i0UvG7WLpxAU9WDQ=;
        b=1ZNKQJriDKY/X4IE4fH/EQdmwAHu+jMHmTXGr/Ntf35FEYrshacGA3L9DyXmyukU9l
         WH27DfXLttxCrMuh9X0Xa9WjD8je19T+BUw3h11KtQmIPWhkxnhBnAN466zqdftwTDlk
         uKuR1/VEJwdBA7LF9j3Pp2RBCYOclkirGleCQOUEBzp80eG1z+5+eyO3n6dwN7uotG/F
         lxzmyIyT9iWga6AzeorL6QXOAO9rXniuenniRUcwMcKyzciyoHFPfbgnatM++GF6mD5f
         6vDiRkxq99Z5dwX9WJehZcZG6fe1cSfqnsXyi4pwM75i1RAoeHnEUsF0jpN9O/iMsJnF
         /4PQ==
X-Forwarded-Encrypted: i=1; AL+hErFL/3WcXIHN57F1U/mD3tCE2I7JBW6H/n0hirP2a9a7+/JHmufbO7WiC9vns9jP/UcwAIcckKu3ec1zTw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+N6/amvakx1oWOYmcvOSYi2AmXmGmFak9HYaZUKMjjPkwuSpjh
	UJSW4HNJXLW1vY0D9IaU7K0PVhY9NTedlltRJmdspwYHi+YfJZW5syUP
X-Gm-Gg: AZFdTZf0mn/IZMGZGmccL31vA3DChM0TVk5OW5Iq5NdjxvAqeK5UNDjcGK7X1iyDNmI
	Jy0OsiE51NpuTK7cGI8K8XG78ShAW9/0KRuar9L8NYLQfrFKQxj8L7kN+ZRPvUBV9Rock3UI1AC
	+JNRnYXTyM/IphWTZ2lst5VRb7yZ2QF5hzVZ5fKLPrp88kGbGne4Hw61W9Yjp7v+H1v7dIiICPa
	ICm17qLxKkRshZU5XFeqOecps0x0sAuF0+q7tzzTVD5DgE1PE5cxwsGtqL+1USVLkC7zzFVr40i
	5sycxYkm+vWhvEc6ZvT4dP3y6+cSmZigku8ySMcjiDjs1Sf14VMwz7Ws9MHdlE7P0gukAaKxlQW
	j+nULwi8lKP5GltJcPB72IN6nYhpCnv7j7mVeOYB7PWjSIFSEdMMLQMmJ4RRiY26yeylIHLBB6f
	Zs3GobSEqq/XL9YEQWkxWQVFcYgJ2PC1qBfGYmJ/l183n6tl9YEQBK90fj8uA+3DDfVOyvMQTnL
	dGTBHRtCqnByQDb4TGMObgP5+bJSgVUrv9IXLDMGA+mjYyt2tb3oWIikB5PAdiRkMAcI61+dy2G
	H62OlU70fkGpQqSIf2ZEFlYwgsy5KsTcvl0iIQswW5U/bSiHYUT1tlsmlE7gXtAxmdip+Hx8J+u
	r4+y+jwFtROZmpg==
X-Received: by 2002:a05:6000:490b:b0:491:8462:20be with SMTP id ffacd0b85a97d-4abb1baaad9mr14119237f8f.12.1795290613677;
        Sat, 21 Nov 2026 11:50:13 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61ddsm11814869f8f.12.2026.11.21.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:13 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: jacopo.mondi@ideasonboard.com,
	philippebaetens@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: i2c: mira016: Fix analogue gain range for the default format
Date: Sat, 21 Nov 2026 19:50:10 +0000
Message-ID: <20261121195010.820752-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The analogue gain control is created with a 1..1 range, and the range is
only updated when an active format is set. The default 8-bit format is
applied by init_state as a TRY format, so the gain cannot be changed
until userspace sets the active format.

Create the control with the 8-bit gain range to match the default format.

The issue was found by code inspection with an LLM, build tested only.

Fixes: ab4a4c39c611 ("media: i2c: mira016: Add driver for Mira016")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/i2c/mira016.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
index 082442ffad28..076e8a22be82 100644
--- a/drivers/media/i2c/mira016.c
+++ b/drivers/media/i2c/mira016.c
@@ -1917,9 +1917,11 @@ static int mira016_init_controls(struct mira016 *mira016)
 					      MIRA016_MAX_EXPOSURE, 1,
 					      def_exposure);
 
+	/* The gain range matches the default 8-bit format set in init_state. */
 	mira016->gain = v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
-					  V4L2_CID_ANALOGUE_GAIN,
-					  1, 1, 1, 1);
+					  V4L2_CID_ANALOGUE_GAIN, 1,
+					  ARRAY_SIZE(mira016_gain_lut_8bit),
+					  1, 1);
 
 	/*
 	 * Changing VFLIP requires re-programming the top point, hence we
-- 
2.55.0

