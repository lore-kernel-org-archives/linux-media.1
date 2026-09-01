Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922A426435
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280475; cv=none; b=gVg/NQNj8znJQ0AaT7pZRdvmspsGDr9n3w2m23h8ALs6I5L2WFiP+Ouzli0NVlpk7P44BW4z7fryuJ9FEF1WwVPOncwl+Sdvuw4AIZcrF3xmxcxku8zzVC7e+6HbKbQdelIbOfBSvAf2Fu80xFNLDSPstTz3EbFFB9taxJqtBWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280475; c=relaxed/simple;
	bh=wmPDYYGtOwcfDqbJ+tEwP4how54tI3HRpH0SlslsGwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0d3xg9pqmLMu4hoO3+nERLBPGGLc/W65xgP82mcAiK/0kWkUD/aKczlsfVSaC3DoSYjz4IXUd8h51Yr96d8idptc7JwH42hXWIp6poIj6EHlrivn+jKTMDfEonDn4jRN1SxqMDgp5xS2tgKQW858Y0nZcpw46cq91pcW2vfItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq36oD+l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq36oD+l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so41435415e9.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280472; x=1788885272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmPDYYGtOwcfDqbJ+tEwP4how54tI3HRpH0SlslsGwM=;
        b=Wq36oD+llL7RbCnq16MkfAk63eTBLpcR/TDEFfUk6B4ugvC7lwjMTturaeDpMWRksd
         lDYajPRRn/MwWqBbEDkDrzZOeMgwciARGpovITveODcOpCeVF9cD6Nr71yqnERmDQHG9
         SCXqeVU4JFMUr9YBGVDXmzuuTFAlCL29OAcSR/Q/RTUwM7OvLakv8VM8z6F40wKI2s//
         GGO1RVyQJw7GQqgySgN+VgaqwXDlevRQQx37+EjPZKK2ZBWDWWdgJEjd9MksrzxwsjTe
         s9GXSBMoOgrUtBqDhCDsgYrL3AUEF1UxeRQOMAK/hYDHpYxmAsvaVIC2ib7iq0L9V3+B
         kAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280472; x=1788885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wmPDYYGtOwcfDqbJ+tEwP4how54tI3HRpH0SlslsGwM=;
        b=BP3a9mbTOHSHNcDBl39wjb7CTnVE/JBEJ2w8PLyp+aG0FHg6cjJ8WXdA/PoxDadZaG
         qcAZbY5Y7d2Or5xNzgWspsGVUzwiVd4m0t3ttm6nT99JuKUokdiCvIQ/zEhIBSZD3Y1C
         yRnd40xc1MU6jBWpJdHi5CkoK6tky1wHl3z0F6XrtzFK7H0mkLFlvVP/qnr8epRd/+nj
         KoZlacgNsbGx5XiNA4z08RygKy4XczMwyoofLGi+JKbw4wnRu55fMR0vO9pOSBZRdZMm
         wE73klVONpu0EfEWcEmkhsDmGNxusJUBwArtr9iKQ2OC6gh/uPIZQ+j3fr+dDx24mOGI
         i/YA==
X-Gm-Message-State: AFuF++lz0ywgG+gBvA15wSgt25+djrpkMGhFfOaqwG3MbiiGTnns3zyp
	5gXfwc50tvA9njmtER+UzJMeNmIl1r2lJjDEvDbDmWncl6GZPpHFKII8AIAb+w==
X-Gm-Gg: AR+sD11PEXi5ish2KzgLLnfXFwhxNoJ76jr8DAvtpV+QZZA8bRIKB3gFT3eHAM7HvIw
	P/6mftECkKYNc9wOLm+fBii9+frPpnkIlA3JBjzwv0SFyPyiHypMh8+GJgS2aVeyqbMsLhIuZok
	cb170SklKlkHsgiLCqQCNXGDTAU9AuQaeFPrrtEeHVIl5WcImxOr9spiN4YCUpjw7sQU3Elq28I
	WaanH29uqgPN4+/62Y2Qd4TnB3An5bBJGYCRfzYsSRvEbNn8Hzyp259cxBfaGB8pbloVXkFMlnp
	cUh6ZihSdlZ7Clgk+32LFPs2nJ5RA8ltVygLiiJbW+WovgOrzzFCQhg9q8JH2gKbjNo7atKt82z
	Y3BgE5psFrvFl77HPctMsa2ZgnuGSznQ7zgArt+mjBcXElRqhN9M275TgfX+857/Uy2DEHQ4CDr
	LyozRmI7O+/40fFGAzVbiBIcl921qGGyjhuPnHqUmaf1Yefdr567m7Ug/JcPiCYeX6qW+xyjfF6
	aGQgFOsImx6jaT7dttYzmnNOQ==
X-Received: by 2002:a05:600c:4e44:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49cdca2ac80mr162231155e9.2.1788280472261;
        Tue, 01 Sep 2026 09:34:32 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([2001:b07:5d3a:fe75:6bf6:388b:455d:27bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce309e418sm22353285e9.13.2026.09.01.09.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:34:31 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	dev@berg.pm
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Date: Tue,  1 Sep 2026 18:34:17 +0200
Message-ID: <20260901163417.230456-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <zDaw-AawkcNfIRsmWXbsPx2WDcg6ltaiPc7FZZTNp7DH-ACLsF98A3QDuuhX4iejr2-VLQYf48c1cingAI4i58i4t2dD4t45SfHr5d4MeOM=@berg.pm>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260831181858.325109-4-fernandorimoli11@gmail.com> <zDaw-AawkcNfIRsmWXbsPx2WDcg6ltaiPc7FZZTNp7DH-ACLsF98A3QDuuhX4iejr2-VLQYf48c1cingAI4i58i4t2dD4t45SfHr5d4MeOM=@berg.pm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakob,

One follow-up question, because two later results bear on your unpatched
numbers and they do not agree with each other.

A Surface Pro 8 user ran the negative control, removing only the flagged
INT33BE entry for Tiger Lake. Without it his front camera streams on the
first capture after boot, with real image data, and every later capture in
that boot hangs at zero bytes. With the entry, every capture works.

A Surface Pro 7+ user then ran the same control on a machine that also
enumerates INT33BE on Tiger Lake, so the same configuration as yours, and
got the opposite: his first capture of that boot already returned zero
frames. He checked the journal to confirm nothing had opened the sensor
earlier in the boot.

So "works once per boot" describes one of those machines and not the other.
The Pro 8 user now suspects his own result is an artefact of how his machine
is set up: he streams an IR camera continuously for face unlock, so a
neighbouring CSI-2 port on the same ISYS was active during his first
capture. He is retesting with that stopped.

Your 3 of 20 is the measurement that would help separate these. Do you
remember whether your harness rebooted or power-cycled the sensor between
runs, or were all 20 opens inside a single boot?

Either answer is useful and neither needs a retest on your part. If all 20
were in one boot, then the machines genuinely differ and I will say so
rather than fold them into one story. If some followed a reboot or a power
cycle, that supports reading it as once per sensor power cycle, which I
would then describe as holding on some machines rather than as the general
behaviour.

I am only trying to describe the unpatched behaviour accurately, since the
current commit message says no frames arrive at all and all three results
contradict that in different ways.

Thanks,
Fernando
