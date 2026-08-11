Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCD7407597
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433460; cv=pass; b=TVZqO8AA6ge9KvwkJUJt+ZOI/zDhjiixCm8Rsqc75/RJEWx3oyz2nCGoOCG0vRO4su5bbCOiwdpuyw0DxG/Do//L2UfF4JBVLCx7mKLtY1AihmsBlupQ62lsjGQLrfIxU1wHsAzM97QVkL+sbz+Vr/JHJOMtj4EJ4298vne8HTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433460; c=relaxed/simple;
	bh=ul5BVry6jdiiP/EIgOz8pi28c3fRHl0DZsSDZX3NmzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOouDqHGnYwV8W7b55R9paR60oMxfdDsLl6116+gtRcX18Qn4bNAKo7V5iROm4pyvlS+dzi7V5/ftxZrETbliBLtVoGj/o0rjaNkDczaP42vJl64f1t327edRp1bKFhNcWIJOuISXP9pGWS0RVbZHsWtuAn2e8jQ10DECeGTfK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTYn4fu/; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTYn4fu/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a10d6f455dso403600a12.1
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 00:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786433454; cv=none;
        d=google.com; s=arc-20260327;
        b=NyhgmmnA4YUDef+pZthiD89xR/5zYlqr7emmofKuXtBRwBIELV4FKiNR2BCLXrbfuB
         CGzKosulJKqV2BitX4/5ppj2vsggmH/DaUXOQSHVnXR+ULg1v2Y2pcXgh2N2vNSpH1k8
         FkuWxz7vDRP31daROIfvLG64/7brN+bgGNkSOLVX2zX9FARnMsK6kz3y2ABafQwY2uQN
         cIc2H5zMhzrvJR8INxQosFKnFtmBSpCED48JWg216/Ab5VtikpgVXGhCBfV8H7dWIfRE
         6BaK01jYTdA51LsQCdWH30wT79Gr7h4MnxcWeYZZbJtjMwTogP7UhiDEQEGHXdSAEzH+
         L4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=32JHRxxMe26YRbDIsrjSe6oFT0eDo9Ri+nUe4A26t1A=;
        fh=TDQsAmkPGFAO0TDt9twSSaTHAYPiF538uIitLd2FSMY=;
        b=oMa8itNQZbPEE15wPagKMScovkxcyFU03A8DdIB5QRo+Cl+fwb+isVOPFdhURc82Us
         Gu+GI80Myk8XyJokJjme4We/Tt0wCQ30N5urw70cF7Cs3RS/XaAl8pzvA6vku/vdNAdT
         Tg/RmgU/K3nBAdJk/zCgPtCwuC0yLzRJW8zTpDnw47DjprGjjCz+O7KMTQy5qGHN0GD6
         38PdTuMol6ESiZjTAENlVi/Hm3qnHKtLHTnkwRpEQRkgoGvbJxUn8TOdqceBr7qpzf1/
         Zobz+3wMVaXeiS2jtXAw9CX4EqOFmqEZXjefFop0GdeH8rMxcbX/ZnDLzKOrTltP3sOn
         LiqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433454; x=1787038254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=32JHRxxMe26YRbDIsrjSe6oFT0eDo9Ri+nUe4A26t1A=;
        b=XTYn4fu/VFMjlGvWwNWusrgaQDIWbTrJIp7dX9+cjsnRRP18c767r3q/bPAJkjOYgg
         0idL8syDAgyBF4bZnwd8DB1zIjiFanzP1CD70C2TY9sX6JvH2KS4zMoCYxcdUZeLQilY
         2AcWgl6rUAcFoBWRG3aHiWGzQZvv54blPlO6eQdTZ9rWFOhKct2dFzHVcptY7ad0qTWV
         psDcTQj+aivki9qj+RYFjeYmnPsref1AFLXGdgkmKpovTZBKg6I3gd+pqNUmygmsEMvl
         dlk+htFfYzLKIB/Mfur/zM67/D5uErCLrnglZxOtiFDR53N5ip1J6QLFT0yGNrCwZm+M
         oK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433454; x=1787038254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32JHRxxMe26YRbDIsrjSe6oFT0eDo9Ri+nUe4A26t1A=;
        b=j2DZo+UQ2qiltY4Zn/MkGwA/is+ydfP0ebw2PVBIMIXnsFiSabpLcewzhcln2qsMpd
         CUm+DzpZsl09Yc9P5tGHSnKKPySKR9T/kWS5my0c/3i5c/H8xBGCjLuOZ/+66ElKsEFa
         MNPfrn6zxknNB3lz/CrvWl7/u2hMS7SptJw8/35BFikcPzhLNGtKIDLEwrD4bdAqs1W/
         iFq5feEYL8tCFpEvwvInQh9R7BQYvdwpb/qHIMV9csm0r85so2piO5A12jWMfGd+e9wu
         LZjZc2qyfrzbaO0/Cfs/EngWWNJ+yPtnigg9q1TrgGv9O3mfsjT9sLJV6Ry2vpDrZMU4
         m0Fw==
X-Forwarded-Encrypted: i=1; AHgh+RrXvfcixSVCfa00ZFlkHc2SBGJSdfLxaKRLpE09tem2X7Qclr1LTRpRtnkzBJRLm7rQmcgzmPg9Ox/8Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/T/kEHAkD6K7bk0rXW5FIXv7ZNYfwR1l7KDbKuttovakGfp+V
	UtiYvS+DMxmH2qoT/BezHK22Q8crBrcn+gsnkqJY5YZDHc8H3H2pSb5Cu+wz5drq+Osh4xPS2nU
	JSk9PwVwRAy8vd9WJpSm5NbLtYbmjcLY=
X-Gm-Gg: AR+sD12myAUEzE5HnETsX85IRDpN51qVT4v4luxVI57oyxitCQu6AchDhm4A/REz91n
	pFXEh1+KcwF6CY5kOtFwfMAj35CQoDKeJ2ZkCd57encMP1VkAFBEJerKBzNnF/XAF0hGR3cQTTz
	TrrELcErSD0vCh7xktnFRHlTmTwRii7tELORKFwehkyaS7bUgDlriE4dPhRX99YRqzqx+GXWLYU
	xYx+1RxmTAO/FWqqs9F1vpzHVrVFsD5onrDDogOo/1DShB1foGZ7tY64wW8oBTO/MCBgbt/XYfC
	rm3hnTcsDOstaoBGhQ/6NN8eKPIBLZdvUqyobKh5zAk=
X-Received: by 2002:a05:6402:4147:b0:6a0:cbef:884c with SMTP id
 4fb4d7f45d1cf-6a3643c106emr420361a12.0.1786433453383; Tue, 11 Aug 2026
 00:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com>
 <anq5HzmP33fqWYEO@kekkonen.localdomain> <CAPwA33LJsSr3w_Vfc6wd7VXNBW2fjrn2zaVxDGB_RfJ-FRrdHg@mail.gmail.com>
 <anrNowQWOaCkh4W1@kekkonen.localdomain>
In-Reply-To: <anrNowQWOaCkh4W1@kekkonen.localdomain>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Tue, 11 Aug 2026 15:30:40 +0800
X-Gm-Features: AUfX_mxTiQzxV5Oc44zLWlzTnfxx_og0ipZP863Yd6q5uVKS0-0PBn_ZyJmA2KY
Message-ID: <CAPwA33JXkioCo0=RC_mO3ZaY-LjCJpWynB7b8chY6eP=fnpvHQ@mail.gmail.com>
Subject: Re: [PATCH] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

> There's no need for a local variable, the above remains within 80
> columns.

Dropped - v3 has the write exactly as you wrote it.

Thanks,
Jason

Sakari Ailus <sakari.ailus@linux.intel.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=
=8811=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:22=E5=AF=AB=E9=81=93=
=EF=BC=9A

>
> Hi Jason,
>
> On Tue, Aug 11, 2026 at 03:18:01PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 wro=
te:
> > Hi Sakari,
> >
> > Thanks for the review.
> >
> > > I guess there wouldn't be harm from backporting either.
> >
> > Agreed, switched to a plain stable Cc.
> >
> > > How about:
> > >
> > >         ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> > >                                on ? 0x5 | ep.bus.mipi_csi2.num_data_l=
anes << 5 :
> > >                                0x40);
> >
> > Nicer, thanks - applied, with the lane count in a local variable to
> > stay within 80 columns.
>
> There's no need for a local variable, the above remains within 80 columns=
.
>
> --
> Sakari Ailus
