Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19787242D7B
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400565; cv=none; b=AT1rO9cFqudE5QIzxf29WDU70+Dp/7OU3Es3JvZcXsAZeyorSgsxtotpEPYFKztstulyILCkBFc/SDIOB9pthhRNTpDfh/MhDrgp8032hYI5wojVMdxV2PBy06bNKq8gI8opcAz5hCtVvmw6uPWm4lhfZRxQqzwuHM9FZoGjvN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400565; c=relaxed/simple;
	bh=k4bR7udKis1FcpGP5Nlezb/ljXmY9NNSsJhGw/Col8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fl2/8gq9hGPyXwvrnki5oO+mPTq87fqjxVgHZNZxKWmG3Cp6Ivn5peXM3ltbscaxLSPSqgh5YBzSNHR/wc942XBoZ/YkWNeSaU+0Oopt9ykD74p5H6Fql1LLQWmydEg/thtiWNzaT0XbANz1QaYxP/zCsgh/td652pjWrvaMufI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/HBQc4v; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/HBQc4v"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a01c80c34so29386791fa.0
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400562; x=1773005362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dytpY8bvc+1h3L1Nh4NfJFPzaxz2X4N4IhENoUNdFJ0=;
        b=U/HBQc4vycH1Gnr9OFlCuQIUgUyQ3i7q7mi+dszLI7LvD5HppKaVtITMqqwoax2xEd
         FWSh1AlkwZ+WQBz4QHRJ9LDLFSZ5GgKngKLYvtp+uOulpqvaOUpPxuq91f/KuYJADQdK
         N8NAe1gYv8bIGHM3fQLy63YvbAeAJ3FkckV2pZ1xLke2RS7dZCtz0Kxj8ylp6Xc/RPde
         eFzLCqQMZvuRFxwMlXqbCC+T7PHAKXQBV8Q1dzvpnZ6tEovTLz7hw9W/KhRwO1lMC+Mk
         ACXUHYCBWcbJ8KJ+oNvLd1OKBPrNUEiXlpCRAE27Y+yYqOJwDjyEQOkslbzmKI9himJ3
         8zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400562; x=1773005362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dytpY8bvc+1h3L1Nh4NfJFPzaxz2X4N4IhENoUNdFJ0=;
        b=NPNLBO13tacST2x+Ok9X7yqsssW0nlnmLmssz8mZI+5l/mThg731bf/2D8L7BkkkaN
         C3Kg3Zya5UIJh3WRa2Y6zGVk8sXSFEuRNGrPr0knHRP3RE1kwPFUCXedgtf9d6WNHA6B
         +IjzuVP2rwtQI3hSnLrl5HEVNuGUcXe4u+rLN6KkqHPWGoAqUInygVsZf+qm+3lTxaD+
         s14hFbAt/wJMsxYycm7QUa/KfxCDysglI3urj9GynGgJE1NX50DOwjqcyWld1pFheTzv
         sZlz2U8RKFsV9+gxMKgaxrMapEjcg+4RxmgSD+6lBf0ypp32nGjKv+p/svfzAv4QNJeU
         TJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqHM7Eeu2GRRPmbOT+7tR205/MKRFtQj2wvbwWW2PZnU2OXAUEoXg1/wdMzzm4igL6Z4x56xWzNG58fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/opoDOi10Psu+70rzl0Dst/LRj9AZGbkm29MDJ9NlXJl+tlL
	mkeWBLB+ehxoCuRnQ9XONxIKVa7zJEVjgXh6heDMAom8/+cxcb3WsD0qiyD0Aw==
X-Gm-Gg: ATEYQzwf4MR1Zkg2vgeW6t4JnKStjhh1HG5aMlikJMRiXlapYcXJF9RmQSKKIoUwhG7
	d3qbXmI1+UBKptwLHAh1lclrGOuZ99bDqvVjrBnAesyf4pcjMcoaoL4J9EC+GAuOqSh8ooAZ2mu
	JJ/W1JyzdGLqG+mj9zI+rsPVwTAq02hYlb7O219/qytHhhVel92QN9D7uo42h5CxiIzRybJTX5s
	NbIQDY3q7O0WYcpCeWJKWzekuu/wJnpICBlxe8vPO1Os66GW6btFKQPVjC/Dk63rpPHb8+qwYdg
	HeSF06mK+mPfAi/AalrVwhuc9llvmlFWM7/gd08XmHpNlm5TPvBp2YX+sivKQCLZXryscCAdCSt
	QfmCwdZ1rzTDs7toiNg3OM18vIeU1w0TMYV0eda88xUJRf1cS6TuKnWZppGkLz7oMHuoKyI+sER
	Whmv26zQSa6FFzk8t35U54LpYV5o4H+Ffn/pcPuoQ5AQV28pumPdpBFzpH3hJq3jD5le0O/yFLE
	w==
X-Received: by 2002:a05:651c:150e:b0:384:9355:6a7e with SMTP id 38308e7fff4ca-389ff144dcdmr75502281fa.17.1772400562143;
        Sun, 01 Mar 2026 13:29:22 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11577588csm1277467e87.67.2026.03.01.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:29:21 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: remove useless return statement in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:29:00 +0100
Message-ID: <20260301212900.3783-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary return statement at the end of void function.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d5c5895e06e2..de0446997154 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1417,7 +1417,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.43.0

