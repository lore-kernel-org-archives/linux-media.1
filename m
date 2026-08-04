Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C88C4398EB
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842123; cv=none; b=NXybuh/ZF4yZ6Qso29M1dHDJEVPcMNIXXLenffy64s5QP715a6Jk0Q++tpXYPHEtObs76mJ66Fk8nN9PjCo5uHRGDEtXK+4Tfe79hUXHtku7ubX9e/HqvN6Pu/gYL+iBjGfdEQqg+k09d3GTRq1G4beuGyLFDZB4DaaiEmPwDkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842123; c=relaxed/simple;
	bh=uUSiEeKC5Jhes4/hJQI0INTXZFTq0Jt5W/fbROuMR2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vpci+fm13Eeotg5AM4Mafj7q/g6Ene2gXN2qI6HJcwmm7FmhzyrFx/RdcWjdjT9+wOaeXdJ8UEVJ7e6Me6nEw59A/hPDc9ZDMleLTVXsPPXfkVvS2+LJGfI0XuiEn04PkTaId9+VutswMz1jd4N1ptqbgDC5C4dZAeeVfdhIWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLyU7Z9h; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLyU7Z9h"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3181917a91.2
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842120; x=1786446920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFBSUwUZyXCkVYgyiIaRGQdZLsjpXGpbkt70ey0xKsA=;
        b=gLyU7Z9h0/uS1njUSz4u38yayQtZEyzv55aNB/PKFhIfnmwFFi+iYuDRoRT83sPw4l
         mJwu9Ix7YNl+DybC1N/x03qGDGiqHvjFBEW8+bi+pmz7QZwl3mW3ZogQ3nuPV/r5SDaS
         vEa/ZgpKvgTOV8lmUkxVHNKcomrJlmHcQAyFjKMAhIFGaXnOoDTnOdkct6+UZR/1NVhI
         CSJVTHRnXgPs7YSxP0+RlahAoXF7vCh7MLfif9nqPsFZEzyP8rdVTGOQ/+coriRb9iQQ
         /k4D/+s3Rn2U/i6CgiHXy9AiqRrTAqmTEgDKXsihEctjOtKt8/eIvzNLO4atCYO67bCX
         JTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842120; x=1786446920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFBSUwUZyXCkVYgyiIaRGQdZLsjpXGpbkt70ey0xKsA=;
        b=VJ7Ets5FU+PV8Ph83GeAHPU8s6rjkMiburDBaUXFy+VZ82PlCQqQ7uLvdalmWWB8OO
         zImxkQqP8cjbD0Vu0NkH8h/4Da6aKClAeGKOD/oFpfhBeyFZHL2/TCFUDJb1kiq7GN6I
         J+eSruWK89Pb5UN+R5W5y3qYNSVvsMYOzFtJhprCpihyqq8R9m+m07X7GenoB2zYE8SX
         UjJ6Wg6G+9evNXIkf6iCIifVmudA0AJU/Djd5i91kqfBDS/EoEfFbSX6LzuHw24J5Gu+
         SHg1x89CgyJ7IZR+h+AsEIvbyxYbQGgmlE4v7FLUNku/AVJsWGAxTgzeaZ8H9+44tjzC
         5tZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr23shMkdVsdbhrEODv3VDY1rRhBJnY45MMpXKhvjvzTTKEzICwF7aqyPAplGPa06w6cY1cu9ILEmVFDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyISqptpdAZ3stfpkWAZiyD5MKcH9WTlbaqwVQDijweg4Z5iq1O
	yhF2MUFSaZDpOa51z+F/IXMdKN9lnJy/EGPF3GoqYVD2SwIb19z1J0fO
X-Gm-Gg: AR+sD12xudC0/ONyACY2DGb7ANVIDh0eknx+xv1GktTrtywGmwqDKS3jr+fZAclSVvr
	tPQNWqV5nPsEwN9O7OAjAw/DFt3KZ+YufS71iIhmvSCmS0mI8yDwiSPafNMQF3gHex+qLnJmGlj
	xnCzbLRWz0KffNM9s2tGrUOETaz4SzGA3JYlrWu8Y87kQHKJf2slCCXVeWXFKX3DbffnhuxQ7fX
	kRwqLx40zQzTKgbRRqE9XVyCLD9MAX7rn0wF/HpxA1JGicpaf2j7c8tu6sR3eF2ibfY60DS8WvP
	KhMFqgR6SaRtkcnDL3QMNOiLjuEyiFmfkcpYCRZIvcRmm4BnpSsjz8KuAdBDKziB/5RuHFhiec9
	HFDWvStko+/2fJC8ebeSrlBZADFPQNMVGbOZ+k8+Fpp8h5eXaY5RqODGgX+VDFZsmuXpE8gcPqd
	XkFy7xFrP3kSCbhOklxVB0FAzfdey9fcPh2+jWAYezt6c5vaHGHzkZdJWTzNZVEQEH8SK4Mt3/l
	4S/610=
X-Received: by 2002:a17:90b:3912:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38fbc0a436emr13244133a91.0.1785842120417;
        Tue, 04 Aug 2026 04:15:20 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50acddsm2750601c88.3.2026.08.04.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:15:19 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v3] staging: media: av7110: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 11:15:04 +0000
Message-ID: <20260804111504.21958-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v3:
- Formatted as a standalone patch (removed 2/3 series numbering).

 drivers/staging/media/av7110/sp8870.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c03..83c6ee305d6 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -92,7 +92,7 @@ static int sp8870_readreg(struct sp8870_state *state, u16 reg)
 		return -1;
 	}
 
-	return (b1[0] << 8 | b1[1]);
+	return b1[0] << 8 | b1[1];
 }
 
 static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmware *fw)
@@ -167,7 +167,7 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 
 static int sp8870_read_data_valid_signal(struct sp8870_state *state)
 {
-	return (sp8870_readreg(state, 0x0D02) > 0);
+	return sp8870_readreg(state, 0x0D02) > 0;
 }
 
 static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
-- 
2.51.0.windows.1

