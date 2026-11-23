Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450772;
	b=JyACTAkSkPCBkb3eCOaVdz7SkATueY162rZmCSRqzVCQile8rgXV5TX4s4phoj9+6LRE
	 YIuciq3oiP2P6BqrsXcCIOu6zjY7I45jQPnyJiKisWMJHDKTmBJfH+OHm1DaGLuXSsVoP
	 Zk+ffhTpESEcLnyeZ4TCJNYgnynZY7s0e3EpaN4v2+p5Vd7PGBPEGui0r2F2BmD01yOKx
	 JpHavyL89GtcyN/WBrrOyMTLD4yyMNOaveU9oxvk+rJymwsn4eRKdbQ7xStx+lbdZ8EQq
	 PyEr1AICDkgiRDPeTOoWy9fr3XGoBceAqpmvbsisiA26bcmQtJ8eUKkjsaO8QPB4sIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=q1NlEZrDBkcD8Q83Cfn+yNtsJtw5oz9oIXe3UlhpKnQ=;
	b=WYquVAyrMgtLi8lV8/xewdtY4QOi4IjyT+LqnrK7ZSNZXryPmKc6zCQz8oqMLfhYWTfg
	 kXxWIm+Ly+qQjTmLLbv2LCIaziDhn+kLtzUiyCQW3u7LhXidrQ2mKxZEfBY169++3/R+j
	 zyEiwpiRtBVkNdzaMcEQVtV8KwIKvcdtQqum/vG+xWk9oxFZdU7I4UPkXahgSprZ4Tq8+
	 QdX7a1IP+dNhw9CKqPeu7wTtezn4s/ofSOuqJeT4ImS6LCU9CjOg4Uv6IB6fKpHLoW+TP
	 VnonO2FLqicTV8/96kBP7YQ/E+c5fe1obx79FHGnUbg5cXfq8mmJwoGOsqgRV4Q7nHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3HE3anr;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09B3606A330
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 16:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09B3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3HE3anr
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso424381f8f.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450770; x=1796055570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1NlEZrDBkcD8Q83Cfn+yNtsJtw5oz9oIXe3UlhpKnQ=;
        b=J3HE3anr17CRfmjbr4pYFXmqMFAxO6vTBN9siso/42jwueDIz3Ror5RHxzCIdQPHLY
         hef7m2ym8srdpC236g19L7Xqj9nSyHpsjhHGA8wHSSMqswuOyJcKT8HIZo5JjFnu9Oax
         w4BoNSYcXS/9qPInL0CA7ZaaDSE3ncQNvXIDxBBxtsqcntekfoW6WA4AOueSf40vfR4S
         +u3R6bYHolLAZA0AFGtxli/oKaVJ0zTXXBuyJMQMO3fSO/JfNpPAZuINSCOffsjOdxAZ
         dc7Zb50h5ngIgUkDBzk9eJBThIrdYHDbLERaa3Sq/usf5xjER5+9OTWBs2Iu4gGOxLwV
         6HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450770; x=1796055570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1NlEZrDBkcD8Q83Cfn+yNtsJtw5oz9oIXe3UlhpKnQ=;
        b=iJvO/XGgYKs44V6V6G5lmzObJwcmmWxr5ZpBwMWPeM45voYcL8KsPPGce/++dYY8jZ
         9cqFUK/fFHEZxvoUppN5uYPYpyRdCl7frecLtnYK4lFshYSbTWCtSV0evj5QxYxGU4OZ
         DH1+4PbjfPaeqLgVDRm81HMJaQom66H4JWXqqVKtu5GvHeqHJLCIwIKs5AafUerBNbWy
         9yv0KR4lBKK1w/AW1HyrTHevkFDmIlJVW0Nbzqycokm6i8Aeakl+jdMsMVU4xdeZB5jw
         gxwlpwfB9beW0r5df//A2m0i/ANxN73JkAyzAWIaGUf813ZM3afFtYHAIvDK56atSwlP
         EBQw==
X-Gm-Message-State: APuU4Z++3qywdUnJaSJkPGFsCzA+B9zmecLuZxrMTPfhlUSGA7oKlnKb
	L2ZeasdHB+Hh+poDxM4LNx/hciMdX8fQIGFbQXGZOLIopTb4k9gD8joP
X-Gm-Gg: AZFdTZeQ+NjRlSOEchROMOhLdc/iAk2hRrBMc89PJtqOAleDnkHeI2EAReGb3Ddte6B
	UQ30ZOinyl8WRKtSzT67G8FMKtzOxMbLZjuufYeiVKOWx8zadWWplk7MrReoudYmtbAJIDxL5Vl
	LPaCZ7K9feBQuUSCLTWg5dnm3akkA/xyJ790tkiU6cZeGB04aa3pia04qGl85VP3P2YpEkLA1n/
	PrLvvXaKiMTJVCfZ3MVMGwkwnsBbM8onKdj+s/ehZ/s0oW7R5EqE9AEYlV9IM6BcxmcH1DXEwR4
	7YYHDe/wZms5Pi3tAt2uWZLwwpSuJXF1t1JALnSefx5O3CVbcKrKte0NeK3oQ5LYTrqOYh/Ohnr
	P/ZkBqLD0oBlcSWSOBGHIu8fG0xhlF0jx0XluBoKum4XHmLFpVCzQYp2FHjkcC2+4pmrVa+01wc
	6QZJniDiSRXtrcqneLEKaow/gYUXScyRJ+Ejv3NlGWt8bH2xqgId+JwPVBvgS2TM5RQW+GqxETj
	u70Bz5HGdM4WzaIxem4N1sDggwdUbhVPFXgFCctJ2/9X8LxsFRT2AYW9dV4BCY5DmXquM4kVIL+
	k9pluWUG9Gi0PA2m5z37NsBXHfMaGhTC/QX0ndhI+SizLJbteih9phPCvFdAJmpcnz+T1zNnjF/
	WkCpE+suzNj5M0GVVmK/ni0+7rNHAb7aT1btgwEKa+Q0OzLNz7uT556Zy59iU3BISTHI+qD09de
	pB
X-Received: by 2002:a05:6000:2282:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4aa4e01e1a6mr30798989f8f.1.1795450769822;
        Mon, 23 Nov 2026 08:19:29 -0800 (PST)
Received: from 2a02-842a-e30d-2a01-e309-fec9-0c54-1c6e.rev.sfr.net (2a02-842a-e30d-2a01-e309-fec9-0c54-1c6e.rev.sfr.net. [2a02:842a:e30d:2a01:e309:fec9:c54:1c6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm22323000f8f.0.2026.11.23.08.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:19:29 -0800 (PST)
From: Valentin Allemand <valentin.allmnd@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Valentin Allemand <valentin.allmnd@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov08x40: Fix burst fill writing past the end of the range
Date: Mon, 23 Nov 2026 17:19:10 +0100
Message-ID: <20261123161910.31956-1-valentin.allmnd@gmail.com>
X-Mailer: git-send-email 2.56.1
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

ov08x40_burst_fill_regs() sets the length of each write to the
adapter's max_write_len - 2 without clamping it to the number of
registers left to fill. Whenever the requested range is not a multiple
of that length, the last write runs past last_reg.

The burst fill is used for the two cross-talk tables (0x5a80-0x5b9f,
288 registers, and 0x5bc0-0x5f1f, 864 registers) after the mode
register list has been written. With i2c-usbio (max_write_len 4096)
each table is filled by a single 4094-byte write, which overwrites
thousands of registers past the end of the table with the fill value,
including registers set earlier by the mode list. This shows up as a
fine 4x4 pixel grid and blocky patches in the image. With an adapter
limited to 52 bytes, the last write of each table still overruns by
12 and 36 registers respectively.

Clamp each write to the number of registers left to fill, and loop
until all of them have been written.

Fixes: d0fef6de4f1b ("media: ov08x40: Fix burst write sequence")
Cc: stable@vger.kernel.org
Signed-off-by: Valentin Allemand <valentin.allmnd@gmail.com>
---
 drivers/media/i2c/ov08x40.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index df2c63d64e62..4ddb202d5c32 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1461,22 +1461,24 @@ static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
 				   u16 last_reg,  u8 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
-	size_t num_regs, num_write_regs;
+	size_t num_regs, max_write_regs, num_write_regs;
 	int ret;
 
 	num_regs = last_reg - first_reg + 1;
-	num_write_regs = num_regs;
+	max_write_regs = num_regs;
 
 	if (client->adapter->quirks && client->adapter->quirks->max_write_len)
-		num_write_regs = client->adapter->quirks->max_write_len - 2;
+		max_write_regs = client->adapter->quirks->max_write_len - 2;
 
-	while (first_reg < last_reg) {
+	while (num_regs) {
+		num_write_regs = min(num_regs, max_write_regs);
 		ret = __ov08x40_burst_fill_regs(client, first_reg, last_reg,
 						num_write_regs, val);
 		if (ret)
 			return ret;
 
 		first_reg += num_write_regs;
+		num_regs -= num_write_regs;
 	}
 
 	return 0;

base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.56.1

