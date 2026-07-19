Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ECC2D8767
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480610; cv=pass; b=Ms5qVF3Ks92dGs89b17Zf0dKJZwJKjavnmBFQRrPwV1qJ7BuCbcCFNBN0961GhkJm1c+iTUtjLrpGHqbG9JOhV6FhwW010lgbrL/Ofr9Hg+Dt2NhR+42BSfKjR6BEqC0wsAI9C9/8ToS+JCWFG+QVqfR/wzBNj9/0B0oV0/sQkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480610; c=relaxed/simple;
	bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHJwLVqi8S/NGGF01i0TuoFj1N4/tc8Gf65jx8Y8Je0U2qmp4c8r7630WAcZpyOFGBT4bTIPYQh2RgzCcV5ThYF0daefEkUjdGwXkCdYheerJPplI7f9U2qJrq1t6h4D6K8Z2XCKaj2LLeSGFsvd8RIrzpYtU/qbeYHaVBZoJmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBG4/FR/; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBG4/FR/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso12945617a12.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 10:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784480607; cv=none;
        d=google.com; s=arc-20260327;
        b=WDb4Uq9SpAs3IHl7zqvTKLbhYtT48O4LSZO8bIuAb/MNotdYydJuDGNanWlMLFS9Hu
         0w0U62WD7W7Q+WxmFmA/g6C5GAkVKfJvzJg0F/CvUrSHOX7fESUiU93mFju8OXXvXzPG
         QVY7ckkb5Qu8Fa5R6dgHY1qwcEXN5C4X5KWGPjm8HUH5VbBr6ehjmDcxQOMamHpvHFs9
         MmjGyCXLp6xPr9ANeNkmOyksSH0pfubeATjRk4tjZu+3oStomYg5ckVwL7S0NuOlzdJs
         GepleVMFE9yj3YivzbscTRP5AcpG2eN5jy/OhKe/5sAc04UOom7b4isELnQp9yV+dKCj
         O9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
        fh=2yBjYcv0sZwgj7myg7/mMGcJ+ZeDtG1uoS1vGeT+/Kg=;
        b=ouu58zS+ZNqM1cTYPnqTwZb82PW+OtYZz1YVETk+h94SSzO51sBeGNG0I+iBnXWJ9N
         HHPgA+dY1VpvjxWK4toi6c7mnALF8CIxPfaMwFeY85hJvLc0olbYdPRoX5X+TBkxoo9j
         g6MLPQokPlMeXt/57yO6/tIkvqcLe1r+yS6FBPWVIZmtllsIjzGGxAvAebdlVjPAjuy7
         1F+pTNlebvdQvYkxpF5lrgQ+Jox3LptNMJsVOs5D2PrJkjYfwbuqAzmbLX8AwQDLVmeC
         knlJO/BiFCMXotouZdkht2m3QHmk3q32+U1A3KrQoUs5D3vERUfidjMoR3B12QiZPOjX
         HhWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784480607; x=1785085407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
        b=DBG4/FR/5cBfZ9Kuz/3HzK2WGVWUcwhgVwmv1dgn1oLaOjv3fm9hqk6gbancSyrxCX
         7wrniK9RxMYYwQIZ3LOe/twLzvYyYi6yqXBaoK7JIzguQm0os1+aABmFId/bI2Av+QRY
         WBZbx7d+ozBTzJWSPF2AUAEF7cMxo76C0oGXdO4HcNh03VBnW9OJyESKBgIfcGIiBOwZ
         I0T0ONaqyQuIKbd4uozOCcQeVloFcC89osWfaosJ++cCjCLS6lLMGNddX6k5EO2arViJ
         1zFVCIk7cht9D3wEq7IemJ0jI98QDoy99Cy1EsHpqs1jmsGqBTyMXxH0BwWnnObQdNpM
         8ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784480607; x=1785085407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANp7PPmMRrR0l2lXvT6AtGIpPbJaupD5ByxcvvFolwo=;
        b=IpC5dJWiNMtTpQ8zw4KlIU1PyUKx+73F6h50ll46f+MQ8eMtrD+RjGTOQQbVknLALl
         PljXWvL4maWooOpVNizBtyLsfmTEa3sfkG8Eonbe01YFt0w/z03QgVumyLxdzffmzNjc
         iHGyQqwdGEwAlcQBQYV6vwlGq9QP70PJpdEHwHQ6KacYU5agfRtUEBblERkELXSQZ86I
         Jfbx94t9IP7cv9M+wQbmb/wu5n7P2WCKhe5cldEZj/lWaruPYTXmwUa/iI+nzh9tPY1H
         CG3Uf5nPiCVOdluTl7BgBqGmcmXSnx9BSqo9fgWdrgu3SGPTiLQrb4K8Zd+hv7tcL8Dw
         ElOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUJieMj9SkRz9drR3xdp3Dn2+pHodFk0hnkxCErq4FFXHz24tLkDFz/Enll156acnu+Ij6cpGE1j88+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPHwAE81PTkE9WO+msV41pV9Cy+960kCWmr/VNJWnsM9jqhh6
	ez/ovHZeTpcGIQMrbugavuPCZ6DEjuBo0V4lDoWybTZZ0fzSrJSfHcTtYYPUpFJplzJ2itHOkZV
	o36/0pF54iSm9JPgtJweZVqW5gA0iAkg=
X-Gm-Gg: AfdE7cmG4wVeOEshWwaJQmtGugl0GZnu5nIlcVzatm8pArIgvUTyH8ghgOoeG4eDLR7
	eedTZyzIO6M/XsE+zI/XUaaBkHaJkk6OXE80AfNrds5/IVum+DtG5wu2gjep3n8bx/4t6urlKwo
	TpcQSwGfmTpmTKFZIQXHb+Kgsk7ovi6ERl+M5lsCUsDai137al0FIWo4CD5dQ1SEkFJwJ1PScf5
	x3QmZChO6qoIZ19JvUOFzN/mJcrZanJwdg8aEl5yqiBvMOeIIoyfr/CFtDPO5zy8VbPLyDOHufv
	pAkGqmYu5BSEun79hKbQ8HoMCF5Bz/IW+CzMSV7IslXDzpeJTw9ZXCN5qT23ydEUxHloswHfWWS
	/rUP9zxUD9O5DKR87aUPtstot0XdvBC9t1/vhEed9sEh74hk=
X-Received: by 2002:a17:906:ee8a:b0:bfe:ed06:5a20 with SMTP id
 a640c23a62f3a-c16b4837dd2mr443400866b.53.1784480607046; Sun, 19 Jul 2026
 10:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
In-Reply-To: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 20:02:50 +0300
X-Gm-Features: AUfX_mxeC0PSIwp9DOcNdOO_SI5VqtRiTxXWWMp7U8PMgTACrkQKKglYlh7n7FE
Message-ID: <CAHp75Vf+3pBU1Sfy7Cutp0qgTucQ+Qntnns7fAiWHM5=H+fo_Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: atomisp: Clean up unnecessary module parameters
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 5:09=E2=80=AFPM Prajval Chaudhary
<prajvalchaudhari733@gmail.com> wrote:
>
> This patch series addresses the 'Remove unnecessary/unwanted module
> parameters' task listed in the atomisp driver's TODO file.
>
> The first patch removes the unused debug parameters along with the
> user-facing pad_w and pad_h parameters to safeguard hardware padding
> boundaries. The second patch converts the remaining internal usages
> of pad_w and pad_h to const configurations to enable compiler
> optimizations and enforce type safety.

I understand your eagerness to achieve something with this driver.
Unfortunately this driver is not that easy. If you really want to
continue with it, please buy or lend some cheap Bay Trail or Cherry
Trail tablet with a camera connected to the SH IP.

--=20
With Best Regards,
Andy Shevchenko
