Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28493B38AD
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521225; cv=none; b=MFX8/rhCKLqn+a+GU3HJ9VEPF+3EiqJqLuYgHQimmU/rzsBWQwxUWk0ouMCG5M325m9sKPr1uTNT98Os8NE5chberUWq7sL31RLa3Nz+FmGZoAwQOyzilfiOn+b7lT+XfwXBr15bEl+VYXAF2gXaf4F3hQBRIqqqQUjSVTYPlvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521225; c=relaxed/simple;
	bh=u9dO4RA2N5zN22YNEBxk+nfIcAHajXTXBLPpIfycIaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZbAV755d5hN/IQinWtjwsf7noSmT0f/wVrYrWN/inLQ4SfN72WgqI3HpsGqxyNC68haZdXvJN99+IRPlP8Uw6iMbHcnMFt1KKEohxhP/YM751BH3b32oyR8xFJQAbSiHjpUHPuYmRjHRSZzppKJyW8JzHVM5mZ+YS+u80UxaUY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC+049xe; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC+049xe"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381507c9380so587310a91.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783521223; x=1784126023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+o3zaIf/6b+dXxvdjQtRz9xf7Upt1jRIGIgkL0q8uY=;
        b=WC+049xeim7fDxBudynsSK/Hye80xquncFqOShTAyZW+koSiN7ycM1U3bzy1/PwGLi
         9WqrI+7gfzB+2KVYxZD8KpFlVraO4bY0Lm681LfdWEgOfC/lDnDVAUqHtxOSzm0Hlv0q
         vAmZ4+XUTqXqbGBPGrzBylYjemcYv/tlRan4Nfpa/T0QV01gy3pxGfjge/hKGUhgtT7R
         lt2CX1Ev/QYhgFEp8PTvFqSMVuQAYqIctriLWqeHfLeDRpjgOgzcSv7JmwPPeFc2lItw
         vfKQzocyWufY1GvDa/jyWKTQDCR0m0j4IcPwft+F2dnT7pVt6b2q0oFATfM4oLzh/dju
         js+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521223; x=1784126023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+o3zaIf/6b+dXxvdjQtRz9xf7Upt1jRIGIgkL0q8uY=;
        b=VrCpPXYzLWS33G3rPyVxwhdpZkkkQPEoccrA99bDnu6mQgKvZwAnZwmiMCy68Y79ZQ
         UgKRMr6+vD7nnU714UFzepkQfSXkqvzLhyrTeDmXaL7HW5a+PbHm9Ldr9YfUvToLthti
         lIj1bacAMZUuOdUiwT4IPZC1mUbdUf/S28TFA3WMseTmvRwiix8EpQZIgqE/erXcnWrU
         xr2GatjdM1xxLNFN7UZviv5QL+xools7S/tUmZoDuBDMPwPOhSg80eePEWZfOJCNukxH
         2ap2T4mX3OHJqlBW+PAQtBzX/mMuoE74CriP91QGf7tYDzGf+OMS+N/uRe6h1SVjOoEg
         hCuA==
X-Gm-Message-State: AOJu0Yy+bReJTwZenkTjlTOrmbkg+RyVc6Y/Oq4IDepL5UQl58eeMuwa
	aQqu71RpGsaHgk32ZoIzI0cHh5fOVwy1z/qvNCcjgF5Qorxzm9L/C7Fn
X-Gm-Gg: AfdE7cmNKCKirrbSQDTGFyDy2GxyV0InBdRukjnU834ASqDZNmmf5ji2lHmAqdOh45Y
	/JUny8MeQjr4yGzAnS0mW5VBAkuGK5EMql1IiQb//Yx0ofzTTbLGwy924tRCHu+t7+zzWDllXBV
	wfSUZsPn890T62C0n953kUPwVdt0nCcR/aN1uZ/O2YKLynZpcah4//22B3/tLG8PWwBxl6wGzE6
	fWeFLus8rELCrd/wEN7wQs25BZuRB2NBknbQxxbi0pRZM3x7DxpksWker3irajANqKjA2JpXiKz
	DWD6TFbTRhHMksYr73Fr0Pz+TGyY14ZZQNf3164G2UHfCdSz2kBqPexD9+akXIbDUq9T2QMADeH
	899CxlFivDXJiJi5tbR/bLhq1SXS1KbSsYWisAIw1ys012M/Q6s7q1QRdyeuIQlq9squ2ViaCq0
	952hyjrB9aGYKDzWSjrlMCGlmbtJhrhGEr
X-Received: by 2002:a17:90b:2241:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-3893fb70506mr2601550a91.4.1783521223082;
        Wed, 08 Jul 2026 07:33:43 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1b95:b995:f60c:5c67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fcecesm2877584a91.1.2026.07.08.07.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:33:42 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: cobalt: Avoid freeing ALSA private data twice
Date: Wed,  8 Jul 2026 22:33:38 +0800
Message-ID: <20260708143338.3164671-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_cobalt_card_create() stores cobsc in sc->private_data and installs
snd_cobalt_card_private_free() as sc->private_free. From that point,
snd_card_free(sc) releases cobsc through the ALSA card cleanup path.

If cobalt_alsa_init() fails after snd_cobalt_card_create(), the
err_exit_free path calls snd_card_free(sc) and then kfree(cobsc). That
second free releases the same object again.

Remove the explicit kfree(cobsc) and leave ownership with the ALSA card.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 85756a069c55 ("[media] cobalt: add new driver")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/pci/cobalt/cobalt-alsa-main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-alsa-main.c b/drivers/media/pci/cobalt/cobalt-alsa-main.c
index 7bb7f13c70c0d..9ed547cd40af5 100644
--- a/drivers/media/pci/cobalt/cobalt-alsa-main.c
+++ b/drivers/media/pci/cobalt/cobalt-alsa-main.c
@@ -135,7 +135,6 @@ int cobalt_alsa_init(struct cobalt_stream *s)
 err_exit_free:
 	if (sc != NULL)
 		snd_card_free(sc);
-	kfree(cobsc);
 err_exit:
 	return ret;
 }
-- 
2.51.0

