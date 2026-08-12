Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A466356764
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515661; cv=pass; b=DWxtI6KUxLQRZSnIsxDOB1Q4S7UgItVAcBAqy8D9OqR4MWv62lg+fjLKTXD+S84QGFbThFIJ3npbP7N/AraKWksYO7HLLHZlA9VZUCaqfhAmRiFlRpWqE+XeGoj9JtaCSWq9UWqancp8E8/fiUxCyouf76OcknKfnGblPW8RuU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515661; c=relaxed/simple;
	bh=tlEalvw38MRIzcu/FK5X9aIVn/heQzK+BENu1kxTBSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pshxlfL2JC5t4slhRNGt4lEWXsIF79BaDIvtl/352bQwe1aWiJV4VaS4TCFZBx+Fw40fkLiGXuqicUeb8PFyMok7fy0+NkHoxiveywxxQnkGo1iwYNNHeNonZBTeb9qJ7ziCKq242dHBnsT0oTDuJEaOzP5HmvXtY/zbaIW69Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsFtz8Nh; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsFtz8Nh"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4af173320f9so414995b6e.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 23:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786515657; cv=none;
        d=google.com; s=arc-20260327;
        b=hmojunGSf28AGwxlAFpGs559TbBfMnfz+UKpTjGg+FL9FcP7Wv0TD0uLt0yNK5R9et
         kr/MX7VguyH/aDjfsKgz7jH6Xk9AxsOO6/tr9ghB5UJ6+7K2OQ4g6lnwKevd5exbI8cX
         XKYFbGc1ydQxCCT29E/NOOS2xpFhDshVTHo99bFJjs3nvUC53AcGAhhp9lJtdd8uQpvD
         8u5VH7SIfiUkssgpq+lOpatT6X1Xa9T9e3ZwWDFbBrQXLks8Z/K2OVgvXli7RkzAROb1
         6fSHpvjCtcrUpTdZf3g69Ce+r6RdBREO8EfAS0nglRXU65ITQCQue2TmJycF/El6P6Do
         xFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        fh=eKVObR6mr4N2JzZPx9PlsmRm/ZHPRickhxNEUJtpezg=;
        b=aIuRYlh8IkjXVKPL6HdSTVDwaDfB/HqzuKL15mWduiYdJlb/1CrFTz0TU8ESZKNxUa
         U27CGVfFejvFbwrVDM8UZoMUTCGeOud/NvRXtFy1JWivpsxfG0SlC1QO6gq0CBjTo6JW
         K+AUL+dCAvX0QOE1kUu12Fno5Y4z0/gwx/jrU78GebhpVBV678/CRl1y03CyDTdEt3jf
         2j/ZjucaTDPwWUB84uVrpEjDF5wy/1Z7Wqb/lOidcHPVQKuHbRqlk1iFClAWYrYtFBfq
         7/0eDkNXZagO08tAB/W4cnFQ8JklBIQ3fTGDGLn6lCYegTDfA8ZRIGHlqVyk9RkFuvnG
         jVyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786515657; x=1787120457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        b=IsFtz8Nh60J9zdXW47w/tzI3CWExgO7OD/cQn8/B+p3KK6r7d8JsXRaagh+JXyTcJI
         ZF21BTu9BheL568Ds3fuNKp5AuLXklt4+l33vSvZX01jfF3W1tEv0NZHHow4E1GDHMUr
         AjuzhRodyd1gv8J/m6RZ/NfCYze123fK5fl9IqVP9u3Eh4l6TmW4IMPxl+gQexiiQi4W
         hIuVBk1adL7oVzTj5s6E2Gnq48o0YauHOgBJOZXTVZhA3KsDxvoK4E4/JIpYv3GANL2f
         eeWTY1O9nmGqrMua0BqM5DcjS5qepB9bZRVd5ov5UY95C0wSqDJ56bhSQ6DN2xCnElTn
         IZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515657; x=1787120457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        b=d+aoFG6sdfrebdS0rH/6+dGiA5w8wjKcV+D3YvnQQlGhHjnNQkSdAToTV5r6TfiQeO
         HGRazE3lL4utsGEV1/EcW1wU+R+gHBkNyH3YQwhEVt/nFl2tFJFFaVZHjdK8J5XkXxEe
         aU/SxAKbGwhZDrjiTkB+6dWUtTpXAFp76hFVGvEF90DxuFF1FdmDfrGEKgrOD/omNerj
         vbPvpgGI4py+U2opAeogjAsTdxm4IwQuzajpDD2lF94G7Xa6jV5dgx1UQkGSOY5NmcE3
         wjdKTUMcVxrwi5OYeLXkw/E406EWjqN58Ya3saL0Zs9p6w1cFPSLSeCwBlpm0lqa3tGM
         /MLw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1AsbhQMWYZavoLUZhllHuRYkXCVbrUjXryVaeQXC7H29D9b9c51E9b+IOxyYwKvQhKmzrOMCHcfyIgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEveJyKDLahpZx2r2KM4itscE5yQho576p48IilrtoQWHrqGMr
	KX5ZRV2rbSkpdm+3MzX//BqZ1loQbAdTSGY8RuYf7CQueBSK6h84ze3WPbjvZFVy2oc7d9/OZke
	tCp7K88VwYiggb/B7W7rnqksFB70BTcE=
X-Gm-Gg: AR+sD13B+cE7kw+6kP/+Lrn1DoPAe3/T9qNEyKycF6Lk2bCSSwIH9mlVsPiwgrpiPvG
	I6CpHbTVQ2x3N6SKfffJFrabLiBos6kpg5Zw0DhdeBmrUqbxGosyczSONXKTGj3YoDJdYQVLbA5
	a+hFLzEvJgTxmDNxgftCa8AH4zzWIUvnuNbDeOgs9vWjcZKZgK5a+PrRakXavzsI5FxJ3PotUHW
	VfeO54FXQuyJ90y+UZ3M91Em1Sn1AfyQKoziwxKJDyvQd+6jo1hOjTuGAxZSWKpMQyMP5tJGePz
	Llf6eTKh9d8a85tdRojH8QiWZ3WYZS36je6crWjekhzWQuAsBuYZC9s+tP9181FbrbV5WxGFdaR
	tGhOPxkWsUhWoxpiHen1RfFeWwtz4
X-Received: by 2002:a05:6808:c187:b0:495:f223:bcdb with SMTP id
 5614622812f47-4b21061c5damr2531855b6e.0.1786515657026; Tue, 11 Aug 2026
 23:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com>
In-Reply-To: <20260804072630.28745-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 12 Aug 2026 09:50:22 +0330
X-Gm-Features: AUfX_mzlabjmvWrDZZ1bt6DkpShw2PYSh2yJEy72hNkw53lZIQYbsjEUo5mnP90
Message-ID: <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol <arash.golgol@gmail.co=
m> wrote:
>
> These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
>
> Each patch has already received review and testing individually in
> previous postings (see the changelog and links within each patch for
> that history), but none have been picked up and none currently have
> a delegate on patchwork. Resending together to make it easier to
> review and apply as a group.
>
> No code changes since the last posted version of each patch.
>
> Arash Golgol (3):
>   media: sun6i-mipi-csi2: Use V4L2 subdev active state
>   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
>  .../sun8i_a83t_mipi_csi2.h                    |   2 -
>  7 files changed, 194 insertions(+), 220 deletions(-)
>
> --
> 2.34.1

I've been trying to get these patches merged for a while.
Multiple pings and followups have been sent, but they haven't
been applied yet. This series is just a collection of my
individual patches.

All patches have full Reviewed-by/Tested-by coverage from
Laurent Pinchart and Paul Kocialkowski. Current status of all
patches are still New in patchwork, without a delegate.

Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D2873=
8

Given the review is complete, would you be able to pick these
up, or let me know if something else is blocking them?

--=20
Regards,
Arash Golgol
