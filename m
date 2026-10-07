Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F345040F
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381690; cv=none; b=VQEmzzT2ycr2zYhQD25ciblhqkAnfZWNwCaK4MYxWpSLIZQ1ekkyHl4+NzLUn1sD0xAQSl6rUYJowj6mtogXS7X2c2lXs791klIoVT/pRxmJkwrc107BPmzaCtvQnyLy45U+ZO12HcY58nPOF+7ncrUQ/2jlR//3A10oQx0j0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381690; c=relaxed/simple;
	bh=Bzonkp4Kl647I49nPKXVT8eFQsR7sFNTOnQ8eIGUtOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SALin0IGVbRqfWZ5WED96XU+0qRDXMBSYa5bIgwU8FUnvVIv80lCGoKMIyDj/8morI/r/v78nmeVTTcVEUOZKKQ20heMVdvoxrvp7kHdLgcBd7INPLsIWbXzbCqxcZgF29D1wCEII/kOlNPsCpmv4ALzxzm8k0pqMI4p7zNKxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1VgcXry; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1VgcXry"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso1448443c88.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791381681; x=1791986481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=A1VgcXryepmu9oJcVz7z2l0VF2lYQRJmesc+tJSYXMOUTYOaoUX3U3mpLzUbxukEx2
         UrpZS/Y7m7UL7JWLLMLGVUVaJFza2R1yHUksD2Dmfak6gcUy43H4Zqu57acLH4F2zMiI
         DodqIMRii6+u3Z0I9qXaJ3IxL+6etXTaghCFXUaTpfPBCY2QEK++2Sve/qslAtMzPXrv
         Q70tQi2Sx/+SvSSuiVUuxFZhszrleyminA2jMBPGdE65FZyKKRokQBm1JSCjKJkqdQb4
         xe5r6Wi33YtdJjR1n6GXvECdLDNSrCWO6CLbVqNIBIxe74dAeSRA6KXLqHt5WxXQD/HO
         8F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381681; x=1791986481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=v3yzE73Ptz/glSVeX4vWxWBkYiMm7WAJYHLasEIDiONrqwrE9+v5NrNPaLkEciIcOd
         Lo00zSbcGb5fWGNhQezkfqDWBxuE/bkfGX6KxUlgsDlNxHfuBWvlPLNTFHtpjpwmQl9C
         J+gW9Ng7mfnNPDQtFf0qZ3k707ExbUsWBA+iw1sPfOQGGXxmFgZ33ha7QtDBF1hCk6Zd
         eakERXrHsNudQqxwPXqePvfC6w6++vCklMEzkHZISgpFbC//dx7C1RsmtDzZ8IKkr6vP
         mogZ4cDTUIUJhL0MovfV96LZiXzgvHDReVijjTk1DQ1bf/EuXTaNd0dVCpxJxIe2te10
         Cl6w==
X-Forwarded-Encrypted: i=1; AKwUvByWMsMkGzkKIKmyS3TS5QvPxUk3e8/hP/pX6Nx+llgAYfhBI3HfCEBKbWpbrBD8Q4wSq9Cn0mz7br42zQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nP4Mp2KtUZiObkuJr/cauwR7gnlkieA+vyEzny3aK6aWI7hqQ5
	Yz47g30KMbdoW0ydvaQFuknUlgXCT7jUA+XarMiPGRXpZ8jogf5I3eSF
X-Gm-Gg: AYBFou164ceSSXseP/7tpvRdX0LqferLQ498vNpvM6oym+80QwRbhySYNgqyVT9HfZc
	7NYmr8p0g7t/f6wHcrZIZmyQhLMKHML6+dPD0G9HOfjMAZNBYnDFo+JCYSiFR6BTSU3DNYb8i18
	SE3uxRzMMHGSq1ZEjX0syTLMUaE5vvFgrZbgtevohY7YslvHvZkIwmCSJ5OQU5ucOosdqRTJ5q/
	IdG9UjDIYReZlXXZgugQZWepQ/LCA2PJdSsbD/tWqD0QVxzX27qUqiWhiPezJkzDqYsEgtFnzUJ
	oX21n1eUvxFB+JheBkhfGc/brLn5w/CYkIWJ8D7QO3cfNhmUEuTsAfvU8oZn1AzjZ6P3DXpBNa4
	VXzBQMVw8hqQN5NdFnWs445LPgAOCV3jx5wcFm/KYP5z/h82orXe4rzWJUwHQE/M73Dsoajmjk+
	dgZ54tVRhWQHuAOZRq4Q5W0hMP+CSsvl0H78ZO0YM6w27Lw7ckwf3iXlvEo3bkExyilqrr/bvv6
	U9MhD5pZfA834zCkmyMOlUwpnF8VQ==
X-Received: by 2002:a05:7022:ea8b:b0:143:3769:c680 with SMTP id a92af1059eb24-15d3115a913mr6364429c88.25.1791381680555;
        Wed, 07 Oct 2026 07:01:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1630180f6a5sm4179461c88.22.2026.10.07.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:01:19 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: cedrus: fix typo in comment
Date: Wed,  7 Oct 2026 11:00:56 -0300
Message-ID: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in a comment: Neightbor -> Neighbor.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.56.0

