Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F11A9F91
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509847; cv=none; b=Cq36uRFE9X+jNSek/RyXSqt4eG4kFDsRGiw0k5MkQdxApbN15nhG+cKRPB3McX9a6R3zaTHBCoZGb33HSiIqgJ/5FBh+9A9oq3MsGch9WQhFjvhzVwVgWzzE8Wf/aNhy6lNPK4YIkmcJYOU3ppjgKatC8Lx5vxi/vk5bwR9/Rrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509847; c=relaxed/simple;
	bh=EJAvSnYa85zvmmYNNsnQzdL44e42VTE8nPd3KKI65A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HR+Nk7pKIp9t9LD3TL/C/c5jg5Ye/9kcweE4KyKT0X3vX1ihnbTxUGw9ZsGfH8tXVCh9EcqlF9wnOCS5L7ntYWpI3gs796a9m6GSDe0olemeM7JI5Wh5Qhj/zIUH8RzyssUch7Xp0v9a05Uez0f5LCJChLMktbsYAi1KaNwxzLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZcKvrDX; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZcKvrDX"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso5478504a12.1
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784509846; x=1785114646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUbzFnHbmjIvMr8zAOVPKxaPCrQP2DiyjHTJi7e/fgY=;
        b=fZcKvrDXZ+94HTjCybJYfa2k1+g6XugWTrdFgYVaL9C6j9DMhbInTs0fx3v/q+VZJU
         XwqAanfIW3B3OkrPYceh8VGPd9QMFPvjI6lJvaLdy5bmYHdwA5k14Ht1+NDM5c5twVKQ
         60xCjBD8hadfwYDeIZxxXX3Nuw2WyKPhR1kH2/5v77J9M5+ggScaxwx9hi8wIyczXe71
         qpk53z9Vd52fVT1oK5/j2NjD9VJRw2UJE+vpkmFAal35z+TD3VmadqlxKLQ/VAAMP3gy
         QZ48y1RhcjcRf59nxsW0xuwV25Tc4GHY7b6a2SGQF9kDRpeB89SKESGrq69opz9lBPd6
         aNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509846; x=1785114646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUbzFnHbmjIvMr8zAOVPKxaPCrQP2DiyjHTJi7e/fgY=;
        b=Jmlnw4lBRbgXza3IFEJ/Cs7x3BDPWjoQ3PiIkkcm7hegiB4js1zlRBo0jTaPqwIBdF
         FBO6WpDjAv7z/r9B0NMnXC3ao4mi+SZfsws/OtoDL9RmVsbbi4JPjaXIfL1dT6cKBeBW
         /p8Lp8wfr18iryrpxsTRIZK3ZZY/pOm/9GFH47Lr9cKvHyCw62J9rtc90ZUVBXnVem7i
         6l3c+M8Q9kCebdLFPvMrLh2cqec8jJZx3/FXyxssB2LMt+9SPQ9nw1L9mOrBHjYbcN8h
         hn2kAOWMHM8LWeUcswVWvJKBxrN4GdxYLhzE2ge912sdrrmzdoTku8da3IvkSc4/nX9t
         zBqw==
X-Gm-Message-State: AOJu0Yx47nfGH+DSacB/Jg45OUxFMLa0M1nBn9vKVwPONip+ukXdmUb3
	Q12NwoA96BgqK7qVNz1hbDJGf/ZnHrtLmBmOZntFpTjyULG3Azc2zrm1H4mIbflSc8I=
X-Gm-Gg: AfdE7ckCwrnovgSrlm0xY6GmhiH6hfV8rO/jEnb7mwQGQtD6MsG44L6aaKXlzJ56JCt
	ovBgjG85EV0CwRRDvwpd0O/tl28ojWnCUwtgypcT3+ati51pAmmwjEuzHg/K7upJXJOtSHae9w9
	ROYCrc7A9AjvUFio2jkM/QSuK53zBiCLMR9Pab18Rcsv3r1wkqA/oeTfeZ8GQ0/eDsrRDFJTE6d
	mBQL4M/1vhn/M6FQtiYV7ctPF6qZ3YbxGyzy3n2ExAii1Ko0Ck61tLSAKyeIR+Ufvi3/L/zbKjx
	qvSkb/Afa3xytLGy5LTQS+ZfZXGNM15+uay+6QBzP81yC+oWpJsTainISrrjyAxMvHaMb+notTI
	9xShR8XXZm8hKLALAZ5V34qw78QEvtefQ/z6vik7Ahy1LY9DfHBUVO9zq9vYDPkvHiSwsihAlid
	xn28WbT7URJba8vCIYDaoBqG7OlAYn
X-Received: by 2002:a05:6a20:ae2f:b0:3bf:b68f:4685 with SMTP id adf61e73a8af0-3c3ad7aa9efmr13252486637.23.1784509845576;
        Sun, 19 Jul 2026 18:10:45 -0700 (PDT)
Received: from White.tail445f11.ts.net ([45.119.30.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm27141680eec.17.2026.07.19.18.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:10:45 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	kees@kernel.org,
	stoth@linuxtv.org
Subject: [PATCH 3/3] media: dvb-frontends: cx24116: abort failed firmware writes
Date: Mon, 20 Jul 2026 06:40:17 +0530
Message-ID: <20260720011017.11363-3-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720011017.11363-1-nikhilgurudasani314@gmail.com>
References: <20260720011017.11363-1-nikhilgurudasani314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx24116_writeregN() returns the I2C message count, making its successful
return value 1 instead of 0. The firmware upload loop also ignores that
return value, so a failed or short transfer does not stop the upload.

Normalize the helper to return zero on success, preserve negative adapter
errors, and stop firmware loading at the first failed chunk.

Fixes: 0d46748c3f87 ("V4L/DVB (8986): cx24116: Adding DVB-S2 demodulator support")
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 drivers/media/dvb-frontends/cx24116.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index 39af918cb59f..d83acccf57e0 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -233,7 +233,9 @@ static int cx24116_writeregN(struct cx24116_state *state, int reg,
 	if (ret != 1) {
 		printk(KERN_ERR "%s: writereg error(err == %i, reg == 0x%02x\n",
 			 __func__, ret, reg);
-		ret = -EREMOTEIO;
+		ret = ret < 0 ? ret : -EREMOTEIO;
+	} else {
+		ret = 0;
 	}
 
 	kfree(buf);
@@ -611,8 +613,10 @@ static int cx24116_load_firmware(struct dvb_frontend *fe,
 		if (len > max - 1)
 			len = max - 1;
 
-		cx24116_writeregN(state, 0xF7, &fw->data[fw->size - remaining],
-			len);
+		ret = cx24116_writeregN(state, 0xF7,
+					&fw->data[fw->size - remaining], len);
+		if (ret)
+			return ret;
 	}
 
 	cx24116_writereg(state, 0xF4, 0x10);
-- 
2.43.0

