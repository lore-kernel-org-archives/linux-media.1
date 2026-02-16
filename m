Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96482E54CC
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273128; cv=none; b=EHQtigHmPMzTL0wat/KjE3Yf79PVaNpZFm79bo0n8pXRdp+VKogCeRYjXL3Q9V1ZiC0/1PleZqpPp05t8yJ2s5AyjCyvIzu6tlX+3LTaEhA18phJ3sKbLVgnZnkCtm0D7/kaq3LiypMdxc9grKH7QhQYN89xwF+twXyRC4IpOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273128; c=relaxed/simple;
	bh=tFeZ6eqQEns+BbNpZxKKzRzzk5L7mf1AI6/R/s6kqxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=He4eOv8+IyZTyRHDczTZ1E8FawhA8N8fts2NvPrWiCzdU9QDlcaiDtgP4L3u8To/9t1jT6Yf3jxLdfQ7loE/x5ZraZJCJdydVxip/+YRxZf5J7wNXVd6nhSo9QB/27Hg73+q/Ao+4xqQlcS6lLwU5TLycjIcfv1hNF13jsjaLRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lONGoyAu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lONGoyAu"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8fa79b9fcdso594744366b.0
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 12:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273125; x=1771877925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=lONGoyAudMfBnbX7NbFgWprAWmu5tIotwnSsF/IEegJbUSyj/Fs4fmSBp6jJ3CuGsn
         EzlQy1lyKOIWolJhKNTR0bcYXlSDAHWMUp/HVnCtFlIjL5c97qK7/V8G9eWYAfN3pnJ8
         5hDs84raFEBBWFmEzUq1qOrAE1atCTJJuyYbnYZuMwUqp23OVwhODsyZiPi7pSmq1zdD
         xmcI8pNoK1H78QmzfeuuYDN69E1zxXdLX/QXtctczcAjn8eXbpLbT1N0idAYNUPUY+GT
         isB9Z7ehysf3ExRhPH2jN0K5Hps4BfYS3/NI8M1vrb5BrSorF3xuuB0zIn07HE+l6Zcf
         4I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273125; x=1771877925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=H5nwwsB4CfoC9ws0vWBq2kN5CmM2y8Vr4mSVEXoxmj6BoPRvQef89YUEfCpCx72yHD
         9utUUqNDIZCxPMLc0ADgDx8p6yqCQ9ZTY6LgI0REZrKLt1DM0GZkO88l/oZqNErVIppS
         5t+lqIZ5ajPWj45vVrRrPapsTvNGGaYi5SbRcs/nxzfZQkA9oEuqzd+mhZ3IWs00ehWc
         joZ1xwLUwe6R5PYKji8jAlSJAsWETxo9GURJ/zD9njzPoUo7uXOQ1l/83jGAQ5l0yJq9
         oGhtzBaM+G5//CuuYObwdI/x1Gbu9eKTmSmHmoJC1O6eT6iLpmzJghmA0flRf97yPnBR
         UI+w==
X-Gm-Message-State: AOJu0YydrEfcZOF6BHCzWNEWDTIHCO1aTdgIq9YnQd5wGxM0plssLGwL
	OJaIjBqohxmWhgJGyHT2zap1SzBKaeLwUL40+bgwXEAzQCEs1xsocWFB
X-Gm-Gg: AZuq6aIG7tajHa2qFwNvoKmEIOhh1BXLW2XD5pYLAsbewAUlNinnS7nebJeduHbbfqA
	uDi5zyY16sxa8cXgP023QEBO64OXAun9lhP8XoPD62eI7KvSGU/y+2KZeYmVHUTULTRtf4D65CJ
	6jpbCfaU9blnqd+zqcvAUQ9e6r0wE6qJQqyGRCJ0E5vKOvHB2b7irh/koQA70AlzqIdAqPS7tP7
	iWjdcKc8jQC99eXHgTiTCUtKanNnUCmSmf9/44jVylmgzsOxK29qGEVAtpfmcJzn4qk9Ps97Gmb
	lyAn9nL9FuuLBaAjaQ7QRR1RoBcAfsGedmiW9UvqP68JwAwiHBR6JEvmrMDCMYMlVamcSzMqIG6
	5VgxJwYZimNC8mGHD+RDvvpNn+fzoxgcIPdoBU0beSEIWddNS16yxMYgbrUqZ6LzE+E+V1yjSII
	Zd9DE7oIKvPKY2zYo9fdzZ6JO3ZuhbMz4ZkCr4/hS/bs1lldRhTb9eqrqrptbMZ+nZMRomr9aqV
	mG74C89SF7M0zzYQjfNSG+j9jc+YnAcq8PY+eq5Gtk9g1j6+DhPHrLmSajTWgxf64lBrcGisQTx
	pQ==
X-Received: by 2002:a17:906:d92:b0:b8f:c684:db3f with SMTP id a640c23a62f3a-b8fc684ea97mr362797266b.12.1771273124991;
        Mon, 16 Feb 2026 12:18:44 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c7020sm281486866b.67.2026.02.16.12.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:18:44 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: media: av7110: replace BUG() with error return in gpioirq
Date: Mon, 16 Feb 2026 20:18:44 +0000
Message-ID: <20260216201844.1768-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG() with a return statement in the gpioirq tasklet handler.
If saa7146_wait_for_debi_done() times out, crashing the kernel is
disproportionate. The pr_err() already logs the failure, and returning
early avoids accessing hardware in a potentially broken state.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 602342d11..bd53d1a41 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -460,7 +460,7 @@ static void gpioirq(struct tasklet_struct *t)
 
 	if (saa7146_wait_for_debi_done(av7110->dev, 0)) {
 		pr_err("%s(): saa7146_wait_for_debi_done timed out\n", __func__);
-		BUG(); /* maybe we should try resetting the debi? */
+		return;
 	}
 
 	spin_lock(&av7110->debilock);
-- 
2.43.0

