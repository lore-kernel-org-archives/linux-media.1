Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A94EC640
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788555275; cv=none; b=K661SyhuxdpY/yAoGt65QwlKah1kpiyMWtflGBiNjyK7/fZMwBi+ameduz+e/5BZv42ROruXlN/oGNEfaBWQZpmBRB5BKN6QRpFsRwAcxnr8lwASuUJ7YZ3vi92Hcb+e+5+OUtP8LItFCyuIc480kpVKwpJjLRFZYqy8TQ9cj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788555275; c=relaxed/simple;
	bh=On0i/g6HB0K5PH9Vva0Jy2CCcd3QsyW1EOQzM95JHp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kC/v2cz5kxUfYKxtjMOYNc7oHW/zgjB63d1/Gp3YwFoTq16ritb+htyu//B3XYbIrFgNOyMOwmCdN8JDuH7VgRZFeA0U2cR76CIKO6q6dxjL3nAhNpwIg6m93y6vM5YaQCoFHoUZQKrwkNPjggCRTGIeloAqo+tGID+4WgOBeTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BT3TPhZw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BT3TPhZw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4762F1F00A3E
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788555273;
	bh=hAJQ4H6fG84Kmr6W0MoxZWSZFGj/1HFCw4IpQx3ZUaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BT3TPhZwaDOa4fOEtr8USjxwH8qv2hjjp0dDRdPaic8W6YGxFxFPe6P/NNw68Lo8o
	 4rYxuzLL+CdksRBaviKFXwzaVOQl59zgZzdGW+lRTIl4Fq9s9fyfSah6byti/EW9OJ
	 e11ODNgDmeQbEMhZXTHwqhhRC+uIJ/VWptp031UfAoe0D8UatroWE6lAI9hzoFDlz/
	 I050bixa/h+O10cBtOR+KUFgsQNTp2RDNCIy6XQn9bkyrkh/rO7wIVvsbS7ufcwYQu
	 PbqboXPlV/ZhLYrUnf3OIaaLxEJzODJUdCTlkUCOHpkvXyyZAj28A4O6WB8hwGkvEF
	 ZvaVDUYH8hndw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c86945164so16245821fa.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 13:54:33 -0700 (PDT)
X-Gm-Message-State: AFuF++nvuWN9x0PD245us8ACFSYyve1iRg3SbV3P8myA5nuFv62xVtTV
	Ym5jLG8oo40QuF5TOO25F2Su/NhqPNMNvVmzRE61rcF8+ErRVzFoRNONQbLZB0+8XbTEFzAIscC
	mI7zC2VZxSa0EsNBMear3o9k5Xih4s3A=
X-Received: by 2002:a05:6512:694:b0:5b6:1a7c:26 with SMTP id
 2adb3069b0e04-5b61a7c01d5mr1106399e87.41.1788555272003; Fri, 04 Sep 2026
 13:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 22:54:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLk0LTcyBTLMWdA4W7bF2pHwOAmvXZP=Q9QuYB0JJ8+4xw@mail.gmail.com>
X-Gm-Features: AcwNN1Xrg_bcSFTVU0O18wFY21fWlKRoXAKZopbK2XZww5s-NVZCrbgTjZ8Ctww
Message-ID: <CAD++jLk0LTcyBTLMWdA4W7bF2pHwOAmvXZP=Q9QuYB0JJ8+4xw@mail.gmail.com>
Subject: Re: [PATCH v3 29/29] media: j721e-csi2rx: Use v4l2_subdev_get_frame_desc()
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

> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

(...)

this is not your code I guess but:

> -               for (j =3D 0; j < fd.num_entries; j++) {
> -                       if (curr_ctx->stream =3D=3D fd.entry[j].stream) {
> -                               curr_ctx->vc =3D fd.entry[j].bus.csi2.vc;
> -                               curr_ctx->dt =3D fd.entry[j].bus.csi2.dt;
> +               for (j =3D 0; j < fd->num_entries; j++) {
> +                       if (curr_ctx->stream =3D=3D fd->entry[j].stream) =
{
> +                               curr_ctx->vc =3D fd->entry[j].bus.csi2.vc=
;
> +                               curr_ctx->dt =3D fd->entry[j].bus.csi2.dt=
;
>                                 break;
>                         }
>
>                         /* Return error if no matching stream found */
> -                       if (j =3D=3D fd.num_entries)
> +                       if (j =3D=3D fd->num_entries)

for j =3D 0; j < num_entries; j++ right.

how would j =3D=3D fd->num_entries??

should this be if (j =3D=3D fd->num_entries - 1)?

Yours,
Linus Walleij
