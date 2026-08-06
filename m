Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B93EE1E0
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007181; cv=none; b=H0guoL0p1vGWQjYhQc1LMJAo2a9D791EBc40iwhfWIKd+6ySmE8BeAkb0ajQrS8kd4GA7+phc+6EEL0K0TZp/CkS0lsVochvBrrW/5uSHHxfWYmXddst+/oD10Ch58H2vULMeeqsNrBWCq4qO4nnxFwl5S9qZIjfHgPYr+BF4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007181; c=relaxed/simple;
	bh=mvWvqSXmFTh2sCs7M99AKCkGAxT/TbAKNN5r5FtwJ7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QB+lR6rbfmknhbD1pAwfXBJLCAVVwBqSMwF52He/Wt3hTJsux2N4t3qb46yWWOy9bMETHHEVze8SHquNtXnpB5uyNy5X8YlsxLUuKB5e5cBczFXwvnYVcNpqYlkBWolf0ZfPtR+8R4ALS0SCPOnPzcWcL0bj6s0FXCrc/26o8W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=grieTSqe; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="grieTSqe"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2773533a12.0
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786007178; x=1786611978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9b4tP5Lc/wo0ndzefwgAczDjZOsCr+md4IiHUeyMtrI=;
        b=grieTSqe2O4i53FZSthJ5JBIjTKQMWrmXc5p4roZX2rijWQvyUwTCFhUvkmX/NTN74
         V6CesEUAiOpiunF/sd7EShljOjePXvCSoKallX995iUzJl4sxVwS6YyjdLRyQaecxexu
         9zTpV6n2UWBJwO5s8eCtCbE3p9urAA1XrVUik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007178; x=1786611978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b4tP5Lc/wo0ndzefwgAczDjZOsCr+md4IiHUeyMtrI=;
        b=qcccXfZM7zmRyd294XVTdeqoV8U9JscAMu1+5BSrMcXYHvsM9iMpwEkUtE4jhKOfnF
         8sTK7QfhEd07Xts3++ALCBfbKH4KHS3oeqePJ4C0Iw+xhbu6k3Og4+yUDLfhM+Bat6Oe
         aP/S0T04zoADQtIhzHl/3eHgSTitE6eG5W30Vf4DC3EweBumZ5+EPvwKAb/Wqn7q1Heo
         6pveABjaI+IKnThRasfopPdJXG0Q3H3JKXw/0aXaBaTIeZOQ3wKtP7hlKqze6dUNFRPe
         /42BU9xQQNJHvGf+DZszaTnhbJRF5T8KYdHNepERSlH53XyK9mM4y+8FEavQv3Z1Yf9e
         bgSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5z1argxrWECRnr4PFaCQsj7kfhsOuu6u56AF99CFlDXD8ZZuEET2C59I6LqOJCKunrdkM9XGefcEfUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT5MuB17+ePv2+e7S58jWH26FeBmEkmxyjnbHARBuMjFHpg6Es
	bJJ0bKTIHFrkKvOCsR/fhwlzvD6kK9vcn8zE6iaF11DOAIs1s3Mr8dccAcFKQKrZDB7orV5WDdJ
	dge0=
X-Gm-Gg: AR+sD10xWJRSHPrQyuqU3/5PAHa2ipCmuTJUH52nqGX7ke6AElaD1QqEKQnvXA0pwRk
	KuKyJqHbW0InUcF0d0ehtknCsTq0i87KC+c9XmFqJYrBvzff8z7RJV3uyKJ/res3PbjKawVflM8
	8NN4SA7B8e7auGfS7jZgOc8MErYaw5Kgb8rWGp78LdOBv7D+VbciidYQ5cCOpA3qJVC86otmPyE
	U7Mx3f2Stu6xwOK069qh4VKsUPk+budjUKD7vTpKcUqA0/JyG0i1I8Y1WCRbGkqzXdqniImLPN6
	rHr2YCGycadKI0Gcf5ctzPj9nASAF0U//Lm7qkiAgjPEZpk79avx/DyxOzcHg2yP7VwqWb3ifb1
	hXitjq5aA1dXz8ZStsYNnoVRVysL6+MOYqGpXh6brodT+XpcIOPO8lwQaX4zj/+tBqgaWnoY/3O
	sEE46JyEWZ6QZZRuQbs7YLKAvqHXjT7QfQjq1ucSoBVyGgUt7jeMY5g6aYID5RblUiGboAOou0A
	bFdNmK6iXeUazmhMYNPxXTOZzYQ0o64gr8p
X-Received: by 2002:a17:907:fd15:b0:c1c:332b:74a1 with SMTP id a640c23a62f3a-c2039f95375mr677587266b.28.1786007177794;
        Thu, 06 Aug 2026 02:06:17 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203624e6bcsm230537666b.14.2026.08.06.02.06.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:06:16 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1fbe461f59so293894066b.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 02:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp7s5hgDmz5IuI/xTvmghfeyMuhb+rVygA7E3QswzV37UTxfaRkhXAU367yPoyJ3ZptazT6cytXEKwtNQ==@vger.kernel.org
X-Received: by 2002:a17:907:3e82:b0:c20:295d:6574 with SMTP id
 a640c23a62f3a-c2039d86ad4mr613095666b.12.1786007174724; Thu, 06 Aug 2026
 02:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805093407.110571-1-reza1234khan1234@gmail.com>
In-Reply-To: <20260805093407.110571-1-reza1234khan1234@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 6 Aug 2026 11:06:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCvhLt7kWn1bfz_h2Tw+SMs7AsLM-pFyhADZh2-Aor=gxA@mail.gmail.com>
X-Gm-Features: AUfX_mwtTTzaL5iFSOYtSe6EybWTBuI3hk1KY4jDiqYQfKsZ735QTnIGMKiwBCk
Message-ID: <CANiDSCvhLt7kWn1bfz_h2Tw+SMs7AsLM-pFyhADZh2-Aor=gxA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Make uvc_event_control attribute name
 array const
To: =?UTF-8?B?44Kk44Og44OG44Kj44Ok44K6?= <reza1234khan1234@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA

Thanks for the change. Have you checked if there are other variables
that could be constified like this?

Grouping all that family of changes would be more sustainable than
reviewing 10s of similar patches (if that was your plan :))

Thanks

On Wed, 5 Aug 2026 at 11:36, =E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=
=E3=82=BA <reza1234khan1234@gmail.com> wrote:
>
> The attrs array in uvc_event_control() is only ever read, never
> modified. Declare it as static const char *const so the pointer array
> itself is also immutable.
>
> Signed-off-by: =E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA <re=
za1234khan1234@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Assisted-by: opencode:auto/best-free
> ---
>  drivers/media/usb/uvc/uvc_status.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/u=
vc_status.c
> index b632cf5e3fe9..97c939206302 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -165,7 +165,7 @@ static struct uvc_control *uvc_event_find_ctrl(struct=
 uvc_device *dev,
>  static bool uvc_event_control(struct urb *urb,
>                               const struct uvc_status *status, int len)
>  {
> -       static const char *attrs[] =3D { "value", "info", "failure", "min=
", "max" };
> +       static const char *const attrs[] =3D { "value", "info", "failure"=
, "min", "max" };
>         struct uvc_device *dev =3D urb->context;
>         struct uvc_video_chain *chain;
>         struct uvc_control *ctrl;
> --
> 2.55.0
>
>


--=20
Ricardo Ribalda
