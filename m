Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204756;
	b=4rIHoNhM8oHeRz3j3PpMLtYfJmm7uYCWXfvl7iBixMsMNt9oyIIqTaVRw+vhulA/sTpo
	 QEZOsDy7sg+XqDp9NN+NR3X6BKpfAOhEKFuAoiYzfUf3S5CEMmkmcKrvkdtmjwozgkZUU
	 AI8WE/dEOdt/EkrJVNfkkwazbhct196M9cDOnHpR2zKknU7qmYNVna5mLtIR2e50bjX4i
	 G2NZVJUV1oKNGAAlYgK7PKNpKDI42FFHuZFbFSsE7ee4qBDM1DYAqKDhi0bRm7mbYVd3C
	 XK1OaH+sKoe4ksy4vn6rqA8lmX8mdHtpBWp7eOfZ8PZA1P5uG8JlCbMoG+fxwDgU5DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
	b=3CDiHdIMqrYn3DySM2ZQOPisTsvQ99zg0GzqsAW+fDt0I9bEXklXe9qA1fmVuSoPGqbf
	 5drR0rLIsP5NRu3zRZHyoJL+B9UhAc9cox9LwPlt4x0hiDTLpAjLjVrZK6tzmUm9zVFpf
	 bcKrVYG44SRQZ1J8OgXe/Qu+g/ZH4DcLicDX9gxRakGBLXOdbsJQmKvFsuYA3Vn9o3TVG
	 yKoQLuOXj2arzQ+vLPCvMaxlr+pAh9aX+MbTZV/SrkhPqHhqlZYtxFnpSywsqg7ucSDXi
	 8ygxXAr/fkgFq/q1mcDIA09PC6+9ED5BYNhO/stHnRTX8RMZxbeTBg8AuotHad4qT7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypFOmIcC;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F98606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 06:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypFOmIcC
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so936645eec.0
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 22:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204756; x=1794809556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
        b=ypFOmIcCCXirRaYF2vctT7IyVr9bqprzHJYmx6d4kV/4990vsFXxGtvUxCVi88u2AA
         mHsIy2gDoqHFC38an+MSkhl9DBiuDy7+bsFW5UI+XPNpuzydlV3bSXozkDCk/Ir8Aoz9
         nB6VwmUJOpqPVywRdm/Djv9vFpv2Ze04xnlh4vZQVLynICxH1x72j+Cn2FY3+NrWhBFd
         zErbr73yuYHBuiKSK0j/0t8vomotfpUcZE1LQOFXpE3WJdOxYIWmpupKs9xCx4gBpWJz
         IVeRsvB5ZP4IdgiO2uIs9VPL65vdubBvZgSFFxf510mmZhV6i6uyFuS38wR7Ey4UgrHV
         iOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204756; x=1794809556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
        b=d0XC1F9lR5D1jjA9gaDKk0qHwKnlkF0eGbH9APdXIoiQmLebSnRpFmCzWcsNQ0Q94t
         5wsTTmtPTo8xt4wyAwQof+XOsxaVxmIk7jVyteFT5C+UsnBityhEie/yyE35TPjZ+NdR
         qP8boOwciQ2Qs8mxIscuv0ztkw2uR0/xQiRI9zkEtNDPJxeDBvNLbTpfv8Hu2qoxuU4X
         7nRzdx9r1d/L5QzLJ5iCINjYWvtTeAGpqP+gWyvkMDA4pzfiH7Ogd1Wenu+sPmrALOEt
         saiaO3SND2W1blBKnBBbtD9fJljIM7mWBWY8CeA+XSEESh6jopJFMZwU2go62PuTOt88
         l1gg==
X-Forwarded-Encrypted: i=1; AL+hErGM763icmWz8bC2RGNlfmWwObsBJWYTiaLthx0fFj7miRwKWbhhIXn2/V0jqx4ghuKzcmdG/u84AkUVcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nqKOso8P5dgYCkH2wVSSqIHySUbRYsOdNmu/hL9VKiZ5nS9Xp
	Jgz67/ynTff2eGspbZq6+g3nuyXD/1rh+osNMlL008y2f+I4jsTvfoMxsEAYqCE5Cbnpew==
X-Gm-Gg: AYBFou1aTn2/LXWaTxMGEvBqidbatcUykSNx5UBy5FZdDpQfWbNTbZvsxiE2YAAsfnV
	GllG7JWqKplLjernx19s1sHJoQE5l7cYcKmZGKGfCqzYDsBs1C3EoqAIVG4WsdbLtbiA7lJVtZQ
	q60sUdtASm+vgLYty8T2aRq5r1Makg8i49y1xql6hUpHqRuRwVczT9a4riXId/BkHepEg5Exr2q
	XZ7KkEr+YoK7hBWHHDQXBQ19SgOe/Dj0s6EVNUng5CD/lW+85IxZ/tKQR31AmBMHzC3RkiXyleg
	29Tjz3AB6y2K8Ys40FnT/uRmdHZEoRA70/4k+FHZPjJpgQlI1bZBZcxk/qGKbwTB5TxMw7Pcn1r
	sZbrkmFy/oXwDfqM8k2VLSfL9GmDgTdyJSPTiY3E977wLIUFrJnqabW3yVeDeAYpvUGSGw7uXAy
	Doq5wVk0l6sKYDDtr7Mq2VCT7pGfwuqbNkLbxmlGASssg6q6T6dHdoixgh2f+GxJveVR51SwYko
	8GfHxEd49pCiPpxFTpUtZZxKPHvGlleUOJVGKrTfqGSocqPP9CpK8K4j+Pf7G/8vtNz3zj2yCPe
	q1nazeKEVUaRUNBIwXawEBH1uDIIumSyEf+5WE0hilPtt20crjjgAN0mlyZB7fjpuI2vP1IXirU
	s7RT+iefQVH8N2PsEVWQeXXcS6SziG8Np9A==
X-Received: by 2002:a05:7300:d20b:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-372571d7f02mr4839228eec.24.1794204755480;
        Sun, 08 Nov 2026 22:12:35 -0800 (PST)
Received: from codespaces-88e7e5.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm9835409eec.10.2026.11.08.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:12:34 -0800 (PST)
From: Lame Morupisi <lamemorupisi12@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lame Morupisi <lamemorupisi12@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout comment
Date: Mon,  9 Nov 2026 06:12:23 +0000
Message-ID: <20261109061223.17144-1-lamemorupisi12@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108122840.85622-1-lamemorupisi12@gmail.com>
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
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

Clarify the description of the MIPI frame memory layout by
explaining the meaning of optional fields and payload words.

Leave the frame layout diagram unchanged to preserve its
existing representation.

Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cd..09c2b1286 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -130,7 +130,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 		even_line_bytes = odd_line_bytes;
 	}
 
-	/*  a frame represented in memory:  ()- optional; data - payload words.
+	/* Frame representation in memory: () denotes optional fields;
+	 * data denotes payload words.
 	*  addr		0	1	2	3	4	5	6	7:
 	*  first	SOF	(SOL)	PACK_H	data	data	data	data	data
 	*		data	data	data	data	data	data	data	data
-- 
2.56.0

