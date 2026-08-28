Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB0A367295
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931308; cv=none; b=dut0eF0RggZ5sP5V77js4YTANjBRIkAw6yNgGVhxAYX0k8iIUmJEHJUuTfioXnFc/RmV3DRtYJ6+OeCGiXtG7zxryRLxoO0In5mliICFMKQQNJA518DyTvxj/NxgGD1l8B3UGOzgZtKV/1dNhCtGWNt1ook0IRqw/7425oZbdKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931308; c=relaxed/simple;
	bh=+6KGxcGGDwc73riwb5otRlgUrSwJkffaC6ls1E91zck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stftEE1pN/o+00QrLzSJq2SbNyvy/gzfdn87seBRBNz9ykB0qaVOpX1775y1Hx7YlTjejsb0or4fLP7w8+fD1NvEMZOQtBaTLrPVJqn00qDrH64T7kEeGvznWUsP7ZcNXt6wPDIiTNhcuIdGfLOasnMsKpu/H2ig66e5j1L0sz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ig8K9w7d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ig8K9w7d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso11623525e9.1
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931305; x=1788536105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaOfa8z6OMzLtYhT5SId13Mw9otf98/zrSeAtowlsB0=;
        b=Ig8K9w7dkZp2wti+wQurSX1ZrOfJh0J7dXpwjL3e8IFY0MAmi5A0gdmPN/atFJIufU
         3IGLbSNpTk8uHmITSJWSBX88IjSX3et0pNVXR9qmkdJzm9WjD1ye6dvbtg5u2fvvs8H7
         re2WGSfEMJQZGA1nMJmKfV2mBiIKSHIjhhqiuxZpq9OT8G0387NClsINRGokoPvxHb86
         e+mOmLmOZRuCMiujts30PSRrKQZSRoBRcMZYpTXKV/NO8gqDx2dCwCnsnl+H0KrsntaZ
         GFDpGQOHZ4zlBN1eE/v1ujUa4lTzBZBmp5NLb14P5fqZ12FjMQZX7qf2eNv3sy+lUZ8k
         oByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931305; x=1788536105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaOfa8z6OMzLtYhT5SId13Mw9otf98/zrSeAtowlsB0=;
        b=RTiW9HNJ+EWNTm5TzOK8E8M/iXtQBjysjFNuSPQ1Pk3QrZN8plpuBt3iO2nVgjHEX0
         FJwqrl5o7/Q+mjUKk4lLAVMDWLYQRV47bHlMavX069iE9ASPGimAbGa2rRWPzLdvC3mY
         X2GNAu6/HwGSnEpSS/R+5qvomB6kpA7HfbpBtIQQ6TuiNecBruqX5GSV4aFjYXSkOU8k
         HOkZi2fUBGRWrOvBxikWpb1zMjCliYUToNvKtKG9DB/+hJ8VZRxjLwQP0xUwZAaCX+Ga
         bmVpOSu7H17kTUIc53A5DmCJZh2+1CJ0B82myJR8haX99nId37hP6sp3HZTiSIx+iqIa
         RmDw==
X-Gm-Message-State: AFuF++l/gqJ2STmB17KbYsnaWiN62orDyDB7S7cBrHftTistVBAOAiDb
	6Mp9V+U12kZ2u/evPkaNxgoQ4hDbGgEP9El4Eg5930x/Usg99j8dwJOO
X-Gm-Gg: AR+sD13QXGD6+soph82nz7YTh4Aih1IDw43IUnXeHXljvqUvRHdx/ZpazPp0uXjO3wW
	n0vAnWR+AJWy+g23tR24HJAFcXmJuKiFzFzseJl9Qckves1HiZdmxy9Y10BjK2IV1zglRkuHXlo
	CKLFXkN7+IdCE7LyfFsjTheZFl5m0aubBmpevUMY7efShROSL8Qerp6UAzjdxLe9Dru6L5hte20
	1k0qwfzCMKkeIcBWQQFrh++n8Mk4hpK+2Z70CIzpxpN3uaJ3dzi+s2uIZQItEJNH0Q0A0yGRg/l
	Nb0MtiTRbxrXpDq1cKWzAt6E6BlzOtSg/0uTsHt0VcPYYv7BevF9/6zsC4Bh9zmC0+3mqGyU2ho
	LVhO79UwQWsG3j3lB1nSoAmV7aVhPfdsyeLipUoFbueQ+UuSNXwdgyWRlSADhKLzI9alYUTxr0A
	yNrUqIK3Uo9g0qB+xbgNI46ybINTzGEIQ9I6sPtXx99Y4CVHiv5zCNfLKIs9HSPlD0Meib++V7L
	1IMJoCb+wczyYZ822Q01TuIFiemVlUSAVmXbIYLZZA8I/SJ+M892j/QSoFKuA850PqFsukneZIG
	A9CwPRLdEyPYcXk=
X-Received: by 2002:a05:600c:3e18:b0:49a:77c1:d246 with SMTP id 5b1f17b1804b1-49b91c4e073mr129859625e9.15.1787931305285;
        Fri, 28 Aug 2026 08:35:05 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm4453038f8f.5.2026.08.28.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:03 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Fri, 28 Aug 2026 17:34:59 +0200
Message-ID: <20260828153500.31556-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apGn9PvuUw_AODd-@kekkonen.localdomain>
References: <20260828132104.21473-1-robertbozik@gmail.com> <20260828132104.21473-4-robertbozik@gmail.com> <apGn9PvuUw_AODd-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

> This bit could go to the driver but the IPU bridge isn't the right place to
> document this.

Agreed. In v3 the entry gets a plain

	/* Omnivision OV32C4 */

like its neighbours, and where the link frequency comes from is
documented in the sensor driver instead.

Thanks,
Robert
