Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FC5378D92
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127742; cv=none; b=FJu5dQeiBHY1bMhmYUwdxjkhcAQRvM9QI2zYwYYsT9r6t2EdZJhS/mXzkSQouAwEo9BxYjuqoDn21a4q/v4ueffWEsd48G+x/vPilccHzIf+zzzP9YQDzsUt4V/1LHQRevn/P14m0d0wddrfr7i6rvGI3KR+KB8wIV+S990BKVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127742; c=relaxed/simple;
	bh=VkHbva5W99Uv3RRqgpizsgyvAOc+Mc0RUY1poJKh+gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Roqi6AYqFJBahyTSoB8HFdaDCAx2WxJcNZHrAcvRmOgeHVOhAE3xRJNHpdfIr8L8ygwtLKhT2+FcsGqggphTJ20Wa2B+esMTn83T6BqRVzphVWVvIV3gFUOpkAUtaXTL33o9U1Q5tPLPeSbcKH5lBKQngaSB2rhcwRHd1G4aQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APymVQ5h; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APymVQ5h"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceab75934dso47827355ad.2
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 11:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127741; x=1786732541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKveWy+y6pUgTVKmIL9d8hPlJnPWCasWboYBiG5h69M=;
        b=APymVQ5hkvEmuXFWt3VY8dTYWtv048HevyLlrNMQIVU3H6bDw8BNKmMWRNxZ0B6vn5
         z9DVG40GgwI5pT5N+Qu1zpOn8cMLSLIJbViZG9Fq5tcmNY1evwTOvLoZqiR7SCIlsDZ7
         SJwSxPBWyq+F+TLGHN8eL0pHjiiADmTe2DIgQlMuqLZtwCqBg3rGt8Uawnft/x3jlQz3
         KJKycHQWTUw/8eRlIGFmuRgyqL/uzbE8MO6Lqn9QTs9ptpOnRmiexLFP0IsVRxEUbk2I
         ELqCAWB3GKhSQh74tideH3gzgqkcqjRcuv1cr5HUTfQgS9ewLV2NVjPzIn35wH2wyans
         HysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127741; x=1786732541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKveWy+y6pUgTVKmIL9d8hPlJnPWCasWboYBiG5h69M=;
        b=g7bEHyrGNJNcnxuCy7EKr8sXLYG6dUmo6Z5RdCqJI2PAUfwnUfBvxxujWeu1PcskR4
         qiti+oi2tdUkFg3Eg1EioJPyQRSbTdKzIl9HXcyGzxqmhD1aOAcHo6QpDSiGzK0Fd2Lt
         6qwHPBgeXt7SucWsQ+5tUx5k9iAtGA9vmtx2y6dwRzThYOjFxI18xf9T2NixXNxGtK/n
         8sO+liz2ZUhhcaAfqsWJyhMWc6Bg2pjdeurGGgBkfyvqwBpj+kmiV5n6j/GxGF2d4k6m
         HVcfydTH/XAGnX7cl7wrpQ4MDykOoRjn9KeHRgI2ZjErjy83U9fDt/pbbbUNAsdeksn2
         MtRA==
X-Forwarded-Encrypted: i=1; AHgh+RpuewquKNYyAucLqytEUdXRHMtk9zAQ8OwWUONFlzGUSd70OWKXLK0h/cyvfWlmrKPnIfHiW6gE0YMiyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys4XJNNpFGgxYInInzN/NhE0vOYWSgw6kpUUTrBgS9bpO7mqG5
	YDeuSVZB2JxwFfE4Ta/wCGVvkuax6WGBfHJCt35/5G/gWksov/2Zu5QlUxpUREr1mbg=
X-Gm-Gg: AR+sD11ucB1BGPOCr1C9v5gyeVhGQe+uDalDMIyFGdeo7SBFSKoGcBr/CvkHTIuGN/H
	ouJR5BTzw1Z6j/3mci9lQZR+ZjzDMfhpEwQBHB6AZLsPbqLDmsF0aU0WTifJWeUnNJUu2oP1VvF
	05EpItDfR6L7Xk7xPGmJMFBbIAU5/7PGoR5jSJgUFdvBewDFDihWAhsCGixTMq2OYetBD7GUKFf
	JITKviKJ32t2njNp5vH8um6iNp3lXgKs9Sofspb6IxmjtzWsZfgIbHfgMRezsXagVJEMKfH0nQ6
	GNLGnv0hAuOwwr/gA4lnmcwiLVLoapPJi7DNLBa/UL26QP4l3Mw1HZJoqJihsU3sQ3AsTy4PxQj
	xz+OhkPrenccS3W8b41Olwi2/mUvlo2a+RoK3gp6B7RSR+o1Cq4PNFD4clkhVMQnIxYpw0VK1pc
	DWoL0amD6cEBQIjignEMk2E/zEra8rxyKgo1itTbSl4bmws+qfTUlQNwmeUiCy3bsnwPf63lgam
	so3gzkfDS8RohdqNt/Xpfc17ck0dA==
X-Received: by 2002:a17:902:da82:b0:2cf:7bfe:6043 with SMTP id d9443c01a7336-2d0ca949b71mr225134925ad.19.1786127740572;
        Fri, 07 Aug 2026 11:35:40 -0700 (PDT)
Received: from localhost ([2401:4900:1c70:5a7c:d1d2:a457:c3e3:35a1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm11483405eec.25.2026.08.07.11.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:35:40 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: error27@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH v2 2/2] staging: media: av7110: fix sp8870 initialization failure state
Date: Sat,  8 Aug 2026 00:04:43 +0530
Message-ID: <20260807183443.13912-2-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807183443.13912-1-punnaysharma805@gmail.com>
References: <20260807183443.13912-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SP8870 DVB frontend driver prematurely flags the device as
initialized at the very beginning of the sp8870_init() routine, prior
to requesting the firmware (dvb-fe-sp8870.fw) and executing the I2C
upload sequence.

If request_firmware() times out or sp8870_firmware_upload() encounters
an I2C bus error, the function aborts and returns -EIO. However,
because `state->initialised` is already set to 1, all subsequent
invocations of `fe->ops.init()` by the DVB core will immediately return
0 (success) without attempting to load the firmware again. This leaves
the demodulator microcontroller halted and the frontend permanently dead
until the module is forcibly reloaded.

Relocate the `state->initialised = 1` assignment to the end of
sp8870_init(), ensuring the flag is only set after the firmware is
successfully uploaded and the system controller is actually restarted.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 77bebf2c7..be62933ce 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -315,7 +315,6 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_wake_up(state);
 	if (state->initialised)
 		return 0;
-	state->initialised = 1;
 
 	dprintk("initialising frontend...\n");
 
@@ -353,6 +352,8 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_writereg(state, 0x0D00, 0x010);
 	sp8870_writereg(state, 0x0D01, 0x000);
 
+	state->initialised = 1;
+
 	return 0;
 }
 
-- 
2.55.0

