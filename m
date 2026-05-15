Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5F410D1F
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834515; cv=pass; b=NClcz/NWooLAtdsg3fqTXfBfrKRjSGpkzjOGXp380zgbIwy1js5QoV6Q8pwLvUUzuhypKsSO8zIqMPlKNusWR+ATd3n2uG6GGGZw2NK9OGwxMbQkAfeLJio1lS0zA1M4Y+lVcBZeH/uF8p/vRACuSQO1BxFt8rMUA7iRzzAnN8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834515; c=relaxed/simple;
	bh=I877MRSe9H5vPYZq5yiCD/TiLGWBm9ufbCGIjpcsS6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZoJI7NyLkYA1iZujxdyZkpMRqVelIlvr96Ov1qaqLYHKfzSh434K9Fng57grCnrsusgTThY2d//5hxLwnsLoGRuBCkjsmd68PN5M9tvh8IgwH3HB6uBeIOD6RofWqJF6fWHayvfLW7S2WCtuBvGhi8cyY45OXaq+Luj1WjeqbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIK0e7mw; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIK0e7mw"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c477a3278so11089186d50.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 01:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834513; cv=none;
        d=google.com; s=arc-20240605;
        b=Yw3JXf+bLanC+AySY+rOn+kgWGabLMfR5feme7mEXCZJV9S6Azwdy5CWUl++RxH+fF
         cKtt/LtE4OZoCs7SnCGvPPPC6Vq8ULukep3RuGsz5wWPnlo+TY6Uaf91h+UesgSNtKYO
         GjVC9FS5uylH+EuCt3/axmpcUJRXrji4Du4rcfKd5QhtSrxcYstlrf2y+1OHP6LaCXaS
         u4l9+yyuJDxmFpr/C1PNRd4j2C7/j7TF6c6cUrkV2D1D+yXNMMFzeVmo8Tvw3AG658zj
         Qx0JZPqkh/5aqZPqq54zZVmfWLaLSMPetpuk6cMb/L87h1whxBsUUXh5eOGqRQ4WqcbO
         NTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBSjZR3vBTrgdu+SMltlDgYPuNOIji8ITlL8pViUrIo=;
        fh=pOfc4jjcw2i/CNOYUsJbMWyw01oxO7dpOQvPIJ2gr5A=;
        b=iXIdFNeSd/KwpwVEaquhCxANRMIk6WxPesjHhHP02hOKkKybtpb0genGyFwhxFvBrO
         kDho2uHu39lI2TtkyIQTNB+zIP201x/WpfsT32+uxJIR1VhqwJXT9LrHghBjDWuM4jCN
         ohwINZ4fzPcS9KwJj39oWBAK5uqHuWa0QFSzKfz+96spKKekKKx53kLZ3n+85s97YRQc
         N5140S+5tBeLt8VD7SW3qO+ObvmgrqC56/puBOZrCaJnirVBf30WQcYnAXdeSif1zG4V
         989za5hpaMEDheWSXyYf3wSVqA7Y/QPiOaIWvJsvO3tqTmFx9mXYeMt35JCKACtBSQ2K
         +UXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834513; x=1779439313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBSjZR3vBTrgdu+SMltlDgYPuNOIji8ITlL8pViUrIo=;
        b=YIK0e7mwJtCTnrAFcWtAoDTrRQ//NLi6l8iDd6Xi2GhYiI+05s+JsC6h230/Wxi9iO
         QFSzQ+Kbw7H5MnmmEKJL+LbCb7Sx4QWsSVZT3k1kvbiXY6W+dHvcM1ZgMCtiW40Eb5vi
         pjbJ7iGZxRr492oBAIyf55xLi9gEFWW2KvHaKsmxeVwMX0jqN8DvNJYzdPK4HPl3C2oM
         yzVUuLltn92f/FxfEH5ZWwRWxXttckgZq8h/8u62UKuqaClChjRoDvPiFlunjoBw35tf
         TlQBqKKB89U/Wcc6idYnfvKBxxn7RSH+eYHcFWDSXgSqM/65RJyC+Hoz5JAF9UIDwutC
         FQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834513; x=1779439313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBSjZR3vBTrgdu+SMltlDgYPuNOIji8ITlL8pViUrIo=;
        b=MaL0DlawPATwWMMxl70GDkFJXURdM1QWLmtaGr1BNxw27+cfa10y5LTmRfgicgwOQV
         ezZae10OZCSYcwG/N/nsNMRoTE4CVnPUnBNRvaQYRoR9/+wWXbV0wzpSfFEqpZNmz3AO
         zJYMSfN4aJuaTnTWvkQYpMNaTSLjsEq7j1Vhj8LC+jqkvaKoFnd5z4xOHLg4xMF31Z+f
         9OzWdxwnzaWsEZfXC18hwoY9Rbg/kvywUCdM1s5+gURZGYzh7sKiPbRE2QeaY4LWVPLL
         CYog8mjUY8VWFHMN2KRfPSZ5DQjhzOzAbVgzcyUpBSCyf8EGdy37L5Da/a051+F9uUNC
         DXgg==
X-Forwarded-Encrypted: i=1; AFNElJ+rNImntVELQ6suxAx9+lSEdPCt+/5ksJRXtulm6lQFSH6vxkuMhyiUNbHOZgMHH71uMaCFXxCmMd9v5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVB5q2d/wUNjfEmmvxTGFKb46KCiZ18ts64BGYxzECsTNnbKaK
	WVFqS2XIIs66CQSjY0uoai1IphK4XXpei+KjcCR6WAf47+/fbpZ4H3Caa8Tra7CGsEKVo3LU1Ew
	3lgDSAxFPvBAjGcVZlQ5iyouAyZaHkGk=
X-Gm-Gg: Acq92OFJG+6PUJwms9cc6AKmUEFe6NgdQtAKFckoVXcrKHhuKOZJb9pIIgRUI79YXEq
	t6+InBwT0MGRmgWBymg5Ke/8I5OSDyM7nhXkMivROYcZzxpq3rYSiZqFpVPiJh2fec8jBXrUelA
	LqyB3Umz0hbmCb6lixEEgQl8cp/mD0tBX/Fo3Sv3wKFJk/Ifq7UWyozabP4u7QHJvBk0PoH93e7
	YMtnXVX2FLckqGlHL4Art9f13IHzTvA5SxpW2n9Z/5AY0rSvTCgTYtePK3wvH+EW2h2xoozcGAE
	cF+AWlx6xj+49ANXlb1yHyZR36+Kp0y68yVcRPhPIrx71oxb3W94gpRgwcr+UYS2Q8Bg11XV
X-Received: by 2002:a05:690c:4:b0:79f:d961:47bf with SMTP id
 00721157ae682-7c9594b0105mr32678827b3.8.1778834513472; Fri, 15 May 2026
 01:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512020718.108044-1-kartikey406@gmail.com>
 <d1bc8d7d-3a4f-4ede-8266-81cc66bf11b5@collabora.com> <CADhLXY7N0eLpA30eV4Rb=F4vzCf9XYtDjMpxBSJtGeMWNi6Cwg@mail.gmail.com>
 <65da2ce9-a2ab-4800-a73e-1a26082d0605@collabora.com>
In-Reply-To: <65da2ce9-a2ab-4800-a73e-1a26082d0605@collabora.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Fri, 15 May 2026 14:11:42 +0530
X-Gm-Features: AVHnY4IGHTZnfpb9msWE08vJttVqhQ6G8dsaF1hRX2r-HcKGXn0VdlxicBL5ZuQ
Message-ID: <CADhLXY6L1RJvgfMGuogmw7bx5Sj-_6G2C7zR5q+xLQXu_M-Tjw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: move cursor resv lock acquisition to prepare_fb
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
	olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, simona@ffwll.ch, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 2:40=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> > Does that match what you had in mind?
>
> Sounds good. The virtio_gpu_resource_flush() also should be updated to
> use uninterruptible() variant.
>
> --
> Best regards,
> Dmitry

I  have sent patch v3.

Thanks

Deepanshu
