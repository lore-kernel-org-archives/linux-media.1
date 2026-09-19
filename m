Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B91472F95
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815129; cv=none; b=NM+4Ned96IQnDiva2GIBELJhi+MocRkD923L/ymmePRQYX8zppPukc3DWcSzNqwTi90j+MBjsAW5sif2iSGycoTH+rB1yxpaoL7Ceyf4gpiPuwV0Fg8SlxTZZ1OzMRY6v0ZTL2iX+GoTtnGWDnKfRfYeuetOTCypjX1aHTshhyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815129; c=relaxed/simple;
	bh=LIw84W8I9k+LuqPfSmXrRVw8sCdAF6oA5St7rGy1o+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EiBRKRXk1wQQ/gE7eTbkMy3de4gRZhzB4dek2DgRBe3JSCpSz3r5RiIut1x8NcuhNHx8IGvHBo5OJQsX4YTkiyR/i0iSoBJfCfLVOuhknMwO2H6GejJDNxG92nfhct55MnitRMd6R2RZvRlA9NC2pjbud5u1eSxEbzd5dcEWJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLsWhU4H; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLsWhU4H"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1192979f8f.0
        for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815125; x=1790419925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBLQW4VRriwtf+wFPBRMNLBW9l69Xiae7tic+lQ/H3g=;
        b=ZLsWhU4HWRk+4Yzs0yAZvn4brNGHz5Uzaovx5peaD1+COeIXG7PFiCDpjaHJ3cAEKb
         TzHr8LF47ChslBJpm0g9By5K8FgJfi5uCNvXSNpSW8S7eJCSRdDPK5m00LJkmjWzYsim
         QPn4uEfEe8aW48Yc/EkCP25nAtfza5y7VUt8MHtxF2naw4iKsguhWWs9S9cnvubBnJJ/
         rpjT30ldmdNLRzFT3oF1UbvVWJTmJkxj4mN0j8LqcLNc07TOFdX+l+C87yaWVvyVwQ2I
         tZ6Jjbp3xT0x5vV5Okqg3OYc4F7gc1wNOHqrN4FMSzU9ncwDNQqApytmuJHbk8Vlwufr
         J+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815125; x=1790419925;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yBLQW4VRriwtf+wFPBRMNLBW9l69Xiae7tic+lQ/H3g=;
        b=NuC+uOelH36ftd15enxjr47ndbael2nwxEkONERfOBXXAJZxJf4aBXaoXIsnoI0/8n
         Vp8S8HXPcvze9gpeTUJoNnODhnMM7FhqUjK3ceLI6YuygUhywnxIzi7loeaGnXI+Aqyb
         pjGKa93/odf/QQHxzbHymz3t3hgbDo4TIyu0T+lJsLpg7c+rcreHSZi6odOqAjbaucVZ
         DyqmWz9h84fwUEgsTghcjuk8yrMy3CArYxsbM/QSuCFJmuPr1pqaWxaOXEwYIpWr+psu
         RpTIf8MjRMHZMAByPrdw3bdNyBDOXdE6bnUKfb+OcaulAqF6MOsjOds2tX1Z3foxWJRr
         8G5g==
X-Forwarded-Encrypted: i=1; AKwUvBwvuDtT5fDa24fvKY1KmTEDhVGe8VJrPhGNfcXaOcrbaHaMTWHSdF5VywhKyb4D+rfWyfOtBZiYfUI1vA==@vger.kernel.org
X-Gm-Message-State: AFuF++kQMOFfLmeRa3PR4f2l5ciNF+IZm5UX8E0UCMw4GpKgH/pAY/H2
	i1+ULFkbq36SWbk2cplFbATAzP3xgFWvd3tHSx8QEz7Hcrrn7TLnIyqj
X-Gm-Gg: AYBFou3mZKFAwKemxcn/fntkQR2UTU8Kf6ZDoRXelRZw8NH54dAAwPKYT+JTT2q0ZQH
	OIzlpylnlxnfEXneM6k9Mk0fUQyfAxrX4Ml2Auh4Sd+6jYp5KOY46e7qQ+yJL5B91UjpANmFucS
	wmyFN6OxJEwQuFD/QOtUUvHJHudNsALDf3RnAYsQBDpq40faL9amDA3eKjKlKKqZRgQr7jPZw+6
	X7UrP2r1KFqmm+AGmjGXKTtv8N6K78iWG1B00JdQWpD/zX0hmaVtDl+eNQl51F1S59eAh+FV/8Y
	yivHNQEkscunsSECt5EQ3l2TB7+cdbQUwxNCWD83PdT35YDuWYHaCE9yEkWFpKFgFN9ZL5TQ2x/
	dOAUKccWLffvVvbNJd+Xuh9KTbh63zUO3Lf754kaG2+Sv/POdp3J6bTCwYS6XoT1RvoNFcvFE4B
	X8pdEONxnpauKC6u6nRjln4snHbkW4aZy76phnFRqDNU6fFz6APw4oQPdQEu8xONF7T+z/6w==
X-Received: by 2002:a05:6000:26c7:b0:487:f37:7ec4 with SMTP id ffacd0b85a97d-4871e25e47emr7454274f8f.24.1789815125076;
        Sat, 19 Sep 2026 03:52:05 -0700 (PDT)
Received: from localhost ([5.83.201.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724595289sm6399768f8f.29.2026.09.19.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:52:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: os02g10: Fix spelling mistake "foramt" -> "format"
Date: Sat, 19 Sep 2026 11:50:00 +0100
Message-ID: <20260919105000.1875554-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/os02g10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
index 141b7cb11fc5..7d3cbf3d6650 100644
--- a/drivers/media/i2c/os02g10.c
+++ b/drivers/media/i2c/os02g10.c
@@ -488,7 +488,7 @@ static int os02g10_enable_streams(struct v4l2_subdev *sd,
 
 	ret = os02g10_set_framefmt(os02g10, state);
 	if (ret) {
-		dev_err(os02g10->dev, "failed to set frame foramt\n");
+		dev_err(os02g10->dev, "failed to set frame format\n");
 		goto err_rpm_put;
 	}
 
-- 
2.55.0

