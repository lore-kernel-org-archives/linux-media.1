Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292866;
	b=ndtDCStRhWcZXHVz7CYOb8JOoQzePg5QLFZlswmStcABeaAm+hMKRCBC1MJbcyGbD7dp
	 E0Kq4S9IHLZAkrmIO7zNw3u9MxnJE6+Dlrb5d3dlMr2QiBxNdia36NvRPRSU0DsqvWq+/
	 Erv8Bf8opw8vw5IiIMoCBLzQElu2qe1DLSMy6l+c9A2a2yeYtugBilL18cHAUw43k0RNT
	 Ba0kqM5hMrZZU7Oy1X5Cuso9oht7miZ3PrxGi4ey5vP3PwJtacpZKQlNSGGAx3lq82stP
	 QtpIzVd6r4JYmtxPc98ZsLbW3zrzJwwhby+bp7prng2LWtDuCBOya3ev4/FH3fnk1iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Xv/Wsic9BdqTGEwyOS/26vxDRJvcspPIySQAk9h2YQA=;
	b=xMbSShjBU1yAc4EPEHHK4+TIIe2pdcBDS4v6agIgtheB7G2rgxnCAdcdEpbjR74jTEls
	 t7VQrDhkAepjzUGTstpbi1J+NxIQ1QaszENdjmtGOsl0RZev0o/v1488Dw72o1HnTKeZU
	 V8iLngpMG4p1GCCeTWhzvyBWdgeJ5sQC7S1vwv74L4rCNjKgtzeC9Sbis4f1LUXwltPA9
	 SoDdAoN92JoxmPib4l6poHkiwpL1RPskMblxpq/neGSupvyiviU9sQbxOJ/JIvhTkFMML
	 v1aIGPjx0E6S3eu/ijcTdtWjZaVVeK5Jev+AZ8iRVu//TY9Ev3Z9Oc44AWBLp+6n45A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oGMH3GTX;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95460A2605
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA95460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oGMH3GTX
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so1635538f8f.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292864; x=1793897664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xv/Wsic9BdqTGEwyOS/26vxDRJvcspPIySQAk9h2YQA=;
        b=oGMH3GTX1z/pW+jg8tLErb7okxpGEPfT6Ab7gffQLPzUmwyu65LLNqvIBp4LYvsvIJ
         g6+G5abQV4DQ2lmaExxrXBNVq3sRVdOHf88uHaafFqinY/Uaaa5ekw0ew5qzhEHz3582
         8cwepirnyVtootBBKEDJ2oj9sDNmut8FHpiHZ2cQda1uiNB1DzFuSZ2RZUnz4WerPky+
         YUqov1YAghC8i4wDoQOsPZ0jzBzLTC2VL4tGXxdf7wuekleeGa++vCL4GzezatASMcYe
         Zuy9JGyJ4BQqXvpRk/UHMoNP2+/8TZd00JiZGQoAZe59OmdGpMEQXx0cEsKqga4Uv8E6
         yICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292864; x=1793897664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xv/Wsic9BdqTGEwyOS/26vxDRJvcspPIySQAk9h2YQA=;
        b=HHw2PYJZT5bhksVWJJGf6UxTRtO1as5/ZNPYGCaZ809IcHQtTHrLKD3fowjyeYBuPY
         gt4WDLjHju6dKfvflFWA2VViNOYoucKkdpe+pdaRuwkwdKveRXnntMCrn1d5dUMyuVtl
         cbnyzOE20aia4eEQHJJMfpEyttSNVIvvd/vXs/tas10oP3du+A4StDTfGpmE9rGUq87d
         avoImG82nDuuk5wahUkas/SyM3qXgU1aqDQ+HWiR1lzBtzMs2GtHmyPsb2jJjv//Y+5J
         KDIWMtDRRhM5AV0f0cxrJledesP8G3HLq0ZGJE5OXANZ7Ai/Oq+6VXhLu4mfJOkx9Jwg
         Dsyw==
X-Gm-Message-State: AFq9FYLeDwFbLxUycGHsyn9D7x1md4M3spIho9D+3dZA0HhOprqg4EXT
	nba/0NdJ2P23iHakP0Nf8xiuy0Tv4ji9IMMvjVDXAFJACeUxqX8n8PxMtjd3YoxdBh0=
X-Gm-Gg: AYBFou3ZfYwe3AUKMOV0DZfycpb8m779MLVbIVWHSb40ELsJ23G4YrxyKkW2fMUnOtc
	eY3yvfgpqPlfrd+sH1jzGtiJxXqYygNvj85pUvHaWZA5fIzBkvGAUgEkjxwPcetSiCtaVvjshH0
	4p0sX2vwp9ob1v1DyF2CvVtLZ8EN+pDj+8xSTKtxXltGSzHP9/YhG8iNQIN+c+Xe4GZqVY3aW9f
	qDJktaEYodQmgYNk23ZLq4/jpY7iFh+5RE6k0zDNROcK6AuGwOzQ1q0DMEBsQB1bS07qWQuVqVc
	xDCHkFThzaiLYT4Bpj/fbgWsJ6hmK9idhI2mhPdOrJFSYhdNeGNZpcD82nI91OFFaouKQofpEVT
	nKFvM1aJzdpgH7IM/pfXN5tO+XZ75aRcKH034vfmMyz6GAsTvAG7rsxL4UWb8hWE315KA44iT27
	7ICarq6QCiAcDUUZ5Oy5Il9xYZvEIMPJWyXWAxemJcZ76sfRKE9ufTQQCIcw7E3Q2Avk0EsIuyn
	b79oIJDDWdC5vZKbvcnWKs++YFKndkJIfVG4B5ad7MrvyjIE6LzE6yIQhXr5Np6tngmkXZ55lnR
	TXL51GgKEq13pPvimtgrgU+MbvIcBqvp7aYwwRQAEBs=
X-Received: by 2002:a5d:4d4c:0:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-48e5d5d89b5mr9359625f8f.40.1793292864179;
        Thu, 29 Oct 2026 09:54:24 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:23 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:17 +0000
Subject: [PATCH 5/5] media: pci: intel: Use named initializers for
 acpi_device_id
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-acpi-media-v1-5-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=954;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=AFbBBnCTxQZ1izxPgFNYFCBvzIPYR4UFZ2HYCI7UK7M=;
 b=i8KokLaGr+Ex829OUisNCzM6KX/hsbRTYUDba+KCdAtYoZTJqbJGHxyVHAqneC/RZqOije3FO
 dNtvpNxJFpKAP3JdqIu1hVILzH6k+AaLftyTdQY5XZJhDgMzj7xFaIQ
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c4..31a0161e54ba 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -325,10 +325,10 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
  * this list is complete.
  */
 static const struct acpi_device_id ivsc_only_acpi_ids[] = {
-	{ "INTC1059" },
-	{ "INTC1095" },
-	{ "INTC100A" },
-	{ "INTC10CF" },
+	{ .id = "INTC1059" },
+	{ .id = "INTC1095" },
+	{ .id = "INTC100A" },
+	{ .id = "INTC10CF" },
 	{ }
 };
 

-- 
2.53.0

