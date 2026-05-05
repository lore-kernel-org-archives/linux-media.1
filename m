Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE7322A1F
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997827; cv=none; b=WBT43CApqk6aaNscuz7IXS9F0/6/zhwZGRNlaDyblkaypYxt0gyTP8XVmQ7b/I5fqD8VFUlhWntBYiFsOqvqK+x3CpS0q9Ft5JJLvlKB24+qGijHTj6qJmjM19U6f0mcJuqtoFYTGQrUlZEgTZ/6L89LToIfpLWBv9Vd4jxg6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997827; c=relaxed/simple;
	bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mymEybHaH3V0hKKWv4Nmclcd5yJMRfcI0WFPNSZZjHBkajB46AvuJUUjU/6U/4+M7vBk0nZwVE8R8URC/lIYLQHoRR1JNLENtOu6RKi+rrqzbYotzmAdudPRAd9tBD+W17jk1I1/owSqJdhcGsE8E+Kxh4bRRaCMGCwwXOwtbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4FF23A3; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4FF23A3"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso6134334a12.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997821; x=1778602621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=H4FF23A3p2afd2RFIiyHCJdqHSn/Vku7Xr9oyuxlaiKJpXhoLjYAnoXWNnjpBQBryf
         lXPV3muouLMnaiD4NNoMnYeRzCS4AiTBnmkguIc6lPX+cec+VzgFHrdGrkujWhEUiHCw
         dNQVaZi0bOVQxKA2FEx/Is6UZYhyuevcFG6E+Nlhk9r9H7FXHUzF9E1DQT8jZ8e0yAHT
         Bc3dOU7GZ1S4p5qH/Y1jP5q1DngcbiO1oIhvi5krARgImr+HAtY4CCbz78Br0Jf9XtrI
         220YCNJaFamyJq6OwZwAb2zi1jazVVih8SXd1kjzvjmpukEUlvTyYEly925tTFL6Wkjk
         cZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997821; x=1778602621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=aWOF6gh+t2BLcWTlX6NylMeb4q4r81GPDSnoF4+ZWRYj8slUnNatgyGSbz4cfz900q
         A8AUbEKe8OtAKAAbhF0f5KihtUD0JFZRHvMY7V3kxFf6nsoKzHzc5I9hPW1ZYb85DclO
         TupMK+HgQveTDUgZQBMsE7mhFQxqP84qczJpt2ZV9XOPJAebmWKece4KPVrK2DCjIgO6
         Zpg9kmtWqfSWkz+3XiSznlYr/BR8SjNa2YfQvt1LuBWG8OWl/D5suo0s9sc06heKx4Ri
         wwOTpYQJecwa8YZZ7QyduSdFeYMgW9bj7r0CgT6TG8b4VsrGD+NRRLllr4qI1giMpsp9
         tYYg==
X-Forwarded-Encrypted: i=1; AFNElJ88yA/pSJppwJslJzD/mKsdWerBZMywjZRvQSJ4Rud+b/vKOULMBt01TjCfdf0jGhCdJFuTvBL77DQSbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++cJIW8Sh7qzUTnfuKufXFdOWh+e9CvSpz93k0MyR4a3UcRB7
	8taGFL/YyKmPTsG/D/sjE4JkmCA0GBzzLnNoAvwkhNbDbjC+chmv2lWV
X-Gm-Gg: AeBDieslK+m23Q0LIeglA3w3BwFo3x3p3Z7wPH9KkFckDfbuOfMmg163Bi8o0/LOamT
	b0tn8DnASR9CIvs2n5e/MfVKtVP5d9b/eNLmXJFbPmUhphsedPnPYZgTrS0B8tltHNP/bCskuOn
	OuWjhJDhS+nqB/EWFxfyjrwPBKDjQm5AP89CT6lL5OSHxJN23leE0acILGX6Qx4kZsoYhA9dQDj
	H4SUGfwf+SCxFwamDWbPwiiVT3hlbinuxa9TbsR/nj8HX8omG2qxKvkAB+MX59Y+hv5tq8es8gJ
	Nd7Ueb/peD6G4H5ITMuF4K1HqmFMJumZTEDSAXh7MNE71vLVx2+UZO71fmwgJzlOu0GDFvOe0XF
	HzqJjzjgYXHpnZwluV2qM/j9hpu0MQ7QIyJrakC/psc1h786jWPR6qm5MPMlqBW/1gnTjYwr2wS
	vzNJ9hYZbSm9UWHahOdlpfEQrBliGzrfbKVYnjmmPUcGNTYy8Zsy8LqJKH9A8UhZZpaymVMvwni
	GEVGu6LxVatUBdhRMo=
X-Received: by 2002:aa7:d319:0:b0:677:866c:6bb2 with SMTP id 4fb4d7f45d1cf-67c1a2e5f85mr5124227a12.16.1777997820593;
        Tue, 05 May 2026 09:17:00 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91d5727sm554894a12.29.2026.05.05.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:16:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616
 compatible
Date: Tue, 05 May 2026 18:16:56 +0200
Message-ID: <GgrksnDEQem0uehnTU2lzw@gmail.com>
In-Reply-To: <20260505134812.408316-4-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:07 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The H616 contains a video engine similar to past SoCs.

Maybe add that it's first to support VP9?

>=20
> Add a new compatible for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Either way:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


