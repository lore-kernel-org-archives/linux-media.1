Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD73F9265
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108476; cv=none; b=tHu2I5+0iK7y1Lv8AmPF+MpNPr3fWxHppM2GchgMloV3Qba723NG1cjeHskz6AmXjMHz7c67fc+pax/LA5NDJMXoPei3mgMuQOH7KEaln1I72RhlejATZ06+0oe2IaU0OPBrvO7AwMKQHFyE6O+ijhJihAOLxpjQHEfClCafreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108476; c=relaxed/simple;
	bh=7GlmDoyW4bfU/UvvrDoTiuGj6klREMUqUByskEivwuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbR/hAcO8G4YhyDZGTkkU+QfD23iOy0N8qoOGd24J6HtdNuyuBMiTcWVlHgtWJasJgF/fJf1DKVvY1CghWXLF3ZhkXydW0sdSJlr1m73YkBgr5fA5R6zWTWA9moNauDDAoRP9YYeXq5JTJGw2Id+16hd7KgltqzRXRW+YcpkkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0hWqDRe; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0hWqDRe"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so692952f8f.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108473; x=1791713273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=L0hWqDReFy5sz6MdzVJmVFHswZC+TVOB2Ra6qnGgWWPAdKiSpJEd5BBdXi/95TwBsS
         vsC59XPyUWaeMECX0O6Ty//kikgOaPqlQ46Cb2hggC900t5TmCriwcG03eTy3gwi3m90
         6RPNNuIX+k7hQ6xzc+lHcbDGmS1iYPwm5H7gRib+A8uxloEGYwaA95hiM3CydhnzW0dy
         /3k0UaHDb4yIngVn2Xbdd7i3wMDwcIvp68lmn7yp4vdsYfhF7Hx2pA4MNMQOp0VtA+Go
         5glCSQOn57Htbi2nggyPGPqTKtyc1AYLF/7FnD0iA49nYUvEWR2WJszdSesktLVt/gW0
         jvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108473; x=1791713273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=0tqRWKl9rOQb8TLwVkkCq7UfTflQSYrTMZtVD6zmJDrZ1CaR5dgYo3nD3Cqxqf34TX
         Q8R2WVNck6shkVTzyyf0D3Bx17NfcB+3E39h8eGBE4BgtywR+lxPvEHgDfZa+XOfJnmK
         1EoLTPzrWLxZ9Ij7s0zWGyDHvNagGo9cu/PzJY5JMQeKNjmGepFzwawHKkj6snkG0I9r
         FSSLf0utIMAh09NvYDLbALbi4HS9hDkiD0FYgzIWdouAkKFI8semPe2LR03CuSEp0Xl3
         jnfZyrNxQyCQlTHtHXCbSt2+q8DwCdyo1Lth5Y5lH/Hj/ls6/8XhF/Whu3nli5VdTiic
         7Anw==
X-Gm-Message-State: AFq9FYLecGESdGAcSAnY3vHXuIUxeWEblSeUXv8W0diTtcdBomvFYTrk
	0gLjva1EPrSA5zYKWNBNG/Dwb8cnVfLhDCNbQMbmfbc3ORX7HG0noJ27
X-Gm-Gg: AYBFou3o2bWYxxJuZjvxau2vUQt7xYFEW9B/xqYDsG5s0BUz6QV7LJnq0MfSKnsBpeq
	qEV1XsKsJwQo8TQS+5FDmsWg9kZcMWvB/5fraur8YkJRQXABg1rX2du1ydBOwlQO1FaauvGvGcg
	ri4cwVDDdulCYLIX/1FsxMOXUXWajJP4kvb30s8lG9t8bZqdpGpvtkj9xoA5KUCugj0AN+4zHrC
	gl5DlaJeeqifuBYfProHhulbmcVlplU9ggl2SQpa1qkHCgi/rZvuhGtvW3pDcVNjrGFvhoymbJl
	tquwRa2S+rEY/edY8rR2qJ7NL04MpZFOzQflwtOiMOPbqw5ALqhkuzT7GLvF9h0QmDj0ofGlJ0J
	TvkUNzzJHevtjyYnZhPoHUkZK/2hKb0zgrEZhzFybraHTXTL1fS5hEftaPp36F/sFF2RCvVzWyN
	YW1RbX0JFzCoiGCCryF4tJE884BWppcOEUCOyjrF0y/J+l5nowkcBtlN5fxVieP+fixVWHTKWqp
	e0f8i8/htt32/ClSflcJH/aQXrampDHWL6ymeauGdbAuch3edqYzF8SQLT/1fRFhax8FlBarD/e
	GaXSxXJN0msGwXQBh7Xexxb7DhkcYvKpclVb3JCC5iOccYJ/Xg87c0IOO8ix85A96ptzxnPuUxv
	3dD2KtuR1NQ41AbgKcqbG
X-Received: by 2002:a05:6000:402c:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48b12726a91mr14815824f8f.53.1791108473037;
        Sun, 04 Oct 2026 03:07:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:52 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 3/6] media: drxk: stop retrying after disconnect
Date: Sun,  4 Oct 2026 12:07:38 +0200
Message-ID: <20261004100741.71711-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
References: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drxk's wait loops retry I2C transfers on every error. In
dvbt_sc_command(), read16() can leave cur_cmd unchanged when the read
fails, so the loop can either exit early or retry until the maximum when
the device has disappeared.

Stop retrying on -ENODEV and return the error instead of continuing with
the command. In power_up_device(), check the final transfer status after
the shortened loop.

-ENODEV is only returned here after a USB device has been disconnected,
so this does not change behaviour while the device is present.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-frontends/drxk_hard.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 47786d0610f0..0815083e54eb 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -467,9 +467,9 @@ static int power_up_device(struct drxk_state *state)
 				continue;
 			status = i2c_read1(state, state->demod_address,
 					   &data);
-		} while (status < 0 &&
+		} while (status < 0 && status != -ENODEV &&
 			 (retry_count < DRXK_MAX_RETRIES_POWERUP));
-		if (status < 0 && retry_count >= DRXK_MAX_RETRIES_POWERUP)
+		if (status < 0)
 			goto error;
 	}
 
@@ -992,7 +992,8 @@ static int hi_command(struct drxk_state *state, u16 cmd, u16 *p_result)
 			retry_count += 1;
 			status = read16(state, SIO_HI_RA_RAM_CMD__A,
 					  &wait_cmd);
-		} while ((status < 0 || wait_cmd) && (retry_count < DRXK_MAX_RETRIES));
+		} while ((status < 0 || wait_cmd) && status != -ENODEV &&
+			 (retry_count < DRXK_MAX_RETRIES));
 		if (status < 0)
 			goto error;
 		status = read16(state, SIO_HI_RA_RAM_RES__A, p_result);
@@ -3199,8 +3200,10 @@ static int dvbt_sc_command(struct drxk_state *state,
 		usleep_range(1000, 2000);
 		status = read16(state, OFDM_SC_RA_RAM_CMD__A, &cur_cmd);
 		retry_cnt++;
-	} while ((cur_cmd != 0) && (retry_cnt < DRXK_MAX_RETRIES));
-	if (retry_cnt >= DRXK_MAX_RETRIES && (status < 0))
+	} while ((cur_cmd != 0) && status != -ENODEV &&
+		 (retry_cnt < DRXK_MAX_RETRIES));
+	if (status == -ENODEV ||
+	    (retry_cnt >= DRXK_MAX_RETRIES && status < 0))
 		goto error;
 
 	/* Write sub-command */
@@ -3252,8 +3255,10 @@ static int dvbt_sc_command(struct drxk_state *state,
 		usleep_range(1000, 2000);
 		status = read16(state, OFDM_SC_RA_RAM_CMD__A, &cur_cmd);
 		retry_cnt++;
-	} while ((cur_cmd != 0) && (retry_cnt < DRXK_MAX_RETRIES));
-	if (retry_cnt >= DRXK_MAX_RETRIES && (status < 0))
+	} while ((cur_cmd != 0) && status != -ENODEV &&
+		 (retry_cnt < DRXK_MAX_RETRIES));
+	if (status == -ENODEV ||
+	    (retry_cnt >= DRXK_MAX_RETRIES && status < 0))
 		goto error;
 
 	/* Check for illegal cmd */
-- 
2.54.0 (Apple Git-157)

