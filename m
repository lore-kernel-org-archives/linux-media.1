Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795882077;
	b=Oon2WocFZgpolosM9vUV8BbPpYfhZkrih71YAHd+bPlRVtRfQtOxsxSNP046vBf+KHkz
	 2YgFM0w06sknLdazVaH5+X+Ercm0OyURxf312uthWXLBpBUptM4RSJPb7eHsH4eQ87N5a
	 z9An/w81H24b2uyM+WoP/ZUbpBN4WD2mfGACUkiV8U41Qr9HzUzl5KxjUgmSMhAugNkNU
	 LL7+wd5fn4f2lFbNc313Cp5gcDjiH2kGJATSgadsZPQdW1r7xA/CJ/TY3NFBljsBkKO08
	 D4j9PzywiYrixaju5cEwjOJF4PyhRS2UPmLIfP1Yq7QjiJZfOf7pO9G5Rkjn6K8l4Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795882077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oZV3wNrzoZWupHzsUQKbiFR8qRMwYXK+sqbWN8yIGM0=;
	b=ZKf0cmC+nh12FjaHHmOg+4ifyIRcV9kPzXLQ2QxrvGX0WCOZOosNJdHpwBrnQNCh8hdy
	 CFA7Jgpth1BBngPQlJRqeRN2Oxrq6+gOFbDgfZJDI6l3QrocuaGyN6pTfY1hylD2RpZgJ
	 LGzp6K+hwMcubNYqgpxJeCQOH5stO86tSwz/RAc0rUXwv5V0Hjxg7qTVla0X+q24TE1cV
	 H8zn6O3Wsr8Pb7IwUP7YGyy8dyP1/h14OpnzPJMvQ/KJvggk6GbIUkpPM/rbhoWVhHrGY
	 71vl6UOWaEsRR29i6nVxqObSdFyoIc1wpR4ouBXMy73bBAGSAUHld2NxOzqkDdbUPxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Krj5goYI;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9DD606A321
	for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 16:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9DD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Krj5goYI
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so85392815e9.2
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 08:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795882076; x=1796486876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oZV3wNrzoZWupHzsUQKbiFR8qRMwYXK+sqbWN8yIGM0=;
        b=Krj5goYI69/cHfWaxsDnzvQrlnx3wgiWXbRJjmJQYzJM9s7xgbgl6jNtSd3NaL2Bt7
         uNxn7KYB68Do+bfpcBhaseKUKh75lISvtf/YDvDrtcg+WtGjhUipS24ksulyVENlUHYY
         UbrVE3UKo4fkMf1dDKn0VVQxVAeMDZ7CcL5LNQibJaLWBeHorJPu+EfVf1wYrOleKKsi
         VB/iyjbRtE8J2WP21c8Ci0+j0yv7hnf3ukOeLF3+vWwOeoRa6tQ8nWD92j0kDo8jUDYD
         W0Po0ZwEdPiQwf7vPOirDaF1wSKNl1bkYVJ30VpRkAmvhrQY0KEUuNkYzNwCnSgusdAG
         SibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795882076; x=1796486876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZV3wNrzoZWupHzsUQKbiFR8qRMwYXK+sqbWN8yIGM0=;
        b=1VWgLLWkyeK9cm6fWA308x5o1SyCLyF5rZvEWvAzi5Ca5YaRFVPASTZSj7YuQk2S9M
         sO89lVgKtabnS55dow4VHg8qmxMNVY+UFBIhbLP2NTJ/Z83kxPsLE1tA0ma22wPJL/o7
         WXhoCvbkEvdgA/Fwzp+idaG/lyIGv7eU8iIiEYAqa02G3oNHaIco2OAynSlTPyysvk91
         aneTPn08r9d+midZra1GkLW2OfcHEDkV4eLguU7M9oj4/S89nDxw8BhKuG1dLXS6vPoE
         pf+gEVbD6UtR+FJLBKFc8ispB1XA6SCTe/mUsWWFtrdaMN5eZkESD/oUHE+O85kaWS6X
         cogQ==
X-Forwarded-Encrypted: i=1; AL+hErFju9JkPfoyA6aQKCxjQZdX6D6AvCuL9efJp6UhuC6y/k0tHd8z/9GANrfIwS1cI0DGivSDtjhgLi50WQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z85xhVXk0BTYwKZRMpNn131+B9u/iZgY3HRGqusQIQltpanVRKR
	4sDP03pK+wACR37EUzShegeZAshavr1e0dTwZek4ok689ViPyH8LutGw
X-Gm-Gg: AZFdTZdR0L2mtaqZBL93IiEXz+8j5PeXl1WN30pfsIdxAlPQyKApg/a0PeC7YgVHi13
	g4UplZRUKjLFbTEmM/b65tkpuwS+Zy8hzZYRyO1QHDayvJHIiSjcqUZFT9v8VIwObKlfswyfscV
	Mq+jhTgIq9NOP0o648wcg1XI8SIi+k8Z9XE2g5l4PKDlR/VNw4ETmU9lHCcEQy5vTL+ifIk5slJ
	ItZdv7kb+crPHJa+a0sAVA1rKHk5XKVKHhIXBUyW8E0DLaQtAPLjnLQ/maPicI9hjBKEnxSa/X+
	BKlGNY8eJO93x38L5QRP1gEUOYnN6CcApMji0kwTy65GWL1pK5fFM2tHMr37WkKgTfYF40VvrqK
	D9blNz3ghuoquUtZ1mNdWRHQmzsYbh8cEFnromc/zY7wG0xQ6lQWzaKGWqkcdcl34bal7anDWFk
	dINzCEO95WzTmu78aIz/0Hj9HdtDEw0e8T2R7cKU2jwdVxwc+kwMdDVkApsqnjBxqXaWjEI7iU5
	OlKU6zTEqIuDvb0oXQmox1nsCZrZgUTTg8gFcsrA2yVokXOeXdjYNH3Fo0xLy4dZEWg5DXDLZjw
	pDrnac4SgHlx3G5czhF8cXpEUBgRp0rZTJ1K/EWdMQkA3H/OnCAwHO9MGe8htdwnW0RIOX+oMpr
	wZ788wYH5rmj7bkYxQWrEgv1LXz4=
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr583846015e9.3.1795882075610;
        Sat, 28 Nov 2026 08:07:55 -0800 (PST)
Received: from localhost.localdomain (222.red-83-35-88.dynamicip.rima-tde.net. [83.35.88.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm50697222f8f.34.2026.11.28.08.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:07:55 -0800 (PST)
From: Antonio Arias <antonio.arias@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Antonio Arias <antonio.arias@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix trailing statement.
Date: Sat, 28 Nov 2026 16:07:04 +0000
Message-ID: <20261128160716.8753-1-antonio.arias@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Fix checkpatch error "ERROR: trailing statements should be on next line"
in ia_css_anr.host.c:35.

Signed-off-by: Antonio Arias <antonio.arias@gmail.com>
---
Hey, this is my first patch, I appreciate any feedback, thanks!
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index f4dd3ca03d75..e6150881c07f 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -32,7 +32,8 @@ void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
 void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
 		     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.47.3

