Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F92218ADD
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122483; cv=none; b=fXsK+ZO2jtWVft7Hr+RqiHTPYUUttT8wwP1xXzQh+g9C4AaSGjXIvz0q14mjk5McJtzJOPeoX5+xUgP1E6LpWkzbUSKqeSLrNKhoHgMMt7CCOG6P22c8tBK1D5H8IpbSSzaJgShYxPHqtVp9+5FW3EzlqT4Lcn9cXhnqZzbYRNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122483; c=relaxed/simple;
	bh=7GlmDoyW4bfU/UvvrDoTiuGj6klREMUqUByskEivwuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmXxpbuoYfpVCdZup3Vxe/qH9GXEPhcLM3pOR85c7KMXHU/mOulhPaGL1uw2rRYBT90/s4PMGa5ydXZhp8Ckwwr81S2LsIK/DmbqAu6Tu5Mc+RfXrGXGHID7Lw1LvZw8odKy5I+fh3iqVKDHVsVl+j1aEG253kPkGWPHpE+QbEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmmxGNIt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmmxGNIt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4194015e9.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122478; x=1790727278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=EmmxGNItM0/oONoD3PEE5ChQ8lru54k99Fs6ABQTS7Pk74/sl9BJyadNYcxJthzyYU
         HCURTxvMD1cUW06O3MRVwAxcswZ0EOzjSWG/GRC0XoDrvRM2waKD8OB7qk+sYyNk6whJ
         lMempJ/7WPeZGqePqszC9knHFHCu2MCPEYmV3/mbD7NhLh6ahkBKU0g2EFWqBDYlAgwU
         3FKnuooKvqKPito7BfMGGjCjrHLEt7iK6XlHs+I5sebw2Sqjfxe1KFprzjXX1ZQr0be4
         uv6+Uv+XOw081tAuIAQtrygk+nua9Q5+Au2iYA4IuT51HlU65/KNWpEzY427p8SIaJx2
         FNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122478; x=1790727278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=jhVAtDj+GbjDdxHN1KYk4LwzyFsa7iT28nf38JZA10oTyazgGMO4bbgXKb2CcTXVuK
         fZ3K0febtlQF83aOagmBs1tWu9ecTfI7l6VJ472W0HI/kAuSkMcmPQHGkG+E3goH6WPq
         qNI6q58bvdGLnprO6DIvaIUlGQEvtBdOYM+BzWpSNKMt+FBbc8oNYlk5iB0NCB9oh0ez
         UvsrCG7RUoCXRdH3pLW1Z1SEgLbgdiNnH9QEVMEmD/0f3/+PWwA/fJ12PgDhlRmc9DSu
         knDddrsGZOkDfiZaCQmu67DyI1UoJgTJDXzNPBShYRTYigbCHd4y6FlBDKgv44LNSsuf
         LejA==
X-Gm-Message-State: AFuF++nM8H6I9REYr54FyKSb7jGHJl3ke6XZ+PN+hgtARv4WhZ50zYeI
	kIeHbe+ARH21CKWRJr9AkTy4ZO/gDstExC/8X6nnCjnnH3BjyQz1azhQJKOZ6y5vj6U=
X-Gm-Gg: AYBFou3PXznPhQ9DItZM+U/M0qwx6OcpS2DU3qSsH6WaGfWiLh9zmM19uFjsB7DqOG0
	lBwBAWPlyWeJyOwXiRLFzyhLtssUOIR9b/b3Wz4GzIzlMeEdc0dmaU/oJqGCtMd5xymD2+8VBEN
	h5ngAUVqMzD5gDv0f1nBDF4xcOylS2feUXaKliqNZ0m/Aj7fm7wXrUrx7dlZ+e+j2tQOwp9qW6r
	c3e5nJInCXP2zGY3MdUKHfFH/9l3goPKGy/kPx9MgQSutp+ExdJKn2BsGoSTMDOxhVBHjx1Ay2o
	KQ04OVfbfUXWvMU/E1C6qPiTa7TeRObDGsg93pyTNIHd+ddSfP99u3Ff0Momnl8rGZynNSRQkRV
	ioMHwelpwxU5IuRQjc+cM/dIbaUakh6vqCe0tR7kzyGcJbGY7SZgmGs1bscQSaP0mhFoJE+BFA8
	NFj9eAByvagyhnEL8uqIK7o8Pp6iee10Q6q8MXyHrO0AnZG0Misqro9tlLw5JmjtGreuyhltczg
	pkU1+XEDo2B96unAOcewEkzOxgmnzT0J33ofgFkCQtTusRmQZrO1YtsQjphOCS4UyYDZmwNsqtv
	EJvuYY2HrdQMD60dIfQ7pLEok1MUG0WEzSA+1vjg+lm3jxNe9yx7QgPPPBVgR6miGSxwmcFF+SJ
	NOevnZt0MZZQMMEv6iFfcYxPLO02jrE8M
X-Received: by 2002:a05:600c:1f90:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49fdeffc657mr8698955e9.1.1790122478142;
        Tue, 22 Sep 2026 17:14:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:36 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 3/6] media: drxk: stop retrying after disconnect
Date: Wed, 23 Sep 2026 02:14:07 +0200
Message-ID: <20260923001410.30297-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
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

