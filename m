Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293903A6B6F
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 04:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785213052; cv=pass; b=ZwwH4sPpbadQhF27AQUuNmc/MI0qdO0aJ4peooXI0cMeI04Fg3bDfyGWJfZZbYHK07rt0S++gZ/gi2Lp1mdl9hTZDGkBxY0eTg/TYa6PwMjWfZCt8nnp1Cq6eEpFyYUwbxySTYr0XvSVMrsR37C8Gg4Y4b2TMTACe+5ivy+0dqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785213052; c=relaxed/simple;
	bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1QtyuAZp1WeJ3NY/4t/4aV5fFAxAF9ite4z7AsyeKLx6SsOU4Ly4b7tCdkgSzI/yuXX25VrIOdDDSk4kNEzuNY1E/vWsJd5hXdyPCK1ygVUBULJre7APWkwqqAfpzA8Zav+NH5e5SkY0oMnDLwK3ER13UFWcAuu8Bmhs66NqRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdRsneD8; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdRsneD8"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e54f8c051so189263185a.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 21:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785213050; cv=none;
        d=google.com; s=arc-20260327;
        b=NOxBSMANDdAJbDrioJ3aSKNuP0cezXqWUDw0Fqq9Khvgb/cfSszjuRlrblJwV3m1vl
         kaC0WjmbeskQvSOFF6OmEdlrdSZU9wq8i1blyp4pzfCa3x19OQMArpasGSD3pGes+jPd
         Txj1+dPSGZ5vh3yG5uI0V66QfqVwmz02VmaYUtWoz81hV61lft/TpHeDdC5WuSvEFQSL
         4KeL/HoWc9fsoY3+9qoOBLonpjULmakjLrEY/hZCtKTaoi/BkA/ECiIl8hR9iC6iUDlc
         EWwPC2GZ1Wh9y+uet/koB3CaNZRKJidjwSDxiOowSPzyIM2F2RY8ouUGZfWBjyb86c7S
         HiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
        fh=jwWMjwLa+TQZymBfvHGHHui4ykULQMaD8cStEWoYODg=;
        b=Uik3k6Y0+ZcyKYT0Soom9nlkx2VMyznTDv3ElATp/K8dtHdwTRjEj2ALZlT6vrhHKV
         bI2S2ej+dbLi3v+x9gELA9cvQz0/zqzLG/5IadK7/IxTA5IU6Qemph8IrjF31MWi+nIR
         Q7ub8ogKgkumk7Xu+8b/yBo2p7d1ZmPQmMnKyoit0r4n2xICHQWwFduClVU+68OC/Wdq
         KxrPhQpd2bfRhDsoFa352MC127kPLimGBCz9zdXVPSZ2X3IGntCa69u5YH9g7YpZ8FMx
         Ap045DdKIoaru0VNX52d2q3OKU3hlREyL3Ph5iOmwxno0Ii/WbUtfDo9ssBQMNSDL0h6
         9g9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785213050; x=1785817850; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
        b=IdRsneD8KH+St7Tl0yCdNV74YHpAkhAH0hUDuouJJtP53bUGWviQGmH7zOxqjX2RjA
         ZxH1PMflXfWlixyy8hueC/ce/UfNl/i7Dsc9KH9uRYABr4zeS1cqeLwLFEvbd+DI9GY9
         58r+x0CxPAxSM2PMzH+ngbCO1f1NcJNIt/NnhaS/bcDiLJrCBD3yFRN1Fu80Yx9fOLtB
         x47uWrnUBkslq6eaZUYmJFpsW7ZkhdeIAoQPz2HPSHYljuJP+tr5rTLqJ3O6nytUIPZK
         zcEMrGDcv8c3uvrS/vzLgWSCLTqnj9tqSAYC9kc0Ti8YD7YKC+NiEsb7wd/fl4aQf0at
         ILLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785213050; x=1785817850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
        b=UMRkny2wNTts4waSUe5JIUaEkBewolZMz8Cv7fU7Q6aZzN08dWukJ4hyQUzsVT8q21
         ve2/XIuYjOdTo72O8v3vAhMeogt3iJ7ZAX5vMfOdrSbuookjC6JjrmK3x/r7Lufd3kqb
         GsF3YCjCcQHnfw0CgcYhlt+3NCMRlSiApdkVSfGdh+APVekpj9EUCKBVG0toQyn6XSoS
         wa+nXR8mW04eXQfxDH1OcKXWZiHJxCGp1j9aB/aIKWxYMdeVC1JHxGJaCDQ0kQKOa2+h
         0mWmRlPjTYo0kJY30u8LHwNodQWWcPXIG8R9m8UzALAtcGRzFF7d1ULg3wOqaMLrFQQs
         6l7g==
X-Forwarded-Encrypted: i=1; AHgh+RoGMRcgB8I5EhjEpzb375okfgQdOkIYZU3pgU87AxBGVauFsyloIzG/ZCmOLFDsH1eeiM9pQUrpD59JJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhoo+ppzTKZV/LdkXtT4DIReVolLBnbWmJ5ALOLqOy8QyHrums
	Y+AxbjQyGlWuB9QGCGeNLm8W+7pArnLO1bjAg1IcoegTw140Ualv9sTGc+5Lu1mK43QKgc9T4NG
	MH2Ta3G1hAJB8gDa29xTSMC1DfmquDvM=
X-Gm-Gg: AR+sD12KNJsDt9KZ+J+s4PsOTvO2JYI2+itp3D7qeSqGHcsWvv89tUC69YomhXKdi8S
	FW0FU4wB4i07wtWWS57g44Nuylr+VviE1QjhXhjCAymJuvjo3ssHHTFEEzTQJSQG+hLDVHhSiUD
	R4h6K8A7UO8UhkbJ8ZFZCgSkOwJc1tHNApBiIfZaYmWTwTWFKcSa5M6ec9Hu93g2rAMz4c5rCyC
	ZLo/MpTU3KPE/PJpwAjJmScIPBZI+xnVxBYTOtPFabndfdp1ASd9pQ00qSO6hc/z02tYbLHDSqR
	SFF3ks1ZpsR7zoadgX+IJxxEzuCABCWSvuQobMeHMdWujhGrp/zu
X-Received: by 2002:a05:620a:7081:b0:930:f67a:a9a0 with SMTP id
 af79cd13be357-9330267b509mr62851685a.79.1785213049961; Mon, 27 Jul 2026
 21:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724131208.2315-1-tharitt97@gmail.com> <20260726024243.730-1-tharitt97@gmail.com>
 <amd2xoJdT5VffcoO@SMW015318>
In-Reply-To: <amd2xoJdT5VffcoO@SMW015318>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Tue, 28 Jul 2026 11:30:38 +0700
X-Gm-Features: AUfX_mwiJC81_PI52kr7e7Fch4bHRZdipUBx0d855GSYbLOwLY7daHHv7kdwAcw
Message-ID: <CACak8wPnkMz4xgx-BLc4sAeMi01tw3XEBXoZn0B6numhRbFw4Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: hantro: release runtime resources when
 device_run fails
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> You need convert to model RUMTIME_PM_OPS and SYSTEM_SLEEP_PM_OPS
>
> pm_ptr(hantro_pm_ops) at below hantro_driver
>
> and remove CONFIG_PM first,
>
> then add move clock manage into runtime pm management
>
> If you remove "CONFIG_PM" here, cause build error at some special config.
>
> Or keep CONFIG_PM at this patch, then convert to RUMTIME_PM_OPS() in
> following patch.
>
> Frank

I see, the compiler may flag resume/suspend callback unused if
CONFIG_PM=n and cause build error. Thanks for pointing this out.
I will keep CONFIG_PM and send a conversion in a subsequent patch.

Best,
Tharit
