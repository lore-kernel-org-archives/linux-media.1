Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636257;
	b=ZbT2HB9m8wEPrcgQL19BzGBE8RzGKh7ryO+s2dBQNz1f3MKLyzBUfolyewA6c7y7BoDs
	 3kyl+sloeliuKPPyjEWJLClYqSglH7EcAXnsmlk7/c2xDazzbAyW8X2Y7N0TfnUAH952c
	 Sg8nEipSOzpPi5EyzG1Ytqzlqcxr/kBANg5mQGyvR6ESanw5M49sM81TuqXpXlM9NL0jJ
	 11q0M6mRMU3kLVn6bF7043V/BV7JoOpcAphyD2TXNWfUtV+mKmIATbQtlPa1SILQ8Fvlx
	 HMXYddtKuM1r00b3/STciq2wXlYnykETpuMMCpKbhBsS5EYaD1odbgWF1utWaMGX7wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EPnxhmlYfB/5e13ND1JsrZD0QHbGBLqSmWEbuVGGmkg=;
	b=e37LsK66Qbrbe6rlpWJCgzoejpAzeh6U9mm52SRPvV+yDoKHQBb6yzjwo8jFLlSCOIPM
	 CdKUfdud8htkV0wfRIE7sqC9CHCpnMMolDCtI12gnTHeX/ec4RTaNEKkuBoNv6p14XNdy
	 XIg/Yn5hECWNzAWFw6J2EOraX0HmB1nGVXATyYahGUUf+FW7eGNkR3JF/d7RzFtcPcpKq
	 wEygM5I1U6iW8XcWZHb4erF+ziBuPEhq/nMgEC64ERQaqOQp8A//yYBkUopmo7HyzqoRN
	 0uiXuvkQSzl/FN9hE3tbmqu/dkP+fmodVCkDKPveKG8y99I/tbiLupSFgqNG5EIVvOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2PFv0l6;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC38606A682
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC38606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2PFv0l6
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4ad881b6517so4192377fac.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636256; x=1796241056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPnxhmlYfB/5e13ND1JsrZD0QHbGBLqSmWEbuVGGmkg=;
        b=v2PFv0l6OPudhCfDi6Y+NqNFWvn8dGkGt/YsK+k+imhZkvnl0Hqgo0HN0t3OJktqve
         DebPyHsKdN/ZLIteIgDnWxfiTOcVlN2o+Q7Y71pbK5F7n0+f/DySbDHipqYSQTRaIez/
         qntaOV/+x0Qnj8dyVemhFcpgE3VPmFrjX33wgDqdYSux2yep8EhGvrHO6O4Mz3YmWqI5
         PNWWb2SZR/DpNBfMwchd2CHMz08VyqY6Tv4joOqV9nputWYZUW5YccwI9gM2to1RuQMG
         K0o57/XNlvucej0nPHPrhwDItp7M9xN8zeDTLZBX+g3YPmRv8Nt65Ojn3djPdu3CMgeE
         RmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636256; x=1796241056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPnxhmlYfB/5e13ND1JsrZD0QHbGBLqSmWEbuVGGmkg=;
        b=usxlf39OJND1TkI9+ox3L1PgY64FxPOUeqYj7wx6ocDa3a5sS0jvNfh5VNUqBTH996
         HzR3NE3VeQ6oSUsifEpczEZwV6zITWAP1bh0tnWdmr8zNpSSK6LCCNRgWSRymHp8bltX
         zl6uuRtJgeuWpRb7C9+Is4gIM3ITTtntAUyigYn0lOOKOv6zPeR5WKBByVSNyKIrpG6X
         A+Yb9SsNCxkSTdTvooQJr5jlp8GYtVK39iwzEF4Rf6f4b4NcxQm6+gJHpfQnoDgxxj0d
         h4Jur/4U6mKnr5SGJO1RkGsO4hf7I7WK9HlKN+PDufgKwE5VMdu7aohCfb1jPQsldg8M
         IaXQ==
X-Forwarded-Encrypted: i=1; AL+hErHfrHTZvJrS/xzVKYfsiT1d6cxmyS2g/lphUQfSCU4rXO2jrguOSeeV+QZIIjUf0Xe9BZvI8BiyHHdflg==@vger.kernel.org
X-Gm-Message-State: APuU4Z98Sxhx5Jjv3Ls9yiM9vgwPbjsbrLM8t0R1LhnkefHfEJBrk8ZK
	0hgnPMzAmr+uEBaIaNkrj7gdwH9ehcy4nyXHtt/a9z3eXaR+7cXWrZA=
X-Gm-Gg: AZFdTZdeRu979y/dM+jt5dE3HH7FkTwu6omCwZ5L8ou0wxpoE2fp7iaXz5FweLdEjh7
	4EBiQB2LYK5sNyM67ysgzVNPCYt5O+AjJHuz1ttDGhZiMQv921ILXvalsn8JmahckW+U/r9Mi4I
	Z0TJvMhalbdPs0Um0vXIRn7qyfNxnka0GUHB61Rj8lXochyYyL2xpJAG6EVB424Z5XXHF0yH5BS
	36o6rGAF+KjzOpToYYIgbIWzw/1M2fAJZyRUcoOT9DtZ0BZKaMr0zjY4Mcp+gSDDBII7MtkrtKJ
	SZglrVABap/JJucVMWrBvClnma/Ao/gLbSHS+l7kHKek2uFhMCtOodfv1nIMgo1bRsA2mGZ3jGd
	8tPWTiDddUo51GBQ3VmMBqj0Y50IKYbjkarj/krlGPLAA8zW/3DnR3rt3LgYwujlD8udDnOGyX7
	SKJ/GCTDqiVu6dZEdQNRy7PuzFa3XDTegvIBPadUG/RxIKAmR7tP7iBZfRseB1I4AID6IjZ2ifp
	ID4yp46NJOprib6qbOnUtEZMMAXGy/cGI2JvuBOwtvVuON1s0uckpZlD1mQgxfwf3KFvaRxYkyu
	JSwd2BQBrMKxPiFkgT+zrvRUGoVzMLJ6bmLsk7oslQHT7poohu8KlvXF+dOyy8YToHfABKXDjIy
	Jtg==
X-Received: by 2002:a05:6809:1d1:20b0:57e:6f22:6430 with SMTP id 5614622812f47-57e6f227deamr1069244b6e.3.1795636255691;
        Wed, 25 Nov 2026 11:50:55 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:54 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 05/12] media: tw9900: program all mode registers in the PAL table
Date: Wed, 25 Nov 2026 13:49:44 -0600
Message-ID: <20261125194951.19072-6-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
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

