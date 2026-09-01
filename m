Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427B4CCDC1
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267689; cv=none; b=Ovz45fIqEC026+j5I2FKIacYyWQU2ZLeQNimTom566GZH4UN+/SYPXXD+qJMI/JYqal2xCZLiI3PtC/OR6ygv6Dz+1DrxB8bqndkzDa2Wc+ebb++95022gy/3p8NTG/n41q6u9ZalvfMzwuuPYIqBE4qeUDODOEMRC5TH51uc/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267689; c=relaxed/simple;
	bh=JezYOX14lqpujbFrJSMonHGxq6z8rTzZ43INHqo6em8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCV6MpsAgfOfep24LvOJcOgrq4e4VslnD4b0w6erLCyqpJY5KsuZilwQ7srMoE6LDjFrCM5C9BC0raggybCgk1Z1W+0r5kNAJ6qXTDuq1DSiptNi12pW8SXuviIIR5eInWlHzUn76oPa0cubxHIuX8A/rcZupvQ2jwsvin/NDBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bekYh76g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bekYh76g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE111F00ADB
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267687;
	bh=C+c3hJjT18pJdrli9sHg/lsRnhK2ck7jsaRoIwZ1jgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bekYh76gaq3Ll2mdNDz+poRtPiAWuvI0FipvgBUb+KSm+EcsfYHCJEsC+Dn3l2Oim
	 FPFBsLGZ1u7iqDVHVtqn7InC5wq6kqaFLhsNpnedYpqzlsu0hxm+OCBBK2bo9K+WKD
	 0evZdvS0I75vqwKRlGqOp2SZ/vVMm3zcmQENxgvkTgn+UjyIY0UYPR91RnVAbovd+l
	 Iao9opJVO7dTTfVh6LbeemmZgnzODih1cqVX8hbm6LwFYbWR5Jp9JPF0njvGM+V1Mg
	 B7Cd2mFSZ6kXymjgffvxmfA7M74V0J0WGgY5ZWAP3946sgV7dkeJYHDTTwagfApfj4
	 s+aZ+7nF7m85w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso1207966e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 06:01:27 -0700 (PDT)
X-Gm-Message-State: AFuF++mGqgezMKHRgk6WNOhjMsZzHy5HgeFAwCs/GB3T5pZJPc5OjFjG
	iV1mdnv0Q4cECvGUUwpPZ3cmsb1PBqunjOeqL2ZNZqnzrGGThneFAKo8lT4pY32nYQ/IEqfMcgX
	JYZ7VbGxSN9JcaPUn+eGmIbY5NwPfr9g=
X-Received: by 2002:a05:6512:3e17:b0:5ae:b9b4:227d with SMTP id
 2adb3069b0e04-5b604271950mr811841e87.1.1788267686336; Tue, 01 Sep 2026
 06:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-8-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-8-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 15:01:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQiG2eoQ2yq07wLHr23XdAa4wZSma6HyE+sB7AYWQbxQ@mail.gmail.com>
X-Gm-Features: AcwNN1XHzeomk-VBM930yveWB4Pvw0Uz7a1p6u_-gumf3KWtRcVRhtF_1VsnVZ4
Message-ID: <CAD++jLkQiG2eoQ2yq07wLHr23XdAa4wZSma6HyE+sB7AYWQbxQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/29] media: v4l2-subdev: Add frame descriptor
 passthrough for CSI-2 and DVP
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

> Add frame descriptor pass-through functions specific to MIPI CSI-2 and DV=
P
> (parallel) interfaces. The two new functions are needed in order to
> support frame descriptor-less sub-device drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)

> +int v4l2_subdev_get_frame_desc_passthrough_dvp(struct v4l2_subdev *sd,
> +                                              unsigned int pad,
> +                                              struct v4l2_mbus_frame_des=
c *fd)

What about calling this
v4l2_subdev_get_frame_desc_passthrough_parallel()

because...

> +{
> +       fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;

That's what it is.
(Following the Rusty Russell API naming hierarchy)

Other than that it looks good so with this change:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
