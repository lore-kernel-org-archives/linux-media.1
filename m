Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2230C445ADE
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784569210; cv=none; b=T8nOLrofgLNOCfggIUBePrt4nK2bL+m/FRNpA91zUW5yI1FcPM0vpCG0z2h6d8uR80m9/GvX1iObr7P6uoN19IhkWeHqM6U2KuQIcdb35FFXCEXfxdCn1IsHja94NjNPjzjyfFJ/tjWT/GZmkGbdPZceBFmU94tv9OvMXoVxbXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784569210; c=relaxed/simple;
	bh=2kAYaaLwIlYcH2buJ96Y0ZdmhoMc4tJxYfECPM7dRIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umwTRdik3RJUjvo1klZwsKhRWnCL0uZ/R/y4+NaVtV+7VbL+z05z/jlFj1XZcwJPLPOkSBwXwC8C65JwYN9gwsgEH0jGd+ppcE5hx9nVTRkjIbdLfNrCyXYzWXrbPO7YK+iGbtsCq97K1pb8OJ3fdq9vI+ZMoMi5COpv9usCVik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1ucvpKj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1ucvpKj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f365afc5aso5061542f8f.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784569206; x=1785174006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kAYaaLwIlYcH2buJ96Y0ZdmhoMc4tJxYfECPM7dRIc=;
        b=c1ucvpKj3y+PVBPyxovaW8gBX1nuO6G8lNjv7EROySilXb4ih3cIi6lwP5dqMnX8PK
         +dhWOmxmKKMeVcfwEdQy6aMnAv0MDCqAgp0enlsZe/dBxXV+SEuC8EeOG8qBedZURX19
         l4Ns6GGLy3XU/vgWOabnqzRh1JT53ibQC/9M/BpTyjv5dU8xIzASQwV54oyIuIlZw0g/
         N9A79L2T20ENlNHddj9aYad1LGrFY2aIt4+gbzXsIFti8eJd9cF957h9Gz7dk34kmoyM
         8WBMlTLNgvNPX927gAzuEN8cXDpohlo8k48zG34SbY47rgeprUOrgEBgkXRDNs4+eUW8
         /DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784569206; x=1785174006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kAYaaLwIlYcH2buJ96Y0ZdmhoMc4tJxYfECPM7dRIc=;
        b=LY7IzlUPSB8hvO6h6CpclxCOhTOhF4UXaAGMaCu7JajfY/pnKKVBTtlKcZ5fgAm6qM
         P0b8KfQOtO2pqejSgsd/hi9drC16AQuASkc+Fu1l25qaKnjXaXgTTRMTeS1lH2qUpHQa
         NU3zzL+wWnHqf5S8HRHSOEsBpeZUwQyCr4fB5ddn024PiTyTSjB8rZcUm3PVHRCNBbxm
         sX9Ymbf90FaxeE+XxKzDmFhzx8kpnA3FZBaIgz2Jppmaz9iEu5BxWr4d0QDjFHPWefzQ
         +j7vRQgvIjCRGUnw389o3+dOHco0qtuDqmRaGGSaULVTTkCkHkIJWqgVtf+15hCRTOHd
         PCmw==
X-Forwarded-Encrypted: i=1; AHgh+RqOZHAAz61F+SzgwfN1tR5oojrpK5QVpLuR6j3vAzOoJHr6AnwXB9LgEeLETLLqGQkqnlkzBbgQ14FVyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXFC/kLtlRAFk161NCH/pJRYq8v9p3b2BJVisLdArn+d0IsUzy
	RPbO4PtMewl9kG4V69ZzfN2pFsTpcIhYW3GbBTSB6A7rAaB+IbmJP/re
X-Gm-Gg: AR+sD12Z5HJM1utGkdjpas/l8u858pQyY2Wj/7aMuGf+5OY5eN9BaJN/8wmZ/u9Zczf
	oJxhrydzGN36TRjeivMuHA8ryu+BX5fONTPzc+S+Fv8x+GpbLqJGnh97bI2CqaMNLCDkI2goNGV
	HFFlflX+rek3iJ5zYFIGEwiHabPwFi8++ZpJhdy8dqVo61iH6srGR2gp5B5TlCgXSs+K46gzYRm
	9dWAQfx5D4tEhporSdLZuBYWBbd1m/xuJ/GfE7r/rXV1B3W44tx9he/u9N5UJSGtiob9YA9Js+g
	DcdUB9kayEmbwFisrLdcBLKZA+vv5l/TlplKeC6wGArqIImCgi3Vn0a4AFXhYaUb11tp0EyUvUv
	OyBwuF3oXfN14RwcRcXY9MGWdPqU7mqyDIVJgr9hcR9ACqBf38sMyxzzBUTJgLWDMtYgX/zUMXs
	QYUnE83rN3z2zow8oIsmFx9WkpLivaqbFo97yT6w==
X-Received: by 2002:a05:6000:186d:b0:47f:7b88:1843 with SMTP id ffacd0b85a97d-47f7b8818b9mr3851758f8f.38.1784569206196;
        Mon, 20 Jul 2026 10:40:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:4352:bba7:6d7f:5f92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm33703136f8f.21.2026.07.20.10.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:40:05 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Tooraj Taraz <tooraj.taraz@yahoo.com>,
	"Joseph V . Lavigne" <jlavig88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: Re: [PATCH RFC 2/2] media: i2c: ov5693: fix horizontal flip polarity and Bayer phase
Date: Mon, 20 Jul 2026 19:39:52 +0200
Message-ID: <20260720173953.126255-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720-sp7plus-ov-flips-v1-2-5f345b0673de@berg.pm>
References: <20260720-sp7plus-ov-flips-v1-2-5f345b0673de@berg.pm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested this ov5693 patch on a Surface Pro 9 (Alder Lake IPU6, ov5693 front
camera).

I reproduced your 4-state flip/image matrix on the SP9 via raw V4L2 (capturing
SBGGR10 straight from the ISYS node, so libcamera's rotation handling is out of
the path and I could drive HFLIP/VFLIP directly). Unpatched, the matrix matched
yours: the correct image is at HFLIP=0/VFLIP=1, and the state libcamera
actually uses to undo the 180-degree mount (HFLIP=1+VFLIP=1) comes out
horizontally mirrored.

With this patch applied, the correct, un-mirrored image moves to
HFLIP=1+VFLIP=1 (what libcamera requests now yields the right
orientation). That confirms the inverted-HFLIP / correct-VFLIP conclusion on a
second IPU6 platform.

I did not separately validate the Bayer-phase column offset (my simple debayer
couldn't isolate it), so this Tested-by is for the HFLIP polarity behaviour.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com>
