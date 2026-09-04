Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1505F47CC96
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521766; cv=none; b=mmw3Ludxrh/HF945m07UjrqDfTRttKufzHPcTBNKiZizN/gAaT7MEEEuk2/rI8+jUt3BfvRNFJbNRPlZOs8aEfRSYbTV/Fj+UcNfJEDCapaPow6mCq2Tv8ywaQOuUnNAA+KitafkJarER4Zd27xkCPOUHtbBEhDDRWQfdfI0ui0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521766; c=relaxed/simple;
	bh=eMh1XgE5WefGudjyk2232OVGrN6vJyE5SunZhB5lM6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNisXB77Shrg23/urGi1DIzO/MK1cbaJ5NFSy6Cqm7px9CR/YaY6m8g67JuUByK9EK1q6KBi2YPAqUTY34dxzPvn+pu+knWFNkVrSenOepcjo9Mbsao4lR/1KFx5Cg0YnO/Ke2D8MgekHjUze7a2OJQINrV9ZGX0ATs2qRPQwt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pf5XjLKy; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pf5XjLKy"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1c75f0049so668419eaf.3
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521764; x=1789126564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zakl8YRmN/ToGrLcfWMXlP0mTlLtVe8E8eXLLODYFCY=;
        b=pf5XjLKyCsPh+oOuoEhc+tlSXMSvvIxIatpFKsRDdnr+hrY+rkgBejQbc7QqHr8Abc
         fHSRLMNPoCaDsK5RTJPRcZSKcIGV0nP835YtWjXd8cWTAAWCNPbtpc24iZpAf6SZWP7e
         Sk3u2x02KzzFBszndYwrdZ/ywP8g1r2W5Cf3L9XTXJdQgeOwS5jlWlGTW0EnY/Eg49il
         w01QP7+X5iHcPWeQAWPJhMXDOyqlo6f+KXTXHzNKJ+NNbxG2GB8vsu28dTja41pxUJqt
         K8ajNClA8PYwTsEbQc+h+RYhZpKQCT9g/WfQ0EhWWfrL/Dy+vlVb+PACg46J+d3IaFaW
         kkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521764; x=1789126564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zakl8YRmN/ToGrLcfWMXlP0mTlLtVe8E8eXLLODYFCY=;
        b=OzuVke/PX5MdfDzautBdt7j8vn9+ybIW9dC2CGkbC7FjDbM0/9EfXomPVxvmUhbtTa
         88rD43DueBEoTNCQrWpt/gwR38Y5zfFWsLAL+5OP0+KV96yuLvYkR8f0u3Gd1IIxVjSi
         IXftQ9eDuEEz4kiss1V5q/A2zqHHHLZx14jhGaElUO1JJjBQHBcwiVXjaczBbpZDy5qU
         kDS5vGR2Oqn64lCd/iyPOIWRp3oe8Xwj6vfzL506gHvGDWZlmQnpC5XX3rZC/OQdXH2P
         aktm1/IcRfREst20wsdTpswxDkUWvpmDBHB6n6KWK0n43zp58zj36NdgEzZVQLypUVNg
         bqwg==
X-Forwarded-Encrypted: i=1; AKwUvBypFScmbn2C883+t+dFi5cKAtkotfW9YNaj3oF16ipczWq2iKKko74Avr7J/Gayev6oSouUcPzq8fbbmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mswhvcYG0n5/Yn3yYjnYvThPCgQrlnfekD+ZXtbPPduO0tRrhP
	sW1Dm5tF7S8rFfQjEXpRcet9unQFwmxTjiHXYWPcI2PRhvG9N2gQmoey
X-Gm-Gg: AYBFou1Wg//SezM3ckaDd4c+uDuHnpXJIXTLBP4coZu+GniZZC/jdpt8gB1jXld7uLs
	8EZ6MhDSXKIoCNORlY80HYc6IiEpYPqem4cIqNP5hVD3YBEKjGgNo0lnwN2B5Ldcbgig4D8AO/S
	woOCbJ1QvmIDFX9AlY9M/mahV77/PiyyavhQaIctMEgInpMCL6M8JXXeirFqpiJz3eMZDvih8Wf
	wFJL2RTPnAHCd+E8r0GvLXnLVmeVuQSuGLE0URVgpMfDdtWofD35LtsfFHmkB4xQumVMyguPHSx
	qDcuyOs+Z6T4r+A8AbmBDkC757M1T6FwU0Qhcij04WSOLhamcSWjMjXAcxgRlG095HLyJJ8V36Q
	0efnk4yMvYQgWOmOGjb/v5Je0FMCNE/UzanrfvvofFQNv2KGxnuc+hOrtokrRVLdxqVym3lMrAA
	U8bXY5cmj22MoYTgJ/fFzkTsHN532GIZBA1FSJ7Ka+hX25VPWKwl+MTIgT4xjCyyqyq0HucnzV4
	2jBE7es82zyPmU=
X-Received: by 2002:a05:6820:20b:b0:6b7:46fc:1de with SMTP id 006d021491bc7-6b746fc02aemr1956810eaf.61.1788521763819;
        Fri, 04 Sep 2026 04:36:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5529506eec.6.2026.09.04.04.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:36:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: usb: fix typo "initilize" in comments
Date: Fri,  4 Sep 2026 17:05:57 +0530
Message-ID: <20260904113558.17172-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "initilize" to "initialize", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c b/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c
index 100a1052dcbc..1a7135b03c33 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c
@@ -755,7 +755,7 @@ static int mxl111sf_i2c_hw_xfer_msg(struct mxl111sf_state *state,
 	buf[0] = USB_WRITE_I2C_CMD;
 	buf[1] = 0x00;
 
-	/* de-initilize I2C BUS */
+	/* de-initialize I2C BUS */
 	buf[5] = USB_END_I2C_CMD;
 	mxl111sf_i2c_send_data(state, 0, buf);
 
@@ -769,7 +769,7 @@ static int mxl111sf_i2c_hw_xfer_msg(struct mxl111sf_state *state,
 	buf[6] = 0x00;
 	buf[7] = 0x00;
 
-	/* de-initilize I2C BUS */
+	/* de-initialize I2C BUS */
 	buf[8] = USB_END_I2C_CMD;
 	mxl111sf_i2c_send_data(state, 0, buf);
 
-- 
2.48.1

