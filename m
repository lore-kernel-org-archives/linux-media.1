Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751B44A40F
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517666; cv=none; b=F3/j7p4oyPIWKg7OXmKHUPHZBLqiKjAM9Ri3rLn4AZGpG9hAD//0qdg8AtUxWqgWIcUWPG8ZlfNsob9M2oBjCTTWT/stiZQ5hNcHfIvLJl87oejoHKyFW2+r1TBniN9E8EhS+9dDrr8FzrHbjMatO/bEmqbSbAoFpkQRVdYBOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517666; c=relaxed/simple;
	bh=QrWeOB+8eZEhyGrxsV6IjGr5lRCGZbcWMvNoUO3pjGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1IwD4ELOUruJlwCShpUQ9O1sCdJiR2HRNN+Qw5GUd/qFKCeaagOoOFOWVHp47DV/8SH2x4QBUp1djyQC1prAgjbJZ15ZMmdUCzRzsELgN7iZ5JdjKDcHtOGcJWN/nUkmZ/ruuYZomE31eRo5+5dnKzvK3sYLR+PUTySW9t0qVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4bnGF10; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4bnGF10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2015B1F00AC4
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788517665;
	bh=GpDnPI2Ei0AtAPP1djBZVgqGbTp36m3pBf4Ws3K8JsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G4bnGF10kKVYGFVDgniCt+0oPnUDZC+t1FhkxCgDM0rDWFrcwiT2bAuHOZ5hktOjH
	 OPhT72aSpI+15f6aL6RjZI9kSiop/EJP6n1SrF0AJfwdJ+w8VjNnJd6ad2V2y6zSoJ
	 8952H54yBWbMxMbPwnbR3HyFhNALunBtalM2sPBwfiwz7bnJx+BJtHHRHUBmhkVHmG
	 DiPPIffD7pOMs+7qNMFF8/hDEiiJMLDGEE2e7Wt68svo5bKlRWgLpg1JXDbzdTeeyL
	 wlv8Z2xSJoMFSkeRaWULo0kOYKQOod1XNMLsN4VELrvp5bLTo6jNSf3gjjxpPpLFTy
	 RUemsYlgjBm9w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so761084e87.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:27:45 -0700 (PDT)
X-Gm-Message-State: AFuF++kOmgbhgoDt9TdZFqg8AVifawezg9sctJnOITF03MSp+Cf2RXda
	iBioPRh5wChEg7kqZbWJ0ygy02bcHJkUjPJnzgNUrkAIh8GOVBwRu09NeE621ur97Xl1OQwdr4R
	hr206YHBGXacxbv3MvOJ8NviqEMvfSK8=
X-Received: by 2002:a05:6512:224c:b0:5b6:425:4bef with SMTP id
 2adb3069b0e04-5b61706a350mr1397110e87.32.1788517663790; Fri, 04 Sep 2026
 03:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-17-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-17-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 12:27:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLnWXeFWuj+Jy2qFe8N_wQzUxu2TLKU8SqsvbA98aq7HOA@mail.gmail.com>
X-Gm-Features: AcwNN1WbwvVVqdy6WcGrGNZe8KyLSRi93tAmm9nK7GgV6hmlmMmd56OEik35o5A
Message-ID: <CAD++jLnWXeFWuj+Jy2qFe8N_wQzUxu2TLKU8SqsvbA98aq7HOA@mail.gmail.com>
Subject: Re: [PATCH v3 16/29] media: v4l2-subdev: Always return at least one
 frame descriptor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

thanks for your patch!

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> +               if (!desc->num_entries) {
> +                       dev_dbg(sd->dev, "no frame descriptor entries\n")=
;
> +                       ret =3D -EINVAL;

I think I saw -ENODATA; used in other cases like this, is this the right
return code? (Just asking, I guess no big deal.)

Yours,
Linus Walleij
