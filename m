Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4137F749
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861321; cv=pass; b=r4bGDb7+nhLSmIsAEvKNR4nkjQ7eY5GmoJI9oA5deJYiPxHrbIX9+s9SS+aQlVo6NtQ3HlcPeohTnFfUu60+3YRaz9JEcRYQPg6XShenz/AgGLKWYCsW2WsS+DmkdXwpG6T1s1T5xOxWONmakZ3LvEJBKR48R+qoBpNw/auwolU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861321; c=relaxed/simple;
	bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6a3BwM8Z2OyhyxWB7mlE7895AMoFgQAyXBiIB3OwCPzTaby6JOh8CYsqr6y1qCFTofxPnzaSzkLEk6kDkhLjlziRVa/cUKddFl+sISj3VdmSsUkdVwkHcr3tzgUUa5w0mLRxOsjTnkYI6rhCXn6nnSZh6VO0QafGVSqUGLOue4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgGDd1v/; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgGDd1v/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so558715166b.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774861319; cv=none;
        d=google.com; s=arc-20240605;
        b=eB6w+X/q7JlqBrquxp+jydVDegUmdIW5xK/yv3eDzgHGr2WZkLLTjF5ygOMj4Nwg04
         nmWjuWsbNNZOejcCLVF/lOGjtd6DyQQyJEg8kgE84JO+JevYR4ZN5D46E8LP/E7QncLG
         ycweSYmRrMQUCVPN92Lnf0esa075420Cw2zZJuFpFPHcz7lwqmEY+fFkbleR5h7jVLlz
         8uL/tjG7Y6yxENWf2LUlaWofr265sFbNL22e9HrEvnPp5QiLCZuN7MhnYF3oq0HA/JTg
         IrAWqOE5ISb0tRJMjRoWmnrYAQhPyyHwxkPBSFuyOVp0ewEVXrMfy8fwi+8iZH/X1xa5
         XW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
        fh=aXboLBaI7Egm0xDl2Jg/TiXp4OSKEkQ/NP73jC+9Bac=;
        b=YqDszTHWYgCltRTCEVl8wNyeIumLEOpL1+2Y8UyfC4QnOStp3bijJyAcgtxPzeOwAI
         3rQwyGTrwjLpcKJCgW6zk7V8w4xcrnDoMlMCWMT9GKIHQgX5zfFNQhY+r2G2m2GSczf1
         ivIG+PW5tK2AyOcEJBoHreulT1Gohi1q/UMRNMMDHf0FYoTlgkmyGn0wKoVfz7tO/OQK
         LNoKrTC6SLJzxR0PsapI0HIXpZBqQSEFgUmeHa82Jh9/Hx0/ljVU5h25g6nk8d3QH5Wd
         Aeofv7Fe2uvs4tS5hRCxGn+dK3dpAxy6Ex1ZnEB8wSIaonIM9XoRw9B/HIhNOAIN5gTf
         Cgxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774861319; x=1775466119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
        b=WgGDd1v/QQkbNzhVcaX2rfQzzA1MJCrgKUZTMK9M0q8+QiO8pYHlzHAc5Tg+l7V7zs
         nv2oDFCfFBpmnRQ5cS8EAoE20Qh5Cg/oIOzzTzQ/jM0IU4RX8S9voKbt2cpeOAli6/Re
         HVDIMJf+LpjVIMsXhE6ZF2R+v2JpUj85AUYMMipuVmsQwlylaWHJO5yOi/6S25xJifly
         sMdeW+F1TLuRsR0Op/GbJ5E7auDCLbZWiH170+ZjYpLf+lXVL4qi1J4hGjsqPp1/AjSo
         KdnEoV4htxNyqXim7uyYNnaICettbX4K8OV8USH4h2zJRTAdX6X4tqtMySzQ9fJ5KTgI
         hGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861319; x=1775466119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
        b=qiBHrPavVO1Ocx6WeyCw5sNwfq+SiNnRjoMKfqsLEdlZd7+vq75IjF+MYnjKBspEKH
         G+ZfBO+jVdjLJEmd/cXBu3une9RWEu4O1umx4f7pXYAABRo3c0MbuQV5vce9q1KKZuG0
         tbr3UfBSKTyxRYHUIKjioVfsRCO5bd3WWgKixG6osXNhXroRQdKvgh6rwU8xjrWn1abR
         kuHOzecYbKXyhMJjIlfIV/aNHfaC8r0RnJ0moS+UzXpRBghLHJ9CHnAm3KkT0blzSniH
         mV/p0mStCPvIeqHo63uhUA6/9HrJ5XeKu+K7/cQK/Y7DcLWIttUVp3yCBCs95WIeTKFx
         f2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUuH7WvX2zHql4hXZrOb8HL6R0504ewyyB8B4Ji/izWVyjWrdSeCUaDySBbutPvxJwgbb4Xds+S9abd6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjYnhQ80H6EyEKUsqqCFPjOnZU3y0JJ5xdOU20gFkukJ1g0UKt
	VxbfXqvdb5S1qE9JPn8p0UPrHINCbDFbfKkBEDGn0UqBzCgfDbJguNHtPrJvezdTkZ+F3Xf9UPc
	w6aqt0x1BJv+jqx4EsVl+N3jHURVvagg=
X-Gm-Gg: ATEYQzwGEM/Fl3xojmx+drZInh3y8GPPtW/aGPlT7Q3WttowKExXLiNNT5Ah4Mwh/rr
	aQRb26n+8qdkbM4Hg8uXzAZd0Uyd8KJ77FID1FuuJSo9kQALfp6a0+t+LA0RP1OIBeaypImzhkG
	ym7JPaTBBklcs4Oz/VtzYxPfLR8GHECUjr0Uhna96wmmV3Gjja1Z/KoMtihbmhJ6ofSUtfEyugG
	GVezcNI/A0vtTgAKeR6oGSrhmaC8yMuyyvqFqJz+oAcnhq6KhNQY4aeMdjEZd0JaNxLSRjKZH1D
	OiYyYCgU2LbmqapGRyQs1d69Lv/o9vvB8vAwoA413sfj8uD0c+fOx5DscXnRA0YPQ/JamqKgnuv
	HVJRvuYA=
X-Received: by 2002:a17:907:1b29:b0:b9b:3a1b:e2ed with SMTP id
 a640c23a62f3a-b9b503381f4mr745202866b.24.1774861318493; Mon, 30 Mar 2026
 02:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-3-azpijr@gmail.com>
In-Reply-To: <20260328192721.255493-3-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 12:01:21 +0300
X-Gm-Features: AQROBzAJlCYZ1qksJI6bEc5kZz2msgaviXs2W8o_RrnvqF0jEUpazJKF1xxV-BU
Message-ID: <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The function configure_isp_from_args() contained a duplicate call to
> ia_css_output0_configure() using the same output frame index. Remove
> the redundant call to simplify the configuration path.

This requires more information, in particular to explain if the order
has no side effects. It might be that double configuration has side
effects and removal (wrong) one may lead to other currently hidden
issues.

--=20
With Best Regards,
Andy Shevchenko
