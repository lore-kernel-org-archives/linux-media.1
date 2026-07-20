Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A8B18B0F
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509732; cv=none; b=OFLJ2wuT9XuOzVn07mJvc/QqqTxQ/3EBQXjIZMK9n8N+Xm9A3uvlADvlqRjMRLgatulv7625fDOhZ3rkWbvzbJinLY14F9IcSDhx65wiaBGdyUGBgytcZkNoYxO4UXbWBJjr3UsuaW/kOHdhO9IK++YHju9C5LuXspNcFJ+l48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509732; c=relaxed/simple;
	bh=YibeCDoJ0FEO0CMpMRpsFxtZiWFHTq9rHfgZA45mrrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQGpVbJXI+tpGx650zW260gRrmRtW4eoUSG8t+7kG90I/I0LIR07SICjhTqXu7Zcjxa5c46EXsQmqCWZIKePW09VJm0fGrVQe/1nvc51MKtvEGlH9dJePXtz3n+LrdDTa4MIM/zlh5ZCuy3E7SU/Dw7uoxwC5teEJlrZtCxEluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3Jl8m6+; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3Jl8m6+"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1466107a12.2
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784509731; x=1785114531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUCEa3ZP3boM6F8lFgF4oiiPGRBy0aIwgosrmDJDdio=;
        b=L3Jl8m6+z+fk4a7hxjN7+tZMZHvgFw2dL2EaBmPNC8x63pWfRjxugUP8kMF0WQx/KF
         o7M74+xc7CQePy83HxycYVMe177UfXZg4xXOJkNAbDF+SffItrjqMeIagXPwlr6NzyZB
         zxjS4nT2C+fHuXKfGVajAK2/kTuzZ8tkSrnZriWRdwYpAIiJKPhd8Id7d+upUa1yP+Pf
         OzZwtjwO67VcjLk/PgIS3YLf+/VIzmssy2aJfmSPt4CfLrIm9K77xA2MhEodUUKwiQyB
         vbqBkoBOYhaER3qd8X2rwkojrJHSLx4Q6rvAF5hHl9eCAtsldd+rNlHaxzOMzOvdAIZJ
         L68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509731; x=1785114531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EUCEa3ZP3boM6F8lFgF4oiiPGRBy0aIwgosrmDJDdio=;
        b=WGjdEcrCQCfIUYcplS6+DzTxwsongXfKmfyLYQuM8EWhiVXjySTeWdELIkEuFp7SGI
         shour+D0XGnwga4/a7aAmhGRQS2t8eDZBfeBYUBA1PCCfIrB3dTugNSpQvcvQNUFTxZw
         tvWVXD1i/c4jcoZXF3eGmxwiJevvIDPQmY6SgHE7I9SD77/6Qb+9B1m+HN9rmlDX3sUc
         ePq2twmoF+kM47Xs/DOLhlfpPUkmBML2Qx3Qv2lWHxBtdAd41g2Okdh6ECNUkP0xalqV
         7b5VVXVkxp4xQlIyGHhmtpXPboz3WqtCSKXapp1U/Ry0FkiD3KvqVoMIOmt0OkSwLpjr
         tTGw==
X-Gm-Message-State: AOJu0YyZyJsn+nj6S9Vu0maDmh4YhxduasZA75Ws5sityltDJLXvSivm
	WQPxGJ17scpODuzm5y7b6Mh64lvbcAcK9T2Lil+eDUSHxsr+KR8WmeqkOvLlfVYtvDtYUQ==
X-Gm-Gg: AfdE7cnJsFnBu3Nuz3HcHeEr7xtNnBdEihODjaTLkQ9KlcuMgbDfQFZ/oBlTOZ4nYf+
	O/0/lvNZi/eFnN+//D+8UbZKW+JV3pP2cus+YSyj7i/E50WPF6NGXuk3yT4fBvwyRzsyDUUd3ht
	cY/yJXQ4QZnDKLle3qihEwK3AmfQqxH6EiyTJwHsFlLhYMHsooOEWt/uVfQK8+DBDITY7AyJ4nB
	YWdlwxqBOiPcfOUEw7hkUHbTk7eFvMFdP8u8pCzWnm7wvp2KFg5YC/pcz3uZ2zx5YdIVCfPl1iR
	zvbRY2GFqRf2c4CmH8nLvc8iAn7UTPnO8e8qSR8TjZT645pdtIhk48YHX5SywhiIBChUXbWhcrO
	++HFG+toAho5R3U98gRWNOZ06Ke1k+/qEtNuQrP81J6tTk3V2Yo3ZAYLz0bdDShYdADbxhmA369
	xIrFsLTKrSLi1MJCxvV3/ZK7Qd3/tz
X-Received: by 2002:a05:6a21:7002:b0:3c3:8aa8:6caf with SMTP id adf61e73a8af0-3c3ad6777c4mr13326123637.27.1784509730805;
        Sun, 19 Jul 2026 18:08:50 -0700 (PDT)
Received: from White.tail445f11.ts.net ([45.119.30.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm32054518eec.27.2026.07.19.18.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:08:50 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	crope@iki.fi,
	u.kleine-koenig@baylibre.com,
	kees@kernel.org
Subject: [PATCH 2/2] media: dvb-frontends: a8293: reject short probe reads
Date: Mon, 20 Jul 2026 06:37:45 +0530
Message-ID: <20260720010745.11275-2-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720010745.11275-1-nikhilgurudasani314@gmail.com>
References: <20260720010745.11275-1-nikhilgurudasani314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

a8293_probe() treats any non-negative i2c_master_recv() result as a
successful two-byte probe read. A short transfer can therefore leave part
of the buffer uninitialized while probe still succeeds.

Require the exact transfer length and convert a short transfer to
-EREMOTEIO.

Fixes: 2c509b866bd2 ("[media] a8293: use i2c_master_send / i2c_master_recv for I2C I/O")
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 drivers/media/dvb-frontends/a8293.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-frontends/a8293.c
index 14e7f6bda10c..27ad8d12c53d 100644
--- a/drivers/media/dvb-frontends/a8293.c
+++ b/drivers/media/dvb-frontends/a8293.c
@@ -234,8 +234,11 @@ static int a8293_probe(struct i2c_client *client)
 
 	/* check if the SEC is there */
 	ret = i2c_master_recv(client, buf, 2);
-	if (ret < 0)
+	if (ret != 2) {
+		if (ret >= 0)
+			ret = -EREMOTEIO;
 		goto err_kfree;
+	}
 
 	/* override frontend ops */
 	fe->ops.set_voltage = a8293_set_voltage;
-- 
2.43.0

