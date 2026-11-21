Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233353;
	b=MilDrDVaKWKVBQFOm1ZOwL5noBVspyPOe0/M9Koe8dAjhyYWDnU1PIa2kx1ZJIg7Q0QZ
	 YL6ev8ajPaYZfFPnDlXkr6MbOYCC1iDRXfnJF3HaCE2idWdHsoEMpswl3s82A2qXTRBBI
	 4vX5ZpBQQHf1lhbL2oVuZuW8OPKgXgZzrcbZSMZKiD/e9D+ICQvUD3WXp2lPNZDourOS9
	 tJknqQE1G2u9nUZCDC5637X4PvYxtcM+jKb4iAuFqCe80ebE/fsVmJhqYyzk5AITUIXxb
	 kRpfZRn6cGYCMR+NUcXjYKrpJQlAwlP9XmcoAmDsLQ4lQrFXb4eQkIzE1x6px9KsCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VUr1L8X42Bzo0eJziGn2ZVZc2zLBEwew7i47qtMtnRA=;
	b=W8nVbdcqE9q6EwfIfZ+RjE8sOg5B7kWggwg0pCX9LLw3nlz1/lOGJFFrIIGO33q0mx7l
	 JmOD+Ay8SRnMjwEb72c0u4hAHazlZgsUqL8vn6tVbtmYGpirqcgygqZGgGfP/S1vjaS27
	 vIiIJTkgmOQwfFeLtZJcMdmCZHNIxD5cKJ9tbNIKf438+SYfeUYl2JxuISdrIOTyo/b+y
	 +Gq0QZAKlsOitaKxGA/vSG3uxMSkH9Y6999hvpzv/uKxcGQoodaJh8pzsJ7qltgAgsDxe
	 bPSKYbDi5eBJDz7JOJ50GfqVPsSMK4z5QSldFGb9LnhAaPBUqVKwzcGe+eFOQobjW2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQv8ONvL;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEAE60A260C
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEAE60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQv8ONvL
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71b0d330acfso1179381eaf.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233351; x=1795838151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUr1L8X42Bzo0eJziGn2ZVZc2zLBEwew7i47qtMtnRA=;
        b=XQv8ONvLZqRsaYpXcQGGBWQI/DnYZuuUCu/dTx4AvokqjkdNltxt6h6yw0HVz29w3T
         0oS4R6ecdM49/IAbDF1mgNvDBKwnbLW5FGjoGFO4aFfTduMwWnWcpbPCF0LcUpswbhZA
         r1MpR4Y3CusBE4fu1KqqIgLkCZHQyTt2GYvMCPgUPaIeG2CW+BTFww8D3wmb3gH6F81A
         eMxOpW5XiCAdgPNKp+Z6IbaD0+T1CQBKBP03aTf9px1+cepQGuLsU22sUy8fV98exrm1
         B3FLCKqsymlU4jhoqeBbSHAjklIXcDoogdTPcNWdadCg5uB0i4hFu2SdTdxs5Hz8zsIg
         3SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233351; x=1795838151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUr1L8X42Bzo0eJziGn2ZVZc2zLBEwew7i47qtMtnRA=;
        b=In5AR5rbCBUB/ijARJk0tVrF/nv5TBt7hHZFDfjPtKXL9HKlGH8uUePHk0kiIkaUXb
         wPlQ4eqCe6AfNENGmsqml/ZJVprlBcJA9nyUtlWmDSHayo+TJx6mwZiQ+20+X/+Jn62z
         Ob/EmvKXxTm0Y3mVHZLmZfQrxXfrLMb59fWBmsrrCvAoGc91+Jybji94l6REA5VWjzzJ
         jYBLIL/VLqRUd8NgzbQ7E/R3jtDrHhmVtkYGnEioxQZieO7/GmG4MNh+D5RdcRMbSU4e
         lUkuDACS09iOeMa3eZ0uhAJRyORVPR6SsjYE1O3BwsGKwLV3jvEORXE5Na0IUev1Wrnz
         Epsw==
X-Forwarded-Encrypted: i=1; AL+hErFZwuJnu1g/G1kwEXxT7x2d13/xS0diM4R22sENXv1/dVHODvc4S6+jzbU7mTj4s6Sbu6MUQZIXCMyBYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9rBwa9P7ltEC/2tR5hY7W3tcRE9R+7gJpLuN623rkop3wIeQde
	3qodKCz2pLRxt9f5xc56BbO/lpKqF9o2cO0jzl8Kvhs/EBCCf9BDs8E=
X-Gm-Gg: AYBFou0e2oR8BB7UqxA9cZDk7IXX/BgwrAv9MGOsJdQ0PNPPgyd8bgrLw0NxwZeq28I
	AFq7viEPCFCMgyQD482ZFbUvryph580pB/sadsSnXaywr1Ofb4y9XvDmav5uOh5cUwhWVZ0yp/a
	GSNypAG5eDTX+0pnj+MkiryWGAMfpuLnU6Jq0zX+yYIuSlt0gsAqoDUYRzEzak3oAQPbeFHFBp8
	3gQMSJ+6o439Vp3wiqHi+iZN5VRU/TO/iWU2unbKrgVoqtSVAeGFPAGRezhtc4WWopdpuYSZgeG
	7HkqmzXTzORQVmkCqy8HPQHVLKjbglfgCznNGgkYOKfH7UyqLbDncc5Fy2G7ftx0isjXfRy3X6g
	UbN8Xuv6zYe3FmfopPDQiSMY0WcTJD8qFxz3fnXlW4+IB7ESkRLJHMV6xI6ggALbGiA2AFE5Lc1
	oPe8v5ZhtxqZp5jc0OYETNKfedBL/b7hSSxyBA2nc6e3g2y/truiz3/XeKBmhIVsYkV+lH4KMvW
	PYa9xNAUqZ8/Bk36peSpcsXuChujlTfTB9VxL1bfwQ3c31ekVFc08flTDOu1xTn/rp6VPnW21IF
	jTRmuq/ySWzOBPVWgd/GLPVb5fgnk/ozQ/H07AQ92kLCH/0nUFdJk9kT
X-Received: by 2002:a05:6820:c2d2:20b0:71a:e932:868e with SMTP id 006d021491bc7-71b392948d1mr2257944eaf.5.1795233351000;
        Fri, 20 Nov 2026 19:55:51 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:49 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 05/12] media: tw9900: program all mode registers in the PAL table
Date: Fri, 20 Nov 2026 21:55:16 -0600
Message-ID: <20261121035523.26764-6-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tw9900_ntsc_regs set VDELAY_LO, VACTIVE_LO, CROP_HI, HACTIVE_LO and
VBI_CNTL, but tw9900_pal_regs only set the standard register. PAL
capture therefore relied on a runtime resume having reset the chip and
rewritten the init table since the last NTSC stream. Make the PAL table
write the same registers as the NTSC table.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 42fc2afbbc77..6309d9eda243 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -112,6 +112,12 @@ static const struct regval tw9900_init_regs[] = {
 };
 
 static const struct regval tw9900_pal_regs[] = {
+	{ TW9900_REG_OUT_FMT_CTL,	0xA7 },
+	{ TW9900_REG_VDELAY_LO,		0x19 },
+	{ TW9900_REG_VACTIVE_LO,	0xF0 },
+	{ TW9900_REG_CROP_HI,		0x02 },
+	{ TW9900_REG_HACTIVE_LO,	0xD0 },
+	{ TW9900_REG_VBI_CNTL,		0x58 },
 	{ TW9900_REG_STD,		0x01 },
 };
 
-- 
2.47.3

