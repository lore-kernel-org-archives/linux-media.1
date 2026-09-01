Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACEA476682
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256635; cv=none; b=JIktsn3Q4QPZUFHohz63YDZqZsEtuAZv4AlQDbiTZmDDsJf72wzxudgGS0zH+0sIjD+BeTS/dndZoT3hRxiyHaf5BnC8N2mOo3loPMjGgiYo/MgFHmJuTUIAxsj9QdjTS9VK+yjkv0qcYdebd6KdLIr8EVnquv7huEbvq5zXMIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256635; c=relaxed/simple;
	bh=2Hd6DnrX3jtfzSXEiMwsfaoHLBGN/ImCBgsGX0PU0H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irNwhNc99NwMdPgFFtxEwszPOWHBtFW3L+Kp5cPdu8Z+nk6ZdJSIsnWTzlkdTvXoOyzlGhCOh8mDhtpqw4nShcrnCH3XlxEoa5X9HzDzJ3VSgz65Xa+nSfb/spp2JRLFOLXCyu4O5gJsGHOHCJEAAw0GrQQsdaQsC259veWoKFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6UVDbTi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6UVDbTi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484374f54d0so1566636f8f.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256632; x=1788861432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Hd6DnrX3jtfzSXEiMwsfaoHLBGN/ImCBgsGX0PU0H8=;
        b=e6UVDbTiV6zqvgExAu+oV6M49AwGEXE+ydXJg/wnKEyHZUZRgWV89/3NczpZLrPrVV
         TljWoGVH/Ll24f0FzBCcX8fRNyeAJ4yhO/QTC6wN2WoUEjMYUiMmDx1AY4wrEoeWbNM7
         Z5HDY6QtUXzGRMQ+PL9b8O/o2xJA+iktBt36vlIiFmfaA1DcVReBUAG3WDQYSLSEOR8t
         q+KcxvjKHL+k7LsSKW9A6HE8Y8F6Sl/y6CA/z/9A2jj/U3WxlgneA1yYVymUph88SF2Z
         q2hg6NSvzjGc9vm5BUSWY9beWGBLxjQ4uoOJItBzkmPjBqyImANgbv0FMof5wphNWG8J
         pERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256632; x=1788861432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Hd6DnrX3jtfzSXEiMwsfaoHLBGN/ImCBgsGX0PU0H8=;
        b=Y5OPOwodOUkmn9M56LzQImxYNQSUAxhRTTHtEwOVbXG0SO/Val0TectKoqg5cWkm7M
         aZLgxPygokVBTClXqkZC8k5hcImUa8qXkbkPR22kn0lbHzJrkf56knyEl7E9SIqK9/iV
         V8gMZQdlFQT7Rn9iNUS7ia/Y8VxikEinQSI+1OOmeTkiRIggrXuk5qMEWjrrhgx+iU3I
         XuDCvCGPGilVFNGiiPs/AAsvvLIjQ/VEGLEZ/fzejZuT8B5xlExeuJf1NUVKku08TYlW
         zco7XNJ9YhQSDQjVOIfT4r3Yu2AtPqTcQlkDfkiko4ig0KMKot/Bz0XUfejR91CoGZtw
         snSA==
X-Forwarded-Encrypted: i=1; AKwUvBzOqq1Ota+ILlMU4reUJEmy5lU+7h8yWUiaVOi/vdnoRi3Lsb46zEDEniiuVOFp1UFxWly0jH1iOSV7kQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lPfbwqX6vJLISp6obo+gUHYjouHO+yCAhjv69YwVfRkGHwEdLd
	RyIKfkrtg8WuofhO3/jro/zWZkWbu4+8L5ZKD2ivtz264+UxNSgBSD/w
X-Gm-Gg: AYBFou2zmH3D0GbJ+Kjq8RMAPtMEznvP9LbJE/dEpQDIhzc1Ml55c+k8nt4nRUOOJnY
	+KmpkOTR0qNY+e+CGz3RlY64I8fGQSd9JKGv2zmk/+trB6s/QXJV9EC1qUBIbURJOlyHdn6g74m
	dFVfb2q3T4fbpYtzfikirErw1nSt4pqpy0s/7l1iFGGIrCMHQnKSXP1lfaKHqbtraR4yGUgw5ac
	40/MxiCZEmxregw4Wj2DqKqzZ/mFruZmFENhPJI7U5fTdw2LxZ/S1KNDWBJwiK2XP6pZjvtuOWE
	9SiAsf/OIHVGAfhWUubvOrSDPbrpwDXVbDBLBiNVvuJy7UoAAiShhPtTpQy/zDzom/BraXwhIzi
	fRDayNxYVuHZ2dbQfPVE1csi98jRqjMjcU9APflCbBR5Pxj2u7NNe87HxD2DQFFxWRk6q1kYNbB
	njkq7m2mx/PHZVGeeRjcy0zRMZn6zphoG05sA1iIqkyMwoij722j3N0cWowPRziKH0eVdzD2+sd
	tASKCsLLN6es5fxdqOQ3pWPLA==
X-Received: by 2002:a05:6000:104b:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-48440ff9366mr10930579f8f.13.1788256632094;
        Tue, 01 Sep 2026 02:57:12 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([2001:b07:5d3a:fe75:6bf6:388b:455d:27bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b86dsm3752395f8f.11.2026.09.01.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:57:11 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Date: Tue,  1 Sep 2026 11:56:50 +0200
Message-ID: <20260901095650.43605-1-fernandorimoli11@gmail.com>
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

Thank you, and thanks for re-testing rather than letting the old tag stand.

I will carry the tag on patches 3 to 6 as you scoped it, and not on 1 and
2, since your machine enumerates INT33BE and neither of those is exercised
there.

The register read-back is the most valuable part. Nobody
had shown the mechanism working end to end before: 0x4800 reading 0x00
unpatched and 0x20 patched, with the chip ID as a bus control, demonstrates
that the bridge really did supply clock-noncontinuous, that the driver
acted on it, and that the read-modify-write set bit 5 and disturbed nothing
else.

Your unpatched result also corrects something I should fix. You saw 3 of 20
runs deliver frames without the series; on my Pro 9 the unpatched case is a
hard zero every time. So the failure is intermittent on Tiger Lake rather
than absolute, and patch 3's commit message currently reads as though it
always fails.

That is too strong given your data. In v5 I will say the receiver usually
fails to lock, note that it is intermittent on some units, and cite your 3
of 20 alongside my 0 of N.

Two smaller things from your mail worth recording. Your read of 0x00 on the
unpatched Tiger Lake machine confirms on a second IPU generation that the
whole-register write and the read-modify-write resolve to the same value,
so that argument in the cover letter is no longer only about my Pro 9. And
you have answered the caveat Zann580 attached to the 0x20 row on GitHub,
which was that the minimal value should be confirmed from a built module
rather than from a userspace poke before the patch was narrowed on its
strength. It now has been.

Thanks again,
Fernando
