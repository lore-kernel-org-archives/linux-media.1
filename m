Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8CB48FF72
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405376; cv=pass; b=USyv6wch4zrgdEF3mD6GJru6s62SpfGH2QOgv0Vu+Cw2AXoqaMFPotNed86fve6ffX/qX08hZY4cu1pwbrML7hW5yM4FtQbMuNBzk40Z1uhDYAFlyeuCu7buBmahO+JyAv2tXAm/f/msQK5EvL26xIwS+3ER00lxfKFkbTrJiL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405376; c=relaxed/simple;
	bh=/xP+WEUlsYY3n5QsfJm9tA0Wc63T+n/0bY6kVv+mVPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjduFcLboVghME1Xk827EdtZlL0jb9JYUeXjTgI4LCX7DOXJ6kSW+zRHAxemtmlUgCj9crgdNjYW7u9whcUkMbdRBurhxrjFKhmpc1VoRINX+l59LUaxciGlDKIAdFYr0T5QCvd2yyyYf3WmO/kG3nzTu/s7X0tctiZpqi5OX5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3Ji5e3g; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3Ji5e3g"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35c76e9614aso3789439eec.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 03:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792405374; cv=none;
        d=google.com; s=arc-20260327;
        b=SVfTGogCmnzQxpGDxlkYk6zpdgddMkoraiGuxYxl2F7nVfjiXKj2KZEPiAGRD0vAzN
         yQdNdmnetrHjbhvwV0YYBi+ovpa5y194X3/jJf4yoSOgcP1XvGl2OSYK/ky5P//l6rWk
         f39JZOvmBsufzW6hIP/1uB980z2VW/Qjtylm1sR7Eq2ZegyXIh/Bc2ebLpB9MkXjRGVo
         5FekZQagfb1T6O8Cwa+DM3v7dhOXKht4d3fJhgdb1rGyoR7M6HBsEbtnF/1K92k/gFzs
         RkN+oAQs2b6GvuFnuj4GAPF9+A4LGJUhjKvvcu6unEZAcl5Yz0SWUhLleiVIXA8uUh1Y
         +baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDP0zNJyoncem5NQ2EXxAHCK2jutUuZuqNkhZsxaBA4=;
        fh=+rFoteOC2M/q1n5lW088Wrd0qQKKLXsoxR93OpgX6Ec=;
        b=nbldoINy1/IR8AICUe1CpLA+/duuyyHK99dzDeVItO6rHo7tww3N3ZJa7KcAATSI4J
         bHQI79/GSx1LNrTiTl1+7mA834b08FwePIZxtZ+PCNGKTJJI3VBllk3eAHrQnkp+LaKG
         V9ywjQnc3brs1Ve/9l3AawXlb/4TTceWkSmH3X0sBXv2c0aRv9Jg/NiNcP5IGXW7ZoKK
         eEgMZ1/GT0sOeokCl/AP9AZk8mlVKSGGXcn+A3ZseI0NoGprj6bKDhCBEN2IBCfvGkWa
         Vlo7EOBjmszuEV7QvcT6zdmcYo1cbjlDWxsswsxg76ngGAhZnfhcGWyGHbsPT61tDFLs
         3SVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405374; x=1793010174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDP0zNJyoncem5NQ2EXxAHCK2jutUuZuqNkhZsxaBA4=;
        b=N3Ji5e3gmZDDnzFiQmRT+HJE1BdhDGLroCNyih1WQnJAzMZWtr+Idhx+XsIGz/w2BO
         ARWT6s+/9z8LxfapB5T8a6C+ymhSM0rANB/WGToAIQbIby/koguqLm8blR5xwVeHUSJK
         n6jjqBt61a5tMMOXya1FGAHuLz1gbFwvOVZSFn86iU1IuPMR0Jv4bsIJ7d00Ms0oMVQ/
         dGUZ1agQRHkTGoDP6ABigwhbk7ybpjgafNC9tV/Zo6kcBg2LRN9/nVj9ElXiZSGlJC9W
         tgpYtJhvNHsyeFRLeIMcZKozqHrVOu2W9jThjMfOlUSGu258Q175TIsRFlCK2IYKrbbH
         tuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405374; x=1793010174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDP0zNJyoncem5NQ2EXxAHCK2jutUuZuqNkhZsxaBA4=;
        b=d9YxebU8tEt52C/JD69E7K/XQW5OdMAXKxhJjmgJ8TwfdAGL2iR9CyI5YrVfkcHyiV
         HKYfh88Hah02FiWuDiXp+wKC4BPr9pQpEMLB/vxsuvpFjVTP0WzMCpa4MLpA6vKv0WDD
         qVcv3qDVzKPKA5zBs+WgQg3mDl2p+Cz+d+/LYJfr2kAg/nRsWPTb0B9fDP87gUNZCTdi
         mIVUFUq+/HUn0+cyeDZzT5PSwNJFm0gJ4KevUpPKPareGQ6V5+kkiy13o2ijgiiQYjST
         bxPjmek1KMS3oaawYEvkOgaSIO/SRV1XH4h+PTGfBGxlh5WmGKbHSUr6Ds+KJJKYwHAW
         TquA==
X-Gm-Message-State: AFq9FYLDm8/7VBB43kojbgCFzYiY1UTuztzq6D88+xsnD3A5Zqk6LQzT
	/a2yA+cHbQUCgATZGOyyw95bAgbIaypl6gZ1pLVP1EQHNAOf3WWnlG8To+RqHcTDeJAJ2kPxpqO
	pvU30rCc3+bojLc+IY5JBzxvGNxToH2tUmw==
X-Gm-Gg: AYBFou35hJuiCEMdRlfJaa6XyB+7PgiTVasIFKwp3LLEsEk4hNVdv/vuwWB72dWQMr9
	tFYXJ36xrJxkgoKp5/qnJ/CjfSgDyQeSLH8Z3ZiPbrjtShnfxf8hv6ag5nYkuQJCbESwWI7wsky
	MRIVIwKIlEZ5K6YfXJLnkbNIYakHTvzDVdLBBoerJBNZt1+a919QZQo0ch07+IvIT3SYjlTmqLB
	Ql0qODe2ge8jk3lnRIQOOukEXA9norePFMwhee96MQ3do0+f3HhU1h9zvTxYnkM1C6k7MB5zzDP
	C2KjAzWMmWF6BB5LvzXFo1KzUJ4iYGmAqmZeKEYjdE3ljRk3ZV7fL6tTdJtzeW1J1HLV89oxTP2
	oty+NInHgHISd
X-Received: by 2002:a05:693c:864e:20b0:35f:2bc:82d3 with SMTP id
 5a478bee46e88-361a195c9aemr10946833eec.15.1792405374294; Mon, 19 Oct 2026
 03:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006153619.304520-1-clamor95@gmail.com>
In-Reply-To: <20261006153619.304520-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 13:22:42 +0300
X-Gm-Features: AclHuK-T9LmpQ5NLkZ_7w9XsYRY3h0E4nk24ilBhela7D2I8HSWGbQdQ0PMxFAg
Message-ID: <CAPVz0n01zFZUy0vM8aQW5fEbKbO=vp+MeGtCQHc0Hh5AQdCNuQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] media: i2c: mt9m114: Add get_fwnode_pad operation
 for IFP
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:36=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Currently, the driver's binding exposes only one endpoint, which maps to
> the IFP subdevice's SOURCE pad. This configuration causes failures for
> many devices using this camera because both the DT binding and the
> one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
> by implementing the get_fwnode_pad operation for the IFP, which correctly
> matches the endpoint to the corresponding IFP pad.
>
> ---
> Changes in v2:
> - adjusted coding style as asked by Laurent Pinchart
> ---
>
> Svyatoslav Ryhel (1):
>   media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
>
>  drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
>
> --
> 2.53.0
>

Hello there!

If everyone is fine with thins change, may it be applied?

Thank you!
