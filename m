Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5C40680A
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180305; cv=none; b=PoXjv68posO0ypJU8Hrm0gwoGQhfRUENwllHae3xdmaE8riWwiktDklbg6NKNEtTeVpPkgP7oaoVqHu1pkPFgDot0VGy36+6j0E/rINAncfmtzJbfdDOqlvhlWQzE26NFMjKp6kY9R7eBlgxXXvg4w0FnFMfb85PC+9AzEk7mgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180305; c=relaxed/simple;
	bh=VxeMidhPFQaSkHcVGSMTJWexKyHBTJwcXChjQkV1JlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftFGil/Zh95LVtYJ038whYNbg8k3VCUBnvPnUAyo9PBrGybYtja9hHGNNGs78Jf/pBDf4jPMfDNLnpqJhx0nnK0uOTEe4sAwbwQK2FPS/aaX8CsSm0JVhh+pHQq1MJjc4R0TO2TkSrXbeRc/yC2cWfyTxGovKkqrZfGmMgTXxN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9EJZZDe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9EJZZDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AD41F00A3D
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180299;
	bh=VmT2EKoW26IIQv2oDoLEdT5Mv5Qn22DEBsuuar81OQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F9EJZZDeHieK8CI0NaqwWSI5ROd1zeinFWJeEMiyhYcWgVFLM7dUb49/BmQyMCDZl
	 DOJV/ikS42E+JD533vlQBylpkKT0Aqty4TEbYclrR6IJ3DKcbdmh08cdrqox09DHRw
	 G50cobyeyo7+raXMJ2euPi363Xpw80O+LRlCGgIWbeY4olD5liLoTSY1Rfye5+51E6
	 BSje53DJWC4T1II1IBQNiB8KGyq9Mr5jWr3PGx0NJRgxQnLt8sT6LSYNe1+WRL/1Du
	 5xQOjjdF2iS7tzu/nbA93I1xZuCDdgaleXMQRj7nYMoSbsugIfAZkwRW0yTCcUR5r5
	 pB3d6qyUNKwpQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so514047eaf.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 05:44:59 -0700 (PDT)
X-Gm-Message-State: AFuF++lciOWsNbcaIhcn1UEiGa+gqbxj7QJ0zcmFjGrcy61SQb9rRH6x
	gbaDhZJ+tvfsTX6WOH8xClj2nfNjSV9U8sQ1vkX5W2SbRgvA6WSvi7AxPLSpk+FZg0dQ4FcvwKx
	1Adt66WqdOMyvorffG/0tvl56BIyCBks=
X-Received: by 2002:a05:6820:25a:b0:6ae:a950:9faa with SMTP id
 006d021491bc7-6b1c65cb077mr18952384eaf.10.1788180298940; Mon, 31 Aug 2026
 05:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-4-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 14:44:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLkwEpCx-Y5iRuR9Dy9gKaCAx+pRtL_K=0PhXoRXSk2O4Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uio1feZeG6nVzzYkoHvHIIt4oPQC2fWDPsWxHsqmutiUMnWQDJjMV-KFI
Message-ID: <CAD++jLkwEpCx-Y5iRuR9Dy9gKaCAx+pRtL_K=0PhXoRXSk2O4Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/29] media: v4l2-subdev: Prepare for changes in
 getting frame descriptors
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

I missed this:

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> +       if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> +               unsigned int type =3D desc->type;

That's an enum according to the header.

enum v4l2_mbus_frame_desc_type expected_type =3D desc->type;

?

Yours,
Linus Walleij
